/*CREACION DE LA TABLA*/
CREATE TABLE Libros(
    ID_libro INT PRIMARY KEY,
    Titulo VARCHAR(50),
    Autor VARCHAR(50),
    Genero VARCHAR(50),
    Precio DECIMAL(10,2),
    Editorial VARCHAR(50),
    Año_publicacion VARCHAR(20)
);

/*INSERCCION DE LOS DATOS*/
INSERT ALL
    INTO libros(ID_libro,Titulo,Autor,Genero,Precio,Editorial,Año_publicacion) VALUES (1,'El señor de los Anillos','J.R.R. Tolkien','Fantasia',25.99,'Planeta','1954')
    INTO libros(ID_libro,Titulo,Autor,Genero,Precio,Editorial,Año_publicacion) VALUES (2,'1984','George Orwel','Ciencia Ficcion',19.95,'Planeta','1949')
    INTO libros(ID_libro,Titulo,Autor,Genero,Precio,Editorial,Año_publicacion) VALUES (3,'Orgullo y Prejucio','Jane Austen','Romance',15.75,'Planeta','1813')
    INTO libros(ID_libro,Titulo,Autor,Genero,Precio,Editorial,Año_publicacion) VALUES (4,'El Alquimista','Paulo Coelho','Autoayuda',12.5,'Planeta','1988')
    INTO libros(ID_libro,Titulo,Autor,Genero,Precio,Editorial,Año_publicacion) VALUES (5,'El Codigo Da Vinci','Dan Brown','Misterio',22.99,'Planeta','2003')
SELECT * FROM dual;

/*MOSTRAR SOLO LOS LIBROS DE CIENCIA FICCION*/
SELECT *
FROM libros
WHERE Genero = 'Ciencia Ficcion';

/*ORDENAR LOS LIBROS EN FORMA DESENDENTE POR EL PRECIO*/
SELECT *
FROM libros
ORDER BY Precio DESC;

/*SABER LA CANTIDAD DE LIBROS QUE TENGO*/
SELECT COUNT(*)
FROM libros;

/*ME CUENTA EL AUTOR QUE MAS LIBROS TIENE*/    
SELECT *
FROM (
  SELECT autor, COUNT(*) AS numero_libros
  FROM libros
  GROUP BY autor
  ORDER BY numero_libros DESC
)
WHERE ROWNUM = 1;

/*INSERTAR UN SOLO REGISTRO*/
INSERT INTO libros VALUES (6,'Inferno','Dan Brown','Misterio',20.95,'Planeta','2008');

/*MOSTRAR TODOS LOS REGISTROS*/
SELECT *
FROM libros;

/*ME MUESTRA EL PROMEDIO DE LOS PRECIOS PARA EL GENERO FANTASIA*/
SELECT AVG(precio) FROM libros WHERE genero = 'fantasía';
