CREATE TABLE STG_FAC_FINANCIERA(
    NUM_EMPRESA NUMBER(3,0), --queda, relacion con dim_compañia   --
	STR_RAZON_SOCIAL VARCHAR2(80 BYTE), --lo trae la dim_compañia  --
	STR_CENTRO_COSTO_MAYOR VARCHAR2(15 BYTE), --no se trae
	STR_CENTRO_COSTO_AUXILIAR VARCHAR2(15 BYTE), --no se trae
	STR_CENTRO_COSTO_NOMBRE VARCHAR2(40 BYTE), --no se trae
	STR_CENTRO_COSTO_NOTAS VARCHAR2(255 BYTE), --no se trae
	STR_TERCERO_ID VARCHAR2(15 BYTE), --no se trae --
	STR_TERCERO_NIT VARCHAR2(25 BYTE), --queda, relacion con dim_cliente --
	STR_TERCERO_NIT_DV VARCHAR2(3 BYTE), --ultimo digito del nit, se puede traer en la dim_cliente
	STR_TERCERO_TIPO_IDENT VARCHAR2(1 BYTE), --tipo de identificacion del tercero(c = ceduna, n = nit)
	NUM_TERCERO_TIPO_TERCERO NUMBER(2,0), --tipo tercero (0 = interno, 1 = personas, 2 empresas)
	STR_TERCERO_NOMBRE VARCHAR2(100 BYTE), -- nombre tercero lo tiene la din_cliente --
	STR_ID_CENTRO_OPERACION VARCHAR2(3 BYTE), --identificacor del centro de operacion,
	STR_DESCRIPCION_CENTRO_OPERACION VARCHAR2(40 BYTE), --ciudad del centro de operacion
	STR_ID_REGIONAL_CENTRO_OPERACION VARCHAR2(2 BYTE),  --id del regional al que pertenece el centro de operacion
	STR_ID_UN_351 VARCHAR2(20 BYTE), 
	NUM_ID_PERIODO NUMBER(7,0), -- periodo de fecha, solo tiene año y mes
	DT_FECHA_DOCTO_R DATE, --fecha del movimiento, queda, relacion con dim_tiempo --
	NUM_LINEA_ID_MOVTO NUMBER(9,0), --Codigo del movimiento, queda --
	NUM_DEBITO NUMBER(19,2), --debito, queda, medida numerica --
	NUM_CREDITO NUMBER(19,2), --credito, queda, medida numerica --
	STR_NOTAS VARCHAR2(260 BYTE), --notas que tenga el movimiento
	NUM_LINEA_ID_DOCTO NUMBER(8,0), --codigo del documento contable, queda --
	STR_ID_CO_DOCTO VARCHAR2(3 BYTE), -- relacion del documento con el centro de operacion
	STR_ID_TIPO_DOCTO VARCHAR2(3 BYTE), --tipo de documento ej(CC, CM)  --
	STR_DESCRIPCION_DOCTO VARCHAR2(40 BYTE), --describe el tipo de documento ej (CM = consolidacion mensual) --
	NUM_NRO_DOCTO NUMBER(5,0), --consultar 
	NUM_IND_STADO NUMBER(1,0), -- estado de documento
	STR_NOTAS_DOCTO VARCHAR2(260 BYTE), --notas del documento genral
	STR_PLAN_CUENTAS VARCHAR2(3 BYTE), --plan de cuentas, dim_cuenta_contable --
	STR_PADRE_CUENTA VARCHAR2(20 BYTE), --padre, dim_cuenta_contable --
	STR_CUENTA_MAYOR VARCHAR2(20 BYTE), --id de cuenta, relacion con dim_cuenta_contable --
	STR_CUENTA_AUXILIAR VARCHAR2(20 BYTE), -- auxiliar, esta en dim cuenta contable --
	STR_DESCRIPCION_CUENTA VARCHAR2(42 BYTE), -- descripcion de la cuenta, dim_cuenta_contable --
	NUM_DOCTO_AUXILIAR NUMBER(8,0), --numero de relacion de la cuenta con el documento --
	STR_AUXILIAR_DESCRIPCION VARCHAR2(50 BYTE), --descripcion del auxiliar --
	STR_IND_ESTADO NUMBER(2,0), --estado de la cuenta
	NUM_ID_FLUJO_EFECTIVO NUMBER(4,0), -- aun no se usa
	STR_FLUJO_EFECTIVO VARCHAR2(10 BYTE), --aun no se usa
	STR_DESCRIPCION_FLUJO VARCHAR2(40 BYTE), --aun no se usa
	STR_CODIGO_PRODUCTO VARCHAR2(20 BYTE), -- codigo de productos, relacion con dim_servicios --
	STR_DESCRIPCION_SERVICIO VARCHAR2(40 BYTE), --nombre del servicio --
	NUM_CODIGO_SECTOR NUMBER(6,0) --codigo del sector economico, relacion con dim_sector_eco --
);


    T254.f254_id_mayor AS MAYOR, 

	--CUENTA AUXILIAR
	T253.f253_id AS AUXILIAR, 
	T253.f253_ind_estado, 
	T253.f253_descripcion AS AUXILIAR_DESCRIPCION, 
	
	--CONCEPTO DE FLUJO DE EFECTIVO
	T274.f274_rowid, 
	T274.f274_id AS FLUJO_EFECTIVO, 
    T274.f274_descripcion AS FLUJO_EFECTIVO_DESCRIPCION, 

	--UNIDAD DE NEGOCIO
	T281.f281_id, 
	T281.f281_descripcion

