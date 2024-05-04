<?php

namespace App\Controller;

use App\Entity\Livres;
use App\Repository\CategoriesRepository;
use App\Repository\LivresRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class UserLivreController extends AbstractController
{
    #[Route('/user/livre', name: 'app_user_livre')]
    public function index(LivresRepository $rep, CategoriesRepository $catrep): Response
    {
        $livres = $rep->findAll();
        $categories = $catrep->findAll();
        return $this->render('user_livre/index.html.twig', [
            'livres' => $livres,
            'categories' => $categories,
        ]);
    }

    #[Route('/user/livre/search', name: 'app_user_livre_search', methods: ['POST'])]
    public function search(Request $request, LivresRepository $rep, CategoriesRepository $catrep): Response
    {
        $categories = $catrep->findAll();

        $searchTerm = $request->request->get('searchTerm');
        $searchBy = $request->request->get('searchBy');
        $cat = "1=1";
        if ($searchBy) {
            $cat = "l.categorie = $searchBy";
        }

        $livres = $rep->createQueryBuilder('l')
            ->where('l.slug LIKE :searchTerm')
            ->orWhere('l.Editeur LIKE :searchTerm')
            ->andWhere($cat)
            ->setParameter('searchTerm', "%$searchTerm%")
            ->getQuery()
            ->getResult();


        return $this->render('user_livre/index.html.twig', [
            'livres' => $livres,
            'categories' => $categories,
        ]);
    }

    #[Route('/user/livre/show/{id}', name: 'app_user_livre_show')]
    public function show(Livres $livre): Response
    {
        return $this->render('user_livre/show.html.twig', [
            'livre' => $livre,
        ]);
    }
}
