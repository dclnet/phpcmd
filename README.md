# phpcmd
命令行模式执行php的小助手程序
// file d:\file\test.php
<?php
function doit($name, $age) {
  echo $name.', '.$age;
}
?>
//----------------------
d:\file 文件夹下：
test.php
cmd
cmd.bat

//----------------------
in windows console(cmd)
d:\file>cmd test/doit myname 18 // 执行test.php文件中的doit函数，参数自动传过去
print: myname, 18

没那么多高大上，只是方便执行一些简单的php程序而已
