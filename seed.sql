-- Seed Data untuk Database Akademik
-- Format: SQLite/Cloudflare D1 SQL

-- 1. Insert Fakultas
INSERT INTO fakultas (nama_fakultas, singkatan) VALUES
('Fakultas Teknologi Informasi', 'FTI'),
('Fakultas Ekonomi dan Bisnis', 'FEB'),
('Fakultas Teknik', 'FT');

-- 2. Insert Program Studi (Prodi)
-- (id 1 & 2 -> FTI, id 3 & 4 -> FEB, id 5 -> FT)
INSERT INTO prodi (nama_prodi, jenjang, fakultas_id) VALUES
('Sistem Informasi', 'S1', 1),
('Informatika', 'S1', 1),
('Manajemen', 'S1', 2),
('Akuntansi', 'S1', 2),
('Teknik Industri', 'S1', 3);

-- 3. Insert Mata Kuliah
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, semester, prodi_id) VALUES
-- Sistem Informasi (Prodi 1)
('SI101', 'Pengantar Sistem Informasi', 3, 1, 1),
('SI202', 'Analisis & Perancangan Sistem', 4, 3, 1),
('SI303', 'Manajemen Basis Data', 3, 4, 1),
-- Informatika (Prodi 2)
('IF101', 'Algoritma & Pemrograman', 4, 1, 2),
('IF202', 'Struktur Data', 3, 2, 2),
('IF303', 'Pemrograman Web', 3, 3, 2),
-- Manajemen (Prodi 3)
('MN101', 'Pengantar Manajemen', 3, 1, 3),
('MN202', 'Perilaku Organisasi', 3, 2, 3),
-- Akuntansi (Prodi 4)
('AK101', 'Pengantar Akuntansi I', 3, 1, 4),
('AK202', 'Akuntansi Biaya', 3, 3, 4),
-- Teknik Industri (Prodi 5)
('TI101', 'Pengantar Teknik Industri', 2, 1, 5),
('TI202', 'Penelitian Operasional', 4, 3, 5);

-- 4. Insert Mahasiswa (50 Mahasiswa)
-- Format: NIM, Nama, Jenis Kelamin, Angkatan, Prodi_id, Status
INSERT INTO mahasiswa (nim, nama, jenis_kelamin, angkatan, prodi_id, status) VALUES
-- Prodi 1 (Sistem Informasi): 20 Mahasiswa (Angkatan 2023 & 2024)
('120123001', 'Budi Santoso', 'L', 2023, 1, 'Aktif'),
('120123002', 'Siti Aminah', 'P', 2023, 1, 'Aktif'),
('120123003', 'Rian Hidayat', 'L', 2023, 1, 'Aktif'),
('120123004', 'Dewa Ketut', 'L', 2023, 1, 'Aktif'),
('120123005', 'Maria Ulfa', 'P', 2023, 1, 'Cuti'),
('120123006', 'Ahmad Fauzi', 'L', 2023, 1, 'Aktif'),
('120123007', 'Lilis Suryani', 'P', 2023, 1, 'Aktif'),
('120123008', 'Hendra Wijaya', 'L', 2023, 1, 'Aktif'),
('120123009', 'Dian Lestari', 'P', 2023, 1, 'Aktif'),
('120123010', 'Rizky Pratama', 'L', 2023, 1, 'Aktif'),
('120124011', 'Jessica Putri', 'P', 2024, 1, 'Aktif'),
('120124012', 'Aditya Nugroho', 'L', 2024, 1, 'Aktif'),
('120124013', 'Amanda Wijaya', 'P', 2024, 1, 'Aktif'),
('120124014', 'Daniel Siahaan', 'L', 2024, 1, 'Aktif'),
('120124015', 'Fitriani', 'P', 2024, 1, 'Aktif'),
('120124016', 'Gede Ary', 'L', 2024, 1, 'Aktif'),
('120124017', 'Hanny Gunawan', 'P', 2024, 1, 'Aktif'),
('120124018', 'Ivan Christian', 'L', 2024, 1, 'Aktif'),
('120124019', 'Kartika Sari', 'P', 2024, 1, 'Aktif'),
('120124020', 'Kevin Sanjaya', 'L', 2024, 1, 'Aktif'),

-- Prodi 2 (Informatika): 10 Mahasiswa (Angkatan 2023)
('120223001', 'Muhammad Reza', 'L', 2023, 2, 'Aktif'),
('120223002', 'Nabila Syakieb', 'P', 2023, 2, 'Aktif'),
('120223003', 'Oki Setiana', 'P', 2023, 2, 'Aktif'),
('120223004', 'Panji Petualang', 'L', 2023, 2, 'Aktif'),
('120223005', 'Qori Sandioriva', 'P', 2023, 2, 'Aktif'),
('120223006', 'Roni Setiawan', 'L', 2023, 2, 'Aktif'),
('120223007', 'Siska Wulandari', 'P', 2023, 2, 'Aktif'),
('120223008', 'Tommy Soeharto', 'L', 2023, 2, 'DO'),
('120223009', 'Utami Ningsih', 'P', 2023, 2, 'Aktif'),
('120223010', 'Valeri Thomas', 'P', 2023, 2, 'Aktif'),