FROM SQL_ALLIANCE.dbo.t351_co_mov_docto AS T351 WITH (NOLOCK) 
    INNER JOIN SQL_ALLIANCE.dbo.t350_co_docto_contable AS T350 WITH (NOLOCK) ON T350.f350_rowid = T351.f351_rowid_docto 
    INNER JOIN SQL_ALLIANCE.dbo.t253_co_auxiliares AS T253 WITH (NOLOCK) ON T253.f253_rowid = T351.f351_rowid_auxiliar 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t254_co_mayores_auxiliares AS T254 WITH (NOLOCK)  ON T253.f253_rowid = T254.f254_rowid_auxiliar 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t252_co_mayores AS T252 WITH (NOLOCK) ON T254.f254_id_plan = T252.f252_id_plan AND T254.f254_id_mayor = T252.f252_id 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t285_co_centro_op AS T285 WITH (NOLOCK) ON T285.f285_id_cia = T351.f351_id_cia AND T285.f285_id = T351.f351_id_co_mov 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t281_co_unidades_negocio AS T281 WITH (NOLOCK)  ON T281.f281_id_cia = T351.f351_id_cia AND T281.f281_id = T351.f351_id_un 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t274_co_fe_conceptos AS T274 WITH (NOLOCK) ON T351.f351_rowid_fe = T274.f274_rowid 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t284_co_ccosto AS T284 WITH (NOLOCK) ON T284.f284_rowid = T351.f351_rowid_ccosto 
    LEFT OUTER JOIN SQL_ALLIANCE.dbo.t200_mm_terceros AS T200 WITH (NOLOCK) ON T200.f200_rowid = T351.f351_rowid_tercero 
    INNER JOIN SQL_ALLIANCE.dbo.t010_mm_companias AS T010 WITH (NOLOCK) on T010.f010_id=T351.f351_id_cia
WHERE 
	T350.f350_id_cia=108			-- filtro de compañía alliance risk & protection
	AND T253.f253_id LIKE '[4-7]%'	-- cuentas
	AND T254.f254_id_plan='NIF'		-- plan de cuentas nif
	and f350_ind_estado=1			-- documentos en estado 1
	and T351.f351_ind_estado=1		-- registro del movimiento en estado 1

	--OTRAS Condidiones:
	--and t351.f351_id_periodo='202501'
	;

	--------------------------------------------------------------------------------------------
	SELECT top 50
	T351.f351_id_cia AS COMPANIA, --ID DE COMPAÑÍA ALLIANCE = 108
	T200.f200_nit AS TERCERO_NIT, --TERCERO
    T351.f351_fecha AS FECHA_DOCTO, --FECHA DEL MOVIMIENTO 
    T254.f254_id_mayor AS MAYOR, --NUMERO DE CUENTA
	T281.f281_id, --ID DEL SERVICIO/PRODUCTO
	T351.f351_rowid AS LINEA_ID_MOVTO, --LÍNEA ÚNICA POR MOVIMIENTO
	T350.f350_rowid AS LINEA_ID_DOCTO,	--LINEA ÚNICA POR DOCUMENTO
	T350.f350_id_tipo_docto AS ID_TIPO_DOCTO, --TIPO DE DOCUMENTO
	T021.F021_DESCRIPCION, --DESCRIOCION DEL TIPO DE DOCUMENTO
	T351.f351_valor_db2 AS DEBITO, --DEBITO
	T351.f351_valor_cr2 AS CREDITO, --CREDITO
