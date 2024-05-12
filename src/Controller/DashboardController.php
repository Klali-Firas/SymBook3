<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use App\Repository\OrderRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DashboardController extends AbstractController
{
    #[Route('/dashboard', name: 'app_dashboard')]
    public function index(ArticleRepository $artRep, OrderRepository $ordRep): Response
    {
        $articleStats = $artRep->createQueryBuilder('a')
            ->select('l.titre as titre, SUM(a.quantite) as totalQuantite') // Select 'titre' from 'l' (Livre) and 'totalQuantite'
            ->join('a.livre', 'l') // Join the 'livre' association
            ->groupBy('l.titre') // Group by the 'titre' of 'livre' association
            ->orderBy('totalQuantite', 'DESC') // Order by 'totalQuantite' in descending order
            ->getQuery()
            ->getResult();

        $categoryStats = $artRep->createQueryBuilder('a')
            ->select('c.libelle as categorie, SUM(a.quantite) as totalQuantite') // Select 'nom' from 'c' (Categorie) and 'totalQuantite'
            ->join('a.livre', 'l') // Join the 'livre' association
            ->join('l.categorie', 'c') // Join the 'categorie' association
            ->groupBy('c.libelle') // Group by the 'nom' of 'categorie' association
            ->getQuery()
            ->getResult();

        $categoryProfit = $artRep->createQueryBuilder('a')
            ->select('c.libelle as categorie, SUM(l.prix * a.quantite) as totalProfit') // Select 'libelle' from 'c' (Categorie) and calculate the total profit
            ->join('a.livre', 'l') // Join the 'livre' association
            ->join('l.categorie', 'c') // Join the 'categorie' association
            ->groupBy('c.libelle') // Group by the 'libelle' of 'categorie' association
            ->getQuery()
            ->getResult();

        $startDate = new \DateTime('first day of this month');
        $endDate = new \DateTime('last day of this month');

        $salesPerDay = $ordRep->createQueryBuilder('o')
            ->select('date(o.orderdate) as date, COUNT(o.id) as totalSales')
            ->where('o.orderdate BETWEEN :startDate AND :endDate')
            ->setParameter('startDate', $startDate)
            ->setParameter('endDate', $endDate)
            ->groupBy('date')
            ->getQuery()
            ->getResult();

        $totalProfit = $ordRep->createQueryBuilder('o')
            ->select('SUM(o.prixtotal) as totalProfit')
            ->getQuery()
            ->getSingleScalarResult();

        $totalSalesPerDay = $ordRep->createQueryBuilder('o')
            ->select('date(o.orderdate) as date, SUM(o.prixtotal) as totalProfit')
            ->groupBy('date')
            ->getQuery()
            ->getResult();


        return $this->render('dashboard/index.html.twig', [
            'articleStats' => $articleStats,
            'categoryStats' => $categoryStats,
            'salesPerDay' => $salesPerDay,
            // 'categoryProfit' => $categoryProfit,
            'totalProfit' => $totalProfit,
            'totalSalesPerDay' => $totalSalesPerDay
        ]);
    }


}
