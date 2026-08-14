
Kimia Farma Business Performance Analytics 2020-2023
# Kimia Farma Business Performance Analytics

## 📊 Project Overview

Project ini merupakan analisis performa bisnis **Kimia Farma periode 2020–2023** menggunakan data transaksi, produk, dan kantor cabang. Data diolah menggunakan **Google BigQuery** dan divisualisasikan dalam bentuk dashboard menggunakan **Looker Studio**.

Tujuan utama project ini adalah memberikan gambaran mengenai performa penjualan, profitabilitas, transaksi, serta performa cabang dan provinsi untuk mendukung analisis bisnis berbasis data.

---

## 🎯 Objectives

* Menganalisis perkembangan pendapatan Kimia Farma dari tahun ke tahun.
* Mengidentifikasi cabang dan provinsi dengan performa penjualan terbaik.
* Menganalisis nett sales dan nett profit.
* Mengevaluasi performa cabang berdasarkan rating.
* Membandingkan rating cabang dengan rating transaksi.
* Menyajikan hasil analisis dalam dashboard interaktif.

---

## 🗂️ Dataset

Project menggunakan beberapa tabel utama:

| Table                  | Description                                    |
| ---------------------- | ---------------------------------------------- |
| `kf_final_transaction` | Data transaksi penjualan                       |
| `kf_product`           | Data produk dan harga                          |
| `kf_kantor_cabang`     | Data kantor cabang, kota, provinsi, dan rating |
| `kf_inventory`         | Data inventory produk                          |
| `analysis_table`       | Tabel hasil penggabungan dan transformasi data |

---

## 🔄 Data Processing

Data dari `kf_final_transaction`, `kf_product`, dan `kf_kantor_cabang` digabungkan menggunakan `LEFT JOIN` berdasarkan:

* `branch_id`
* `product_id`

Kemudian dibuat beberapa field analisis seperti **Nett Sales, Persentase Gross Laba, dan Nett Profit**.

### Nett Sales

```text
Nett Sales = Actual Price - (Actual Price × Discount Percentage)
```

### Persentase Gross Laba

Persentase gross laba ditentukan berdasarkan harga produk:

| Harga Produk            | Gross Laba |
| ----------------------- | ---------: |
| ≤ Rp50.000              |        10% |
| > Rp50.000 – Rp100.000  |        15% |
| > Rp100.000 – Rp300.000 |        20% |
| > Rp300.000 – Rp500.000 |        25% |
| > Rp500.000             |        30% |

### Nett Profit

```text
Nett Profit =
(Persentase Gross Laba × Nett Sales)
- (Actual Price - Nett Sales)
```

---

## 📈 Analysis Metrics

`analysis_table` menghasilkan beberapa data dan metrik utama:

### Transaction & Customer

* Transaction ID
* Date
* Customer Name

### Branch

* Branch ID
* Branch Name
* Kota
* Provinsi
* Rating Cabang

### Product

* Product ID
* Product Name
* Actual Price

### Sales & Profit

* Discount Percentage
* Nett Sales
* Persentase Gross Laba
* Nett Profit

### Rating

* Rating Transaksi

---

## 📊 Dashboard

Dashboard dibuat menggunakan **Looker Studio** untuk menyajikan hasil analisis secara interaktif.

### Snapshot Data

Dashboard mencakup:

* **Perbandingan Pendapatan Kimia Farma dari Tahun ke Tahun**
* **Top 10 Total Transaksi Cabang/Provinsi**
* **Top 10 Nett Sales Cabang/Provinsi**
* **Top 5 Cabang dengan Rating Tertinggi namun Rating Transaksi Terendah**
* **Indonesia Geo Map untuk Total Profit Masing-masing Provinsi**

Dashboard dapat digunakan untuk melihat performa bisnis berdasarkan tahun, provinsi, cabang, dan indikator keuangan.

---

## 🛠️ Tools

* **Google BigQuery** — Data processing & SQL
* **Google Data Studio** — Data visualization & dashboard
* **GitHub** — Project documentation & version control

---

## 📁 Project Structure

```text
kimia-farma-business-performance/
│
├── README.md
│
├── sql/
│   └── analysis_table.sql
│
├── dashboard/
│   └── dashboard.png
│
└── data/
    └── README.md
```

---

## 🚀 Workflow

```text
Raw Data
   ↓
Data Preparation
   ↓
BigQuery
   ↓
Data Joining & Transformation
   ↓
Analysis Table
   ↓
Google Data Studio
   ↓
Business Performance Dashboard
   ↓
Business Insights
```

---

## 💡 Key Insights

Analisis pada project ini berfokus pada beberapa aspek utama:

1. **Revenue Performance** — melihat perubahan pendapatan dari tahun ke tahun.
2. **Sales Performance** — mengidentifikasi cabang/provinsi dengan nett sales tertinggi.
3. **Transaction Performance** — melihat distribusi dan jumlah transaksi.
4. **Profitability** — menganalisis nett profit berdasarkan wilayah.
5. **Branch Performance** — mengevaluasi performa cabang berdasarkan rating.
6. **Customer Transaction Rating** — membandingkan rating transaksi dengan rating cabang.

---

## 👤 Author

**Eko Damar Yogi**

Data Analytics Project — Kimia Farma Business Performance Analytics
