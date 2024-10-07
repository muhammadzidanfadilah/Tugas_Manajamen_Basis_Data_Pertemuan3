
-- Menggunakan Database Hotel
USE hotel_management;

-- Membuat Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    no_telepon VARCHAR(20),
    email VARCHAR(100)
);

-- Membuat Tabel Kamar
CREATE TABLE kamar (
    id_kamar INT AUTO_INCREMENT PRIMARY KEY,
    nomor_kamar VARCHAR(10) NOT NULL,
    tipe_kamar VARCHAR(50),
    harga_per_malam DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'tersedia'
);

-- Membuat Tabel Reservasi
CREATE TABLE reservasi (
    id_reservasi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_kamar INT,
    tanggal_checkin DATE,
    tanggal_checkout DATE,
    total_harga DECIMAL(10, 2),
    status_reservasi VARCHAR(50) DEFAULT 'dipesan',
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_kamar) REFERENCES kamar(id_kamar)
);

-- Membuat Tabel Pembayaran
CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_reservasi INT,
    tanggal_pembayaran DATE,
    jumlah DECIMAL(10, 2),
    metode_pembayaran VARCHAR(50),
    status_pembayaran VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (id_reservasi) REFERENCES reservasi(id_reservasi)
);
