<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require_once("db.php");

$data = json_decode(file_get_contents("php://input"), true);

$order_id = $data['order_id'] ?? null;
$card_name = $data['card_name'] ?? null;
$payment_method = $data['payment_method'] ?? null;

if (!$order_id || !$payment_method) {
    echo json_encode([
        "success" => false,
        "message" => "Missing payment information"
    ]);
    exit;
}

// Siparişin gerçekten var olduğunu ve toplam tutarını kontrol et
$stmt = $conn->prepare(
    "SELECT total_price FROM orders WHERE id = ?"
);
$stmt->bind_param("i", $order_id);
$stmt->execute();

$result = $stmt->get_result();
$order = $result->fetch_assoc();

if (!$order) {
    echo json_encode([
        "success" => false,
        "message" => "Order not found"
    ]);
    exit;
}

$amount = $order['total_price'];
$status = "success";

$stmt = $conn->prepare(
    "INSERT INTO payments (order_id, card_name, amount, payment_method, payment_status)
     VALUES (?, ?, ?, ?, ?)"
);

$stmt->bind_param("isdss", $order_id,$card_name, $amount, $payment_method, $status);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "payment_id" => $conn->insert_id,
       
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Payment could not be saved"
    ]);
}

$stmt->close();
$conn->close();
?>