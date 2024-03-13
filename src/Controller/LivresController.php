<?php

namespace App\Controller;

use App\Entity\Livres;
use App\Repository\LivresRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class LivresController extends AbstractController
{
    #[Route('/admin/livres', name: 'admin_livres')]
    public function index(LivresRepository $rep): Response
    {
        $livres = $rep->findAll();
        //$livres = $rep->findGreaterThan(100);
        //dd($livres);
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
    public function create(EntityManagerInterface $em): Response
    {
        $livre = new Livres();
        $livre->setImage('https://picsum.photos/300')
            ->setTitre('Titre du livre 10')
            ->setEditeur('Editeur 1')
            ->setISBN('111.1111.1111.1235')
            ->setPrix(200)
            ->setEditedAt(new \DateTimeImmutable('01-01-2024'))
            ->setSlug('titre-du-livre-10')
            ->setResume('hfjhgdkfhfklgfdlkjgjgfmjgfgfjgjgbkjbfl,gj');
        $em->persist($livre);
        $em->flush();
        //dd($livre);
        //return $this->render('livres/create.html.twig', [
        //   'livre' => $livre,
        // ]);
        return $this->redirectToRoute('admin_livres');
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
