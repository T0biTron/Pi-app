<?php
header('Content-Type: application/json');
require_once 'db_connection.php';

try {
    // Verificar que todos los campos requeridos estén presentes
    $required_fields = [
        'idUser',
        'suma_puntuaciones_escaladas',
        'rango_percentil',
        'indice_motor_gruesa',
        'intervalo_confianza_90',
        'intervalo_confianza_95',
        'termino_descriptivo'
    ];

    foreach ($required_fields as $field) {
        if (!isset($_POST[$field]) || empty($_POST[$field])) {
            throw new Exception("El campo $field es requerido");
        }
    }

    // Preparar la consulta SQL
    $query = "INSERT INTO MotricidadGruesa (
        User_idUser,
        suma_puntuaciones_escaladas,
        rango_percentil,
        indice_motor_gruesa,
        intervalo_confianza_90,
        intervalo_confianza_95,
        termino_descriptivo
    ) VALUES (?, ?, ?, ?, ?, ?, ?)";

    // Preparar la sentencia
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        throw new Exception("Error al preparar la consulta: " . $conn->error);
    }

    // Vincular los parámetros
    $stmt->bind_param("issssss",
        $_POST['idUser'],
        $_POST['suma_puntuaciones_escaladas'],
        $_POST['rango_percentil'],
        $_POST['indice_motor_gruesa'],
        $_POST['intervalo_confianza_90'],
        $_POST['intervalo_confianza_95'],
        $_POST['termino_descriptivo']
    );

    // Ejecutar la consulta
    if (!$stmt->execute()) {
        throw new Exception("Error al ejecutar la consulta: " . $stmt->error);
    }

    // Obtener el ID del registro insertado
    $idMotricidad = $conn->insert_id;

    // Cerrar la sentencia
    $stmt->close();

    // Devolver respuesta exitosa
    echo json_encode([
        'status' => 'success',
        'message' => 'Datos de motricidad guardados correctamente',
        'idMotricidad' => $idMotricidad
    ]);

} catch (Exception $e) {
    // En caso de error, devolver mensaje de error
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}

// Cerrar la conexión
$conn->close();
?> 