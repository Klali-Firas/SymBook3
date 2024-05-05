<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Order;
use App\Entity\Panier;
use App\Entity\User;
use App\Repository\OrderRepository;
use App\Repository\PanierRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class OrderController extends AbstractController
{
    #[Route('/order/place/{panier}', name: 'app_order')]
    public function placeOrder(Panier $panier, EntityManagerInterface $em): Response
    {
        Stripe::setApiKey($_ENV['STRIPE_SECRET_KEY']);


        $line_items = [];

        foreach ($panier->getArticles() as $ind => $article) {
            $prix = $article->getLivre()->getPrix();
            $quantite = $article->getQuantite();


            // Add a line item for this article to the line_items array
            $line_items[] = [
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => $article->getLivre()->getTitre(), // Assuming the Livre entity has a getTitre() method
                    ],
                    'unit_amount' => $prix * 100, // Stripe expects the amount in cents
                ],
                'quantity' => $quantite,
            ];
        }



        // Create the Stripe session with the line items
        $session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $line_items,
            'mode' => 'payment',
            'success_url' => $this->generateUrl('app_order_finalise', ['panier' => $panier->getId()], UrlGeneratorInterface::ABSOLUTE_URL),
            'cancel_url' => $this->generateUrl('app_order_annuler_paiment', ['panier' => $panier->getId()], UrlGeneratorInterface::ABSOLUTE_URL),
        ]);

        // Redirect to the Stripe Checkout page
        return $this->redirect($session->url, 303);
    }

    #[Route('/order/{order}', name: 'app_order_show', requirements: ['order' => '\d+'])]

    public function showOrder(Order $order): Response
    {
        return $this->render('order/index.html.twig', [
            'order' => $order,
        ]);
    }

    #[Route('/order/my-orders', name: 'app_my_orders')]
    public function myOrders(OrderRepository $rep): Response
    {
        $user = $this->getUser();
        $orders = $rep->findBy(['user' => $user]);
        return $this->render('order/my_orders.html.twig', [
            'orders' => $orders,
        ]);
    }

    #[Route('/order/finalise/{panier}', name: 'app_order_finalise')]
    public function finaliseOrder(EntityManagerInterface $em, Panier $panier, SessionInterface $session): Response
    {
        $user = $this->getUser();
        $order = new Order();
        $total = 0;

        foreach ($panier->getArticles() as $ind => $article) {
            $prix = $article->getLivre()->getPrix();
            $quantite = $article->getQuantite();
            $total += $prix * $quantite;


        }
        $order->setUser($user)
            ->setPanier($panier)
            ->setOrderdate(new DateTime())
            ->setPrixtotal($total)
            ->setStatut("En cours");
        $em->persist($order);
        $em->flush();

        $session->set('panier', []);

        notyf()
            ->ripple(true)
            ->addSuccess('Votre commande a été enregistrée avec succès!');

        return $this->redirectToRoute('app_order_show', ['order' => $order->getId()]);
    }

    #[Route('/order/annulerPaiment/{panier}', name: 'app_order_annuler_paiment')]
    public function annulerPaiment(Panier $panier, EntityManagerInterface $em): Response
    {
        $em->remove($panier);
        $em->flush();
        notyf()
            ->ripple(true)
            ->addError('Votre paiement a été annulé!');

        return $this->redirectToRoute('app_panier_show');
    }


}
