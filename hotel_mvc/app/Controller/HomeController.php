<?php 

class HomeController {

    // public function index($id,$id2) {

    //     $data['title'] = "Home Page";
    //     $data['content'] = "Content of Home Page";
    //     View::load('home', $data);

    //     // echo $id2;
    //     // require_once(VIEWS.'home.php');
    //     //echo "This Class is :" . __CLASS__ . " and method is :". __METHOD__; 
    // }

    public function index() {
        
        view::load('home');
    }
}