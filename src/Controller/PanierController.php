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

    #[Route('/new', name: 'app_panier_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $panier = new Panier();
        $form = $this->createForm(PanierType::class, $panier);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($panier);
            $entityManager->flush();

            return $this->redirectToRoute('app_panier_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('panier/new.html.twig', [
            'panier' => $panier,
            'form' => $form,
        ]);
    }

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

    #[Route('/{id}/edit', name: 'app_panier_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Panier $panier, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(PanierType::class, $panier);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_panier_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('panier/edit.html.twig', [
            'panier' => $panier,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_panier_delete', methods: ['POST'])]
    public function delete(Request $request, Panier $panier, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $panier->getId(), $request->request->get('_token'))) {
            $entityManager->remove($panier);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_panier_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/confirm', name: 'app_panier_confirm')]
    public function confirm(LivresRepository $livrep, SessionInterface $session, EntityManagerInterface $entityManager): Response
    {
        $panier = new Panier();
        $panier->setUser($this->getUser());

        $panierFromSession = $session->get('panier', []);
        foreach ($panierFromSession as $id => $quantite) {
            $livre = $livrep->find($id);
            $article = new Article();
            $article->setLivre($livre);
            $article->setQuantite($quantite);
            $panier->addArticle($article);
        }

        $entityManager->persist($panier);
        $entityManager->flush();

        $session->set('panier', []);

        return $this->redirectToRoute('app_user_livre');
    }
}
