<?php

namespace App\DataFixtures;

use App\Entity\Categories;
use App\Entity\Livres;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        $faker = Factory::create('en_US');

        for ($j = 0; $j < 3; $j++) {
            $cat = new Categories();
            $cat->setLibelle($faker->name())
                ->setSlug(strtolower(preg_replace('/[^a-zA-Z0-9]/', '-', $cat->getLibelle())))
                ->setDescription($faker->paragraph(3));
            $manager->persist($cat);
            for ($i = 0; $i < random_int(50, 100); $i++) {
                $titre = $faker->name();

                $livre = new Livres();
                // $dateTime = new \DateTimeImmutable::createFromMutable()
                $livre->setImage($faker->imageUrl(300, 300))
                    ->setTitre($titre)
                    ->setEditeur($faker->name())
                    ->setISBN($faker->isbn13())
                    ->setPrix($faker->numberBetween(100, 1000))
                    ->setEditedAt(\DateTimeImmutable::createFromMutable($faker->dateTime()))
                    ->setSlug(strtolower(preg_replace('/[^a-zA-Z0-9]/', '-', $titre)))
                    ->setResume($faker->paragraph(3))
                    ->setCategorie($cat);
                $manager->persist($livre);
            }
        }



        $manager->flush();
    }
}
