<?php 
session_start();

class RoomController {

    public function index() {
        date_default_timezone_set("Asia/Colombo");
        $current_date = date('Y-m-d');
        //Checking if a user is logged in
        if(!isset($_SESSION['user_id'])) {
            view::load('home');    
        }
        else {
            //view::load('room/index');
            if($_SESSION['user_level'] == "Owner") {
                $data = array();
                $db = new Room;
                if(isset($_POST['search'])) {
                    $search = $_POST['search'];
                    //echo $search;
                    if($search == "Today") {
                        $data['rooms'] = $db->getAllRoom($current_date);
                        view::load('room/index', $data);
                    }
                    else {
                        $data['rooms'] = $db->getSearchRoomOwner($search);
                        view::load('room/index', $data);
                    }
                }
                else {
                    $data['rooms'] = $db->getAllRoomOwner();
                    view::load('room/index', $data);
                }
            }
            else {
                $data = array();
                $db = new Room;
                if(isset($_POST['search'])) {
                    $search = $_POST['search'];
                    $data['rooms'] = $db->getSearchRoom($search, $current_date);
                    //echo 'Error1';
                    view::load('room/index', $data);
                    //view::load('inc/test', $data);
                }
                else {
                    $data['rooms'] = $db->getAllRoom($current_date);
                    //$current_date = strtotime(time, now);
                    
                    //$current_date = date('Y-m-d');
                    //echo $current_date;
                    //echo 'Error2';
                    //view::load('inc/test', $data);
                    view::load('room/index', $data);
                }
            }
            
            
            
        }
           
    }

    // public function add() {
    //     if(!isset($_SESSION['user_id'])) {
    //         view::load('home');    
    //     }
    //     else {
    //         view::load('employee/add');
            
    //     }
         
    // }

    // public function edit($emp_id) {
    //     if(!isset($_SESSION['user_id'])) {
    //         view::load('home');    
    //     }
    //     else {
    //         $db = new Employee();
    //         $data['employee']= $db->getDataEmployee($emp_id);
    //         //echo $data['first_name'];
    //         //view::load('inc/test', $data);
    //         view::load('employee/edit', $data);
    //     }
         
    // }

    // public function create() {
    //     if(isset($_POST['submit'])) {

    //         // Validation
    //         $errors = array();
            
    //         //$errors = $this->validation();

    //         $owner_user_id = $_POST['owner_user_id'];
    //         $first_name = $_POST['first_name'];
    //         $last_name = $_POST['last_name'];
    //         $email = $_POST['email'];
    //         $salary = $_POST['salary'];
    //         $location = $_POST['location'];
    //         $contact_num = $_POST['contact_num'];

    //         // Check input is empty
    //         $req_fields = array('first_name', 'last_name', 'email', 'salary', 'location', 'contact_num');
    //         $errors = array_merge($errors, $this->check_req_fields($req_fields));

    //         // Checking max length
    //         $max_len_fields = array('first_name' => 50, 'last_name' => 100, 'email' => 100, 'salary' => 10, 'location' => 50, 'contact_num' => 10);
    //         $errors = array_merge($errors, $this->check_max_len($max_len_fields));

    //         // Check Email is valid
    //         if(!$this->is_email($_POST['email'])) {
    //             $errors[] = 'Email address is Invalid';
    //         }

    //         // Check Employee email already exist
    //         $db = new Employee();
    //         $result = $db->getEmail($email); 

    //         if($result == 1) {
    //             $errors[] = 'Email address already exists';
    //         }

    //         // Check Owner is valid
    //         $result = $db->getOwner($owner_user_id);

    //         if($result == 0) {
    //             $errors[] = 'Owner ID isn\'t valid';
    //         }

    //         $data['error'] = $errors;
    //         $data['employee'] = array($owner_user_id, $first_name, $last_name, $email, $salary, $location, $contact_num);
                 
    //         if(!empty($errors)) {
    //             view::load("employee/add", $data);
    //         }
    //         else {
    //             $data = array($owner_user_id, $first_name, $last_name, $email, $salary, $location, $contact_num);
    //             $result = $db->getCreate($data);

