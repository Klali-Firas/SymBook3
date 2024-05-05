<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ArticleRepository::class)]
class Article
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'articles', cascade: ['persist', 'remove'])]
    private ?panier $panier = null;

    #[ORM\ManyToOne]
    private ?Livres $livre = null;

    #[ORM\Column]
    private ?int $quantite = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPanier(): ?panier
    {
        return $this->panier;
    }

    public function setPanier(?panier $panier): static
    {
        $this->panier = $panier;

        return $this;
    }

    public function getLivre(): ?Livres
    {
        return $this->livre;
    }

    public function setLivre(?Livres $livre): static
    {
        $this->livre = $livre;

        return $this;
    }

    public function getQuantite(): ?int
    {
        return $this->quantite;
    }

    public function setQuantite(int $quantite): static
    {
        $this->quantite = $quantite;

        return $this;
    }
}
