# PBI_Kimia-Farma_BDA

# Final Project: Analisis Kinerja Bisnis Kimia Farma (2020-2023)

Ini adalah repository untuk *submission* Final Project Virtual Internship Experience (VIX) Rakamin Academy - Big Data Analytics Intern bersama Kimia Farma.

Proyek ini berfokus pada analisis kinerja bisnis Kimia Farma dari tahun 2020-2023, mulai dari pemrosesan data di BigQuery hingga visualisasi di Looker Studio.

## 1. Isi Repository

Repository ini berisi satu file utama:

* `[Sql Code (1).sql]`: File ini berisi *syntax* SQL (BigQuery) yang digunakan untuk melakukan seluruh proses *data transformation* (ETL).

## 2. Panduan Singkat Script SQL

Script SQL yang disediakan akan membuat satu tabel analisa final bernama `tabel_analisa_final`.

Alur kerja script tersebut adalah sebagai berikut:

1.  **`BaseTable` (CTE 1):** Menggabungkan (`JOIN`) tiga tabel utama: `kf_final_transaction`, `kf_kantor_cabang`, dan `kf_product`.
2.  [cite_start]**`CalculateMetrics` (CTE 2):** Menghitung `persentase_gross_laba` (menggunakan logika `CASE` [cite: 48-53]) dan `nett_sales` (penjualan setelah diskon).
3.  **`CalculateFinal` (CTE 3):** Menghitung `nett_profit` (profit bersih) berdasarkan hasil dari CTE sebelumnya.
4.  **`CREATE OR REPLACE TABLE`:** Menyimpan hasil akhir dari `CalculateFinal` sebagai tabel permanen yang siap digunakan oleh Looker Studio.

## 3. Alat (Tools) yang Digunakan

* **Google BigQuery:** Untuk penyimpanan data (Data Warehouse) dan transformasi data (SQL).
* **Google Looker Studio:** Untuk visualisasi data dan pembuatan dashboard.

## 4. Hasil Akhir (Dashboard)

[cite_start]Data dari `tabel_analisa_final` kemudian divisualisasikan menggunakan Looker Studio untuk menjawab pertanyaan bisnis utama [cite: 65-73] seperti:
* Tren pendapatan dari tahun ke tahun.
* Total profit berdasarkan lokasi geografis (peta).
* Performa provinsi teratas (Top 10).
* Anomali layanan di tingkat cabang (Top 5).

---
* **Nama:** Ahmad Syarifudin Alamsyah
* **Program:** PBI Rakamin Academy - Big Data Analytics - Kimia Farma
