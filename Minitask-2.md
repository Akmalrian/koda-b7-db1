```mermaid
erDiagram
    customer {
        int id PK
        string nama
        string email
        string alamat
        string no_hp
    }
    kategori_produk {
        int id PK
        string nama_kategori
    }
    produk {
        int id PK
        int id_kategori FK
        string nama_produk
        text deskripsi
        int harga
        int stok
    }
    orders {
        int id PK
        int id_customer FK
        int total_harga
        string status_order
        datetime tanggal_order
    }
    order_item {
        int id PK
        int id_order FK
        int id_produk FK
        int kuantitas
        int harga_satuan
    }
    pembayaran {
        int id PK
        int id_order FK
        string metode_pembayaran
        boolean status_pembayaran
        date tanggal_pembayaran
    }
    review {
        int id PK
        int id_customer FK
        int id_produk FK
        int rating
        string komen
        date tanggal_review
    }

    kategori_produk ||--o{ produk : "memiliki"
    customer ||--o{ orders : "melakukan"
    orders ||--o{ order_item : "berisi"
    produk ||--o{ order_item : "terdaftar di"
    orders ||--|| pembayaran : "dibayar dengan"
    customer ||--o{ review : "menulis"
    produk ||--o{ review : "menerima"