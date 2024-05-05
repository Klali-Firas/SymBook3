<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Livres;
use App\Entity\Panier;
use App\Entity\User;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

use function PHPUnit\Framework\isEmpty;

class ArticleController extends AbstractController
{

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }


    #[Route('/article', name: 'app_article')]
    public function index(): Response
    {
        return $this->render('article/index.html.twig', [
            'controller_name' => 'ArticleController',
        ]);
    }

    #[Route('/article/add/{livre}', name: 'app_article')]
    public function add(Livres $livre, SessionInterface $session): Response
    {
        $panier = $session->get('panier', []);

        if (!empty($panier[$livre->getId()])) {
            $panier[$livre->getId()]++;
        } else {
            $panier[$livre->getId()] = 1;
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

        return $this->redirectToRoute('app_panier_show');
    }

    #[Route('/article/remove/{livre}', name: 'app_article_remove')]
    public function remove(Livres $livre, SessionInterface $session): Response
    {
        $panier = $session->get('panier', []);
        if (!empty($panier[$livre->getId()])) {
            unset($panier[$livre->getId()]);
        }
        $session->set('panier', $panier);

        return $this->redirectToRoute('app_panier_show');
    }
}
