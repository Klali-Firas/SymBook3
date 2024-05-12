<?php

namespace App\Controller;


use App\Entity\Livres;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;


class ArticleController extends AbstractController
{

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }


    // #[Route('/article', name: 'app_article')]
    // public function index(): Response
    // {
    //     return $this->render('article/index.html.twig', [
    //         'controller_name' => 'ArticleController',
    //     ]);
    // }

    #[Route('/article/add/{livre}', name: 'app_article')]
    public function add(Livres $livre, SessionInterface $session): Response
    {
        $panier = $session->get('panier', []);

        if (!empty($panier[$livre->getId()])) {
            $panier[$livre->getId()]++;
            notyf()
                ->ripple(true)
                ->addSuccess('Quantité augmentée dans le panier!');
        } else {
            $panier[$livre->getId()] = 1;
            notyf()
                ->ripple(true)
                ->addSuccess('Article ajouté au panier!');
        }
        $session->set('panier', $panier);



        return $this->redirectToRoute('app_panier_show');
    }

    #[Route('/article/decrease/{livre}', name: 'app_article_decrease')]
    public function decrease(Livres $livre, SessionInterface $session): Response
    {
        $panier = $session->get('panier', []);
        if (!empty($panier[$livre->getId()])) {
            $panier[$livre->getId()]--;
            if ($panier[$livre->getId()] <= 0) {
                unset($panier[$livre->getId()]);
            }
        }
        $session->set('panier', $panier);

        notyf()
            ->ripple(true)
            ->addSuccess('Quantité diminuée dans le panier!');

        return $this->redirectToRoute('app_panier_show');
    }

    #[Route('/article/remove/{livre}', name: 'app_article_remove')]
    public function remove(Livres $livre, SessionInterface $session): Response
    {
        $panier = $session->get('panier', []);
        if (!empty($panier[$livre->getId()])) {
            unset($panier[$livre->getId()]);
            notyf()
                ->ripple(true)
                ->addSuccess('Article supprimé du panier!');
        }
        $session->set('panier', $panier);

        return $this->redirectToRoute('app_panier_show');
    }
}
