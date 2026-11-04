<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require_once("db.php");

$data = json_decode(file_get_contents("php://input"), true);

$product_id = $data['product_id'];
$customer_name = $data['customer_name'];
$city = $data['city'];
$address = $data['address'];
$phone = $data['phone'];
$message = $data['message'];
$quantity = $data['quantity'];
$total_price = $data['total_price'];

$stmt = $conn->prepare(
    "INSERT INTO orders 
    (product_id, customer_name, city, address, phone, message, quantity, total_price)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
);

$stmt->bind_param(
    "isssssid",
    $product_id,
    $customer_name,
    $city,
    $address,
    $phone,
    $message,
    $quantity,
    $total_price
);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "Order added",
        "order_id" => $conn->insert_id
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => $stmt->error
    ]);
}

$stmt->close();
$conn->close();
?>