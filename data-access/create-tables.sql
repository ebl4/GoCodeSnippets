DROP TABLE IF EXISTS dbo.album;
CREATE TABLE dbo.album (
  id         INT IDENTITY(1,1) PRIMARY KEY,
  title      NVARCHAR(128) NOT NULL,
  artist     NVARCHAR(255) NOT NULL,
  price      DECIMAL(5,2) NOT NULL
);

INSERT INTO dbo.album
  (title, artist, price)
VALUES
  ('Blue Train', 'John Coltrane', 56.99),
  ('Giant Steps', 'John Coltrane', 63.99),
  ('Jeru', 'Gerry Mulligan', 17.99),
  ('Sarah Vaughan', 'Sarah Vaughan', 34.98);
GO