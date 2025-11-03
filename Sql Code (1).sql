-- Create Table Statement
-- Membuat tabel bernama 'tabel_analisa_final' di dalam dataset 'kimia_farma'.
CREATE OR REPLACE TABLE `plucky-function-476506-j1.kimia_farma.tabel_analisa_final` AS (

-- Common Table Expression (CTE)
-- Memecah logika menjadi beberapa tahap agar mudah dibaca dan diperiksa.
WITH BaseTable AS (
  SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    t.customer_name,
    t.product_id,
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    p.product_name
  -- From statement: Menentukan tabel transaksi sebagai tabel utama.
  FROM
    `plucky-function-476506-j1.kimia_farma.kf_final_transaction` AS t
  -- Left Join On Statement: Menggabungkan tabel-tabel berdasarkan ID yang sesuai.
  LEFT JOIN
    `plucky-function-476506-j1.kimia_farma.kf_kantor_cabang` AS c ON t.branch_id = c.branch_id
  LEFT JOIN
    `plucky-function-476506-j1.kimia_farma.kf_product` AS p ON t.product_id = p.product_id
),

CalculateMetrics AS (
  SELECT
    *,
    -- Case When End Statement: Logika IF/THEN untuk menentukan persentase laba.
    CASE
      WHEN actual_price <= 50000 THEN 0.10
      WHEN actual_price > 50000 AND actual_price <= 100000 THEN 0.15
      WHEN actual_price > 100000 AND actual_price <= 300000 THEN 0.20
      WHEN actual_price > 300000 AND actual_price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,

    -- Sales Calculation: Menghitung penjualan bersih (setelah diskon) dan membulatkannya.
    ROUND((actual_price * (1 - discount_percentage)), 2) AS nett_sales
  FROM
    BaseTable
),

CalculateFinal AS (
  SELECT
    *,
    -- Profit Calculation: Menghitung profit bersih dan membulatkannya.
    ROUND((nett_sales * persentase_gross_laba), 2) AS nett_profit
  FROM
    CalculateMetrics
)

-- Select statement
-- Memanggil kolom-kolom yang diperlukan untuk tabel final sesuai urutan.
SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  nett_sales,
  nett_profit,
  rating_transaksi
FROM
  CalculateFinal
);