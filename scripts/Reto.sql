create database Reto;

use Reto;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100),
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos en Usuarios
INSERT INTO Usuarios (Nombre, Telefono, Email) VALUES
('Juan Pérez', '1234567890', 'juan.perez@example.com'),
('María López', '0987654321', 'maria.lopez@example.com'),
('Carlos Gómez', '1112223333', 'carlos.gomez@example.com'),
('Ana Torres', '4445556666', 'ana.torres@example.com'),
('Luis Martínez', '7778889999', 'luis.martinez@example.com'),
('Sofía Ramírez', '1231231234', 'sofia.ramirez@example.com'),
('Pedro Sánchez', '4564564567', 'pedro.sanchez@example.com'),
('Laura Fernández', '7897897890', 'laura.fernandez@example.com'),
('Jorge Herrera', '1472583690', 'jorge.herrera@example.com'),
('Marta Díaz', '3692581470', 'marta.diaz@example.com');

-- Crear tabla Conductores
CREATE TABLE Conductores (
    ConductorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Licencia VARCHAR(50) NOT NULL,
    FechaIngreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos en Conductores
INSERT INTO Conductores (Nombre, Telefono, Licencia) VALUES
('José Moreno', '9876543210', 'LIC12345'),
('Elena García', '8765432109', 'LIC23456'),
('Raúl Jiménez', '7654321098', 'LIC34567'),
('Isabel Castro', '6543210987', 'LIC45678'),
('Fernando Rojas', '5432109876', 'LIC56789'),
('Claudia Vega', '4321098765', 'LIC67890'),
('Diego Navarro', '3210987654', 'LIC78901'),
('Patricia Soto', '2109876543', 'LIC89012'),
('Alberto Ruiz', '1098765432', 'LIC90123'),
('Gabriela León', '0987654321', 'LIC01234');

-- Crear tabla Vehículos
CREATE TABLE Vehiculos (
    VehiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(20) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Año INT NOT NULL,
    KilometrajeActual INT NOT NULL,
    UltimoMantenimiento DATETIME NOT NULL
);

-- Insertar datos en Vehículos
INSERT INTO Vehiculos (Placa, Modelo, Año, KilometrajeActual, UltimoMantenimiento) VALUES
('ABC123', 'Toyota Corolla', 2019, 45000, '2024-01-10'),
('DEF456', 'Honda Civic', 2018, 60000, '2024-02-15'),
('GHI789', 'Nissan Sentra', 2020, 30000, '2024-03-20'),
('JKL012', 'Chevrolet Malibu', 2017, 80000, '2024-04-25'),
('MNO345', 'Ford Focus', 2021, 15000, '2024-05-30'),
('PQR678', 'Hyundai Elantra', 2019, 50000, '2024-06-05'),
('STU901', 'Kia Rio', 2018, 70000, '2024-07-10'),
('VWX234', 'Mazda 3', 2020, 35000, '2024-08-15'),
('YZA567', 'Subaru Impreza', 2019, 40000, '2024-09-20'),
('BCD890', 'Volkswagen Jetta', 2017, 85000, '2024-10-25');

-- Crear tabla Viajes
CREATE TABLE Viajes (
    ViajeID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT NOT NULL,
    ConductorID INT NOT NULL,
    VehiculoID INT NOT NULL,
    FechaHoraSolicitud DATETIME NOT NULL,
    FechaHoraInicio DATETIME NOT NULL,
    FechaHoraFin DATETIME NOT NULL,
    Origen VARCHAR(255) NOT NULL,
    Destino VARCHAR(255) NOT NULL,
    DistanciaRecorrida DECIMAL(10, 2) NOT NULL,
    Tarifa DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ConductorID) REFERENCES Conductores(ConductorID),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);

-- Insertar datos en Viajes
INSERT INTO Viajes (UsuarioID, ConductorID, VehiculoID, FechaHoraSolicitud, FechaHoraInicio, FechaHoraFin, Origen, Destino, DistanciaRecorrida, Tarifa) VALUES
(1, 1, 1, '2024-12-01 08:00:00', '2024-12-01 08:05:00', '2024-12-01 08:25:00', 'Punto A', 'Punto B', 10.5, 15.00),
(2, 2, 2, '2024-12-02 09:00:00', '2024-12-02 09:10:00', '2024-12-02 09:40:00', 'Punto C', 'Punto D', 12.0, 18.00),
(3, 3, 3, '2024-12-03 07:00:00', '2024-12-03 07:15:00', '2024-12-03 07:45:00', 'Punto E', 'Punto F', 8.5, 13.00),
(4, 4, 4, '2024-12-04 11:00:00', '2024-12-04 11:20:00', '2024-12-04 11:50:00', 'Punto G', 'Punto H', 14.2, 21.00),
(5, 5, 5, '2024-12-05 15:00:00', '2024-12-05 15:10:00', '2024-12-05 15:35:00', 'Punto I', 'Punto J', 11.7, 17.00),
(6, 6, 6, '2024-12-06 12:00:00', '2024-12-06 12:10:00', '2024-12-06 12:40:00', 'Punto K', 'Punto L', 9.0, 14.50),
(7, 7, 7, '2024-12-07 10:00:00', '2024-12-07 10:15:00', '2024-12-07 10:50:00', 'Punto M', 'Punto N', 15.3, 22.50),
(8, 8, 8, '2024-12-08 16:00:00', '2024-12-08 16:20:00', '2024-12-08 16:55:00', 'Punto O', 'Punto P', 13.6, 20.00),
(9, 9, 9, '2024-12-09 14:00:00', '2024-12-09 14:05:00', '2024-12-09 14:30:00', 'Punto Q', 'Punto R', 10.0, 15.50),
(10, 10, 10, '2024-12-10 17:00:00', '2024-12-10 17:10:00', '2024-12-10 17:35:00', 'Punto S', 'Punto T', 12.8, 19.00);

