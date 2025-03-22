-- 1. USERS
CREATE TABLE site_user (
    id SERIAL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    password VARCHAR(60) NOT NULL
);

-- 2. PRODUCT CATEGORY
CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- 3. PRODUCT
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    sku VARCHAR(50) UNIQUE NOT NULL,
    quantity_in_stock INT DEFAULT 0,
    price DECIMAL(10,2) NOT NULL,
    product_image VARCHAR(100),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 4. SHOPPING CART
CREATE TABLE shopping_cart (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES site_user(id)
);

-- 5. SHOPPING CART ITEM
CREATE TABLE shopping_cart_item (
    id SERIAL PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES shopping_cart(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 6. SHOP ORDER
CREATE TABLE shop_order (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    payment_method_id INT,
    shipping_address_id INT,
    order_status VARCHAR(20) NOT NULL,
    order_date TIMESTAMP DEFAULT NOW(),
    order_total DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES site_user(id)
);

-- 7. ORDER LINE
CREATE TABLE order_line (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES shop_order(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
