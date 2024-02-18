-- replace numbers in SQL
-- Use the flag 'g' if multiple numbers can occur in a string
regexp_replace(col, '[[:digit:]]+', '#', 'g')




-- Nested CASE
    CASE
        WHEN condition1 THEN calculation1
        WHEN condition2 THEN calculation2
        ELSE NULL
    END AS calculatedcol


