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