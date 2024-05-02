<?php

namespace App\Controller;

use App\Entity\Livres;
use App\Form\LivreType;
use App\Repository\LivresRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

// #[IsGranted('ROLE_ADMIN')]

class LivresController extends AbstractController
{
    #[Route('/admin/livres', name: 'admin_livres')]
    public function index(LivresRepository $rep): Response
    {
        $livres = $rep->findAll();
        //$livres = $rep->findGreaterThan(100);
        // dd($livres);
        return $this->render('livres/index.html.twig', [
            'livres' => $livres,
        ]);
    }
    #[Route('/admin/livres/show/{id}', name: 'admin_livres_show')]
    public function show(Livres $livre): Response
    {
        return $this->render('livres/show.html.twig', [
            'livre' => $livre,
        ]);
    }
    #[Route('/admin/livres/create', name: 'admin_livres_create')]
    public function create(EntityManagerInterface $em, Request $request): Response
    {
        $livre = new Livres();
        //Construction de l'objet formulaire
        $form = $this->createForm(LivreType::class, $livre);
        //traitement de la requête
        $form->handleRequest($request);
        //vérification de la soumission du formulaire
        if ($form->isSubmitted() && $form->isValid()) {
            //enregistrement de la catégorie
            $em->persist($livre);
            $em->flush();
            // $this->addFlash('success', 'Catégorie ajoutée avec succès');
            //redirection vers la liste des catégories
            return $this->redirectToRoute('admin_livres');
        }

        return $this->render('livres/create.html.twig', [
            'f' => $form,

        ]);
    }
    #[Route('/admin/livres/delete/{id}', name: 'admin_livres_delete')]
    public function delete(EntityManagerInterface $em, Livres $livre): Response
    {    //recherche du livre à supprimer

        //suppression du livre trouvé
        $em->remove($livre);
        $em->flush();
        //dd($livre);

        return $this->render('livres/create.html.twig', [
            'livre' => $livre,
        ]);
    }
}
