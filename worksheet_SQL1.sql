-- 1. Goal: Here we use users table to pull a list of user email addresses. Edit the query to pull email addresses, but only for non-deleted users.

SELECT id, email_address FROM dsv1069.users WHERE deleted_at IS NOT NULL

-- 2. Goal: Use the items table to count the number of items for sale in each category

SELECT category, COUNT(*) AS item_count FROM dsv1069.items GROUP BY category

-- 3. Goal: Select all of the columns from the result when you JOIN the users table to the orders table 

SELECT * FROM dsv1069.users u INNER JOIN dsv1069.orders o ON u.id = o.user_id

-- 4. Goal: Check out the query below. This is not the right way to count the number of viewed_item events. Determine what is wrong and correct the error.

SELECT COUNT(DISTINCT event_id) FROM dsv1069.events WHERE event_name = 'view_item' 

-- 5. Goal:Compute the number of items in the items table which have been ordered. The query



-- below runs, but it isn’t right. Determine what is wrong and correct the error or start from scratch.

SELECT 
  DATE(event_time) AS date,
  COUNT(*)         AS rows
FROM 
  dsv1069.events_201701
GROUP BY
  DATE(event_time)

-- Goal: Write a query to format the view_item event into a table with the appropriate columns

SELECT
  event_id,
  event_time,
  user_id
  platform,
  (CASE WHEN parameter_name = 'item_id'
        THEN CAST(parameter_value AS INT)
        ELSE NULL
        END) AS item_id
  FROM
    dsv1069.events 
  WHERE
    event_name = 'view_item'
  ORDER BY event_id LIMIT 10
  
  -- Goal: Use the result from the previous exercise, but make sure

  
  SELECT 
  event_id,
  event_time,
  user_id,
  platform,
  MAX(CASE WHEN parameter_name = 'item_id'
        THEN CAST(parameter_value AS INT)
        ELSE NULL 
        END) AS item_id,
  MAX(CASE WHEN parameter_name = 'referrer'
        THEN parameter_value
        ELSE NULL 
        END) AS referrer
  FROM 
    dsv1069.events 
  WHERE 
    event_name = 'view_item'
  GROUP BY 
    event_id,
    event_time,
    user_id,
    platform
