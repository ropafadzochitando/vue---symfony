<?php

namespace App\Controller;


use App\Entity\Contact;
use App\Services\Serializer;
use App\Form\Type\ContactType;
use App\Services\DataValidator;
use Symfony\Component\Mime\Email;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class ContactController extends AbstractController
{
    public function indexAction(ManagerRegistry $doctrine, Serializer $serializer): Response
    {
        $contacts =  $doctrine->getRepository(Contact::class)->findAll();
        return $serializer->resjson($contacts);
    }

    public function createAction(Request $request, Serializer $serializer, MailerInterface $mailer)
    {
        // get contact data
        $json = $request->getContent();
        $params = json_decode($json);
        // default response
        $data = [
            'status' => 'error',
            'code' => 400,
            'message' => 'Error sending contact.',
            'data' => $json
        ];

        $validator = new DataValidator();
        $newParams = $validator->paramsValidator($params);

        // validate data
        if ($newParams != null) {

            $contact = new Contact();
            $contact->setEmail($newParams->email);
            $contact->setName($newParams->name);
            $contact->setGender($newParams->gender);
            $contact->setContent($newParams->content);
            // if validate success, create contact

            // save contact
            $doctrine = $this->getDoctrine();
            $em = $doctrine->getManager();

            $em->persist($contact);
            $em->flush();
            $email = (new Email())
                ->from('sinfreechitando@gmail.com')
                ->to($newParams->email)
                ->priority(Email::PRIORITY_HIGH)
                ->subject($newParams->name)
                ->html($newParams->name . '<br>' . $newParams->gender . '<br>' . $newParams->content);

            $mailer->send($email);
            $data = [
                'status' => 'success',
                'code' => 200,
                'message_status' => 'Contact sent succesfully.',
                'data' => $contact
            ];
        }

        return $serializer->resjson($data);
    }
}
