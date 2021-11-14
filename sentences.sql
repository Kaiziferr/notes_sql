

# Seleccionar con un limite
SELECT * FROM <table> LIMIT 5

# Seleccionar un elemento distinto
SELECT DISTINCT <column1, column2, ...> FROM <TABLE>

# Contando
SELECT COUNT(DISTINCT COUNTRY) FROM [Customers]

# Contando con un alias
SELECT COUNT(*) AS <alias> FROM (SELECT DISTINCT(<columna>) FROM <table>)