-- Prodi 3 (Manajemen): 10 Mahasiswa (Angkatan 2023)
('110123001', 'Wawan Hermawan', 'L', 2023, 3, 'Aktif'),
('110123002', 'Xena Aliyah', 'P', 2023, 3, 'Aktif'),
('110123003', 'Yudiantara', 'L', 2023, 3, 'Aktif'),
('110123004', 'Zaskia Mecca', 'P', 2023, 3, 'Aktif'),
('110123005', 'Andi Hakim', 'L', 2023, 3, 'Aktif'),
('110123006', 'Bella Safira', 'P', 2023, 3, 'Aktif'),
('110123007', 'Candra Wijaya', 'L', 2023, 3, 'Aktif'),
('110123008', 'Desy Ratnasari', 'P', 2023, 3, 'Aktif'),
('110123009', 'Eko Patrio', 'L', 2023, 3, 'Aktif'),
('110123010', 'Feni Rose', 'P', 2023, 3, 'Aktif'),

-- Prodi 4 (Akuntansi): 5 Mahasiswa (Angkatan 2023)
('110223001', 'Gunawan Sudradjat', 'L', 2023, 4, 'Aktif'),
('110223002', 'Helmalia Putri', 'P', 2023, 4, 'Aktif'),
('110223003', 'Indra Bruggman', 'L', 2023, 4, 'Aktif'),
('110223004', 'Jihan Fahira', 'P', 2023, 4, 'Aktif'),
('110223005', 'Krisdayanti', 'P', 2023, 4, 'Aktif'),

-- Prodi 5 (Teknik Industri): 5 Mahasiswa (Angkatan 2023)
('130123001', 'Lukman Sardi', 'L', 2023, 5, 'Aktif'),
('130123002', 'Meriam Bellina', 'P', 2023, 5, 'Aktif'),
('130123003', 'Nicholas Saputra', 'L', 2023, 5, 'Aktif'),
('130123004', 'Olla Ramlan', 'P', 2023, 5, 'Cuti'),
('130123005', 'Primus Yustisio', 'L', 2023, 5, 'Aktif');

-- 5. Insert KRS & Nilai (Pengambilan KRS Mahasiswa Angkatan 2023 & 2024)
INSERT INTO krs (nim, kode_mk, semester_akademik, nilai_angka, nilai_huruf) VALUES
-- Mahasiswa Sistem Informasi (Prodi 1) mengambil SI101 (Semester Ganjil 2023/2024)
('120123001', 'SI101', '2023/2024 Ganjil', 85.5, 'A'),
('120123002', 'SI101', '2023/2024 Ganjil', 78.0, 'B'),
('120123003', 'SI101', '2023/2024 Ganjil', 92.0, 'A'),
('120123004', 'SI101', '2023/2024 Ganjil', 65.5, 'C'),
('120123005', 'SI101', '2023/2024 Ganjil', 74.0, 'BC'),
('120123006', 'SI101', '2023/2024 Ganjil', 81.5, 'AB'),
('120123007', 'SI101', '2023/2024 Ganjil', 88.0, 'A'),
('120123008', 'SI101', '2023/2024 Ganjil', 55.0, 'D'),
('120123009', 'SI101', '2023/2024 Ganjil', 79.5, 'B'),
('120123010', 'SI101', '2023/2024 Ganjil', 83.0, 'AB'),

-- Mahasiswa Sistem Informasi mengambil SI202 (Semester Ganjil 2024/2025)
('120123001', 'SI202', '2024/2025 Ganjil', 80.0, 'AB'),
('120123002', 'SI202', '2024/2025 Ganjil', 72.5, 'BC'),
('120123003', 'SI202', '2024/2025 Ganjil', 95.0, 'A'),
('120123004', 'SI202', '2024/2025 Ganjil', 60.0, 'C'),
('120123006', 'SI202', '2024/2025 Ganjil', 78.5, 'B'),
('120123007', 'SI202', '2024/2025 Ganjil', 85.0, 'A'),
('120123008', 'SI202', '2024/2025 Ganjil', 45.0, 'E'),
('120123009', 'SI202', '2024/2025 Ganjil', 81.0, 'AB'),
('120123010', 'SI202', '2024/2025 Ganjil', 77.0, 'B'),

