-- Kumpulan Contoh Query SQL Akademik untuk Kelas MIS
-- Dapat dijalankan langsung setelah schema dan seed dimasukkan ke D1 / SQLite

-- 1. Menampilkan Semua Mahasiswa Beserta Program Studi dan Fakultasnya (JOIN 3 Tabel)
SELECT 
    m.nim, 
    m.nama, 
    m.jenis_kelamin, 
    p.nama_prodi, 
    f.singkatan AS fakultas
FROM mahasiswa m
JOIN prodi p ON m.prodi_id = p.id
JOIN fakultas f ON p.fakultas_id = f.id
ORDER BY f.singkatan, p.nama_prodi, m.nim;

-- 2. Menghitung Jumlah Mahasiswa Aktif per Program Studi (GROUP BY & COUNT)
SELECT 
    p.nama_prodi, 
    COUNT(m.nim) AS total_mahasiswa
FROM prodi p
LEFT JOIN mahasiswa m ON p.id = m.prodi_id AND m.status = 'Aktif'
GROUP BY p.id, p.nama_prodi
ORDER BY total_mahasiswa DESC;

-- 3. Menampilkan Nilai Mahasiswa pada Mata Kuliah Tertentu (JOIN & WHERE)
SELECT 
    k.nim, 
    m.nama, 
    k.kode_mk, 
    mk.nama_mk, 
    k.nilai_angka, 
    k.nilai_huruf
FROM krs k
JOIN mahasiswa m ON k.nim = m.nim
JOIN mata_kuliah mk ON k.kode_mk = mk.kode_mk
WHERE k.kode_mk = 'SI101'
ORDER BY k.nilai_angka DESC;

-- 4. Menghitung Nilai Rata-rata Ujian per Mata Kuliah (AVG)
SELECT 
    mk.kode_mk, 
    mk.nama_mk, 
    ROUND(AVG(k.nilai_angka), 2) AS rata_rata_nilai,
    COUNT(k.nim) AS jumlah_peserta
FROM mata_kuliah mk
LEFT JOIN krs k ON mk.kode_mk = k.kode_mk
GROUP BY mk.kode_mk, mk.nama_mk
ORDER BY rata_rata_nilai DESC;

-- 5. Contoh Query Menghitung IPS (Indeks Prestasi Semester) Mahasiswa
-- Nilai Huruf dikonversi menjadi Bobot Angka (A=4, AB=3.5, B=3, BC=2.5, C=2, D=1, E=0)
SELECT 
    m.nim, 
    m.nama, 
    SUM(mk.sks) AS total_sks,
    ROUND(SUM(
        CASE k.nilai_huruf
            WHEN 'A'  THEN 4.0 * mk.sks
            WHEN 'AB' THEN 3.5 * mk.sks
            WHEN 'B'  THEN 3.0 * mk.sks
            WHEN 'BC' THEN 2.5 * mk.sks
            WHEN 'C'  THEN 2.0 * mk.sks
            WHEN 'D'  THEN 1.0 * mk.sks
            ELSE 0.0
        END
    ) / SUM(mk.sks), 2) AS ips
FROM krs k
JOIN mahasiswa m ON k.nim = m.nim
JOIN mata_kuliah mk ON k.kode_mk = mk.kode_mk
WHERE k.semester_akademik = '2023/2024 Ganjil'
GROUP BY m.nim, m.nama
ORDER BY ips DESC;