FROM t351_co_mov_docto T351 WITH (NOLOCK) inner JOIN
    t350_co_docto_contable T350 WITH (NOLOCK) ON T350.f350_rowid = T351.f351_rowid_docto INNER JOIN
    t253_co_auxiliares T253 WITH (NOLOCK) ON T253.f253_rowid = T351.f351_rowid_auxiliar inner JOIN
    t254_co_mayores_auxiliares T254 WITH (NOLOCK)  ON T253.f253_rowid = T254.f254_rowid_auxiliar inner JOIN
    t281_co_unidades_negocio T281 WITH (NOLOCK)  ON T281.f281_id_cia = T351.f351_id_cia AND T281.f281_id = T351.f351_id_un LEFT OUTER JOIN
    t200_mm_terceros T200 WITH (NOLOCK) ON T200.f200_rowid = T351.f351_rowid_tercero INNER JOIN
	INNER JOIN t021_mm_tipos_documentos T021 WITH(NOLOCK) ON T021.F021_ID = T350.F350_ID_TIPO_DOCTO and t350.f350_id_cia = t021.f021_id_cia
WHERE 
		-- filtro de compañía alliance risk & protection
	T253.f253_id LIKE '[4-7]%'-- cuentas
	AND T254.f254_id_plan='NIF'		-- plan de cuentas nif
	and f350_ind_estado=1			-- documentos en estado 1
	and T351.f351_ind_estado=1
    and t200.f200_nit like '%[A-Za-z]%'
    AND t351.f351_fecha BETWEEN '2024-01-01' AND '2024-01-31';

----------------------------------------------------------------------------------------------------------------
	SELECT top 50
	T351.f351_id_cia AS COMPANIA, --ID DE COMPAÑÍA ALLIANCE = 108
	T200.f200_nit AS TERCERO_NIT, --TERCERO
    T351.f351_fecha AS FECHA_DOCTO, --FECHA DEL MOVIMIENTO 
    T254.f254_id_mayor AS MAYOR, --NUMERO DE CUENTA
	T281.f281_id, --ID DEL SERVICIO/PRODUCTO
	T351.f351_rowid AS LINEA_ID_MOVTO, --LÍNEA ÚNICA POR MOVIMIENTO
	T350.f350_rowid AS LINEA_ID_DOCTO,	--LINEA ÚNICA POR DOCUMENTO
	T350.f350_id_tipo_docto AS ID_TIPO_DOCTO, --TIPO DE DOCUMENTO
	T021.F021_DESCRIPCION, --DESCRIOCION DEL TIPO DE DOCUMENTO
	T351.f351_valor_db2 AS DEBITO, --DEBITO
	T351.f351_valor_cr2 AS CREDITO, --CREDITO
FROM t351_co_mov_docto T351 WITH (NOLOCK) inner JOIN
    t350_co_docto_contable T350 WITH (NOLOCK) ON T350.f350_rowid = T351.f351_rowid_docto INNER JOIN
    t253_co_auxiliares T253 WITH (NOLOCK) ON T253.f253_rowid = T351.f351_rowid_auxiliar inner JOIN
    t254_co_mayores_auxiliares T254 WITH (NOLOCK)  ON T253.f253_rowid = T254.f254_rowid_auxiliar inner JOIN
    t281_co_unidades_negocio T281 WITH (NOLOCK)  ON T281.f281_id_cia = T351.f351_id_cia AND T281.f281_id = T351.f351_id_un LEFT OUTER JOIN
    t200_mm_terceros T200 WITH (NOLOCK) ON T200.f200_rowid = T351.f351_rowid_tercero INNER JOIN
	INNER JOIN t021_mm_tipos_documentos T021 WITH(NOLOCK) ON T021.F021_ID = T350.F350_ID_TIPO_DOCTO
WHERE 
		-- filtro de compañía alliance risk & protection
	T253.f253_id LIKE '[4-7]%'-- cuentas
	AND T254.f254_id_plan='NIF'		-- plan de cuentas nif
	and f350_ind_estado=1			-- documentos en estado 1
	and T351.f351_ind_estado=1
    and t200.f200_nit like '%[A-Za-z]%'
    AND t351.f351_fecha BETWEEN '2024-01-01' AND '2024-01-31';

