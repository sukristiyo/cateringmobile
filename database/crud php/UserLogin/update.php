<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->id)){
    
    $msg['message'] = '';
    $post_id = $data->id;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user` WHERE id=:post_id";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':post_id', $post_id,PDO::PARAM_INT);
    $get_stmt->execute();
    
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_name = isset($data->name) ? $data->name : $row['name'];
        $post_email = isset($data->email) ? $data->email : $row['email'];
        $post_password = isset($data->password) ? $data->password : $row['password'];
        $post_address = isset($data->address) ? $data->address : $row['address'];
        $post_houseNumber = isset($data->houseNumber ) ? $data->houseNumber  : $row['houseNumber'];
        $post_phoneNumber = isset($data->phoneNumber) ? $data->phoneNumber : $row['phoneNumber'];
        $post_city = isset($data->city) ? $data->city : $row['city'];
        $post_roles = isset($data->roles) ? $data->roles : $row['roles'];
        
        $update_query = "UPDATE `user` SET name = :name, email = :email, password = :password, address = :address, houseNumber = :houseNumber, phoneNumber = :phoneNumber, city = :city, roles = :roles
        WHERE id = :id";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':name', htmlspecialchars(strip_tags($post_name)),PDO::PARAM_STR);
        $update_stmt->bindValue(':email', htmlspecialchars(strip_tags( $post_email)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags($post_password)),PDO::PARAM_STR);
        $update_stmt->bindValue(':address', htmlspecialchars(strip_tags($post_address)),PDO::PARAM_STR);
        $update_stmt->bindValue(':houseNumber', htmlspecialchars(strip_tags($post_houseNumber)),PDO::PARAM_STR);
        $update_stmt->bindValue(':phoneNumber', htmlspecialchars(strip_tags($post_phoneNumber)),PDO::PARAM_STR);
        $update_stmt->bindValue(':city', htmlspecialchars(strip_tags($post_city)),PDO::PARAM_STR);
        $update_stmt->bindValue(':roles', htmlspecialchars(strip_tags( $post_roles)),PDO::PARAM_STR);
        $update_stmt->bindValue(':id', $post_id,PDO::PARAM_INT);
        
        
        if($update_stmt->execute()){
            $msg['message'] = 'Data updated successfully';
        }else{
            $msg['message'] = 'data not updated';
        }   
        
    }
    else{
        $msg['message'] = 'Invlid ID';
    }  
    
    echo  json_encode($msg);
    
}
?>