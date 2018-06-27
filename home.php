<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);


// sql query - inner join (media, author, publisher)
$sql = "SELECT * FROM media INNER JOIN authors ON media.isbn = authors.fk_isbn INNER JOIN publisher ON media.isbn = publisher.fk_isbn";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
</head>
<body>
           Welcome back <?php echo $userRow['userEmail']; ?>
           
           <a href="logout.php?logout">Sign Out</a>
 
       <!-- List Data in Front-End -->
    <?php
        while($row = $result->fetch_assoc()) {
            echo
            "<div class='card col'>" .
            " <b>Title:</b> " . $row["title"].
            " <b>Author:</b> " . $row["firstName"] . " " . $row["surname"].
            " <b>Type:</b> " . $row["type"].
            " <b>Genre:</b> " . $row["genre"].
            " <img src='" . $row["image"]. "' style='width: 15%'".
            " </br>".
            " <b>Description:</b> " . $row["short_description"].
            " <b>ISBN:</b> " . $row["isbn"].
            " <b>Publication Date:</b> " . $row["publish_date"].
            " <b>Status:</b> " . $row["status"].
            " <b>Publisher</b> " . $row["name"] .
            "</div>";
            }
            $conn->close();
        ?>
 
</body>
</html>
<?php ob_end_flush(); ?>