SELECT vin, COUNT(vin)
FROM Cars
GROUP BY vin
HAVING COUNT(VIN) > 1

SELECT *
FROM Cars
WHERE vin = 'DAM41UDN3CHU2WVF6'

DELETE FROM Cars
WHERE car_id = 5


