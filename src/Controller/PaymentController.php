<?php

namespace App\Controller;

use Stripe\Checkout\Session;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class PaymentController extends AbstractController
{
    #[Route('/payment', name: 'app_payment')]
    public function index(): Response
    {
        return $this->render('payment/index.html.twig', [
            'controller_name' => 'PaymentController',
        ]);
    }
    // ...
    #[Route('/payment/create-charge', name: 'app_payment_charge')]

    public function createCharge(): Response
    {
        Stripe::setApiKey($_ENV['STRIPE_SECRET_KEY']);

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => 'usd',
                        'product_data' => [
                            'name' => 'T-shirt',
                        ],
                        'unit_amount' => 2000,
                    ],
                    'quantity' => 1,
                ],
                [
                    'price_data' => [
                        'currency' => 'usd',
                        'product_data' => [
                            'name' => 'Hat',
                        ],
                        'unit_amount' => 20,
                    ],
                    'quantity' => 3,
                ]
            ],
            'mode' => 'payment',
            'success_url' => $this->generateUrl('app_home', [], UrlGeneratorInterface::ABSOLUTE_URL),
            'cancel_url' => $this->generateUrl('app_user_livre', [], UrlGeneratorInterface::ABSOLUTE_URL),
        ]);

        return $this->redirect($session->url, 303);
    }

}
