﻿USE Imbang_Company_1;
GO

DROP TABLE IF EXISTS dbo.WORKS_ON;
GO

CREATE TABLE dbo.WORKS_ON
(
	[Essn]  CHAR(9)      NOT NULL,
	[Pno]   INT          NOT NULL,
	[Hours] DECIMAL(3,1) NOT NULL,
	CONSTRAINT [PK_WORKS_ON] PRIMARY KEY (Essn, Pno)
);
GO

CREATE NONCLUSTERED INDEX IX_WORKS_ON_Hours ON dbo.WORKS_ON ([Hours] ASC);
GO

INSERT INTO dbo.WORKS_ON (Essn, Pno, Hours)
VALUES
(N'123456789', 30, 5.0),
(N'987654321', 20, 10),
(N'564326876', 21, 20);
GO

SELECT * FROM WORKS_ON;
GO

UPDATE dbo.WORKS_ON
SET Hours = 10
WHERE Essn = '123456789' AND Pno = 30;
GO

SELECT * FROM WORKS_ON;
GO

DELETE FROM WORKS_ON WHERE Essn = '123456789' AND Pno = 30;
GO

SELECT * FROM WORKS_ON;
GO

INSERT INTO dbo.WORKS_ON (Essn, Pno, Hours)
VALUES
(N'123456789', 30, 5.0);
GO