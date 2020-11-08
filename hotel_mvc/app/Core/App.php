<?php 

// Front end Controller

class App {
    protected $controller = "HomeController";
    protected $action = "index";

    protected $params = [];


    public function __construct() {

        $this->prepareURL();
        $this->render();
    }


    /**
     *  extract controller, method and parameters
     *  @return void
     */

    private function prepareURL() {

        $url = $_SERVER['QUERY_STRING'];

        //$url = explode("/",$url);
        //var_dump($url);
        //echo $url[2];

        if(!empty($url)) {

            $url = trim($url,"/");
            $url = explode("/", $url);

            // define the controller
            $this->controller = isset($url[0]) ? ucwords($url[0])."Controller":"HomeController";

            //echo $this->controller;

           // define the action 
            $this->action = isset($url[1]) ? $url[1] : "index";

            unset($url[0],$url[1]);

            $this->params = !empty($url) ? array_values($url):[];

            //var_dump($this->params);
        }
    }

    private function render() {

        if(class_exists($this->controller)) {

            $controller = new $this->controller;

            if(method_exists($controller, $this->action)) {

                call_user_func_array([$controller, $this->action], $this->params);
            }
            else {
                echo "Method Not Exist";
            }
        }
        else {
            echo "This Controller :" . $this->controller . " Not Exist";
        }
    }

}