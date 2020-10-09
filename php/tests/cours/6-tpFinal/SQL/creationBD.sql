CREATE TABLE Restaurants (
    idRestaurant INTEGER NOT NULL AUTO_INCREMENT,
    nom          VARCHAR(50) NOT NULL,
    adresse      VARCHAR(200),
    cp           NUMERIC (5),
    ville        VARCHAR(50) NOT NULL,
    telephone    NUMERIC(10),
    description  VARCHAR(2200),
	CONSTRAINT pkRestaurants PRIMARY KEY(idRestaurant)
);

CREATE TABLE Avis (
    idRestaurant            INTEGER NOT NULL,
    idAvis                  INTEGER NOT NULL,
    auteur                  VARCHAR(50),
    note                    INTEGER NOT NULL,
    commentaire             VARCHAR(500),
	CONSTRAINT pkAvis PRIMARY KEY(idRestaurant, idAvis),
	CONSTRAINT fkAvisRestaurant FOREIGN KEY(idRestaurant)  REFERENCES Restaurant(idRestaurant)
 );

INSERT INTO Restaurants(nom, adresse, cp, ville, telephone, description) VALUES('Le Globe', '9 Boulevard Amiral de Kerguélen', '29500', 'Quimper', '0298950910', '<p>Faites votre tour du monde culinaire !</p><p>C''est vos papilles que vous emmènerez en voyage au restaurant Le Globe ! Faites les patienter avec des cocktails originaux hauts en couleurs et des petits toasts de Tapenade que Laurent, le directeur du restaurant le Globe vous fera un plaisir de vous apporter. Côté cuisine, évadez vous avec le chef du restaurant Le Globe Marc et une cuisine « À sa façon », suivez le guide ! Il vous emmène au Japon, en Thaïlande, en Grèce, aux Antilles et au Moyen Orient !</p><p>En entrée, le restaurant Le Globe vous propose de déguster le Croustillant au tartare de boeuf Thaï, mousse de gingembre et soja ou le Foie Gras Maison et son chutney de Pommes et mangues épicées... Pour un dépaysement total côté plat, goûtez le Wok de Poulet Thaï, la Poêlée de Gambas à l''Orientale, vierge de tomate cerise, à la Marjolaine ou l''Emincé de Poulet à la Mexicaine, Guacamole et Yaourt épicée. En dessert, dégustez le Moelleux aux agrumes, coeur de fruits frais et coulis framboise, le Sablé citron vert aux fraises et bâtonnets meringués ou le Fondant chocolat avec son coeur coulant au caramel.</p><p>Au restaurant Le Globe, vous pourrez vous retrouvez entre amis pour déguster cette cuisine du monde. Vous ne serez pas déçu du voyage !</p>');
INSERT INTO Restaurants(nom, adresse, cp, ville, telephone, description) VALUES('Le Clémenceau', '40 rue George Clémenceau', '85000', 'La Roche-sur-Yon', '0251371020', '<p>Face au grand parking de la Place de la Vendée, ouvert de 9h à minuit chaque jour de la semaine, le Clemenceau vous propose un service en continu. Dès l''ouverture, venez prendre votre petit-déjeuner ; vous pourrez ensuite déguster à toute heure de la journée des plats « maison », élaborés à partir de produits locaux frais traduisant tout le savoir-faire de nos cuisiniers.</p><p>Lieu de pause incontournable depuis plus de trente ans, Le Clemenceau vous offre de multiples choix de détente au sein de ses différents espaces entièrement rénovés, chaleureux, où nos équipes mettent tout en oeuvre pour que vous passiez un moment privilégié. Venez découvrir la brasserie à la parisienne, assurant convivialité et rapidité, les salons privatifs à l''étage, pour le plaisir ou le travail dans un cadre plus feutré, la véranda orientée plein sud et climatisée, plus moderne et, quand il fait beau, profitez de notre magnifique terrasse extérieure.');

INSERT INTO Avis(idRestaurant, idAvis, note, auteur, commentaire) VALUES(1, 1, 5, 'Adeline', 'Que du positif. Un service impeccable. Un menu à 20€50 avec du choix et surtout du goût. Nous le recommandons sans hésiter et ne tarderont pas à revenir pour goûter les autres plats qui ont l''air tout aussi bon !');
INSERT INTO Avis(idRestaurant, idAvis, note, commentaire) VALUES(1, 2, 4, 'Nous y sommes aller pour y passer une soirée en amoureux. Le service était super. Bon rapport qualité/prix. Cuisine très originale vraiment très bon de l''entrée au dessert. Un peu trop de gingembre pour le wok au poulet mais sinon tout était parfait! Nous avons passer une super soirée. Bonne ambiance, déco sympa! Je recommande vivement!');
INSERT INTO Avis(idRestaurant, idAvis, note, commentaire) VALUES(2, 1, 4, 'Nous connaissions l''ancien restaurant et le nouveau avec une deco au goût du jour, une cuisine raffinée mais accessible à des palais différents, on a apprécié');
