CREATE DATABASE IF NOT EXISTS fixora;
USE fixora;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(20),
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('customer', 'worker', 'admin') NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS worker_profiles (
  user_id INT PRIMARY KEY,
  city VARCHAR(100) NOT NULL,
  bio TEXT,
  experience_years INT DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS worker_services (
  worker_id INT NOT NULL,
  service_id INT NOT NULL,
  price INT,
  PRIMARY KEY (worker_id, service_id),
  FOREIGN KEY (worker_id) REFERENCES users(id),
  FOREIGN KEY (service_id) REFERENCES services(id)
);