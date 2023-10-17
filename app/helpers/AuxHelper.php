<?php

require_once './config.php';

class AuxHelper {
    public static function reformatDate($date) {
        $params = explode('-', $date);
        $date = "$params[2]/$params[1]/$params[0]";
        return $date;
    }

    public static function deployDB() {
        $db = new PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DB . ';charset=utf8', MYSQL_USER, MYSQL_PASS);
        $query = $db->query('SHOW TABLES');
        $tables = $query->fetchAll();
        if (count($tables) == 0) {
            $sql =<<<END
            
            END;
        }
    }
}