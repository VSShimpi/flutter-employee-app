<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "employee_db");

if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

$sql = "SELECT * FROM employees";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {

    $joiningDate = new DateTime($row['joining_date']);
    $today = new DateTime();

    $years = $joiningDate->diff($today)->y;

    $row['years'] = $years;
    $row['is_active'] = (bool)$row['is_active'];

    $data[] = $row;
}

echo json_encode($data);
$conn->close();
?>