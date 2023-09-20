--ADD AN ELEMENT IN THE TABLE
ALTER TABLE Medico ADD dni CHAR(10)
-- UPDATE VALUE OF THE COLUMNS
ALTER TABLE Medico ALTER COLUMN dni VARCHAR(10);
-- DROP COLUMN OF THE A TABLE
ALTER TABLE Medico DROP COLUMN dni;

-- ADD A FOREIGN KEY
ALTER TABLE Paciente
ADD FOREIGN KEY (idPais) REFERENCES Pais (idPais);

ALTER TABLE HistoriaPaciente
ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);


-- DROP
ALTER TABLE Paciente ADD estado VARCHAR(10);
ALTER TABLE Paciente DROP COLUMN estado;

CREATE TABLE EXAMPLE(
	uno int,
	dos int
)

DROP TABLE EXAMPLE;
