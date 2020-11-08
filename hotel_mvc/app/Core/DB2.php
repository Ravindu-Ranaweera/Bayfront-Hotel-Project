<?php 

        $dbhost = 'localhost';
        $dbuser = 'root';
        $dbpass = '';
        $dbname = 'bayfronthotelDB';  //change

        $data = "tharindu";

        $connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
        $data= mysqli_real_escape_string($connection,$data);
        echo $data;

        //Checking the connection
        if(mysqli_connect_errno()) {
            die('Database connection failed ' .mysqli_connect_error());
        }
        else {
            return $connection;
        }
