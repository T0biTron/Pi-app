<?php
include 'db_connection.php';

try {
    $query = "
        SELECT 
            U.name AS childName,
            U.gender,
            U.birthdate,
            U.testDate,
            U.totalLocomotoraScore,
            U.totalPelotaScore,
            D.preferredHand,
            D.preferredFoot,
            I.Institution_Name AS institution,
            E.examinerName,
            E.examinerTitle,
            -- Datos de EvaluacionTGMD
            ET.locomotora_puntaje_bruto,
            ET.locomotora_edad_equivalente,
            ET.locomotora_rango_percentil,
            ET.locomotora_escala_puntaje,
            ET.locomotora_intervalo_confianza_90,
            ET.locomotora_intervalo_confianza_95,
            ET.locomotora_nivel_madurez,
            ET.pelota_puntaje_bruto,
            ET.pelota_edad_equivalente,
            ET.pelota_rango_percentil,
            ET.pelota_escala_puntaje,
            ET.pelota_intervalo_confianza_90,
            ET.pelota_intervalo_confianza_95,
            ET.pelota_nivel_madurez,
            ET.suma_puntuaciones,
            ET.diferencia_puntuaciones,
            ET.estado,
            -- Datos de MotricidadGruesa
            MG.suma_puntuaciones_escaladas,
            MG.rango_percentil AS mg_rango_percentil,
            MG.indice_motor_gruesa,
            MG.intervalo_confianza_90 AS mg_ic90,
            MG.intervalo_confianza_95 AS mg_ic95,
            MG.termino_descriptivo
        FROM 
            User U
            LEFT JOIN Dates D ON U.idUser = D.User_idUser
            LEFT JOIN Institution I ON U.Institution_idInstitution = I.idInstitution
            LEFT JOIN Examiner E ON U.Examiner_idExaminador = E.idExaminador
            LEFT JOIN EvaluacionTGMD ET ON U.idUser = ET.User_idUser
            LEFT JOIN MotricidadGruesa MG ON U.idUser = MG.User_idUser
    ";

    $result = $conn->query($query);
    $records = [];

    while ($row = $result->fetch_assoc()) {
        $records[] = [
            'name' => $row['childName'] ?? 'No disponible',
            'gender' => $row['gender'] ?? 'No disponible',
            'birthdate' => $row['birthdate'] ?? 'No disponible',
            'testDate' => $row['testDate'] ?? 'No disponible',
            'totalLocomotoraScore' => $row['totalLocomotoraScore'] ?? '0',
            'totalPelotaScore' => $row['totalPelotaScore'] ?? '0',
            'preferredHand' => $row['preferredHand'] ?? 'No especificado',
            'preferredFoot' => $row['preferredFoot'] ?? 'No especificado',
            'institution' => $row['institution'] ?? 'No especificada',
            'examinerName' => $row['examinerName'] ?? 'Desconocido',
            'examinerTitle' => $row['examinerTitle'] ?? 'Desconocido',
            // Datos de EvaluacionTGMD
            'locomotora_puntaje_bruto' => $row['locomotora_puntaje_bruto'] ?? 'No disponible',
            'locomotora_edad_equivalente' => $row['locomotora_edad_equivalente'] ?? 'No disponible',
            'locomotora_rango_percentil' => $row['locomotora_rango_percentil'] ?? 'No disponible',
            'locomotora_escala_puntaje' => $row['locomotora_escala_puntaje'] ?? 'No disponible',
            'locomotora_intervalo_confianza_90' => $row['locomotora_intervalo_confianza_90'] ?? 'No disponible',
            'locomotora_intervalo_confianza_95' => $row['locomotora_intervalo_confianza_95'] ?? 'No disponible',
            'locomotora_nivel_madurez' => $row['locomotora_nivel_madurez'] ?? 'No disponible',
            'pelota_puntaje_bruto' => $row['pelota_puntaje_bruto'] ?? 'No disponible',
            'pelota_edad_equivalente' => $row['pelota_edad_equivalente'] ?? 'No disponible',
            'pelota_rango_percentil' => $row['pelota_rango_percentil'] ?? 'No disponible',
            'pelota_escala_puntaje' => $row['pelota_escala_puntaje'] ?? 'No disponible',
            'pelota_intervalo_confianza_90' => $row['pelota_intervalo_confianza_90'] ?? 'No disponible',
            'pelota_intervalo_confianza_95' => $row['pelota_intervalo_confianza_95'] ?? 'No disponible',
            'pelota_nivel_madurez' => $row['pelota_nivel_madurez'] ?? 'No disponible',
            'suma_puntuaciones' => $row['suma_puntuaciones'] ?? 'No disponible',
            'diferencia_puntuaciones' => $row['diferencia_puntuaciones'] ?? 'No disponible',
            'estado' => $row['estado'] ?? 'No disponible',
            // Datos de MotricidadGruesa
            'suma_puntuaciones_escaladas' => $row['suma_puntuaciones_escaladas'] ?? 'No disponible',
            'rango_percentil' => $row['mg_rango_percentil'] ?? 'No disponible',
            'indice_motor_gruesa' => $row['indice_motor_gruesa'] ?? 'No disponible',
            'intervalo_confianza_90' => $row['mg_ic90'] ?? 'No disponible',
            'intervalo_confianza_95' => $row['mg_ic95'] ?? 'No disponible',
            'termino_descriptivo' => $row['termino_descriptivo'] ?? 'No disponible'
        ];
    }

    echo json_encode(['status' => 'success', 'records' => $records]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}

$conn->close();
?> 