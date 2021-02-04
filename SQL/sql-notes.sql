-- baz dafa ham kafa 1 sath insert kar rahy hoty hen, to data insert nahi ho pata, 1 wajah ye ho sakti h k aap k for-insert data ka size above limit h, limit ko barhany k lye ye karen: 
SET GLOBAL max_allowed_packet=1073741824;
-- is me ham 1GB tak increase kar rahy hen.


-- check primary key
SHOW KEYS FROM table_name WHERE Key_name = 'PRIMARY'


-- check index
SHOW INDEX FROM table_name FROM data_base_name;


-- change maximum size of query to 500MB
SET GLOBAL max_allowed_packet=512000000;

# get tables sizes in MB
SELECT table_name AS "Table",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema = "kashat"
ORDER BY (data_length + index_length) DESC;

# get DB backup ............ mysqldump --compress -h127.0.0.1 -udb_user -p kashat > kashat-20201224_created_from_history_folders.sql ............. (--compress here for compression. mery pas 70GB ki DB thi, me ny --compress flat use kar k backup lya to 21GB ki file bani)
# restore from backup ............ sudo mysql -h 127.0.0.1 -P 3307 -u root -p kashat_new < kashat.sql
# SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema 

# change type to longtext ............. ALTER TABLE  MODIFY  LONGTEXT;
