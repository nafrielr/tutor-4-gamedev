## Tutorial 4 Game Development

### **📌 Deskripsi Proyek**

Proyek ini merupakan pengembangan dari level pertama dengan menambahkan level kedua yang memiliki desain tile map, rintangan, dan mekanisme yang berbeda. Level ini dirancang untuk memberikan tantangan baru kepada pemain dengan variasi obstacle dan musuh yang lebih beragam.

### 🎮 Level 1 – Pengenalan Dasar

Pada level pertama, saya mengimplementasikan:

- **TileMap**: Membuat peta menggunakan TileMap sebagai dasar level.
- **Player**: Karakter utama yang bisa bergerak, melompat, dan mengumpulkan koin.
- **Spawner dengan Falling Fish**: Objek **Falling Fish** yang jatuh secara periodik sebagai rintangan.
- **Koin sebagai Penunjuk Arah**: Koin akan menghilang ketika **Player** menyentuhnya (`body_entered`).
- **Gedung Rektorat sebagai Tujuan**: Ketika **Player** mencapai **Area2D** di gedung rektorat, game akan berpindah ke **Level 2**.
    - Perpindahan ini menggunakan **signal `body_entered`** untuk mendeteksi interaksi dengan gedung.

### 🎮 Level 2 – Tantangan Baru

Level kedua memiliki beberapa perbedaan dari level pertama:

- **TileMap yang Berbeda**: Menggunakan **desain peta yang baru**, berbeda dari level pertama.
- **Spawner dengan Barnacle**: Rintangan baru berupa **Barnacle**, bukan **Falling Fish**.
- **Koin sebagai Penunjuk Arah**: Sama seperti level pertama, koin akan membantu menunjukkan jalur yang harus diambil oleh Player.
- **Musuh Baru**:
    - **Bee & Slime**: Berbeda dari objek jatuh di level pertama, **musuh ini tetap di tempat (tidak jatuh)**.
    - **Jika Player menyentuh Bee, Slime, atau Barnacle, maka akan kalah** (berpindah ke **LoseScreen**).
- **Gedung Rektorat sebagai Tujuan**:
    - Jika **Player berhasil mencapai gedung rektorat**, maka akan muncul **WinScreen**, artinya pemain telah menang.