-- Crear tabla Rutas
CREATE TABLE Rutas (
    RutaID INT PRIMARY KEY AUTO_INCREMENT,
    ViajeID INT NOT NULL,
    PuntoInicio VARCHAR(255) NOT NULL,
    PuntoFin VARCHAR(255) NOT NULL,
    TiempoEstimado DECIMAL(10, 2) NOT NULL,
    Trafico VARCHAR(100),
    FOREIGN KEY (ViajeID) REFERENCES Viajes(ViajeID)
);

-- Insertar datos en Rutas
INSERT INTO Rutas (ViajeID, PuntoInicio, PuntoFin, TiempoEstimado, Trafico) VALUES
(1, 'Punto A', 'Punto B', 20.0, 'Moderado'),
(2, 'Punto C', 'Punto D', 30.0, 'Alto'),
(3, 'Punto E', 'Punto F', 25.0, 'Bajo'),
(4, 'Punto G', 'Punto H', 35.0, 'Moderado'),
(5, 'Punto I', 'Punto J', 30.0, 'Alto'),
(6, 'Punto K', 'Punto L', 20.0, 'Bajo'),
(7, 'Punto M', 'Punto N', 40.0, 'Alto'),
(8, 'Punto O', 'Punto P', 35.0, 'Moderado'),
(9, 'Punto Q', 'Punto R', 25.0, 'Bajo'),
(10, 'Punto S', 'Punto T', 30.0, 'Moderado');

-- Crear tabla Mantenimientos
CREATE TABLE Mantenimientos (
    MantenimientoID INT PRIMARY KEY AUTO_INCREMENT,
    VehiculoID INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    KilometrajeMantenimiento INT NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);

-- Insertar datos en Mantenimientos
INSERT INTO Mantenimientos (VehiculoID, Fecha, Descripcion, KilometrajeMantenimiento, Costo) VALUES
(1, '2024-01-10', 'Cambio de aceite', 45000, 75.00),
(2, '2024-02-15', 'Revisión de frenos', 60000, 150.00),
(3, '2024-03-20', 'Cambio de neumáticos', 30000, 200.00),
(4, '2024-04-25', 'Cambio de batería', 80000, 120.00),
(5, '2024-05-30', 'Revisión general', 15000, 300.00),
(6, '2024-06-05', 'Cambio de filtros', 50000, 80.00),
(7, '2024-07-10', 'Alineación y balanceo', 70000, 100.00),
(8, '2024-08-15', 'Cambio de aceite', 35000, 75.00),
(9, '2024-09-20', 'Revisión de frenos', 40000, 150.00),
(10, '2024-10-25', 'Cambio de neumáticos', 85000, 200.00);

-- Crear tabla Demanda
CREATE TABLE Demanda (
    DemandaID INT PRIMARY KEY AUTO_INCREMENT,
    FechaHora DATETIME NOT NULL,
    Zona VARCHAR(100) NOT NULL,
    Solicitudes INT NOT NULL
);

-- Insertar datos en Demanda
INSERT INTO Demanda (FechaHora, Zona, Solicitudes) VALUES
('2024-12-01 08:00:00', 'Zona 1', 50),
('2024-12-02 09:00:00', 'Zona 2', 60),
('2024-12-03 07:00:00', 'Zona 3', 45),
('2024-12-04 11:00:00', 'Zona 4', 70),
('2024-12-05 15:00:00', 'Zona 5', 55),
('2024-12-06 12:00:00', 'Zona 6', 65),
('2024-12-07 10:00:00', 'Zona 7', 80),
('2024-12-08 16:00:00', 'Zona 8', 75),
('2024-12-09 14:00:00', 'Zona 9', 50),
('2024-12-10 17:00:00', 'Zona 10', 90);
