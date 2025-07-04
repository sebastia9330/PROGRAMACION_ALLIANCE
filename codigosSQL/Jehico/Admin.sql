#######ERP_SQL#########
ProyectoIA
B0g0t42025
##############################
PARA LA EJECUCION DEL RCU SE DEBE BUSCAR UN ARCHIVO rcu.bat
VALIDACION Y EJECUCION DEL RCU, CRECION DE NUEVO ESPACION DE TRABAJO EN PRODUCCION 
OracleDIAgent1
DEV_ODI_REPO.
C:\Users\jehico.bolivar\AppData\Local\Temp\3\RCU2025-02-10_15-10_156670062\logs\rcu.log
C:\Users\jehico.bolivar\AppData\Local\Temp\3\RCU2025-02-10_15-10_156670062\logs
/*#### PARA LA ACTIVACION DE UNA GENTE ESTOS SON LOS PASO QUE SE DEBEN REALIZAR*######*/
SE DEBE INGRESRA A ESTA RUTA QUE ES DONDE SE ENCUENTRA EL BINARY_INTEGER
CD C:\ODI_12_APP\user_projects\domains\base_domain\bin>
DENTRO DE LA DE LA RUTA SE DEBE EJECUATAR LO SIGUIENTE CON ESTO EL AGENTE QUEDA ACTIVO
agent.cmd -NAME=OracleDIAgent1 -PORT=20910

/*###############################################################################################*/
/*######### YABLAS DE ADMINISTRACION PARA LLEVR EL CONTROL DE LOS DESARROLOS EN ODI##############*/ 
/*###############################################################################################*/
Tablas del Repositorio Maestro
Estas contienen la configuración global de ODI:
Tabla	Descripción
SNP_CONNECT	Conexiones a las bases de datos.
SNP_CONTEXT	Contextos utilizados en ODI.
SNP_AGENT	Configuración de los agentes ODI.
SNP_MODEL	Modelos de datos creados en ODI.
SNP_SUB_MODEL	Submodelos de los modelos en ODI.
SNP_TABLE	Tablas registradas dentro de los modelos.


Tablas del Repositorio de Trabajo
Aquí se almacenan los objetos desarrollados y ejecutados en ODI:
Tabla	Descripción
SNP_PACKAGE	Paquetes de ODI (workflows que orquestan procesos).
SNP_PROCEDURE	Procedimientos almacenados creados en ODI.
SNP_MAPPING	Mappings (antes llamados Interfaces en ODI 11g).
SNP_STEP	Pasos individuales de un paquete o procedimiento.
SNP_SCEN	Escenarios generados a partir de paquetes o mappings.
SNP_SESSION	Historial de ejecuciones de escenarios y paquetes.
SNP_SESS_STEP	Pasos individuales dentro de una ejecución de sesión.
/*###############################################################################################*/
/*######### YABLAS DE ADMINISTRACION PARA LLEVR EL CONTROL DE LOS DESARROLOS EN ODI##############*/ 
/*###############################################################################################*/

/*##################################################################*/
/*######### SABER LAS BASES DE DATOS QUE EXISTEN EN CD##############*/ 
/*##################################################################*/
 SELECT name, open_mode, restricted, open_time FROM v$pdbs;
/*######### CNUEVO CONTEXTO EN ODI##############*/  
NOMBRE : PROD
CODIGO : PROD
CONTRASEÑA : Cambio24*   
 
/*######### CREACION DE BD EN CDB##############*/ 
CREATE PLUGGABLE DATABASE WORK_ODS
ADMIN USER WORK_ODS IDENTIFIED BY Cambio10
FILE_NAME_CONVERT = ('C:\19c\app\jehico.Bolivar\oradata\ORCL\pdbseed', 'C:/19c/app/jehico.Bolivar/oradata/ORCL/WORK_ODS');

/*######### ELIMINAR LA BD CREADA##############*/ 
DROP PLUGGABLE DATABASE PDB_PROD INCLUDING DATAFILES;

/*##################################################################*/
/*######### SABER LAS BASES DE DATOS QUE EXISTEN EN CD##############*/ 
/*##################################################################*/




