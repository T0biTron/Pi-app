<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once 'db_connection.php';

try {
    // Consulta para obtener el último usuario insertado
    $query = "SELECT u.*, i.name as institution_name, e.examinerName, e.examinerTitle 
             FROM User u 
             LEFT JOIN Institution i ON u.Institution_idInstitution = i.idInstitution
             LEFT JOIN Examiner e ON u.Examiner_idExaminador = e.idExaminador
             ORDER BY u.idUser DESC LIMIT 1";
    
    $result = $conn->query($query);
    
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // Formatear la respuesta con más detalles
        $response = [
            'status' => 'success',
            'user' => [
                'idUser' => (int)$row['idUser'],
                'name' => $row['name'],
                'gender' => $row['gender'],
                'birthdate' => $row['birthdate'],
                'institution' => $row['institution_name'],
                'examiner' => [
                    'name' => $row['examinerName'],
                    'title' => $row['examinerTitle']
                ],
                'created_at' => $row['created_at']
            ]
        ];
        
        echo json_encode($response);
    } else {
        throw new Exception("No se encontraron usuarios");
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}

$conn->close();
?> 