<!DOCTYPE html>
<html>
<body>

<?php

$coin = $_POST['crypto'];
$month2 = $_POST['month'];
$year2 = $_POST['year'];

echo "<h2>$coin coin statistic for month $month2 year $year2</h2>";
echo "<table style='border: solid 1px black;'>";
 echo "<tr><th>ID</th><th>DATE</th><th>TIME</th><th>$coin PRICE</th></tr>";

class TableRows extends RecursiveIteratorIterator {
    function __construct($it) {
        parent::__construct($it, self::LEAVES_ONLY);
    }

    function current() {
        return "<td style='width: 150px; border: 1px solid black;'>" . parent::current(). "</td>";
    }

    function beginChildren() {
        echo "<tr>";
    }

    function endChildren() {
        echo "</tr>" . "\n";
    }
}

$servername = "localhost";
$username = "user1";
$password = "bananapi";
$dbname = "cryptodb";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//    $stmt = $conn->prepare("SELECT * FROM $coin");
    $stmt = $conn->prepare("SELECT * FROM $coin WHERE price_date  >= '$year2-$month2-01' AND price_date <= '$year2-$month2-31'");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);

    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        echo $v;
    }
}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";

?>

</body>
</html>

