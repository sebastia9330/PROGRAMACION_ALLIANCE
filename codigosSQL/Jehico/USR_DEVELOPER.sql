############################################
###########CREDENCIALES SYDBA###############
############################################
PWD:Cambio21*
SYS
SYSTEM
DBSNMP
############################################
###########CREDENCIALES SYDBA###############
############################################


###########ODI###############
WEB LOGY
weblogic
Cambio21*


DEV_STB
Cambio21*
###########ODI###############






############################################
###########CREDENCIALES pdo###############
############################################

SUPERVISOR
Cambio21*

SCORRERO
Colombia2024*

WSARMIENTO
Colombia2025*


ODS_ALLIANCE
Cambio21*

usuario : WORK_ODS 
 
contraseña : Colombia2024y
 


SQL> CREATE USER C##odin IDENTIFIED BY odin; /*Cambio2024 */ 

RESPOSITOTIO
ODS_ALLIANCE_FINANCIERA

############################################
###########CREDENCIALES SYDBA###############


CDB$ROOT

SQL> CREATE USER ODS IDENTIFIED BY Cambio21*
  2
SQL> CREATE USER ODS IDENTIFIED BY Cambio21*;
CREATE USER ODS IDENTIFIED BY Cambio21*
                                      *
ERROR en lÝnea 1:
ORA-00922: falta la opci¾n o no es vßlida


SQL> CREATE USER ODS IDENTIFIED BY ODS1;
CREATE USER ODS IDENTIFIED BY ODS1
            *
ERROR en lÝnea 1:
ORA-65096: nombre de usuario o rol com·n no vßlido


SQL> CREATE USER C##ODS IDENTIFIED BY ODS12;

RCU Cambio2024

#############################################################
#####################TOPOLOGIA Y SEGURIDAD###################
#############################################################

##### PROCEDIINETO PARA GENERAR UN MAESTRO
jdbc:oracle:thin:@localhost:1521:xe

SQL> CREATE USER C##odin IDENTIFIED BY odin; /*Cambio2024 */ 

### SE CREA UN USUARIO CON PERMISOS DBA
CREATE USER  C##ODI_DBA IDENTIFIED BY ODI_DBA;

## SE ASIGNAN PERMISOS DBA
GRANT  DBA TO  C##ODI_DBA;

## en esta parte muestra la sesion denegada para poder utilizar el inicio de sesion
GRANT CREATE SESSION, RESOURCE TO C##odin;

## MUESTRA ERROR AL GENRAR EL REPOSITOTIO MAESTROS EN LA BD RAIZ DEL PROBLEMA
ALTER USER C##odin QUOTA UNLIMITED ON USERS;



#############################################################
#####################ESPACIO DE TRABAJO PRODUCCION###########
#############################################################
CREATE USER DEV_ODI_REPO IDENTIFIED BY Cambio2024;
GRANT  DBA TO  DEV_ODI_REPO;
GRANT CREATE SESSION, RESOURCE TO DEV_ODI_REPO;
ALTER USER DEV_ODI_REPO QUOTA UNLIMITED ON USERS;

CREATE USER WORK_ODSPRD IDENTIFIED BY Cambio2025;
GRANT  DBA TO  WORK_ODSPRD;
GRANT CREATE SESSION, RESOURCE TO WORK_ODSPRD;
ALTER USER WORK_ODSPRD QUOTA UNLIMITED ON USERS;
#############################################################
#####################TOPOLOGIA Y SEGURIDAD###################
#############################################################




#############################################################
###########INSTALACION DE REPOCITORIO DE TRABAJO#############
#############################################################

NOMBRE DEL RESPOSITIORIO Y CLAVE WORKREP1

1ro se ingresa en topologias
2 EN REPOSITIORIO DE TRABAJO SE DA CLICK SECUNDARIO PARA CREAR

### SE REALIZA LA CREACION DE UN ESQUEMA DIFERENTE
CREATE USER  C##ODI_W IDENTIFIED BY ODI_W;

## SE CREAN LOS PERMISO DE CONEXION
GRANT CONNECT , RESOURCE TO C##ODI_W;

## MUESTRA ERROR AL GENRAR EL REPOSITOTIO MAESTROS EN LA BD RAIZ DEL PROBLEMA
ALTER USER C##ODI_W QUOTA UNLIMITED ON USERS;

#############################################################
###########INSTALACION DE REPOCITORIO DE TRABAJO#############
#############################################################


###### USUARIO_ CREADO PARA DESAROLLAR EL ALMACEN DE DATOS########
CREATE USER  C##ODS IDENTIFIED BY ODS ;
## SE CREAN LOS PERMISO DE CONEXION
GRANT CONNECT , RESOURCE TO C##ODI_W;

## MUESTRA ERROR AL GENRAR EL REPOSITOTIO MAESTROS EN LA BD RAIZ DEL PROBLEMA
ALTER USER C##ODI_W QUOTA UNLIMITED ON USERS;