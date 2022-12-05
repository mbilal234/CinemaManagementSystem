<?php 

$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$email = $_POST['email'];
$cellNo = $_POST['cellNo'];
$cnic = $_POST['cnic'];
$password = $_POST['password'];

// $DOB = $_POST['DOB'];
// $profession = $_POST['profession'];
// $reference = $_POST['reference'];
// $residencePhone = $_POST['residencePhone'];
// $officePhone = $_POST['officePhone'];
// $gender = $_POST['gender'];
// $address = $_POST['address'];
// $movieGenre = $_POST['movieGenre'];
// $movieType = $_POST['movieType'];
// $userName = $_POST['userName'];
// $pinCode = $_POST['pinCode'];

$host = "localhost";
$dbUsername = 'sqluser';
$dbPassword = '308NegraAroyoLane';
$dbname = "cinema";

//create connection
$conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
if(mysqli_connect_error()){
    die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
} 
else{
    $SELECT = "SELECT email From customer Where email = ? Limit 1";
    $INSERT = "INSERT Into members values(DEFAULT,?,?,?,?,?,?)";

    //Prepare statement
    $stmt = $conn->prepare($SELECT);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->bind_result($email);
    $stmt->store_result();
    $rnum = $stmt->num_rows;

    if($rnum==0){
        $stmt->close();

        $stmt = $conn->prepare($INSERT);
        $stmt->bind_param("sssiis", $firstName, $lastName, $email, $cellNo, $cnic, $password);
        $stmt->execute();
        echo "New record inserted sucessfully";
    } 
    else{
        echo "Someone already register using this email";
    }
    $stmt->close();
    $conn->close();


}
?>