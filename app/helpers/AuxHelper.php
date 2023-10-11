<?php

class AuxHelper {
    public static function reformatDate($date) {
        $params = explode('-', $date);
        $date = "$params[2]/$params[1]/$params[0]";
        return $date;
    }
}