/* IMPORTANTE PARA REALIZAR AUDITORIA Y PROCECOS DE INFORMACION 

SELECT *  FROM ODIN.SNP_MAPPING m;

SELECT * FROM ALL_ALL_TABLES
WHERE TABLE_NAME LIKE '%LOG%'
AND OWNER = 'ODIN';


SELECT 
M.FIRST_USER,
    M.NAME AS MAPPING_NAME, 
    F.FOLDER_NAME AS FOLDER_NAME 
FROM ODIN.SNP_MAPPING M
JOIN ODIN.SNP_FOLDER F ON M.I_FOLDER = F.I_FOLDER;

select * from ODIN.SNP_PROJECT;
select * from ODIN.SNP_FOLDER;
select * from ODIN.SNP_MAPPING;
select * from ODIN.SNP_MAP_COMP;
select * from ODIN.SNP_SCEN;
select * from ODIN.SNP_SESSION;/*IMPORTANTE SE EVIDENCIA EL LOG DE EJECUCION DE LOS PROCESOS*/

select * from ODIN.SNP_STEP_LOG;/*IMPORTANTE VALIDA SESIONES DE LOS PORCESOS*/

*/

shutdown /r /t 0

##### MODULOS DE CONOCIENTO C:\ODI_12_APP\jdeveloper\..\odi\sdk\xml-reference   ####rutas para importar
/* validacion de almacenamiento*/
SELECT 
    tablespace_name,
    file_name,
    ROUND(bytes / 1024 / 1024, 2) AS tamaño_actual_mb,
    ROUND(maxbytes / 1024 / 1024, 2) AS tamaño_maximo_mb,
    ROUND((maxbytes - bytes) / 1024 / 1024, 2) AS espacio_disponible_mb
FROM 
    dba_data_files;

/* validacion de  consumos de recusos que ponen en lentitud la BD  */
SELECT event, total_waits, time_waited
FROM v$system_event
WHERE event NOT LIKE 'SQL*Net%';
	
	
/* ELIMINAR LAS TBABKAS EN CASCADA */ 
BEGIN
   FOR table_rec IN (SELECT table_name 
                     FROM all_tables 
                     WHERE owner = 'ODI_DBA') 
   LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ODI_DBA.' || table_rec.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
/

/*cambiar de contraseña*/
ALTER USER system IDENTIFIED BY "Cambio24*" CONTAINER=ALL;



/*PARA PODER CAMBIAR DE SESION EN LA BD*/
ALTER SESSION SET CONTAINER=orclpdb;
ALTER SESSION SET CONTAINER=WORK_ODS;

/*IDENTIFICAR SI LA BD ESTA ACTIVA */
SELECT status FROM v$instance;

/*ABIRIR LA BASE DE DATOS*/
ALTER PLUGGABLE DATABASE OPEN;


/* PO DER DESBLOQUEAR CUENTAS DE USUARIO*/
ALTER USER SYSTEM ACCOUNT UNLOCK;
/* VERIFICAR QUE TIPO DE AUDITORIA SE TIENE*/
SHOW PARAMETER audit_trail; 

/* ESTA ES LA TLAS DE AUDITORIA*/
SELECT * FROM SYS.AUD$;

/*AQUI SE ACTIVAN LAS AUDITORIAS*/
AUDIT SESSION;


/* SENTENCIAS PARA PODER BUSCAR INICIOS DE SESION EN LA BD*/
SELECT * FROM SYS.AUD$ ORDER BY TIMESTAMP DESC;

SELECT * FROM DBA_PROFILES WHERE PROFILE = (SELECT PROFILE FROM DBA_USERS WHERE USERNAME = 'SYSTEM');


