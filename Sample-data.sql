USE ShowSphereDB;
GO

INSERT INTO Users (FirstName, LastName, Email, PasswordHash, Role)
VALUES 
('Aditi', 'Menon', 'aditi.menon@example.com', 'aditi123', 'Customer'),
('Raj', 'Verma', 'raj.verma@example.com', 'raj123', 'Customer'),
('Admin', 'User', 'admin@example.com', 'admin123', 'Admin');

INSERT INTO Events (EventName, EventType, Description, EventDate, Venue, TicketPrice, AvailableSeats)
VALUES 
('Movie Night: Avengers', 'Movie', 'Marvel action movie screening.', '2025-07-12', 'Auditorium A', 12.50, 100),
('Rock Fusion Concert', 'Concert', 'Live performance by indie bands.', '2025-07-20', 'City Stage', 30.00, 250),
('Photography Workshop', 'Other', 'Learn basics of DSLR photography.', '2025-07-25', 'Studio Room B', 20.00, 40);

INSERT INTO Bookings (UserID, EventID, BookingDate, NumberOfSeats)
VALUES 
(1, 1, GETDATE(), 2),  -- Aditi books 2 tickets for Avengers
(2, 2, GETDATE(), 3);  -- Raj books 3 tickets for concert 

INSERT INTO Payments (BookingID, PaymentDate, Amount, PaymentStatus)
VALUES 
(1, GETDATE(), 25.00, 'Completed'),
(2, GETDATE(), 90.00, 'Completed');


SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Bookings;
SELECT * FROM Payments;


