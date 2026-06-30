// Cloudflare D1 Academic API Backend Worker
// Dibuat untuk bahan ajar Kelas MIS / Sistem Informasi

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const path = url.pathname;

    // CORS Headers untuk API
    const corsHeaders = {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, HEAD, OPTIONS",
      "Access-Control-Allow-Headers": "Content-Type",
    };

    // Handle OPTIONS preflight request
    if (request.method === "OPTIONS") {
      return new Response(null, { headers: corsHeaders });
    }

    // 1. API: Statistik Utama (KPI Cards)
    if (path === "/api/stats") {
      try {
        const stats = await env.akademik_db.prepare(`
          SELECT 
            (SELECT COUNT(*) FROM mahasiswa) as total_mahasiswa,
            (SELECT COUNT(*) FROM mahasiswa WHERE status = 'Aktif') as aktif_mahasiswa,
            (SELECT COUNT(*) FROM mata_kuliah) as total_mk,
            (
              SELECT ROUND(AVG(
                CASE nilai_huruf
                  WHEN 'A'  THEN 4.0
                  WHEN 'AB' THEN 3.5
                  WHEN 'B'  THEN 3.0
                  WHEN 'BC' THEN 2.5
                  WHEN 'C'  THEN 2.0
                  WHEN 'D'  THEN 1.0
                  ELSE 0.0
                END
              ), 2) FROM krs
            ) as rata_rata_gpa,
            (SELECT COUNT(*) FROM prodi) as total_prodi
        `).first();

        return new Response(JSON.stringify(stats), {
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      }
    }

    // 2. API: Daftar Mahasiswa
    if (path === "/api/students") {
      try {
        const { results } = await env.akademik_db.prepare(`
          SELECT 
            m.nim, 
            m.nama, 
            m.jenis_kelamin, 
            m.angkatan, 
            m.status, 
            p.nama_prodi, 
            f.singkatan as nama_fakultas
          FROM mahasiswa m
          LEFT JOIN prodi p ON m.prodi_id = p.id
          LEFT JOIN fakultas f ON p.fakultas_id = f.id
          ORDER BY m.nim ASC
        `).all();

        return new Response(JSON.stringify(results), {
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      }
    }

    // 3. API: Daftar Mata Kuliah + Rata-rata Nilai
    if (path === "/api/courses") {
      try {
        const { results } = await env.akademik_db.prepare(`
          SELECT 
            mk.kode_mk, 
            mk.nama_mk, 
            mk.sks, 
            mk.semester, 
            p.nama_prodi, 
            COUNT(k.nim) as total_peserta, 
            ROUND(AVG(k.nilai_angka), 2) as rata_rata_nilai
          FROM mata_kuliah mk
          LEFT JOIN prodi p ON mk.prodi_id = p.id
          LEFT JOIN krs k ON mk.kode_mk = k.kode_mk
          GROUP BY mk.kode_mk, mk.nama_mk, mk.sks, mk.semester, p.nama_prodi
          ORDER BY mk.kode_mk ASC
        `).all();

        return new Response(JSON.stringify(results), {
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      }
    }

    // 4. API: KRS dan Catatan Nilai
    if (path === "/api/grades") {
      try {
        const { results } = await env.akademik_db.prepare(`
          SELECT 
            k.id, 
            k.nim, 
            m.nama as nama_mahasiswa, 
            k.kode_mk, 
            mk.nama_mk, 
            k.semester_akademik, 
            k.nilai_angka, 
            k.nilai_huruf
          FROM krs k
          JOIN mahasiswa m ON k.nim = m.nim
          JOIN mata_kuliah mk ON k.kode_mk = mk.kode_mk
          ORDER BY k.semester_akademik DESC, k.nilai_angka DESC
        `).all();

        return new Response(JSON.stringify(results), {
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", ...corsHeaders }
        });
      }
    }

    // Halaman tidak ditemukan untuk rute non-API (Asset static / index.html ditangani otomatis oleh Cloudflare)
    return new Response("Not Found", { status: 404 });
  }
};
