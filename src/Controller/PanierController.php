<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Panier;
use App\Form\PanierType;
use App\Repository\LivresRepository;
use App\Repository\PanierRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/panier')]
class PanierController extends AbstractController
{


    #[Route('/', name: 'app_panier_show', methods: ['GET'])]
    public function show(SessionInterface $session, LivresRepository $rep): Response
    {
        $user = $this->getUser();
        if ($user == null) {
            return $this->redirectToRoute('app_login');
        }
        $panier = $session->get('panier', []);
        $data = [];
        foreach ($panier as $id => $quantite) {
            $livre = $rep->find($id);
            $data[] = [
                'livre' => $livre,
                'quantite' => $quantite
            ];
        }
        return $this->render('panier/show.html.twig', [
            'data' => $data,
        ]);
    }





    #[Route('/confirm', name: 'app_panier_confirm')]
    public function confirm(LivresRepository $livrep, SessionInterface $session, EntityManagerInterface $entityManager): Response
    {
        $panier = new Panier();
        $panier->setUser($this->getUser());

        $panierFromSession = $session->get('panier', []);
        if (count($panierFromSession) == 0) {
            return $this->redirectToRoute('app_panier_show');
        }
        foreach ($panierFromSession as $id => $quantite) {
            $livre = $livrep->find($id);
            $article = new Article();
            $article->setLivre($livre);
            $article->setQuantite($quantite);
            $panier->addArticle($article);
        }

        $entityManager->persist($panier);
        $entityManager->flush();

        // $session->set('panier', []);

        return $this->redirectToRoute('app_order', ['panier' => $panier->getId()]);
    }
}
