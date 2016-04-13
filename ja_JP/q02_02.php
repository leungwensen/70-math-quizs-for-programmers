<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>電卓</title>
</head>
<body>
<form method="post" action="<?php echo $_SERVER['SCRIPT_NAME'];?>">
<input type="text" name="exp" size="30">
<input type="submit" value="計算">
</form>
<div>
<?php
if($_SERVER["REQUEST_METHOD"] == "POST"){
  $exp = $_POST["exp"];
  eval("echo $exp;");
}
?>
</div>
</body>
</html>
