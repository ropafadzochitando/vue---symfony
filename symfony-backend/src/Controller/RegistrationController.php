<?php

namespace App\Controller;

use App\Entity\User;
use App\Services\Serializer;
use App\Services\DataValidator;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 * @Route("api", name="api_")
 */
class RegistrationController extends AbstractController
{
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var UserPasswordEncoderInterface
     */
    private $passwordEncoder;
    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(UserRepository $userRepository, UserPasswordEncoderInterface $passwordEncoder, EntityManagerInterface $entityManager)
    {
        $this->userRepository = $userRepository;
        $this->passwordEncoder = $passwordEncoder;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/register", name="register")
     * @param Request $request
     * @return \FOS\RestBundle\View\View
     */
    public function index(Request $request, Serializer $serializer)
    {

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

        if ($newParams != null) {
            $user = $this->userRepository->findOneBy([
                'email' => $newParams->email,
            ]);

            if (!is_null($user)) {
                return new JsonResponse([
                    'message' => 'User already exists'
                ], Response::HTTP_CONFLICT);
            }

            $user = new User();

            $user->setEmail($newParams->email);
            $user->setPassword(
                $this->passwordEncoder->encodePassword($user, $newParams->password)
            );
            $doctrine = $this->getDoctrine();
            $em = $doctrine->getManager();

            $em->persist($user);
            $em->flush();

            $data = [
                'status' => 'success',
                'code' => 200,
                'message_status' => 'User created successfully',
                'data' => $user
            ];
        }
        return $serializer->resjson($data);
    }

    public function user()
    {

        $user = $this->getUser();
        $doctrine = $this->getDoctrine();
        $em = $doctrine->getManager();

        $em->persist($user);
        $em->flush();

        $data = [
            'status' => 'success',
            'code' => 200,
            'message_status' => 'User created successfully',
            'data' => $user
        ];
        $json = $this->get('serializer')->serialize($data, 'json');

        // response http
        $response = new Response();
        $response->setContent($json);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    
    }
}
