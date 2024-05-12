<?php
namespace App\Repository;

use App\Entity\Livres;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Tools\Pagination\Paginator;

class PaginationRep extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Livres::class);
    }

    public function findPaginated(int $currentPage = 1, int $limit = 10)
    {
        $query = $this->createQueryBuilder('e')
            ->orderBy('e.id', 'ASC')
            ->getQuery()
            ->setFirstResult(($currentPage - 1) * $limit)
            ->setMaxResults($limit);

        return new Paginator($query, true);
    }

    public function filterPaginated(int $currentPage = 1, int $limit = 10, string $searchTerm = null, string $searchBy = null)
    {
        $query = $this->createQueryBuilder('e')
            ->orderBy('e.id', 'ASC');

        if ($searchTerm) {
            $query->andWhere('e.slug LIKE :searchTerm')
                ->orWhere('e.Editeur LIKE :searchTerm')
                ->setParameter('searchTerm', "%$searchTerm%");
        }

        if ($searchBy) {
            $query->andWhere('e.categorie = :searchBy')
                ->setParameter('searchBy', $searchBy);
        }

        $query->setFirstResult(($currentPage - 1) * $limit)
            ->setMaxResults($limit);

        return new Paginator($query, true);
    }
}
