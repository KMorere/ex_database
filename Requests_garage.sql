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