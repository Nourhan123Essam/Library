CREATE VIEW ReaderActivitySummary AS
SELECT 
    r.ReaderId,
    r.Name AS ReaderName,
    COUNT(co.CheckoutId) AS TotalCheckouts,
    MAX(co.CheckoutDate) AS LastCheckoutDate
FROM 
    Readers r
LEFT JOIN Checkouts co ON r.ReaderId = co.ReaderId
GROUP BY 
    r.ReaderId, r.Name;