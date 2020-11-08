<?php 

define("DS", DIRECTORY_SEPARATOR);
define("ROOT_PATH", dirname(__DIR__).DS);
define("APP", ROOT_PATH.'app'.DS);
define("CORE", APP.'Core'.DS);
define("CONFIG", APP.'Config'.DS);
define("CONTROLLERS", APP.'Controller'.DS);
define("MODELS", APP.'Model'.DS);
define("VIEWS", APP.'Views'.DS);
define("LIBS", APP.'Libs'.DS);
define("UPLOAD", ROOT_PATH.'public'.DS.'uploads'.DS);

require_once(CONFIG.'config.php');
require_once(CONFIG.'helpers.php');

// autoload all classess
$modules = [ROOT_PATH, APP, CORE, CONFIG, CONTROLLERS, MODELS, VIEWS, LIBS];
set_include_path(get_include_path(). PATH_SEPARATOR.implode(PATH_SEPARATOR, $modules));
spl_autoload_register('spl_autoload', false);


// new App();