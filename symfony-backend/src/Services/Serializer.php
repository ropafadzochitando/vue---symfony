<?php

namespace App\Services;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class Serializer extends AbstractController{

    public function resjson($data){
        // serialize obj
        $json = $this->get('serializer')->serialize($data, 'json');

        // response http
        $response = new Response();
        $response->setContent($json);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }
}