CREATE TABLE kategori (
    id SERIAL PRIMARY KEY,
    nama_kategori VARCHAR(255) NOT NULL UNIQUE
);
table buku;
table rak_buku;
table kategori;
table petugas;
table peminjaman;
CREATE TABLE rak_buku (
    id SERIAL PRIMARY KEY,
    rak VARCHAR(255),
    kapasitas int NOT NULL
);

CREATE TABLE petugas (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    gmail VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE peminjaman (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    tanggal_peminjaman DATE,
    tanggal_pengembalian DATE,

    petugas_id INT,

    FOREIGN KEY (petugas_id) REFERENCES petugas(id)
);

CREATE TABLE buku (
    id SERIAL PRIMARY KEY,
    judul VARCHAR(255),
    sinopsis TEXT,

    kategori_id INT UNIQUE,
    rak_buku_id INT UNIQUE,
    peminjaman_id INT UNIQUE,

    FOREIGN KEY (kategori_id) REFERENCES kategori(id),
    FOREIGN KEY (rak_buku_id) REFERENCES rak_buku(id),
    FOREIGN KEY (peminjaman_id) REFERENCES peminjaman(id)
);

INSERT INTO kategori (nama_kategori)
VALUES
    ('Komedi'),
    ('Action'),
    ('Fantasi'),
    ('Horror'),
    ('Petualangan'),
    ('Fiksi'),
    ('Novel'), 
    ('Perang & Militer'),
    ('Romantis'),
    ('Mistery');

INSERT INTO rak_buku (rak, kapasitas) VALUES
    ('A',30),('B',30),('C',30),('D',30),('E',30),
    ('V',30),('W',30),('X',30),('Y',30),('Z',30);

INSERT INTO petugas (nama, gmail, password) VALUES
    ('Akmal','akmal@gmail.com','12345'),
    ('Ali','ali@gmail.com','qwerty'),
    ('Angga','angga@gmail.com','qweasd'),
    ('Akil','akil@gmail.com','asdrefd'),
    ('Ilham','ilham@gmail.com','123@weq'),
    ('Dwiki','dwiki@gmail.com','sa3@weq'),
    ('Naufal','naufal@gmail.com','2d5weq'),
    ('Vando','vando@gmail.com','1sLweq'),
    ('Hanif','hanif@gmail.com','dsd123@weq'),
    ('Rafi','rafi@gmail.com','dsfrafiweq');


INSERT INTO peminjaman (nama, tanggal_peminjaman, tanggal_pengembalian, petugas_id) VALUES 
    ('Akmal', 'Jan 3, 2026', 'Aug 12, 2026', 1),
    ('Ali', 'Jan 3, 2026', 'Aug 12, 2026', 2),
    ('Angga', 'Jan 3, 2026', 'Aug 12, 2026', 3),
    ('Akil', 'Jan 3, 2026', 'Aug 12, 2026', 4),
    ('Ilham', 'Jan 3, 2026', 'Aug 12, 2026', 5),
    ('Dwiki', 'Jan 3, 2026', 'Aug 12, 2026', 6),
    ('Naufal', 'Jan 3, 2026', 'Aug 12, 2026', 7),
    ('Vando', 'Jan 3, 2026', 'Aug 12, 2026', 8),
    ('Hanif', 'Jan 3, 2026', 'Aug 12, 2026', 9),
    ('Rafi', 'Jan 3, 2026', 'Aug 12, 2026', 10);
    

INSERT INTO buku (judul, sinopsis, kategori_id, rak_buku_id, peminjaman_id) VALUES 
    ('Laskar Pelangi','Kisah sepuluh anak di Pulau Belitung yang berjuang menempuh pendidikan di tengah keterbatasan ekonomi dan fasilitas sekolah yang memprihatinkan. Sebuah penghormatan bagi dunia pendidikan dan persahabatan.',1,1,1),
    ('The Alchemist','Menceritakan perjalanan Santiago, seorang gembala Spanyol, menuju Mesir untuk mencari harta karun di piramida. Buku ini adalah alegori tentang mengikuti mimpi dan mendengarkan suara hati.',2,2,2),
    ('Cantik Itu Luka','Kisah epik yang memadukan sejarah, mitos, dan realisme magis tentang Dewi Ayu dan keempat putrinya di masa kolonial hingga kemerdekaan Indonesia.',3,3,3),
    ('1984','Sebuah novel distopia tentang Winston Smith yang hidup di bawah pengawasan ketat rezim totaliter "Big Brother", di mana pikiran bebas adalah kejahatan dan sejarah selalu dimanipulasi.',4,4,4),
    ('The Midnight Library','Nora Seed menemukan perpustakaan di antara hidup dan mati, di mana setiap buku memungkinkannya mencoba kehidupan lain yang bisa saja ia jalani jika ia mengambil keputusan berbeda di masa lalu.',5,5,5),
    ('Atomic Habits','Buku ini menjelaskan bagaimana perubahan-perubahan kecil (1%) yang dilakukan secara konsisten dapat menghasilkan dampak luar biasa dalam jangka panjang melalui sistem kebiasaan yang tepat.',6,6,6),
    ('Lofarsa', 'Minta dijodohkan sebenarnya tidak pernah masuk ke dalam rencana kehidupan masa depan Najmi Desra. Namun sang Papi malah mengamini permintaan isengnya tersebut.', 7, 7, 7),
    ('Anne of Avonlea', 'Kita semua pernah membuat kesalahan. Kita harus menyesali kesalahan kita dan belajar dari situ, tapi jangan pernah terus membawa kesalahan itu ke masa depan. Itulah yang dikisahkan dalam Anne of Avonlea.', 8, 8, 8),
    ('Athar: Cinta Dalam Ikhlas', 'Aurora Cinta Purnama, Aku sudah berusaha mengikhlaskanmu. Namun, pada akhirnya, memang hanya kamu sosok yang kuyakini akan menjadi jodohku nanti. Ya, aku masih berharap kamulah yang menjadi pasanganku, meski sudah bertahun-tahun lamanya kita tak bertemu. Keyakinanku kepadamu tak pernah pudar, fatwa hatiku masih tetap sama. Aku ingin memperjuangkanmu, Ara, supaya kita dapat bersatu. Oleh karena itulah, wajar jika aku berharap kepada Allah agar kita bisa dipertemukan di saat yang tepat. Tapi, apakah kamu menyimpan keyakinan dan keinginan yang sama denganku? Ara, apa pun yang terjadi nanti, aku akan ikhlas dan tetap mencintaimu. ', 9, 9, 9),
    ('Sincerpity', 'Lagi-lagi, penerbit Aristeia menjadi katalis utama atas pertemuan dua insan penggiat seni yang terikat kontrak penerbitan menumbuhkan ikatan mereka sendiri di balik layar profesionalitas. Ikatan yang terhubung atas pencarian arti cinta untuk diri sendiri, secara pribadi dan juga untuk dibagi.', 10, 10, 10);