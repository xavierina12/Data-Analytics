
<?php

IF (isset($_POST['submit']) and !empty($_POST['roll']) and $_POST['roll'] >=1 and $_POST['roll'] <=5 ){

function do_fetch($myeid, $s)
{
  // Fetch the results in an associative array
  print '<h1><p align="center"> Degree First Year Results'.'</p>';
     print '<h3><p align="center">  Student Roll Number'.'   '.$myeid.'</p>';
	 
	  $NAME;
	
$MAX=100;
$PASS='PASS';
$FAIL='FAIL';
$RE=$PASS;	
$total=0;



  
print '<table border="1" cellpadding="10" align="center" >
  <tr>
<th>SUBJECT</th>
<th>MAX MARKS</th>
<th>MARKS OBTAINED</th>
<th>PASS/FAIL</th>
</tr>';
  
  while ($row =oci_fetch_array($s, OCI_RETURN_NULLS+OCI_ASSOC)) {	
   

   $NAME=$row['SNAME'];
  echo "<tr>";
  echo "<td align='center' style='font-weight: bold'>" . $row['SUBNAME'] . "</td>";
  echo "<td align='center' >".$MAX. "</td>";
  echo "<h3><td align='center' style='font-weight: bold'>" . $row['MARKS'] . "</td>";
        $total += $row['MARKS'];
		
  
  IF ($row['MARKS']>35)
  {
	  ECHO "<td align='center'>".$PASS. "</td>";
	 
  }
  
  ELSE 
  {
	    ECHO "<td align='center'>".$FAIL. "</td>";
		$RE=$FAIL;
		
  }

   echo "</tr>";
  
    }
 
	
		ECHO '<TR>';
	ECHO "<TD>" . "</TD>";
	ECHO "<td align='center' style='font-weight: bold'>". "TOTAL "."</td>"; 
		ECHO "<td align='center' style='font-weight: bold'>".$total. "</td>"; 
	ECHO '</TR>';
	
	ECHO '<TR>';
	ECHO "<TD>" . "</TD>";
	ECHO "<TD>" . "</TD>";
	ECHO "<td align='center' style='font-weight: bold'>". "RESULT "."</td>"; 
    echo "<td align='center' style='font-weight: bold'>".$RE. "</td>"; 
	ECHO '</TR>';
	
  
  print '</table>';
  
  echo '<h3 align="center"> Student Name: ' .strtoupper($NAME). '<H3>';
  
  echo '<h3 align="center"> <a href="index.html"> Return to Home Page </a> </h3>';
  
}


// Create connection to Oracle
$c = oci_connect("result", "result", "//localhost:1521/orclpdb");

// Use bind variable to improve resuability, 
// and to remove SQL Injection attacks.
$query = 'select sname, subname, marks from student s join subject sub on s.sid=sub.sid where s.sid= :eidbv';
$s = oci_parse($c, $query);

$myeid = $_POST["roll"];
oci_bind_by_name($s, ":EIDBV", $myeid);
oci_execute($s);

do_fetch($myeid, $s);

// Close the Oracle connection
oci_close($c);
}

else
	
echo "error"
?>