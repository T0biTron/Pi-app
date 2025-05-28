<?php
header('Content-Type: application/json');
require_once 'db_connection.php';

// Get all POST data
$data = $_POST;

// Required fields validation
$required_fields = [
    'idUser',
    'locomotora_puntaje_bruto',
    'locomotora_edad_equivalente',
    'locomotora_rango_percentil',
    'locomotora_escala_puntaje',
    'locomotora_intervalo_confianza_90',
    'locomotora_intervalo_confianza_95',
    'locomotora_nivel_madurez',
    'pelota_puntaje_bruto',
    'pelota_edad_equivalente',
    'pelota_rango_percentil',
    'pelota_escala_puntaje',
    'pelota_intervalo_confianza_90',
    'pelota_intervalo_confianza_95',
    'pelota_nivel_madurez',
    'suma_puntuaciones',
    'diferencia_puntuaciones',
    'estado'
];

// Check if all required fields are present
$missing_fields = array();
foreach ($required_fields as $field) {
    if (!isset($data[$field]) || $data[$field] === '') {
        $missing_fields[] = $field;
    }
}

if (!empty($missing_fields)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Faltan parámetros necesarios: ' . implode(', ', $missing_fields)
    ]);
    exit;
}

try {
    // Obtener la fecha actual para el registro
    $fecha_test = date('Y-m-d');

    // Preparar la consulta SQL
    $query = "
        INSERT INTO EvaluacionTGMD (
            User_idUser, 
            fecha_test,
            locomotora_puntaje_bruto,
            locomotora_edad_equivalente,
            locomotora_rango_percentil,
            locomotora_escala_puntaje,
            locomotora_intervalo_confianza_90,
            locomotora_intervalo_confianza_95,
            locomotora_nivel_madurez,
            pelota_puntaje_bruto,
            pelota_edad_equivalente,
            pelota_rango_percentil,
            pelota_escala_puntaje,
            pelota_intervalo_confianza_90,
            pelota_intervalo_confianza_95,
            pelota_nivel_madurez,
            suma_puntuaciones,
            diferencia_puntuaciones,
            estado
        ) VALUES (
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
        )
    ";

    // Preparar la consulta
    $stmt = $conn->prepare($query);
    if ($stmt === false) {
        throw new Exception("Error al preparar la consulta: " . $conn->error);
    }

    // Vincular los parámetros
    $stmt->bind_param(
        "issssssssssssssssss",
        $data['idUser'],
        $fecha_test,
        $data['locomotora_puntaje_bruto'],
        $data['locomotora_edad_equivalente'],
        $data['locomotora_rango_percentil'],
        $data['locomotora_escala_puntaje'],
        $data['locomotora_intervalo_confianza_90'],
        $data['locomotora_intervalo_confianza_95'],
        $data['locomotora_nivel_madurez'],
        $data['pelota_puntaje_bruto'],
        $data['pelota_edad_equivalente'],
        $data['pelota_rango_percentil'],
        $data['pelota_escala_puntaje'],
        $data['pelota_intervalo_confianza_90'],
        $data['pelota_intervalo_confianza_95'],
        $data['pelota_nivel_madurez'],
        $data['suma_puntuaciones'],
        $data['diferencia_puntuaciones'],
        $data['estado']
    );

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Evaluación guardada exitosamente',
            'id' => $conn->insert_id
        ]);
    } else {
        throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
    }

    // Cerrar la consulta
    $stmt->close();

} catch (Exception $e) {
    // En caso de error, enviar un mensaje JSON con el error
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}

// Cerrar la conexión a la base de datos
$conn->close();
?> 