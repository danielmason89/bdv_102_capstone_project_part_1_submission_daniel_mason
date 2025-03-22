# Documentation - Detailed Use Cases: Swiftcart Online ECommerce Store/Platform

This document outlines key use cases for Swiftcart eCommerce store/platform, detailing actions performed by the user and corresponding backend database operations. The use cases include browsing and viewing products, adding products to the shopping cart, placing orders, and updating product information.

---

## Use Case 1: Browsing and Viewing Products

**Actors**: Customer  
**Description**: A customer opens the website and browses available products.  

### Trigger:
- The customer navigates to the “Products” section of the store.

### Preconditions:
- The products are already stored in the database.
- The user is on the product listing page (not necessarily logged in).

### Process/Steps:
1. The customer selects “View Products.”
2. The frontend calls a `GET /products` API.
3. The backend fetches the list of products from the database (including name, description, price, etc.).
4. The system returns the product data in a JSON response.

### Postconditions:
- The customer sees a list of products along with pertinent details (name, price, etc.).

---

## Use Case 2: Add Product to Shopping Cart

**Actors**: Customer  
**Description**: A customer browses through the product listings on the website, selects a product, and adds it to their shopping cart for later purchase.

### Data Required:
- Product details (e.g., name, price, quantity)
- Customer session or identification (ensuring the cart is linked to the correct user)

### Backend Database Operations:
- **Create**: Add the selected product to the shopping cart table in the database.
- **Read**: Fetch product details using a `GET` request (e.g., product name, price, etc.).
- **Update**: Modify the quantity of an item already in the cart (if the customer changes their mind or adds more).
- **Delete**: Remove an item from the shopping cart if the customer decides to delete it.

---

## Use Case 3: Place an Order

**Actors**: Customer  
**Description**: After reviewing their shopping cart, the customer proceeds to checkout and places an order for the products, which is then processed for shipping and payment.

### Data Required:
- **Customer Details**: Name, address, contact information
- **Order Details**: Items in the cart, quantities, total price
- **Payment Method**: Credit card, PayPal, etc.

### Backend Database Operations:
- **Create**: Insert a new order record into the database when the customer places an order.
- **Read**: Retrieve customer profile and cart details to ensure the order is complete and accurate.
- **Update**: Modify the status of the order (e.g., processing, shipped, delivered).
- **Delete**: Cancel an order (optional, depending on the system's policies).

---

## Use Case 4: Update Product Information (Admin Only)

**Actors**: Admin (Store Manager)  
**Description**: An admin can modify product details, such as updating the price, availability, description, or adding new product information.

### Data Required:
- **Product ID**: The unique identifier for the product being updated
- **New Product Details**: Updated price, description, quantity available, etc.

### Backend Database Operations:
- **Create**: Create a new product record or update an existing one with new details.
- **Read**: Fetch the existing details of the product to confirm or verify before making changes.
- **Update**: Modify the product’s details (e.g., price, availability, or description).
- **Delete**: Remove the product from the database (if it's no longer available or being sold).

---

## Key Customer CRUD Operations for Swiftcart Online Ecommerce Platform

## 1) Create a New User
- **Action**: `POST /users`
- **Effect on DB**: Insert new row in `site_user` table.

---

## 2) Retrieve List of Products
- **Action**: `GET /products`
- **Effect on DB**: Select rows from `product` table.

---

## 3) Add an Item to Cart
- **Action**: `POST /cart/{userId}/items`
- **Effect on DB**: Insert a new row in `shopping_cart_item` table.

---

## 4) Update Quantity in Cart
- **Action**: `PUT /cart/{cartId}/items/{itemId}`
- **Effect on DB**: Update `shopping_cart_item.quantity` in the database.

---

## 5) Place an Order
- **Action**: `POST /orders`
- **Effect on DB**: Insert a new record in `shop_order` table and insert corresponding `order_line` items.

---

## Summary of Operations

The use cases above highlight the essential operations for Swiftcart online eCommerce platform, with each case focusing on customer interaction and backend database operations. The following is a quick summary:

| Use Case                    | Create Operation                          | Read Operation                      | Update Operation                        | Delete Operation                         |
|-----------------------------|-------------------------------------------|--------------------------------------|-----------------------------------------|------------------------------------------|
| Browsing and Viewing Products | N/A                                       | Fetch product details               | N/A                                     | N/A                                      |
| Add Product to Cart          | Add item to cart table                    | Fetch product details               | Modify item quantity                    | Remove item from cart                    |
| Place Order                  | Insert new order record                   | Retrieve customer & cart details    | Update order status                     | Cancel order                             |
| Update Product Info          | Create/update product record              | Fetch product details               | Modify product details                   | Delete product                           |

This document serves as a reference for understanding key workflows in the Swiftcart eCommerce environment to help guide the backend implementation.
