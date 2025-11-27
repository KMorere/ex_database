SELECT `c_nom`, `c_prenom`, `c_adresse`, `c_tel`, vc_plaque, v_marque, v_type, v_energie
FROM `g_client` 
LEFT JOIN g_voiture_client
	ON g_client.c_id = g_voiture_client.client_id
LEFT JOIN g_voiture
	ON g_voiture.v_id = g_voiture_client.voiture_id
WHERE g_voiture_client.vc_plaque = '251 AB 33';


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


SELECT `f_id`, `f_taux` * o_temps AS total FROM `g_facture`
LEFT JOIN g_ordre ON g_facture.f_fk_o_id = o_id


SELECT *, COUNT(`a_marque`) AS stock FROM `g_article`
GROUP BY `a_type`
HAVING COUNT(a_marque) > 1;

SELECT *, COUNT(`a_type`) AS stock FROM `g_article`
GROUP BY `a_type`
HAVING COUNT(a_type) > 1;

SELECT `a_type`, SUM(`a_quantite`) AS total, COUNT(`a_marque`) AS marques FROM `g_article`
GROUP BY `a_type`
HAVING COUNT(a_type) > 1;

SELECT `a_type`, `a_marque`, `a_quantite`
FROM g_article
UNION ALL
SELECT 'TOTAL', `a_marque`, SUM(`a_quantite`)
FROM g_article;

SELECT `a_type`, SUM(`a_quantite`) AS total, COUNT(`a_marque`) AS marques FROM `g_article`
GROUP BY `a_type`
HAVING COUNT(a_type) > 1
UNION
SELECT 'Total', SUM(`a_quantite`), ''
FROM g_article;


SELECT `o_date`, `o_temps`, `o_fk_c_id`, c_nom, c_prenom, c_tel, a_ref, a_type, COUNT(o_fk_c_id) AS Nombre FROM `g_ordre`
LEFT JOIN g_client ON o_fk_c_id = g_client.c_id
LEFT JOIN g_ordre_article ON g_ordre_article.ordre_id = o_id
LEFT JOIN g_article ON g_article.a_id = g_ordre_article.article_id
GROUP BY o_fk_c_id
HAVING COUNT(o_fk_c_id) > 1;

SELECT GROUP_CONCAT(o_date ORDER BY o_date SEPARATOR '\n') AS Dates, 
c_nom, c_prenom, c_tel, 
GROUP_CONCAT(a_type ORDER BY a_type SEPARATOR '\n') AS Articles, 
COUNT(o_fk_c_id) AS Nombre FROM `g_ordre`
LEFT JOIN g_client ON o_fk_c_id = g_client.c_id
LEFT JOIN g_ordre_article ON g_ordre_article.ordre_id = o_id
LEFT JOIN g_article ON g_article.a_id = g_ordre_article.article_id
GROUP BY `o_fk_c_id`;

SELECT `a_marque`, `a_prix`, CAST(AVG(a_prix) OVER() AS DECIMAL (5, 2)) AS 'moyenne par filtre',
CAST(AVG(a_prix) AS DECIMAL (5, 2)) AS 'moyenne par marque'
FROM `g_article`
GROUP BY a_marque;