-- Создание таблицы "Хаб поставщиков" (Supplier Hub)
CREATE TABLE SupplierHub (
    supplier_id serial PRIMARY KEY,
    supplier_hashkey VARCHAR(255) NOT NULL,
    supplier_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

-- Создание таблицы "Хаб товаров" (Product Hub)
CREATE TABLE ProductHub (
    product_id serial PRIMARY KEY,
    product_hashkey VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Связь Заказ-Поставщик" (PurchaseOrder-Supplier Link)
CREATE TABLE PurchaseOrderSupplierLink (
    purchase_order_supplier_id serial PRIMARY KEY,
    purchase_order_id INT,
    supplier_id INT,
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Создание таблицы "Связь Заказ-Товар" (PurchaseOrder-Product Link)
CREATE TABLE PurchaseOrderProductLink (
    purchase_order_product_id serial PRIMARY KEY,
    purchase_order_id INT,
    product_id INT,
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Создание таблицы "Спутник Заказа на поставку" (Purchase Order Satellite)
CREATE TABLE PurchaseOrderSatellite (
    purchase_order_id INT,
    order_date DATE,
    total_amount NUMERIC(10, 2),
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Создание таблицы "Спутник Товара" (Product Satellite)
CREATE TABLE ProductSatellite (
    product_id INT,
    product_name VARCHAR(255),
    description TEXT,
    unit_price NUMERIC(10, 2),
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Создание таблицы "Спутник поставщика" (Supplier Satellite)
CREATE TABLE SupplierSatellite (
    supplier_id INT,
    contact_person VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);
