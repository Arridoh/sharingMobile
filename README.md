# 📝 Panduan Push Proyek Pertama Kali ke GitHub

Ini adalah catatan langkah demi langkah untuk mengunggah (push) proyek yang sudah ada di komputer lokal ke repositori baru di GitHub.

---

## Langkah 1: Buat Repositori Baru di GitHub

1. Buka **GitHub.com** dan login.
2. Klik ikon **tanda tambah (+)** di pojok kanan atas, lalu pilih **"New repository"**.
3. Beri nama repositori Anda (misalnya: `proyek-latihan-saya`).
4. Pilih **"Private"** atau **"Public"**.
5. **SANGAT PENTING:** *Jangan* centang kotak "Add a README file", "Add .gitignore", atau "Choose a license". Kita akan mengunggah file kita sendiri.
6. Klik tombol **"Create repository"**.
7. Di halaman berikutnya, Anda akan melihat beberapa perintah. Biarkan halaman ini tetap terbuka. Salin URL `.git` yang ditampilkan, contohnya:
    `https://github.com/username-anda/proyek-latihan-saya.git`

---

## Langkah 2: Persiapan di Folder Proyek Lokal (Terminal)

Buka Terminal (untuk Mac/Linux) atau Git Bash/Command Prompt (untuk Windows) dan masuk ke folder proyek Anda.

1. **Masuk ke folder proyek:**

    ```bash
    cd /lokasi/folder/proyek-anda
    ```

2. **Inisialisasi Git:**
    (Hanya dilakukan jika ini adalah proyek baru yang belum pernah menggunakan Git)

    ```bash
    git init
    ```

3. **Tambahkan semua file ke pelacakan Git:**
    (Tanda titik `.` berarti "semua file dan folder" di direktori saat ini)

    ```bash
    git add .
    ```

4. **Buat "commit" (simpanan) pertama Anda:**

    ```bash
    git commit -m "First commit"
    ```

---

## Langkah 3: Hubungkan Lokal ke GitHub dan Push

Sekarang, kita akan menghubungkan folder lokal kita ke repositori yang sudah dibuat di Langkah 1.

1. **Ganti nama branch utama menjadi `main`:**
    (Ini adalah standar baru GitHub, menggantikan `master`)

    ```bash
    git branch -M main
    ```

2. **Tambahkan "remote" (koneksi ke GitHub):**
    (Ganti `[URL-GIT-ANDA]` dengan URL yang Anda salin dari Langkah 1)

    ```bash
    git remote add origin [URL-GIT-ANDA]
    ```

    *Contoh:*
    `git remote add origin https://github.com/username-anda/proyek-latihan-saya.git`

3. **Push kode Anda ke GitHub:**
    (Perintah `-u` akan mengatur `origin main` sebagai tujuan *default* untuk *push/pull* di masa depan)

    ```bash
    git push -u origin main
    ```

4. **Selesai!**
    Sekarang, jika Anda me-*refresh* halaman repositori Anda di GitHub, semua file Anda akan muncul di sana.

---

### Perintah untuk Push Selanjutnya

Setelah melakukan ini semua, untuk *push* perubahan di masa depan, langkahnya jauh lebih sederhana:

1. **Tambahkan file yang berubah:**

    ```bash
    git add .
    ```

2. **Commit perubahan:**

    ```bash
    git commit -m "Menambahkan fitur baru"
    ```

3. **Push ke GitHub:**

    ```bash
    git push
    ```
