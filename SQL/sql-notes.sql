-- baz dafa ham kafa 1 sath insert kar rahy hoty hen, to data insert nahi ho pata, 1 wajah ye ho sakti h k aap k for-insert data ka size above limit h, limit ko barhany k lye ye karen: 
SET GLOBAL max_allowed_packet=1073741824;
-- is me ham 1GB tak increase kar rahy hen.


-- check primary key
SHOW KEYS FROM table_name WHERE Key_name = 'PRIMARY'


-- check index
SHOW INDEX FROM table_name FROM data_base_name;


-- change maximum size of query to 500MB
SET GLOBAL max_allowed_packet=512000000;
