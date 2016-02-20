<?php
define('ROOT_PATH', __DIR__);
define('DS', DIRECTORY_SEPARATOR);

$cmd = isset($argv[1]) ? $argv[1] : '';
if (count($argv) > 2) {
	$args = array_slice($argv, 2);
} else {
	$args = [];
}

try {
	if ($cmd && (strpos($cmd, '/') !== false)) {
		list($file, $fun) = explode('/', $cmd);
		$filePath = ROOT_PATH . DS . $file . '.php';
		if ($file && file_exists($filePath)) {
			include $filePath;
			if ($fun && function_exists($fun)) {
				$funRef = new ReflectionFunction($fun);
				$params = $funRef->getParameters();
				if (count($params) > count($args)) {
					throw new Exception("function {$fun} missing arguments.\n".implode("\n", $params));
				}
				$result = call_user_func_array($fun, $args);
				if ($result === false) {
					throw new Exception('Invoke failed.');
				} elseif (!empty($result)) {
					echo $result."\n";
				}
			} else {
				throw new Exception('function you called is not exist.');
			}
		} else {
			throw new Exception("file {$file} is not exist.");
		}
	} else {
		throw new Exception('file/fun argument is error.');
	}
} catch(Exception $e) {
	echo $e->getMessage()."\n";
}