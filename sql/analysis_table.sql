CREATE OR REPLACE TABLE
    `rakamin-kf-analytics-427500.kimia_farma.analysis_table` AS

SELECT
    x.transaction_id,
    x.date,
    x.branch_id,
    x.branch_name,
    x.kota,
    x.provinsi,
    x.rating_cabang,
    x.customer_name,
    x.product_id,
    x.product_name,
    x.actual_price,
    x.discount_percentage,
    x.persentase_gross_laba,
    x.nett_sales,

    -- Perhitungan Nett Profit
    (
        x.persentase_gross_laba * x.nett_sales
    )
    - (
        x.actual_price - x.nett_sales
    ) AS nett_profit,

    x.rating_transaksi

FROM (
    SELECT
        -- Transaction Information
        a.transaction_id,
        a.date,
        a.branch_id,

        -- Branch Information
        b.branch_name,
        b.kota,
        b.provinsi,
        b.rating AS rating_cabang,

        -- Customer Information
        a.customer_name,

        -- Product Information
        a.product_id,
        c.product_name,
        c.price AS actual_price,

        -- Discount
        a.discount_percentage,

        -- Gross Profit Percentage
        CASE
            WHEN c.price <= 50000 THEN 0.10
            WHEN c.price > 50000
                AND c.price <= 100000 THEN 0.15
            WHEN c.price > 100000
                AND c.price <= 300000 THEN 0.20
            WHEN c.price > 300000
                AND c.price <= 500000 THEN 0.25
            WHEN c.price > 500000 THEN 0.30
        END AS persentase_gross_laba,

        -- Nett Sales
        (
            c.price - (c.price * a.discount_percentage)
        ) AS nett_sales,

        -- Transaction Rating
        a.rating AS rating_transaksi

    FROM
        `rakamin-kf-analytics-427500.kimia_farma.kf_final_transaction` AS a

    -- Join Branch Table
    LEFT JOIN
        `rakamin-kf-analytics-427500.kimia_farma.kf_kantor_cabang` AS b
        ON a.branch_id = b.branch_id

    -- Join Product Table
    LEFT JOIN
        `rakamin-kf-analytics-427500.kimia_farma.kf_product` AS c
        ON a.product_id = c.product_id
) AS x;
