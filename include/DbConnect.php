<?php
/**
 * Created by PhpStorm.
 * User: ayur
 * Date: 3/19/18
 * Time: 9:39 PM
 */

class DbConnect
{
    //database link
    private $con;

    function __construct()
    {

    }

    function connect()
    {
        include_once dirname(__FILE__) . '/Constants.php';

        $this->con = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        return $this->con;
    }

}