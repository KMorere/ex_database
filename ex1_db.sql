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