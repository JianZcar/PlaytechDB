CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fname VARCHAR(255),
  mname VARCHAR(255),
  lname VARCHAR(255),
  email VARCHAR(255),
  mobile VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE audit_trail (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255),
  activity VARCHAR(255),
  register DATETIME DEFAULT CURRENT_TIMESTAMP,
  login VARCHAR(2),
  logout VARCHAR(2)
);

CREATE TABLE admins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  role VARCHAR(50) -- e.g., 'superadmin', 'manager'
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  date_created DATE
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  price DECIMAL(10,2),
  category_id INT,
  stock INT,
  image blob,
  date_added DATE,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  total_price DECIMAL(10,2),
  status VARCHAR(50), -- e.g., 'Pending', 'Paid', 'Shipped', 'Delivered'
  order_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE cart (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  quantity INT,
  date_added DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE inventory_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  action VARCHAR(50), -- 'add', 'remove', 'adjust'
  quantity INT,
  admin_id INT,
  date_logged DATETIME,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (admin_id) REFERENCES admins(id)
);


CREATE TABLE contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  subject VARCHAR(255),
  message TEXT,
  date_sent DATETIME
);