-- Mahasiswa Sistem Informasi mengambil SI303 (Semester Genap 2024/2025)
('120123001', 'SI303', '2024/2025 Genap', 88.0, 'A'),
('120123002', 'SI303', '2024/2025 Genap', 82.0, 'AB'),
('120123003', 'SI303', '2024/2025 Genap', 90.0, 'A'),
('120123004', 'SI303', '2024/2025 Genap', 70.0, 'B'),
('120123006', 'SI303', '2024/2025 Genap', 75.0, 'B'),
('120123007', 'SI303', '2024/2025 Genap', 89.5, 'A'),
('120123009', 'SI303', '2024/2025 Genap', 80.5, 'AB'),
('120123010', 'SI303', '2024/2025 Genap', 78.0, 'B'),

-- Mahasiswa Informatika (Prodi 2) mengambil IF101 (Semester Ganjil 2023/2024)
('120223001', 'IF101', '2023/2024 Ganjil', 90.0, 'A'),
('120223002', 'IF101', '2023/2024 Ganjil', 85.0, 'A'),
('120223003', 'IF101', '2023/2024 Ganjil', 76.5, 'B'),
('120223004', 'IF101', '2023/2024 Ganjil', 68.0, 'C'),
('120223005', 'IF101', '2023/2024 Ganjil', 72.0, 'BC'),
('120223006', 'IF101', '2023/2024 Ganjil', 81.0, 'AB'),
('120223007', 'IF101', '2023/2024 Ganjil', 88.5, 'A'),
('120223008', 'IF101', '2023/2024 Ganjil', 35.0, 'E'), -- Tommy Soeharto DO
('120223009', 'IF101', '2023/2024 Ganjil', 79.0, 'B'),
('120223010', 'IF101', '2023/2024 Ganjil', 84.0, 'AB'),

-- Mahasiswa Informatika mengambil IF202 (Semester Genap 2023/2024)
('120223001', 'IF202', '2023/2024 Genap', 85.0, 'A'),
('120223002', 'IF202', '2023/2024 Genap', 78.5, 'B'),
('120223003', 'IF202', '2023/2024 Genap', 73.0, 'BC'),
('120223004', 'IF202', '2023/2024 Genap', 65.0, 'C'),
('120223005', 'IF202', '2023/2024 Genap', 80.0, 'AB'),
('120223006', 'IF202', '2023/2024 Genap', 77.0, 'B'),
('120223007', 'IF202', '2023/2024 Genap', 92.0, 'A'),
('120223009', 'IF202', '2023/2024 Genap', 82.5, 'AB'),
('120223010', 'IF202', '2023/2024 Genap', 79.0, 'B'),

-- Mahasiswa Manajemen (Prodi 3) mengambil MN101 (Semester Ganjil 2023/2024)
('110123001', 'MN101', '2023/2024 Ganjil', 75.0, 'B'),
('110123002', 'MN101', '2023/2024 Ganjil', 82.0, 'AB'),
('110123003', 'MN101', '2023/2024 Ganjil', 70.0, 'B'),
('110123004', 'MN101', '2023/2024 Ganjil', 88.0, 'A'),
('110123005', 'MN101', '2023/2024 Ganjil', 67.5, 'C'),
('110123006', 'MN101', '2023/2024 Ganjil', 91.0, 'A'),
('110123007', 'MN101', '2023/2024 Ganjil', 76.0, 'B'),
('110123008', 'MN101', '2023/2024 Ganjil', 85.0, 'A'),
('110123009', 'MN101', '2023/2024 Ganjil', 80.0, 'AB'),
('110123010', 'MN101', '2023/2024 Ganjil', 73.5, 'BC'),

-- Mahasiswa Akuntansi (Prodi 4) mengambil AK101 (Semester Ganjil 2023/2024)
('110223001', 'AK101', '2023/2024 Ganjil', 82.0, 'AB'),
('110223002', 'AK101', '2023/2024 Ganjil', 89.0, 'A'),
('110223003', 'AK101', '2023/2024 Ganjil', 76.0, 'B'),
('110223004', 'AK101', '2023/2024 Ganjil', 68.5, 'C'),
('110223005', 'AK101', '2023/2024 Ganjil', 92.5, 'A'),

-- Mahasiswa Teknik Industri (Prodi 5) mengambil TI101 (Semester Ganjil 2023/2024)
('130123001', 'TI101', '2023/2024 Ganjil', 78.0, 'B'),
('130123002', 'TI101', '2023/2024 Ganjil', 85.5, 'A'),
('130123003', 'TI101', '2023/2024 Ganjil', 74.0, 'BC'),
('130123004', 'TI101', '2023/2024 Ganjil', 62.0, 'C'),
('130123005', 'TI101', '2023/2024 Ganjil', 80.0, 'AB');