----------------------------------------------------------------------------------------------------------------
SELECT 
    T200_MM_TERCEROS.f200_nit as F200_NIT ,
    T281_CO_UNIDADES_NEGOCIO.f281_id as F281_ID ,
    T350_CO_DOCTO_CONTABLE.f350_rowid as F350_ROWID ,
    T350_CO_DOCTO_CONTABLE.f350_id_tipo_docto as F350_ID_TIPO_DOCTO ,
    T351_CO_MOV_DOCTO.f351_id_cia as F351_ID_CIA ,
    T351_CO_MOV_DOCTO.f351_rowid as F351_ROWID ,
    T351_CO_MOV_DOCTO.f351_fecha as F351_FECHA ,
    T351_CO_MOV_DOCTO.f351_valor_db2 as F351_VALOR_DB2 ,
    T351_CO_MOV_DOCTO.f351_valor_cr2 as F351_VALOR_CR2 ,
    T254_CO_MAYORES_AUXILIARES.f254_id_mayor as F254_ID_MAYOR   
FROM 
    SQL_ALLIANCE.dbo.t200_mm_terceros as T200_MM_TERCEROS  
    INNER JOIN  (SQL_ALLIANCE.dbo.t281_co_unidades_negocio as T281_CO_UNIDADES_NEGOCIO  
    LEFT JOIN  ((SQL_ALLIANCE.dbo.t253_co_auxiliares as T253_CO_AUXILIARES  
    LEFT JOIN  (SQL_ALLIANCE.dbo.t350_co_docto_contable as T350_CO_DOCTO_CONTABLE  
    INNER JOIN  SQL_ALLIANCE.dbo.t351_co_mov_docto as T351_CO_MOV_DOCTO  
    ON  T350_CO_DOCTO_CONTABLE.f350_rowid = T351_CO_MOV_DOCTO.f351_rowid_docto
    )  
    ON  T253_CO_AUXILIARES.f253_rowid = T351_CO_MOV_DOCTO.f351_rowid_auxiliar
    )  LEFT JOIN  SQL_ALLIANCE.dbo.t254_co_mayores_auxiliares as T254_CO_MAYORES_AUXILIARES  
    ON  T253_CO_AUXILIARES.f253_rowid = T254_CO_MAYORES_AUXILIARES.f254_rowid_auxiliar
    )  
    ON  T281_CO_UNIDADES_NEGOCIO.f281_id_cia = T351_CO_MOV_DOCTO.f351_id_cia AND T281_CO_UNIDADES_NEGOCIO.f281_id = T351_CO_MOV_DOCTO.f351_id_un
    )  
    ON  T200_MM_TERCEROS.f200_rowid = T351_CO_MOV_DOCTO.f351_rowid_tercero
WHERE
    (T351_CO_MOV_DOCTO.f351_fecha BETWEEN '2024-01-01' AND '2024-01-31'
    AND T253_CO_AUXILIARES.f253_id LIKE '[4-7]%'
    AND T254_CO_MAYORES_AUXILIARES.f254_id_plan = 'NIF'
    AND T350_CO_DOCTO_CONTABLE.f350_ind_estado = 1
    AND T351_CO_MOV_DOCTO.f351_ind_estado = 1
)   

------------------------------------------------------------------------------------------------------------
--STG_COMPAÑIA
CREATE TABLE STG_COMPAÑIA(
	NUM_ID_CIA NUMBER(4),
	NUM_NIT_COMPAÑIA NUMBER(12),
	STR_NOMBRE_COMPAÑIA VARCHAR2(50),
	STR_CIIU VARCHAR2(5)
);

---------------------------------------------------------------------------------------------------------------
CREATE TABLE DIM_COMPAÑIA(
	
);

