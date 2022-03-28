<?php

namespace App\Services;

class DataValidator{
    public function paramsValidator($params){
        // set null to empty parameters
        if($params != null){
            foreach($params as $param){
                if(empty($param)){
                    $param = null;
                }
            }
            return $params;
        }

        return null;
    }
    
}