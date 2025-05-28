CREATE TABLE MotricidadGruesa (
    idMotricidad INT AUTO_INCREMENT PRIMARY KEY,
    User_idUser INT NOT NULL,
    suma_puntuaciones_escaladas VARCHAR(10) NOT NULL,
    rango_percentil VARCHAR(10) NOT NULL,
    indice_motor_gruesa VARCHAR(10) NOT NULL,
    intervalo_confianza_90 VARCHAR(20) NOT NULL,
    intervalo_confianza_95 VARCHAR(20) NOT NULL,
    termino_descriptivo VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (User_idUser) REFERENCES User(idUser) ON DELETE CASCADE,
    INDEX idx_user (User_idUser)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 