----------------------------------------------------------------------------------------------------------------
SELECT 
    NUM_ID_CIA,str_razon_social, str_padre_cuenta, STR_CUENTA_MAYOR, str_descripcion_cuenta, 
    CASE
        WHEN STR_PADRE_CUENTA LIKE '41%' THEN 'INGRESOS OPERACIONALES'
        WHEN STR_PADRE_CUENTA LIKE '42%' THEN 'INGRESOS NO OPERACIONALES'
        WHEN STR_PADRE_CUENTA LIKE '51%' THEN 'GASTOS OPERACIONALES DE ADMINISTRACION'
        WHEN STR_PADRE_CUENTA LIKE '52%' THEN 'GASTOS OPERACIONALES DE VENTAS'
        WHEN STR_PADRE_CUENTA LIKE '53%' THEN 'GASTOS NO OPERACIONALES'
        WHEN STR_PADRE_CUENTA LIKE '54%' THEN 'GASTOS DE IMPUESTOS'
        WHEN STR_PADRE_CUENTA LIKE '59%' THEN 'GASTOS DE GANACIAS Y PERDIDAS'
        WHEN STR_PADRE_CUENTA LIKE '63%' THEN 'COSTOS INDIRECTOS'
        WHEN STR_PADRE_CUENTA LIKE '72%' THEN 'COSTOS DE MANO DE OBRA DIRECTA'
        WHEN STR_PADRE_CUENTA LIKE '73%' THEN 'COSTOS INDIRECTOS'
    END AS CATEGORIA,
    SUM(NUM_DEBITO) AS DEBITO, 
    SUM(NUM_CREDITO) AS CREDITO,
    COUNT(*) AS TOTAL_REGISTROS
FROM stg_fac_financiera
WHERE (STR_PADRE_CUENTA LIKE '41%'
    OR STR_PADRE_CUENTA LIKE '42%'
    OR STR_PADRE_CUENTA LIKE '51%' 
    OR STR_PADRE_CUENTA LIKE '52%' 
    OR STR_PADRE_CUENTA LIKE '53%' 
    OR STR_PADRE_CUENTA LIKE '54%' 
    OR STR_PADRE_CUENTA LIKE '59%' 
    OR STR_PADRE_CUENTA LIKE '63%' 
    OR STR_PADRE_CUENTA LIKE '72%' 
    OR STR_PADRE_CUENTA LIKE '73%')
        AND NUM_ID_CIA = 108
GROUP BY NUM_ID_CIA,str_razon_social, str_padre_cuenta, str_descripcion_cuenta, STR_CUENTA_MAYOR;

----------------------------------------------------------------------------------------------------------------
CREATE TABLE STG_FAC_FINANCIERA(
NUM_ID_CIA NUMBER(3,0), --queda, relacion con dim_compañia   --
STR_RAZON_SOCIAL VARCHAR2(80 BYTE), --lo trae la dim_compañia  --
STR_ID_CENTRO_COSTO VARCHAR(25), --TRAE EL ID DEL CENTRO DE COSTOS
STR_CENTRO_COSTO_NOMBRE VARCHAR2(50) --TRAE EL NOMBRE DEL CENTRO DE COSTO
STR_TERCERO_ID VARCHAR2(15 BYTE), --no se trae --
STR_TERCERO_NIT VARCHAR2(25 BYTE), --queda, relacion con dim_cliente --
STR_TERCERO_NOMBRE VARCHAR2(100 BYTE), -- nombre tercero lo tiene la din_cliente --
NUM_PERIODO_FECHA NUMBER(7), --PERIODO DE EXTRACCION DE FECHA
DT_FECHA_DOCTO DATE, --fecha del movimiento, queda, relacion con dim_tiempo --
NUM_LINEA_ID_MOVTO NUMBER(9,0), --Codigo del movimiento, queda --
NUM_DEBITO NUMBER(19,2), --debito, queda, medida numerica --
NUM_CREDITO NUMBER(19,2), --credito, queda, medida numerica --
NUM_LINEA_ID_DOCTO NUMBER(8,0), --codigo del documento contable, queda --
STR_ID_TIPO_DOCTO VARCHAR2(3 BYTE), --tipo de documento ej(CC, CM)  --
STR_DESCRIPCION_DOCTO VARCHAR2(40 BYTE), --describe el tipo de documento ej (CM = consolidacion mensual) --
STR_PLAN_CUENTAS VARCHAR2(3 BYTE), --plan de cuentas, dim_cuenta_contable --
STR_CUENTA_PADRE VARCHAR2(20 BYTE), --padre, dim_cuenta_contable --
STR_CUENTA_MAYOR VARCHAR2(20 BYTE), --id de cuenta, relacion con dim_cuenta_contable --
STR_CUENTA_AUXILIAR VARCHAR2(20 BYTE), -- auxiliar, esta en dim cuenta contable --
STR_DESCRIPCION_CUENTA VARCHAR2(42 BYTE), -- descripcion de la cuenta, dim_cuenta_contable --
NUM_DOCTO_AUXILIAR NUMBER(8,0), --numero de relacion de la cuenta con el documento --
STR_AUXILIAR_DESCRIPCION VARCHAR2(50 BYTE), --descripcion del auxiliar --
STR_CODIGO_PRODUCTO VARCHAR2(20 BYTE), -- codigo de productos, relacion con dim_servicios --
STR_DESCRIPCION_SERVICIO VARCHAR2(40 BYTE), --nombre del servicio --
NUM_CODIGO_SECTOR NUMBER(6,0) --codigo del sector economico, relacion con dim_sector_eco --
);





