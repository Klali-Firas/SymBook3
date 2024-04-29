<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Form\CategorieType;
use App\Repository\CategoriesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CategorieController extends AbstractController
{
    #[Route('/admin/categorie', name: 'app_admin_categorie')]
    public function index(CategoriesRepository $rep): Response
    {
        $categories = $rep->findAll();
        return $this->render('categorie/index.html.twig', [
            'categories' => $categories,
        ]);
    }
    #[Route('/admin/categorie/create', name: 'app_admin_create_categorie')]
    public function create(EntityManagerInterface $em, Request $request): Response
    {
        $categorie = new Categories();
        //Construction de l'objet formulaire
        $form = $this->createForm(CategorieType::class, $categorie);
        //traitement de la requête
        $form->handleRequest($request);
        //vérification de la soumission du formulaire
        if ($form->isSubmitted() && $form->isValid()) {
            //enregistrement de la catégorie
            $em->persist($categorie);
            $em->flush();
            // $this->addFlash('success', 'Catégorie ajoutée avec succès');
            //redirection vers la liste des catégories
            return $this->redirectToRoute('app_admin_categorie');
        }
        return $this->render('categorie/create.html.twig', [
            'f' => $form,
        ]);
    }


    #[Route('/admin/categorie/update/{id}', name: 'app_admin_update_categorie')]
    public function update(EntityManagerInterface $em, Request $request, Categories $categorie): Response
    {
        //Construction de l'objet formulaire
        $form = $this->createForm(CategorieType::class, $categorie);
        //traitement de la requête
        $form->handleRequest($request);
        //vérification de la soumission du formulaire
        if ($form->isSubmitted() && $form->isValid()) {
            // $formData = $form->getData();
            // dd($formData->getLibelle());
            //enregistrement de la catégorie
            $em->persist($categorie);
            $em->flush();
            // $this->addFlash('success', 'Catégorie ajoutée avec succès');
            //redirection vers la liste des catégories
            return $this->redirectToRoute('app_admin_categorie');
        }

        return $this->render('categorie/update.html.twig', [
            'f' => $form,
        ]);
    }
}


