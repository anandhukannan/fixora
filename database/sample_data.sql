-- Sample workers for development (delete once real workers register)
INSERT IGNORE INTO users (name, email, phone, password_hash, role) VALUES
  ('Ravi Kumar', 'ravi@example.com', '9000000001', 'temp_hash', 'worker'),
  ('Anil Das', 'anil@example.com', '9000000002', 'temp_hash', 'worker'),
  ('Suresh Nair', 'suresh@example.com', '9000000003', 'temp_hash', 'worker');

INSERT IGNORE INTO worker_profiles (user_id, city, bio, experience_years) VALUES
  ((SELECT id FROM users WHERE email = 'ravi@example.com'), 'Kannur', 'Plumber and electrician', 5),
  ((SELECT id FROM users WHERE email = 'anil@example.com'), 'Kannur', 'Electrician and carpenter', 8),
  ((SELECT id FROM users WHERE email = 'suresh@example.com'), 'Kochi', 'Home cleaning and plumbing', 3);

INSERT IGNORE INTO worker_services (worker_id, service_id, price) VALUES
  ((SELECT id FROM users WHERE email = 'ravi@example.com'), (SELECT id FROM services WHERE name = 'Plumbing'), 500),
  ((SELECT id FROM users WHERE email = 'ravi@example.com'), (SELECT id FROM services WHERE name = 'Electrical'), 600),
  ((SELECT id FROM users WHERE email = 'anil@example.com'), (SELECT id FROM services WHERE name = 'Electrical'), 550),
  ((SELECT id FROM users WHERE email = 'anil@example.com'), (SELECT id FROM services WHERE name = 'Carpentry'), 700),
  ((SELECT id FROM users WHERE email = 'suresh@example.com'), (SELECT id FROM services WHERE name = 'Cleaning'), 400),
  ((SELECT id FROM users WHERE email = 'suresh@example.com'), (SELECT id FROM services WHERE name = 'Plumbing'), 450);