SELECT 
  T284_CO_CCOSTO.f284_id as F284_ID ,
  T284_CO_CCOSTO.f284_descripcion as F284_DESCRIPCION ,
  T252_CO_MAYORES.f252_descripcion as F252_DESCRIPCION ,
  T252_CO_MAYORES.f252_id_padre as F252_ID_PADRE ,
  T010_MM_COMPANIAS.f010_razon_social as F010_RAZON_SOCIAL ,
  T200_MM_TERCEROS.f200_id as F200_ID ,
  T200_MM_TERCEROS.f200_nit as F200_NIT ,
  T200_MM_TERCEROS.f200_razon_social as F200_RAZON_SOCIAL ,
  T281_CO_UNIDADES_NEGOCIO.f281_id as F281_ID ,
  T281_CO_UNIDADES_NEGOCIO.f281_descripcion as F281_DESCRIPCION ,
  T253_CO_AUXILIARES.f253_rowid as F253_ROWID ,
  T253_CO_AUXILIARES.f253_id as F253_ID ,
  T253_CO_AUXILIARES.f253_descripcion as F253_DESCRIPCION ,
  T350_CO_DOCTO_CONTABLE.f350_rowid as F350_ROWID ,
  T350_CO_DOCTO_CONTABLE.f350_id_tipo_docto as F350_ID_TIPO_DOCTO ,
  T351_CO_MOV_DOCTO.f351_id_cia as F351_ID_CIA ,
  T351_CO_MOV_DOCTO.f351_rowid as F351_ROWID ,
  T351_CO_MOV_DOCTO.f351_fecha as F351_FECHA ,
  T351_CO_MOV_DOCTO.f351_id_periodo as F351_ID_PERIODO ,
  T351_CO_MOV_DOCTO.f351_valor_db2 as F351_VALOR_DB2 ,
  T351_CO_MOV_DOCTO.f351_valor_cr2 as F351_VALOR_CR2 ,
  T254_CO_MAYORES_AUXILIARES.f254_id_plan as F254_ID_PLAN ,
  T254_CO_MAYORES_AUXILIARES.f254_id_mayor as F254_ID_MAYOR ,
  T021_MM_TIPOS_DOCUMENTOS.f021_descripcion as F021_DESCRIPCION   
FROM 
  SQL_ALLIANCE.dbo.t284_co_ccosto as T284_CO_CCOSTO  LEFT JOIN  (SQL_ALLIANCE.dbo.t252_co_mayores as T252_CO_MAYORES  LEFT JOIN  ((SQL_ALLIANCE.dbo.t010_mm_companias as T010_MM_COMPANIAS  INNER JOIN  (SQL_ALLIANCE.dbo.t200_mm_terceros as T200_MM_TERCEROS  LEFT JOIN  (SQL_ALLIANCE.dbo.t281_co_unidades_negocio as T281_CO_UNIDADES_NEGOCIO  LEFT JOIN  ((SQL_ALLIANCE.dbo.t253_co_auxiliares as T253_CO_AUXILIARES  INNER JOIN  (SQL_ALLIANCE.dbo.t350_co_docto_contable as T350_CO_DOCTO_CONTABLE  INNER JOIN  SQL_ALLIANCE.dbo.t351_co_mov_docto as T351_CO_MOV_DOCTO  
    ON  T350_CO_DOCTO_CONTABLE.f350_rowid = T351_CO_MOV_DOCTO.f351_rowid_docto
     )  
    ON  T253_CO_AUXILIARES.f253_rowid = T351_CO_MOV_DOCTO.f351_rowid_auxiliar
     )  LEFT JOIN  SQL_ALLIANCE.dbo.t254_co_mayores_auxiliares as T254_CO_MAYORES_AUXILIARES  
    ON  T253_CO_AUXILIARES.f253_rowid = T254_CO_MAYORES_AUXILIARES.f254_rowid_auxiliar
     )  
    ON  T281_CO_UNIDADES_NEGOCIO.f281_id_cia = T351_CO_MOV_DOCTO.f351_id_cia AND T281_CO_UNIDADES_NEGOCIO.f281_id = T351_CO_MOV_DOCTO.f351_id_un
     )  
    ON  T200_MM_TERCEROS.f200_rowid = T351_CO_MOV_DOCTO.f351_rowid_tercero
     )  
    ON  T010_MM_COMPANIAS.f010_id = T351_CO_MOV_DOCTO.f351_id_cia
     )  INNER JOIN  SQL_ALLIANCE.dbo.t021_mm_tipos_documentos as T021_MM_TIPOS_DOCUMENTOS  
    ON  T350_CO_DOCTO_CONTABLE.f350_id_tipo_docto = T021_MM_TIPOS_DOCUMENTOS.f021_id AND T350_CO_DOCTO_CONTABLE.f350_id_cia = T021_MM_TIPOS_DOCUMENTOS.f021_id_cia
     )  
    ON  T252_CO_MAYORES.f252_id_plan = T254_CO_MAYORES_AUXILIARES.f254_id_plan AND T252_CO_MAYORES.f252_id = T254_CO_MAYORES_AUXILIARES.f254_id_mayor
     )  
    ON  T284_CO_CCOSTO.f284_rowid = T351_CO_MOV_DOCTO.f351_rowid_ccosto
