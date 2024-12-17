create table dulces_csv(
    id_dulce varchar(15),
    nombre varchar(25)
);

insert all
into dulces_csv values('124','lulo')
select * from dual;

update dulces_csv
set nombre = 'Fresa'
where id_dulce = '456';

select * from dulces_csv;


-- codigo uno
drop table WORKER_3.C$_0DUL;

--codigo dos
create table WORKER_3.C$_0DUL
(
	CODIGO_DE_BARRAS	VARCHAR2(15) NULL,
	NOMBRE_DULCE	VARCHAR2(25) NULL
);

--codigo tres
insert into WORKER_3.C$_0DUL
(
    CODIGO_DE_BARRAS,
    NOMBRE_DULCE
)
select codigo_de_barras, nombre_dulce
from (
    select dul.id_dulce as codigo_de_barras,
           dul.nombre as nombre_dulce
    from dulces_csv dul
    where (1=1)
);

select * from c$_0dul;
select * from dulceriat1;

--codigo cuatro
drop table WORKER_3.I$_DULCERIAT1;

--codigo cinco
create table WORKER_3.I$_DULCERIAT1
(
	SK_DULCE	NUMBER NULL,
	ID_DULCE	VARCHAR2(15) NULL,
	NOMBRE	VARCHAR2(25) NULL,
	FECHA_ACTUALIZACION	DATE NULL
	,IND_UPDATE		char(1)
);

select * from i$_dulceriat1;

--codigo seis
insert into	WORKER_3.I$_DULCERIAT1
(
	ID_DULCE,
	NOMBRE,
	IND_UPDATE
)
select 
ID_DULCE,
	NOMBRE,
	IND_UPDATE
 from (
select 	 
	DUL_A.CODIGO_DE_BARRAS AS ID_DULCE,
	DUL_A.NOMBRE_DULCE AS NOMBRE,
	'I' IND_UPDATE
from	WORKER_3.C$_0DUL DUL_A
where	(1=1)
) S
where NOT EXISTS 
	( select 1 from WORKER_3.DULCERIAT1 T
	where	T.ID_DULCE	= S.ID_DULCE 
		 and ((T.NOMBRE = S.NOMBRE) or (T.NOMBRE IS NULL and S.NOMBRE IS NULL))
);
       
select * from i$_dulceriat1;
       
-- codigo siete
-- actualizacion
update WORKER_3.DULCERIAT1 T
set T.NOMBRE = (
        select S.NOMBRE
        from WORKER_3.I$_DULCERIAT1 S
        where T.ID_DULCE = S.ID_DULCE
          and T.NOMBRE != S.NOMBRE
    ),
    T.FECHA_ACTUALIZACION = SYSDATE
where exists (
    select 1
    from WORKER_3.I$_DULCERIAT1 S
    where T.ID_DULCE = S.ID_DULCE
      and T.NOMBRE != S.NOMBRE
);

select * from dulceriat1;
-- insercion
insert into WORKER_3.DULCERIAT1 (
    ID_DULCE,
    NOMBRE,
    SK_DULCE,
    FECHA_ACTUALIZACION
)
select 
    S.ID_DULCE,
    S.NOMBRE,
    SEQ_TIPO1DULCE.NEXTVAL,
    SYSDATE
from WORKER_3.I$_DULCERIAT1 S
where not exists (
    select 1
    from WORKER_3.DULCERIAT1 T
    where T.ID_DULCE = S.ID_DULCE
);


--MERGE
merge into	WORKER_3.DULCERIAT1 T
using	WORKER_3.I$_DULCERIAT1 S
on	(
		T.ID_DULCE=S.ID_DULCE
	)
when matched
then update set
	T.NOMBRE	= S.NOMBRE
	, T.FECHA_ACTUALIZACION	= '01/01/2024'
when not matched
then insert
	(
	T.ID_DULCE,
	T.NOMBRE
	,  T.SK_DULCE,
	T.FECHA_ACTUALIZACION
	)
values
	(
	S.ID_DULCE,
	S.NOMBRE
	,  SEQ_TIPO1DULCE.NEXTVAL,
	'01/01/2024'
);

 
select * from dulceriat1;

--tranformacion en dimensiones
--cambiar diagramas
-- base de datos work_ods
-- FUNCION NBL



