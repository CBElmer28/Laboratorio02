CREATE TABLE alumnos (
id INT PRIMARY KEY AUTO INCREMENT,
nombre VARCHAR(100)
);
CREATE TABLE cursos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100)
);
CREATE TABLE matriculas (
id_alumno INT,
id_curso INT,
FOREIGN KEY (id_alumno) REFERENCES alumnos (id),
FOREIGN KEY (id_curso) REFERENCES cursos (id)
);
--Insertar datos de ejemplo
INSERT INTO alumnos (nombre) VALUES ('Ana Torres');
INSERT INTO cursos (nombre) VALUES ('Base de Datos Avanzadas');
INSERT INTO matriculas (id_alumno, id_curso) VALUES (1,1);
--Consultar
SELECT a.nombre, c.nombre
FROM alumnos a
JOIN matriculas m ON a.id = m.id_alumno
JOIN cursos c ON c.id = m.id_curso;

--Consultar cuandos cursos lleva un alumno
SELECT a.nombre, COUNT(*) AS cantidad_cursos
FROM alumnos a
JOIN matriculas m ON a.id = m.id_alumno
GROUP BY a.id, a.nombre;