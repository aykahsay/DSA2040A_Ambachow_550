-- PRAGMA to enforce foreign keys in SQLite (run before creating/inserting)
PRAGMA foreign_keys = ON;

-- Dimension: Customer
CREATE TABLE IF NOT EXISTS CustomerDim (
    CustomerKey INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER UNIQUE,    -- original customer id from data
    Country TEXT,
    TotalPurchases REAL,
    NumTransactions INTEGER
);

-- Dimension: Product
CREATE TABLE IF NOT EXISTS ProductDim (
    ProductKey INTEGER PRIMARY KEY AUTOINCREMENT,
    StockCode TEXT UNIQUE,
    Description TEXT,
    Category TEXT,
    AvgUnitPrice REAL
);

-- Dimension: Time
CREATE TABLE IF NOT EXISTS TimeDim (
    TimeKey INTEGER PRIMARY KEY AUTOINCREMENT,
    InvoiceDate DATE UNIQUE,
    Day INTEGER,
    Month INTEGER,
    MonthName TEXT,
    Quarter INTEGER,
    Year INTEGER
);

-- Fact: Sales
CREATE TABLE IF NOT EXISTS SalesFact (
    SalesKey INTEGER PRIMARY KEY AUTOINCREMENT,
    InvoiceNo TEXT,
    ProductKey INTEGER,
    CustomerKey INTEGER,
    TimeKey INTEGER,
    Quantity INTEGER,
    UnitPrice REAL,
    TotalSales REAL,
    FOREIGN KEY(ProductKey) REFERENCES ProductDim(ProductKey),
    FOREIGN KEY(CustomerKey) REFERENCES CustomerDim(CustomerKey),
    FOREIGN KEY(TimeKey) REFERENCES TimeDim(TimeKey)
);
