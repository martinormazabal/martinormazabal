CREATE DATABASE chatbotdb;
CREATE USER chatbotuser WITH PASSWORD 'cp1619comm2k1';
GRANT ALL PRIVILEGES ON DATABASE chatbotdb TO chatbotuser;

-- Dar permisos globales al usuario
ALTER USER chatbotuser CREATEDB;
ALTER USER chatbotuser CREATEROLE;

-- Relaciones entre perfiles y usuarios
ALTER TABLE profiles ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE profiles ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;

-- Crear la tabla requests
CREATE TABLE IF NOT EXISTS requests (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    steps TEXT NOT NULL
);

-- Tabla para almacenar documentos subidos
CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    uploaded_by VARCHAR(100) NOT NULL,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla 'users'
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla 'profiles'
CREATE TABLE IF NOT EXISTS profiles (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  role VARCHAR(50) NOT NULL CHECK (role IN ('student', 'faculty', 'admin')),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos de ejemplo
INSERT INTO requests (name, description, steps)
VALUES
('Solicitud de Cambio de Carrera', 'Permite solicitar un cambio de carrera dentro de la universidad.', '1. Descargue el formulario.\n2. Complete los campos requeridos.\n3. Entregue el formulario a la oficina correspondiente.'),
('Solicitud de Certificado de Alumno Regular', 'Permite obtener un certificado que acredite su condición de estudiante.', '1. Ingrese al portal.\n2. Seleccione "Solicitar certificado".\n3. Descargue el documento.'),
('Solicitud de Reincorporación', 'Permite solicitar la reincorporación tras una suspensión o retiro.', '1. Complete el formulario de reincorporación.\n2. Adjunte la documentación requerida.\n3. Presente su solicitud en la secretaría académica.');

-- Verificar los permisos
\du chatbotuser