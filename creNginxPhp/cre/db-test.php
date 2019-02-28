<?php
 require("/cre/www/db-config.php");
?>
<!DOCTYPE html>
<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>
    <h2>Database Test</p>
     <?php printDbResults(); ?>
  </body>
</html>

<?php

 function printDbResults()
 {
   echo "<style>";
   echo "table {border-collapse: collapse;}";
   echo "table, th, td {border: 1px solid black; padding: 10px;}";
   echo "</style>";

   echo "<table>";
   echo "<tr><th>Type</th><th>Table</th><th>PDO</th><th>Classic</th></tr>";
   foreach(inqDbConnections() as $db=>$c)
   {
    echo "<tr><td>".$c['type']."</td><td>".$c['dbname']."</td>";
    $pdoTest = testPDO($c['pdo'], $c['user'], $c['password']);
    echo "<td>".($pdoTest ? "ok" : "fail")."</td>";
    $classicTest = false;
    switch($c['type']) {
     case "mysql":
       $classicTest = testMySqlDb($c['dbname'], $c['user'], $c['password'], $c['host'], $c['port']);
       break;
     case "postgres":
       $classicTest = testPostgresDb($c['dbname'], $c['user'], $c['password'], $c['host'], $c['port']);
       break;
    } 
    echo "<td>".($classicTest ? "ok" : "fail")."</td>";
    echo "</tr>";
   }
   echo "</table>";
 }

 function testPostgresDb($dbname, $user, $password, $host, $port='5432')
  {
     $connectString = 'host='.$host.' port='.$port.' dbname='.$dbname.' user='.$user.' password='.$password;
     return pg_connect($connectString);
  }

 function testMySqlDb($dbname, $user, $password, $host, $port='3306')
  {
     $connectString = ''.$host.':'.$port.';dbname='.$dbname;
     return mysqli_connect($connectString, $user, $password);
  }

  function testMySqlPDO($dbname, $user, $password, $host, $port='3306')
  {
     return testPDO('mysql', $dbname, $user, $password, $host, $port);
  }

  function testPDO2($type, $dbname, $user, $password, $host, $port)
  {
     $connectionString = ''.$type.':host='.$host.':'.$port.';dbname='.$dbname;
     return testPDO($connectionString, $user, $password);
  }

  function testPDO($connect, $user, $password)
  {
     try {
       $connection = new PDO($connect, $user, $password);  
       $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
       return true;
     }
     catch(PDOException $e)
     {
       return false;
     }
     return false;
  }

?>
