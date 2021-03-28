<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CREATE MESSAGE ARRAY AND SET EMPTY
$msg['message'] = '';

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->name) && isset($data->email) && isset($data->password) && isset($data->address) && isset($data->houseNumber) && isset($data->phoneNumber) && isset($data->city) && isset($data->roles)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->name) && !empty($data->email) || !empty($data->password) || !empty($data->address) || !empty($data->houseNumber) || !empty($data->phoneNumber) || !empty($data->city) || !empty($data->roles)){
        
        $insert_query = "INSERT INTO `user`(name,email,password,address,houseNumber,phoneNumber,city,roles) VALUES(:name,:email,:password,:address,:houseNumber,:phoneNumber,:city,:roles)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':name', htmlspecialchars(strip_tags($data->name)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':email', htmlspecialchars(strip_tags($data->email)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':password', htmlspecialchars(strip_tags($data->password)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':address', htmlspecialchars(strip_tags($data->address)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':houseNumber', htmlspecialchars(strip_tags($data->houseNumber)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':phoneNumber', htmlspecialchars(strip_tags($data->phoneNumber)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':city', htmlspecialchars(strip_tags($data->city)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':roles', htmlspecialchars(strip_tags($data->roles)),PDO::PARAM_STR);
        
        
        if($insert_stmt->execute()){
            $msg['message'] = 'Data Inserted Successfully';
        }else{
            $msg['message'] = 'Data not Inserted';
        } 
        
    }else{
        $msg['message'] = 'Oops! empty field detected. Please fill all the fields';
    }
}
else{
    $msg['message'] = 'Please fill all the fields | title, body, author';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($msg);
?>