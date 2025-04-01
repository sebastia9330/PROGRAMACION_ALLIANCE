CREATE TABLE HEC_FCT_REFERENCIA_FINANCIERA(
    SK_NUM_HEC_FCT_REFERENCIA  NUMBER(7),
    SK_NUM_DIM_SECTOR_ECO NUMBER(7),
    SK_NUM_DIM_CLIENTE NUMBER(7),
    SK_NUM_DIM_FUNCIONARIO NUMBER(7),
    SK_NUM_DIM_SERVICIO NUMBER(7),
    SK_NUM_DIM_CUENTA_CONTABLE NUMBER(7),
    SK_NUM_DIM_COMPAÑIA NUMBER(7),
    SK_NUM_DIM_TIEMPO NUMBER(7),
    NUM_LINEA_ID_MOVTO NUMBER(9,0),
    NUM_LINEA_ID_DOCTO NUMBER(8,0),
    STR_TIPO_DOCTO VARCHAR(3),
    NUM_DEBITO NUMBER(19,2),
    NUM_CREDITO NUMBER(19,2),
    DT_FECHA_INICIO DATE,
    DT_FECHA_ACTUALIZACION DATE
);