CREATE TABLE table_name (
	table_id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (table_id)
) ENGINE = InnoDB;


SELECT `c_nom`, `c_prenom`, `c_adresse`, `c_tel` FROM `g_client` 
JOIN g_voiture_client
ON g_client.c_id = g_voiture_client.voiture_id 
WHERE g_voiture_client.vc_plaque = '64';


INSERT INTO g_voiture_client (voiture_id, client_id, vc_plaque)
VALUES (16, 1, 'AB12CDE');


ALTER TABLE g_voiture_client
	ADD KEY `voiture_id` (`voiture_id`);


SELECT `c_nom`, `c_prenom`, `c_adresse`, `c_tel`, vc_plaque, v_marque, v_type, v_energie
FROM `g_client` 
LEFT JOIN g_voiture_client
	ON g_client.c_id = g_voiture_client.client_id
LEFT JOIN g_voiture
	ON g_voiture.v_id = g_voiture_client.voiture_id
WHERE g_voiture_client.vc_plaque = 'AB12CDE';


CREATE TABLE g_article_voiture (
  voiture_id INT NOT NULL,
  article_id INT NOT NULL,
  PRIMARY KEY (voiture_id, article_id),
  KEY voiture_id (voiture_id),
  KEY article_id (article_id),
  CONSTRAINT voiture_id FOREIGN KEY (voiture_id) REFERENCES g_voiture (v_id),
  CONSTRAINT article_id FOREIGN KEY (article_id) REFERENCES g_article (a_id)
) ENGINE = InnoDB;


SELECT * FROM `g_voiture`
JOIN g_article_voiture
	ON g_voiture.v_id = g_article_voiture.voiture_id;


SELECT `o_id`, `o_date`, `o_temps`, g_article.a_ref
FROM g_ordre 
LEFT JOIN g_client
 ON g_client.c_id = `o_fk_c_id`
LEFT JOIN g_voiture_client
 ON g_voiture_client.client_id = g_client.c_id
LEFT JOIN g_voiture
 ON g_voiture_client.voiture_id = g_voiture.v_id
LEFT JOIN g_article_voiture
 ON g_article_voiture.voiture_id = g_voiture.v_id
LEFT JOIN g_article
 ON g_article_voiture.article_id = g_article.a_id
WHERE g_article.a_ref = '7CK215G';


UPDATE g_facture
INNER JOIN g_ordre ON g_facture.f_fk_o_id = g_ordre.o_id
SET f_total = o_temps * f_total;
INNER JOIN (
    SELECT f_taux, o_temps * f_total AS total
    FROM g_facture
    ) AS fact ON g_facture.f_fk_o_id = g_ordre.o_id
SET f_total = fact.total;

SELECT `f_id`, `f_taux` * o_temps AS total, `f_total` FROM `g_facture`
LEFT JOIN g_ordre ON g_facture.f_fk_o_id = o_id

UPDATE g_facture
LEFT JOIN g_ordre ON o_id = f_fk_o_id
SET f_total = o_temps * f_taux


UPDATE g_article INNER JOIN g_ordre_article 
SET g_article.a_quantite = g_article.a_quantite - g_ordre_article.a_quantite 
WHERE a_id = g_ordre_article.article_id;

SELECT c_nom, c_prenom, c_tel, 
GROUP_CONCAT(o_date ORDER BY o_date SEPARATOR '\n') AS Dates,
GROUP_CONCAT(a_type ORDER BY a_type SEPARATOR '\n') AS Articles, 
COUNT(o_fk_c_id) AS Nombre FROM `g_ordre`
LEFT JOIN g_client ON o_fk_c_id = g_client.c_id
LEFT JOIN g_ordre_article ON g_ordre_article.ordre_id = o_id
LEFT JOIN g_article ON g_article.a_id = g_ordre_article.article_id
GROUP BY `o_fk_c_id`;

SELECT `a_type`, SUM(`a_quantite`) AS total, COUNT(`a_marque`) AS marques FROM `g_article` 
GROUP BY `a_type` HAVING COUNT(a_type) > 1 
UNION SELECT 'Total', SUM(`a_quantite`), '' FROM g_article;