<?php 
session_start();

class CustomerController {
    public function index() {
        
        //Checking if a user is logged in
        if(!isset($_SESSION['user_id'])) {
            $dashboard = new DashboardController();
            $dashboard->index();
        }
        else {
            $data = array();
            // $db = new Employee;
            if(isset($_POST['search'])) {
                $search = $_POST['search'];
                $db = new Customer();
                // $db->setSearchCustomer($search);
                $data['customer'] = $db->getSearchCustomer($search);
                //echo 'Error1';
                view::load('dashboard/customer/index', $data);
            }
            else {
                $db = new Customer();
                $data['customer'] = $db->getAllCustomer();
                // var_dump($data['customer']);
                // die();
                //echo 'Error2';
                view::load('dashboard/customer/index', $data);
            }
            
            
        }
           
    }
}