CREATE DATABASE ShowSphereDB;
GO

USE ShowSphereDB;
GO

-- ShowSphere Database Schema
-- Author: Padmaja Govindasamy
-- Purpose: Initial schema for booking movies, concerts, and events

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) CHECK (Role IN ('Customer', 'Admin')) NOT NULL
);

-- Events Table
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(100) NOT NULL,
    EventType NVARCHAR(20) CHECK (EventType IN ('Movie', 'Concert', 'Other')) NOT NULL,
    Description TEXT,
    EventDate DATETIME NOT NULL,
    Venue NVARCHAR(100) NOT NULL,
    TicketPrice DECIMAL(10, 2) NOT NULL,
    AvailableSeats INT NOT NULL
);

-- Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    BookingDate DATETIME DEFAULT GETDATE(),
    NumberOfSeats INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    BookingID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus NVARCHAR(50) CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed')),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