0	UNKNOWN
1	CREATE TABLE
2	INSERT
3	SELECT
4	CREATE CLUSTER
5	ALTER CLUSTER
6	UPDATE
7	DELETE
8	DROP CLUSTER
9	CREATE INDEX
10	DROP INDEX
11	ALTER INDEX
12	DROP TABLE
13	CREATE SEQUENCE
14	ALTER SEQUENCE
15	ALTER TABLE
16	DROP SEQUENCE
17	GRANT OBJECT
18	REVOKE OBJECT
19	CREATE SYNONYM
20	DROP SYNONYM
21	CREATE VIEW
22	DROP VIEW
23	VALIDATE INDEX
24	CREATE PROCEDURE
25	ALTER PROCEDURE
26	LOCK
27	NO-OP
28	RENAME
29	COMMENT
30	AUDIT OBJECT
31	NOAUDIT OBJECT
32	CREATE DATABASE LINK
33	DROP DATABASE LINK
34	CREATE DATABASE
35	ALTER DATABASE
36	CREATE ROLLBACK SEG
37	ALTER ROLLBACK SEG
38	DROP ROLLBACK SEG
39	CREATE TABLESPACE
40	ALTER TABLESPACE
41	DROP TABLESPACE
42	ALTER SESSION
43	ALTER USER
44	COMMIT
45	ROLLBACK
46	SAVEPOINT
47	PL/SQL EXECUTE
48	SET TRANSACTION
49	ALTER SYSTEM
50	EXPLAIN
51	CREATE USER
52	CREATE ROLE
53	DROP USER
54	DROP ROLE
55	SET ROLE
56	CREATE SCHEMA
57	CREATE CONTROL FILE
59	CREATE TRIGGER
60	ALTER TRIGGER
61	DROP TRIGGER
62	ANALYZE TABLE
63	ANALYZE INDEX
64	ANALYZE CLUSTER
65	CREATE PROFILE
66	DROP PROFILE
67	ALTER PROFILE
68	DROP PROCEDURE
70	ALTER RESOURCE COST
71	CREATE MATERIALIZED VIEW LOG
72	ALTER MATERIALIZED VIEW LOG
73	DROP MATERIALIZED VIEW LOG
74	CREATE MATERIALIZED VIEW
75	ALTER MATERIALIZED VIEW
76	DROP MATERIALIZED VIEW
77	CREATE TYPE
78	DROP TYPE
79	ALTER ROLE
80	ALTER TYPE
81	CREATE TYPE BODY
82	ALTER TYPE BODY
83	DROP TYPE BODY
84	DROP LIBRARY
85	TRUNCATE TABLE
86	TRUNCATE CLUSTER
91	CREATE FUNCTION
92	ALTER FUNCTION
93	DROP FUNCTION
94	CREATE PACKAGE
95	ALTER PACKAGE
96	DROP PACKAGE
97	CREATE PACKAGE BODY
98	ALTER PACKAGE BODY
99	DROP PACKAGE BODY
100	LOGON
101	LOGOFF
102	LOGOFF BY CLEANUP
103	SESSION REC
104	SYSTEM AUDIT
105	SYSTEM NOAUDIT
106	AUDIT DEFAULT
107	NOAUDIT DEFAULT
108	SYSTEM GRANT
109	SYSTEM REVOKE
110	CREATE PUBLIC SYNONYM
111	DROP PUBLIC SYNONYM
112	CREATE PUBLIC DATABASE LINK
113	DROP PUBLIC DATABASE LINK
114	GRANT ROLE
115	REVOKE ROLE
116	EXECUTE PROCEDURE
117	USER COMMENT
118	ENABLE TRIGGER
119	DISABLE TRIGGER
120	ENABLE ALL TRIGGERS
121	DISABLE ALL TRIGGERS
122	NETWORK ERROR
123	EXECUTE TYPE
128	FLASHBACK
129	CREATE SESSION
130	ALTER MINING MODEL
131	SELECT MINING MODEL
133	CREATE MINING MODEL
157	CREATE DIRECTORY
158	DROP DIRECTORY
159	CREATE LIBRARY
160	CREATE JAVA
161	ALTER JAVA
162	DROP JAVA
163	CREATE OPERATOR
164	CREATE INDEXTYPE
165	DROP INDEXTYPE
166	ALTER INDEXTYPE
167	DROP OPERATOR
168	ASSOCIATE STATISTICS
169	DISASSOCIATE STATISTICS
170	CALL METHOD
171	CREATE SUMMARY
172	ALTER SUMMARY
173	DROP SUMMARY
174	CREATE DIMENSION
175	ALTER DIMENSION
176	DROP DIMENSION
177	CREATE CONTEXT
178	DROP CONTEXT
179	ALTER OUTLINE
180	CREATE OUTLINE
181	DROP OUTLINE
182	UPDATE INDEXES
183	ALTER OPERATOR
197	PURGE USER_RECYCLEBIN
198	PURGE DBA_RECYCLEBIN
199	PURGE TABLESPACE
200	PURGE TABLE
201	PURGE INDEX
202	UNDROP OBJECT
204	FLASHBACK DATABASE
205	FLASHBACK TABLE
206	CREATE RESTORE POINT
207	DROP RESTORE POINT
208	PROXY AUTHENTICATION ONLY
209	DECLARE REWRITE EQUIVALENCE
210	ALTER REWRITE EQUIVALENCE
211	DROP REWRITE EQUIVALENCE
212	CREATE EDITION
213	ALTER EDITION
214	DROP EDITION
215	DROP ASSEMBLY
216	CREATE ASSEMBLY
217	ALTER ASSEMBLY
218	CREATE FLASHBACK ARCHIVE
219	ALTER FLASHBACK ARCHIVE
220	DROP FLASHBACK ARCHIVE