WHERE
  (T351_CO_MOV_DOCTO.f351_fecha BETWEEN '2024-01-01' AND '2024-01-31' 
AND T253_CO_AUXILIARES.f253_id LIKE '[4-7]%' 
AND T254_CO_MAYORES_AUXILIARES.f254_id_plan = 'NIF' 
AND T350_CO_DOCTO_CONTABLE.f350_ind_estado = 1 
AND T351_CO_MOV_DOCTO.f351_ind_estado = 1
)   


select count(*)
FROM t351_co_mov_docto T351 WITH (NOLOCK) INNER JOIN
    t350_co_docto_contable T350 WITH (NOLOCK) ON T350.f350_rowid = T351.f351_rowid_docto INNER JOIN
    t253_co_auxiliares T253 WITH (NOLOCK) ON T253.f253_rowid = T351.f351_rowid_auxiliar LEFT OUTER JOIN
    t254_co_mayores_auxiliares T254 WITH (NOLOCK)  ON T253.f253_rowid = T254.f254_rowid_auxiliar LEFT OUTER JOIN
    t252_co_mayores T252 WITH (NOLOCK) ON T254.f254_id_plan = T252.f252_id_plan AND T254.f254_id_mayor = T252.f252_id LEFT OUTER JOIN
    t285_co_centro_op T285 WITH (NOLOCK) ON T285.f285_id_cia = T351.f351_id_cia AND T285.f285_id = T351.f351_id_co_mov LEFT OUTER JOIN
    t281_co_unidades_negocio T281 WITH (NOLOCK)  ON T281.f281_id_cia = T351.f351_id_cia AND T281.f281_id = T351.f351_id_un LEFT OUTER JOIN
   -- t274_co_fe_conceptos T274 WITH (NOLOCK) ON T351.f351_rowid_fe = T274.f274_rowid LEFT OUTER JOIN
    t284_co_ccosto T284 WITH (NOLOCK) ON T284.f284_rowid = T351.f351_rowid_ccosto LEFT OUTER JOIN
    t200_mm_terceros T200 WITH (NOLOCK) ON T200.f200_rowid = T351.f351_rowid_tercero INNER JOIN
	t010_mm_companias T010 WITH (NOLOCK) on T010.f010_id=T351.f351_id_cia
	--INNER JOIN t021_mm_tipos_documentos T021 WITH(NOLOCK) ON T021.F021_ID = T350.F350_ID_TIPO_DOCTO and t350.f350_id_cia = t021.f021_id_cia
WHERE 
	--T350.f350_id_cia=108			-- filtro de compañía alliance risk & protection
	T253.f253_id LIKE '[4-7]%'	-- cuentas
	AND T254.f254_id_plan='NIF'		-- plan de cuentas nif
	and f350_ind_estado=1			-- documentos en estado 1
	and T351.f351_ind_estado=1		-- registro del movimiento en estado 1
	--OTRAS Condidiones:
