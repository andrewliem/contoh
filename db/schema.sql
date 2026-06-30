-- Schema untuk Database Akademik (Cloudflare D1 / SQLite)
-- Dibuat untuk bahan ajar program studi MIS / Sistem Informasi

-- Aktifkan foreign key enforcement di SQLite/D1
PRAGMA foreign_keys = ON;

-- 1. Tabel Fakultas
CREATE TABLE IF NOT EXISTS fakultas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_fakultas TEXT NOT NULL,
    singkatan TEXT NOT NULL UNIQUE
);

-- 2. Tabel Program Studi (Prodi)
CREATE TABLE IF NOT EXISTS prodi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_prodi TEXT NOT NULL,
    jenjang TEXT NOT NULL DEFAULT 'S1',
    fakultas_id INTEGER,
    FOREIGN KEY (fakultas_id) REFERENCES fakultas(id) ON DELETE RESTRICT
);

-- 3. Tabel Mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    nim TEXT PRIMARY KEY,
    nama TEXT NOT NULL,
    jenis_kelamin TEXT CHECK(jenis_kelamin IN ('L', 'P')),
    angkatan INTEGER NOT NULL,
    prodi_id INTEGER,
    status TEXT DEFAULT 'Aktif' CHECK(status IN ('Aktif', 'Cuti', 'Lulus', 'DO')),
    FOREIGN KEY (prodi_id) REFERENCES prodi(id) ON DELETE RESTRICT
);

-- 4. Tabel Mata Kuliah
CREATE TABLE IF NOT EXISTS mata_kuliah (
    kode_mk TEXT PRIMARY KEY,
    nama_mk TEXT NOT NULL,
    sks INTEGER NOT NULL CHECK(sks BETWEEN 1 AND 6),
    semester INTEGER NOT NULL CHECK(semester BETWEEN 1 AND 8),
    prodi_id INTEGER,
    FOREIGN KEY (prodi_id) REFERENCES prodi(id) ON DELETE CASCADE
);

-- 5. Tabel KRS (Kartu Rencana Studi) / Nilai
CREATE TABLE IF NOT EXISTS krs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nim TEXT,
    kode_mk TEXT,
    semester_akademik TEXT NOT NULL, -- Contoh: '2025/2026 Ganjil'
    nilai_angka REAL CHECK(nilai_angka BETWEEN 0 AND 100),
    nilai_huruf TEXT CHECK(nilai_huruf IN ('A', 'AB', 'B', 'BC', 'C', 'D', 'E')),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim) ON DELETE CASCADE,
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON DELETE CASCADE,
    UNIQUE(nim, kode_mk, semester_akademik) -- Mencegah duplikasi pengambilan MK yang sama di semester yang sama
);
