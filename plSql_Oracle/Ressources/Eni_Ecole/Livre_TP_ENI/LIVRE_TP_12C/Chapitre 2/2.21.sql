SELECT genres.libelle, ouvrages.titre
FROM Ouvrages inner join Genres
on genres.code=ouvrages.genre
ORDER BY genres.libelle, ouvrages.titre ;