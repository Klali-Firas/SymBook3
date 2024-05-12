<?php

namespace App\Controller;

use App\Entity\Livres;
use App\Repository\PaginationRep;
use App\Repository\CategoriesRepository;
use App\Repository\LivresRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class UserLivreController extends AbstractController
{
    #[Route('/user/livre', name: 'app_user_livre')]
    public function index(CategoriesRepository $catrep, Request $request, PaginationRep $paginationRep): Response
    {

        $currentPage = $request->query->getInt('page', 1);
        $limit = 6; // Number of items per page
        $paginator = $paginationRep->findPaginated($currentPage, $limit);
        $categories = $catrep->findAll();

        return $this->render('user_livre/index.html.twig', [
            'paginator' => $paginator,
            'currentPage' => $currentPage,
            'limit' => $limit,
            'categories' => $categories,
        ]);
        // $livres = $rep->findAll();
        // $categories = $catrep->findAll();
        // return $this->render('user_livre/index.html.twig', [
        //     'livres' => $livres,
        //     'categories' => $categories,
        // ]);
    }

    #[Route('/user/livre/search', name: 'app_user_livre_search')]
    public function search(Request $request, CategoriesRepository $catrep, PaginationRep $paginationRep): Response
    {
        $categories = $catrep->findAll();


        $searchTerm = $request->query->get('searchTerm');
        $searchBy = $request->query->get('searchBy');
        $currentPage = $request->query->getInt('page', 1);
        $limit = 6; // Number of items per page
        $paginator = $paginationRep->filterPaginated($currentPage, $limit, $searchTerm, $searchBy);
        // $cat = "1=1";
        // if ($searchBy) {
        //     $cat = "l.categorie = $searchBy";
        // }

        // $livres = $rep->createQueryBuilder('l')
        //     ->where('l.slug LIKE :searchTerm')
        //     ->orWhere('l.Editeur LIKE :searchTerm')
        //     ->andWhere($cat)
        //     ->setParameter('searchTerm', "%$searchTerm%")
        //     ->getQuery()
        //     ->getResult();


        return $this->render('user_livre/index.html.twig', [
            'categories' => $categories,
            'paginator' => $paginator,
            'currentPage' => $currentPage,
            'limit' => $limit,
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
