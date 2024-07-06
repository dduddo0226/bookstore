-- 예시 데이터 삽입
INSERT INTO Product (name, description, price, category_id, manufacturer_id, stock_quantity)
VALUES
    ('Ballpoint Pen', 'Blue ink ballpoint pen', 1.99, 1, 1, 100),
    ('Mechanical Pencil', '0.5mm lead mechanical pencil', 2.49, 1, 2, 75),
    ('Notebook', 'A5 size ruled notebook', 4.99, 2, 3, 50),
    ('Sticky Notes', 'Colorful sticky notes set', 1.79, 2, 4, 200),
    ('Highlighter', 'Assorted color highlighter set', 3.29, 1, 5, 80),
    ('Correction Tape', 'White correction tape', 1.49, 1, 6, 150),
    ('Binder Clips', 'Assorted size binder clips', 2.99, 2, 7, 100),
    ('Index Cards', '3x5 inch ruled index cards', 0.99, 2, 8, 300),
    ('Gel Pen', '0.7mm black gel pen', 1.29, 1, 9, 120),
    ('Whiteboard Marker', 'Assorted color whiteboard marker set', 5.49, 1, 10, 60);ProductProductProduct

CREATE TABLE Product (
                         product_id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(255) NOT NULL,
                         description TEXT,
                         price INT NOT NULL,
                         category_id INT,
                         manufacturer_id INT,
                         stock_quantity INT DEFAULT 0,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);