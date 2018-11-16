
<!DOCTYPE html>
<html>
  <head>
    <title>1: DB Test</title>
    <!-- weitere Kopfinformationen -->
    <!-- Kommentare werden im Browser nicht angezeigt. -->
  </head>
  <body>
    <h2>1: Database Test</p>
    
  </body>
</html>

<?php
 function testPostgresDb($dbname, $user, $password, $host, $port='5432')
  {
     $connectString = "host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$password;
     return pg_connect($connectString);
  }

 function testMySqlDb($dbname, $user, $password, $host, $port='3306')
  {
     $connectString = "".$host.":".$port.";dbname=".$dbname.";
     return mysqli_connect($connectString, $user, $password);
  }

  function testMySqlPDO($dbname, $user, $password, $host, $port='3306')
  {
     return testPDO('mysql', $dbname, $user, $password, $host, $port);
  }

  function testPDO($type, $dbname, $user, $password, $host, $port)
  {
     $connectionString = "".$type.":host=".$host.":".$port.";dbname=".$dbname.";user=".$user.";password=".$password;
     //$connectionString = "".$type.":host=".$host.";port=".$port.";dbname=".$dbname.";user=".$user.";password=".$password;
     try {
       $connection = new PDO($connectionString); 
       //$connection = new PDO($connectionString, $user, $password);  
       $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
       return true;
     }
     catch(PDOException $e)
     {
       return false;
     }
     return false
  }

?>
