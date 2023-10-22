-- Создание таблицы "Поставщики" (Suppliers)
CREATE TABLE Suppliers (
    supplier_id serial PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

-- Создание таблицы "Товары" (Products)
CREATE TABLE Products (
    product_id serial PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Заказы на поставку" (PurchaseOrders)
CREATE TABLE PurchaseOrders (
    order_id serial PRIMARY KEY,
    supplier_id INT REFERENCES Suppliers(supplier_id),
    order_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Состав заказа на поставку" (PurchaseOrderItems)
CREATE TABLE PurchaseOrderItems (
    order_item_id serial PRIMARY KEY,
    order_id INT REFERENCES PurchaseOrders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    price_per_unit NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Получатели" (Recipients)
CREATE TABLE Recipients (
    recipient_id serial PRIMARY KEY,
    recipient_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(100),
    address TEXT,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- Создание таблицы "Заказы на доставку" (DeliveryOrders)
CREATE TABLE DeliveryOrders (
    delivery_order_id serial PRIMARY KEY,
    order_id INT REFERENCES PurchaseOrders(order_id),
    recipient_id INT REFERENCES Recipients(recipient_id),
    delivery_date DATE NOT NULL
);