--	and t351.f351_id_periodo='202401'
	AND t351.f351_fecha BETWEEN '2024-01-01' AND '2024-01-31'
	;


    SELECT 
  T350_CO_DOCTO_CONTABLE.f350_rowid as F350_ROWID ,
  T350_CO_DOCTO_CONTABLE.f350_id_tipo_docto as F350_ID_TIPO_DOCTO ,
  T351_CO_MOV_DOCTO.f351_id_cia as F351_ID_CIA ,
  T351_CO_MOV_DOCTO.f351_rowid as F351_ROWID ,
  T351_CO_MOV_DOCTO.f351_fecha as F351_FECHA ,
  T351_CO_MOV_DOCTO.f351_id_periodo as F351_ID_PERIODO ,
  T351_CO_MOV_DOCTO.f351_valor_db2 as F351_VALOR_DB2 ,
  T351_CO_MOV_DOCTO.f351_valor_cr2 as F351_VALOR_CR2   
FROM 
  SQL_ALLIANCE.dbo.t350_co_docto_contable as T350_CO_DOCTO_CONTABLE  INNER JOIN  SQL_ALLIANCE.dbo.t351_co_mov_docto as T351_CO_MOV_DOCTO  
    ON  T350_CO_DOCTO_CONTABLE.f350_rowid = T351_CO_MOV_DOCTO.f351_rowid_docto
WHERE
  (T351_CO_MOV_DOCTO.f351_id_periodo = '202401'
)   



SELECT 
  T351_CO_MOV_DOCTO.f351_id_cia as F351_ID_CIA ,
  T351_CO_MOV_DOCTO.f351_rowid as F351_ROWID ,
  T351_CO_MOV_DOCTO.f351_fecha as F351_FECHA ,
  T351_CO_MOV_DOCTO.f351_id_periodo as F351_ID_PERIODO ,
  T351_CO_MOV_DOCTO.f351_valor_db2 as F351_VALOR_DB2 ,
  T351_CO_MOV_DOCTO.f351_valor_cr2 as F351_VALOR_CR2 ,
  T350_CO_DOCTO_CONTABLE.f350_rowid as F350_ROWID ,
  T350_CO_DOCTO_CONTABLE.f350_id_tipo_docto as F350_ID_TIPO_DOCTO   
FROM 
  SQL_ALLIANCE.dbo.t351_co_mov_docto as T351_CO_MOV_DOCTO  INNER JOIN  SQL_ALLIANCE.dbo.t350_co_docto_contable as T350_CO_DOCTO_CONTABLE  
    ON  T351_CO_MOV_DOCTO.f351_rowid_docto = T350_CO_DOCTO_CONTABLE.f350_rowid
WHERE
  (T351_CO_MOV_DOCTO.f351_id_periodo = '202401'
)   


select 
    sec.num_codigo_sector,
    cli.str_nit,
    ser.num_codigo,
    cue.num_cuenta_mayor,
    cop.num_id_cia,
    tie.dt_fecha,
    fac.num_credito,
    fac.num_debito,
    fac.num_linea_id_movto
from stg_fac_financiera fac
LEFT join dim_clientes cli ON TO_CHAR(TRIM(cli.str_nit)) = TO_CHAR(TRIM(fac.str_tercero_nit))
left join dim_tiempo tie on tie.dt_fecha = fac.dt_fecha_docto
left join dim_compañia cop on cop.num_id_cia = fac.num_id_cia
left join dim_sector_eco sec on sec.num_codigo_sector = fac.num_codigo_sector
left join dim_cuenta_contable cue on cue.num_cuenta_mayor = fac.num_cuenta_mayor
left join dim_servicios ser on ser.num_codigo = fac.STR_CODIGO_PRODUCTO
WHERE fac.NUM_ID_CIA = 108
and num_periodo_fecha = '202401';

------------------------------------------------------------------------------------------------------------
CREATE TABLE HEC_FCT_REFERENCIA_FINANCIERA(
    SK_NUM_DIM_SECTOR NUMBER(7),
    SK_NUM_DIM_CLIENTES NUMBER(7),
    SK_NUM_DIM_CUENTA_CONTABLE NUMBER(10),
    SK_NUM_DIM_COMPAÑIA NUMBER(10),
    SK_NUM_DIM_TIEMPO NUMBER(7),
    SK_NUM_DIM_SERVICIOS NUMBER(10),
    NUM_CREDITO NUMBER(19,2),
    NUM_DEBITO NUMBER(19,2)
);