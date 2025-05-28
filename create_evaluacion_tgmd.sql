CREATE TABLE EvaluacionTGMD (
    idEvaluacion INT AUTO_INCREMENT PRIMARY KEY,
    User_idUser INT NOT NULL,
    fecha_test DATE NOT NULL,
    
    -- Campos para habilidades locomotrices
    locomotora_puntaje_bruto VARCHAR(10) NOT NULL,
    locomotora_edad_equivalente VARCHAR(10) NOT NULL,
    locomotora_rango_percentil VARCHAR(10) NOT NULL,
    locomotora_escala_puntaje VARCHAR(10) NOT NULL,
    locomotora_intervalo_confianza_90 VARCHAR(20) NOT NULL,
    locomotora_intervalo_confianza_95 VARCHAR(20) NOT NULL,
    locomotora_nivel_madurez VARCHAR(50) NOT NULL,
    
    -- Campos para habilidades con pelota
    pelota_puntaje_bruto VARCHAR(10) NOT NULL,
    pelota_edad_equivalente VARCHAR(10) NOT NULL,
    pelota_rango_percentil VARCHAR(10) NOT NULL,
    pelota_escala_puntaje VARCHAR(10) NOT NULL,
    pelota_intervalo_confianza_90 VARCHAR(20) NOT NULL,
    pelota_intervalo_confianza_95 VARCHAR(20) NOT NULL,
    pelota_nivel_madurez VARCHAR(50) NOT NULL,
    
    -- Campos de evaluación total
    suma_puntuaciones VARCHAR(10) NOT NULL,
    diferencia_puntuaciones VARCHAR(10) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    
    -- Fecha de creación y actualización
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Clave foránea para la relación con la tabla User
    FOREIGN KEY (User_idUser) REFERENCES User(idUser) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 