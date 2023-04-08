-- SELECT reservations.id, title, cost_per_night, start_date, average_rating
-- FROM reservations

-- INNER JOIN (
--   SELECT properties.id, avg(property_reviews.rating)as average_rating
--   FROM properties
--   JOIN property_reviews ON properties.id = property_id
--   GROUP BY properties.id
-- ) as ratings

-- ON ratings.id = reservations.property_id
-- INNER JOIN properties ON properties.id = reservations.property_id
-- WHERE reservations.guest_id = 1
-- ORDER BY start_date
-- LIMIT 10;

SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;