- comando ayuda
```
\?
```
- listar base de datos
```
\l
```
- listar comandos de ayuda
```
\h 
\h <Comando SQL> --> \h select
```

Ejecutar el comando anterior
```
\g
```
Cambiar base de datos
```
\c <base de datos>
```

Listar la base de datos
```
\dt
```



Time Permite ver el tiempo en que la consulta demora en ejecutarse.
```
\timing
```

Show Version
```
 SELECT version();
 ```

Show file config
```
show config_file;
```

Crear la partición

1. Crear tabla.
2. Buscar la parte para indicar que es una tabla de partición (pesta{a general).
3. Pestaña partición agregar el campo. Ejmp -> Rango fechas
```sql
INSERT INTO public.bitacora_viajes(
	id_viaje, fecha)
	VALUES (1, '2010-01-01');
	
CREATE TABLE bitacora_viajes201001 PARTITION OF bitacora_viajes
FOR VALUES FROM ('2010-01-01') TO ('2019-01-31');

CREATE TABLE bitacora_viajes201001 PARTITION OF bitacora_viajes
FOR VALUES FROM ('2010-01-01') TO ('2019-01-31');
```



