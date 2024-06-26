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
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

// #[IsGranted('ROLE_ADMIN')]

class LivresController extends AbstractController
{

    public function __construct(private UrlGeneratorInterface $urlGenerator)
    {
    }
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
            notyf()->ripple(true)->addSuccess('Livre ajouté avec succès');
            //redirection vers la liste des catégories
            return $this->redirectToRoute('admin_livres');
        }

        return $this->render('livres/create.html.twig', [
            'f' => $form,

        ]);
    }
    #[Route('/admin/livres/delete/{id}', name: 'admin_livres_delete')]
    public function delete(EntityManagerInterface $em, Livres $livre)
    {    //recherche du livre à supprimer
        notyf()->ripple(true)->addSuccess('Livre supprimé avec succès');
        //suppression du livre trouvé
        $em->remove($livre);
        $em->flush();
        //dd($livre);

        return new RedirectResponse($this->urlGenerator->generate('admin_livres'));
    }

    #[Route('/admin/livres/edit/{id}', name: 'admin_livres_edit')]

    public function edit(EntityManagerInterface $em, Request $request, Livres $livre): Response
    {
        //Construction de l'objet formulaire
        $form = $this->createForm(LivreType::class, $livre);
        //traitement de la requête
        $form->handleRequest($request);
        //vérification de la soumission du formulaire
        if ($form->isSubmitted() && $form->isValid()) {
            //enregistrement de la catégorie
            $em->persist($livre);
            $em->flush();
            notyf()->ripple(true)->addSuccess('Livre modifié avec succès');
            //redirection vers la liste des catégories
            return $this->redirectToRoute('admin_livres');
        }

        return $this->render('livres/edit.html.twig', [
            'f' => $form,

        ]);
    }
}
