/*
########## Creado por: Sebastián Carrero ##########
########## Fecha De Creacion: 31/01/25 #############
########## Dimension Tiempo, encargada de almacenar los datos de las fechas para analisis #############
*/

/*=======================================================
#################### DIMENSION TIEMPO ####################
=========================================================*/
CREATE TABLE DIM_TIEMPO(
    SK_NUM_DIM_TIEMPO NUMBER(7),
    NUM_ID_FECHA NUMBER(8),
    DT_FECHA DATE,
    NUM_AÑO NUMBER(4),
    NUM_MES NUMBER(2),
    STR_NOMBRE_MES VARCHAR2(15),
    NUM_TRIMESTRE NUMBER(1),
    NUM_SEMANA NUMBER(2),
    STR_NOMBRE_DIA VARCHAR2(15),
    NUM_DIA NUMBER(3),
    STR_FIN_SEMANA CHAR(2) CHECK(STR_FIN_SEMANA IN ('SI', 'NO')),
    STR_BISIESTO CHAR(2) CHECK(STR_BISIESTO IN ('SI', 'NO'))
);

/*=======================================================
###################### COMENTARIOS ######################
=========================================================*/
COMMENT ON COLUMN DIM_TIEMPO.SK_NUM_DIM_TIEMPO IS 'Secuencia generada automaticamente';
COMMENT ON COLUMN DIM_TIEMPO.NUM_ID_FECHA IS 'Identificador único de la fecha en formato YYYYMMDD';
COMMENT ON COLUMN DIM_TIEMPO.DT_FECHA IS 'Fecha en formato DATE';
COMMENT ON COLUMN DIM_TIEMPO.NUM_AÑO IS 'Año de la fecha';
COMMENT ON COLUMN DIM_TIEMPO.NUM_MES IS 'Número del mes (1-12)';
COMMENT ON COLUMN DIM_TIEMPO.STR_NOMBRE_MES IS 'Nombre del mes (Ej: "Enero", "Febrero")';
COMMENT ON COLUMN DIM_TIEMPO.NUM_TRIMESTRE IS 'Trimestre del año (1-4)';
COMMENT ON COLUMN DIM_TIEMPO.NUM_SEMANA IS 'Número de la semana dentro del año (1-52)';
COMMENT ON COLUMN DIM_TIEMPO.STR_NOMBRE_DIA IS 'Nombre del día de la semana (Ej: "Lunes", "Martes")';
COMMENT ON COLUMN DIM_TIEMPO.NUM_DIA IS 'Número del día dentro del año (1-365 o 366 en años bisiestos)';
COMMENT ON COLUMN DIM_TIEMPO.STR_FIN_SEMANA IS 'Indica si es fin de semana ("SI" o "NO")';
COMMENT ON COLUMN DIM_TIEMPO.STR_BISIESTO IS 'Indica si el año es bisiesto ("SI" o "NO")';

/*=======================================================
################## SCRIPT DE INSERCION ##################
=========================================================*/
DECLARE
    V_FECHA DATE := TO_DATE('01-01-2015', 'DD-MM-YYYY');
BEGIN
    WHILE V_FECHA <= TO_DATE('31-12-2045', 'DD-MM-YYYY') LOOP
        INSERT INTO dim_tiempo (
            SK_NUM_DIM_TIEMPO, NUM_ID_FECHA, DT_FECHA, NUM_AÑO, NUM_MES, STR_NOMBRE_MES, NUM_TRIMESTRE, NUM_SEMANA,
            STR_NOMBRE_DIA, NUM_DIA, STR_FIN_SEMANA, STR_BISIESTO
        ) VALUES (
            SEQ_SK_DIM_TIEMPO.NEXTVAL,
            TO_NUMBER(TO_CHAR(V_FECHA, 'YYYYMMDD')),  -- NUM_ID_FECHA 
            V_FECHA,
            EXTRACT(YEAR FROM V_FECHA),
            EXTRACT(MONTH FROM V_FECHA),
            TO_CHAR(V_FECHA, 'Month', 'NLS_DATE_LANGUAGE = SPANISH'),
            CEIL(EXTRACT(MONTH FROM V_FECHA) / 3),
            TO_CHAR(V_FECHA, 'IW'),  -- Número de semana del año
            TO_CHAR(V_FECHA, 'Day', 'NLS_DATE_LANGUAGE = SPANISH'),
            TO_CHAR(V_FECHA, 'DDD'),
            CASE WHEN TO_CHAR(V_FECHA, 'D') IN ('1', '7') THEN 'SI' ELSE 'NO' END,
            CASE WHEN MOD(EXTRACT(YEAR FROM V_FECHA), 4) = 0 AND 
                    (MOD(EXTRACT(YEAR FROM V_FECHA), 100) <> 0 OR 
                    MOD(EXTRACT(YEAR FROM V_FECHA), 400) = 0) THEN 'SI' ELSE 'NO' END
        );
        
        V_FECHA := V_FECHA + 1;  -- Avanzar un día
    END LOOP;
    COMMIT;
END;
/

/*=======================================================
####################### SECUENCIA #######################
=========================================================*/
CREATE SEQUENCE SEQ_SK_DIM_TIEMPO
START WITH 1
INCREMENT BY 1
NOCACHE;