    //             if($result == 1) {
    //                 view::load("employee/add", ["success"=>"Data Created Successfully"]);
    //             }
    //             else {
    //                 view::load("employee/add", ["newerror"=>"Data Created Unsuccessfully"]);
    //             }



    //         }


    //     }
    // }

    // public function update($emp_id) {
    //     if(isset($_POST['submit'])) {

    //         // Validation
    //         $errors = array();
            
    //         //$errors = $this->validation();

    //         $owner_user_id = $_POST['owner_user_id'];
    //         $first_name = $_POST['first_name'];
    //         $last_name = $_POST['last_name'];
    //         $email = $_POST['email'];
    //         $salary = $_POST['salary'];
    //         $location = $_POST['location'];
    //         $contact_num = $_POST['contact_num'];

    //         // Check input is empty
    //         $req_fields = array('first_name', 'last_name', 'email', 'salary', 'location', 'contact_num');
    //         $errors = array_merge($errors, $this->check_req_fields($req_fields));

    //         // Checking max length
    //         $max_len_fields = array('first_name' => 50, 'last_name' => 100, 'email' => 100, 'salary' => 10, 'location' => 50, 'contact_num' => 10);
    //         $errors = array_merge($errors, $this->check_max_len($max_len_fields));

    //         // Check Email is valid
    //         if(!$this->is_email($_POST['email'])) {
    //             $errors[] = 'Email address is Invalid';
    //         }

    //         // Check Employee email already exist
    //         $db = new Employee();
    //         $result = $db->getEmailOther($email, $emp_id); 

    //         if($result == 1) {
    //             $errors[] = 'Email address Invalid or already use other';
    //         }

    //         // Check Owner is valid
    //         $result = $db->getOwner($owner_user_id);

    //         if($result == 0) {
    //             $errors[] = 'Owner ID isn\'t valid';
    //         }

    //         $data['error'] = $errors;
    //         $data['employee'] = array("emp_id"=>$emp_id, "owner_user_id"=>$owner_user_id, "first_name"=>$first_name, "last_name"=>$last_name, "email"=>$email, "salary"=>$salary, "location"=>$location, "contact_num"=>$contact_num);
                 
    //         if(!empty($errors)) {
    //             //view::load("inc/test", $data);
    //             view::load("employee/edit", $data);
    //         }
    //         else {
    //             $data1 = array($emp_id, $owner_user_id, $first_name, $last_name, $email, $salary, $location, $contact_num);
    //             $result = $db->getUpdate($data1);

    //             if($result == 1) {
    //                 view::load("employee/edit", ["success"=>"Employee Update Successfully", 'employee'=>$data['employee']]);
    //             }
    //             else {
    //                 view::load("employee/edit", ["newerror"=>"Data Update Unsuccessfully", 'employee'=>$data['employee']]);
    //             }



    //         }


    //     }
    // }

    // public function delete($emp_id) {
    //     $db = new Employee();
    //     $result = $db->remove($emp_id);

    //     if($result == 1) {
    //         $this->index();
    //     }

    // }


    // private function check_req_fields($req_fields) {
        
    //     $errors = array();

    //     foreach($req_fields as $field) {
    //         if(empty(trim($_POST[$field]))) {
    //             $errors[] = $field . ' is required';
    //         }
    //     }

    //     return $errors;
    // }

    // private function check_max_len($max_len_fields) {
    //     // Check max lengths
    //     $errors = array();
    
    //     foreach($max_len_fields as $field => $max_len) {
    //         if(strlen(trim($_POST[$field])) > $max_len ) {
    //             $errors[] = $field . ' must be less than ' . $max_len . ' characters';
    //         }
    //     }
    
    //     return $errors;
    // }
    
    // private function is_email($email) {
    //     return(preg_match("/^[-_.[:alnum:]]+@((([[:alnum:]]|[[:alnum:]][[:alnum:]-]*[[:alnum:]])\.)+(ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|at|au|aw|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cs|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|eh|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|in|info|int|io|iq|ir|is|it|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|mg|mh|mil|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nt|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zw)$|(([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5])\.){3}([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5]))$/i" ,$email));
    // }
    
}

