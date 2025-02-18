--  create 
--  \! clear
--  \l  hamma malumotlar bazasini ko'rish

CREATE DATABASE vazifa;

\c vazifa;



--user yaratish

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role VARCHAR(50) CHECK (role IN ('admin', 'user')) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



--ticket yaratish

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(50) CHECK (status IN ('open', 'in_progress', 'closed')) DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



--   ticket comment yaratish

CREATE TABLE ticket_comments (
    id SERIAL PRIMARY KEY,
    ticket_id INT REFERENCES tickets(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--userlar

INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@gmail.com', 'hashedpassword123', 'admin'),
('Regular User', 'user@example.com', 'hashedpassword456', 'user'),
('John Doe', 'johndoe@gmail.com', 'johndoee1221', 'user'),
('Jane Doe', 'janedoe@gmail.com', 'janedoe101', 'user'),
('Alice Smith', 'alice@gmail.com', 'aliceSmith33', 'user'),
('Bob Johnson', 'bob@gmail.com', 'bobjohnson03', 'user'),
('Charlie Brown', 'charlie@gmail.com', 'charliebrow404', 'user'),
('David Wilson', 'david@gmail.com', 'wilson44455', 'user'),
('Emma Davis', 'emma@gmail.com', 'emmadavisa22', 'user'),
('Frank Miller', 'frank@gmail.com', 'mrmiller707', 'user'),
('Grace Lee', 'grace@gmail.com', 'gracelee38', 'user');



--ticketlar

INSERT INTO tickets (user_id, title, description) VALUES
(2, 'System Crash', 'My system crashes when I open the application'),
(3, 'Login Issue', 'Unable to log in with correct credentials'),
(4, 'Payment Failure', 'Transaction not going through'),
(5, 'App Freezing', 'Application freezes randomly'),
(6, 'Feature Request', 'Add dark mode option'),
(7, 'Bug Report', 'Profile picture not uploading'),
(8, 'Slow Performance', 'App is running very slow'),
(9, 'Database Error', 'Getting 500 error on requests'),
(10, 'Security Issue', 'Password reset not working'),
(11, 'UI Improvement', 'Improve accessibility options');



--ticket commentlar

INSERT INTO ticket_comments (ticket_id, user_id, comment) VALUES
(1, 1, 'We are looking into this issue.'),
(2, 3, 'This issue is still present.'),
(3, 4, 'Please check the payment gateway logs.'),
(4, 5, 'We are investigating the freezing issue.'),
(5, 6, 'Dark mode is in our roadmap.'),
(6, 7, 'Can you provide more details on the bug?'),
(7, 8, 'We are optimizing the app performance.'),
(8, 9, 'Database error logs are being analyzed.'),
(9, 10, 'We will prioritize this security issue.'),
(10, 11, 'UI improvements are planned for the next release.');



----- chiptalarni yangilash
UPDATE tickets SET status = 'in_progress' WHERE id = 1;
UPDATE tickets SET status = 'closed' WHERE id = 2;
UPDATE tickets SET status = 'in_progress' WHERE id = 3;
UPDATE tickets SET status = 'closed' WHERE id = 4;
UPDATE tickets SET status = 'open' WHERE id = 5;
UPDATE tickets SET status = 'in_progress' WHERE id = 6;
UPDATE tickets SET status = 'closed' WHERE id = 7;
UPDATE tickets SET status = 'open' WHERE id = 8;
UPDATE tickets SET status = 'in_progress' WHERE id = 9;
UPDATE tickets SET status = 'closed' WHERE id = 10;


--chiptalarni o‘chirish
DELETE FROM tickets WHERE id = 2;
DELETE FROM tickets WHERE id = 4;
DELETE FROM tickets WHERE id = 6;
DELETE FROM tickets WHERE id = 8;
DELETE FROM tickets WHERE id = 10;



-- user yangilash
UPDATE users SET name = 'Updated User' WHERE id = 2;
UPDATE users SET name = 'John Updated' WHERE id = 3;
UPDATE users SET name = 'Jane Updated' WHERE id = 4;
UPDATE users SET name = 'Alice Updated' WHERE id = 5;
UPDATE users SET name = 'Bob Updated' WHERE id = 6;

-- user o‘chirish
DELETE FROM users WHERE id = 2;
DELETE FROM users WHERE id = 4;
DELETE FROM users WHERE id = 6;
DELETE FROM users WHERE id = 8;
DELETE FROM users WHERE id = 10;






--------
select * from users