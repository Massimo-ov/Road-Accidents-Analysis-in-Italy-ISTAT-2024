/*incidenti per ora*/
SELECT Ora, COUNT(*) AS num_incidenti
FROM incidenti_clean ic 
GROUP BY Ora
ORDER BY Ora;

/*feriti e morti per ora*/
SELECT Ora, SUM(morti_entro_30_giorni) AS tot_morti,
           SUM(feriti) AS tot_feriti
FROM incidenti_clean ic 
GROUP BY Ora
ORDER BY Ora;

/*morti per tipo di strada*/
SELECT tipo_di_strada_txt, SUM(morti_entro_30_giorni) AS morti
FROM incidenti_clean ic 
GROUP BY tipo_di_strada_txt;

SELECT provincia, comune
FROM incidenti_clean ic 
LIMIT 40


/*tasso di mortalità per tipo di strada*/
SELECT 
    tipo_di_strada_txt,
    SUM(morti_entro_30_giorni)*1.0 / COUNT(*) AS tasso_mortalita
FROM incidenti_clean ic 
GROUP BY tipo_di_strada_txt;

/*incidenti per ora e tipo di strada */
SELECT 
    Ora,
    tipo_di_strada_txt,
    COUNT(*) AS incidenti
FROM incidenti_clean ic 
GROUP BY Ora, tipo_di_strada_txt;

/*costruzione della colonne con provincie e regioni*/
CREATE TABLE province_regioni (
    provincia INTEGER,
    regione TEXT
);

INSERT INTO province_regioni (provincia, regione) VALUES

-- PIEMONTE
(1,'Piemonte'),(2,'Piemonte'),(3,'Piemonte'),(4,'Piemonte'),
(5,'Piemonte'),(6,'Piemonte'),(96,'Piemonte'),(103,'Piemonte'),

-- VALLE D'AOSTA
(7,'Valle d''Aosta'),

-- LOMBARDIA
(12,'Lombardia'),(13,'Lombardia'),(14,'Lombardia'),(15,'Lombardia'),
(16,'Lombardia'),(17,'Lombardia'),(18,'Lombardia'),(19,'Lombardia'),
(20,'Lombardia'),(97,'Lombardia'),(98,'Lombardia'),(108,'Lombardia'),

-- TRENTINO-ALTO ADIGE
(21,'Trentino-Alto Adige'),(22,'Trentino-Alto Adige'),

-- VENETO
(23,'Veneto'),(24,'Veneto'),(25,'Veneto'),(26,'Veneto'),
(27,'Veneto'),(28,'Veneto'),(29,'Veneto'),

-- FRIULI-VENEZIA GIULIA
(30,'Friuli-Venezia Giulia'),(31,'Friuli-Venezia Giulia'),
(32,'Friuli-Venezia Giulia'),(93,'Friuli-Venezia Giulia'),

-- LIGURIA
(8,'Liguria'),(9,'Liguria'),(10,'Liguria'),(11,'Liguria'),

-- EMILIA-ROMAGNA
(33,'Emilia-Romagna'),(34,'Emilia-Romagna'),(35,'Emilia-Romagna'),
(36,'Emilia-Romagna'),(37,'Emilia-Romagna'),(38,'Emilia-Romagna'),
(39,'Emilia-Romagna'),(40,'Emilia-Romagna'),(99,'Emilia-Romagna'),

-- TOSCANA
(45,'Toscana'),(46,'Toscana'),(47,'Toscana'),(48,'Toscana'),
(49,'Toscana'),(50,'Toscana'),(51,'Toscana'),(52,'Toscana'),
(53,'Toscana'),(100,'Toscana'),

-- UMBRIA
(54,'Umbria'),(55,'Umbria'),

-- MARCHE
(41,'Marche'),(42,'Marche'),(43,'Marche'),(44,'Marche'),(109,'Marche'),

-- LAZIO
(56,'Lazio'),(57,'Lazio'),(58,'Lazio'),(59,'Lazio'),(60,'Lazio'),

-- ABRUZZO
(66,'Abruzzo'),(67,'Abruzzo'),(68,'Abruzzo'),(69,'Abruzzo'),

-- MOLISE
(70,'Molise'),(94,'Molise'),

-- CAMPANIA
(61,'Campania'),(62,'Campania'),(63,'Campania'),
(64,'Campania'),(65,'Campania'),

-- PUGLIA
(71,'Puglia'),(72,'Puglia'),(73,'Puglia'),
(74,'Puglia'),(75,'Puglia'),(110,'Puglia'),

-- BASILICATA
(76,'Basilicata'),(77,'Basilicata'),

-- CALABRIA
(78,'Calabria'),(79,'Calabria'),(80,'Calabria'),
(101,'Calabria'),(102,'Calabria'),

-- SICILIA
(81,'Sicilia'),(82,'Sicilia'),(83,'Sicilia'),
(84,'Sicilia'),(85,'Sicilia'),(86,'Sicilia'),
(87,'Sicilia'),(88,'Sicilia'),(89,'Sicilia'),

-- SARDEGNA
(90,'Sardegna'),(91,'Sardegna'),(92,'Sardegna'),(95,'Sardegna'),
(104,'Sardegna'),(105,'Sardegna'),(106,'Sardegna'),
(107,'Sardegna'),(111,'Sardegna');

SELECT 
    p.regione,
    COUNT(*) AS num_incidenti,
    SUM(i.morti_entro_30_giorni) AS tot_morti,
    SUM(i.feriti) AS tot_feriti,
    ROUND(
        SUM(i.morti_entro_30_giorni) * 1.0 / COUNT(*) * 100,
        2
    ) AS tasso_mortalita_percentuale
FROM incidenti_clean i
LEFT JOIN province_regioni p
ON i.provincia = p.provincia
GROUP BY p.regione
ORDER BY tasso_mortalita_percentuale DESC;



CREATE TABLE province (
    provincia INTEGER,
    nome_provincia TEXT
);

INSERT INTO province (provincia, nome_provincia) VALUES

(56,'Viterbo'),(57,'Rieti'),(58,'Roma'),(59,'Latina'),(60,'Frosinone'),
(41,'Pesaro e Urbino'),(42,'Ancona'),(43,'Macerata'),(44,'Ascoli Piceno'),(109,'Fermo'),
(70,'Campobasso'),(94,'Isernia'),
(71,'Foggia'),(72,'Bari'),(73,'Taranto'),(74,'Brindisi'),(75,'Lecce'),(110,'Barletta-Andria-Trani'),
(54,'Perugia'),(55,'Terni'),
(23,'Verona'),(24,'Vicenza'),(25,'Belluno'),(26,'Treviso'),(27,'Venezia'),(28,'Padova'),(29,'Rovigo'),
(66,'L''Aquila'),(67,'Teramo'),(68,'Pescara'),(69,'Chieti'),
(8,'Imperia'),(9,'Savona'),(10,'Genova'),(11,'La Spezia'),
(81,'Trapani'),(82,'Palermo'),(83,'Messina'),(84,'Agrigento'),(85,'Caltanissetta'),
(86,'Enna'),(87,'Catania'),(88,'Ragusa'),(89,'Siracusa'),
(45,'Massa-Carrara'),(46,'Lucca'),(47,'Pistoia'),(48,'Firenze'),(49,'Livorno'),
(50,'Pisa'),(51,'Arezzo'),(52,'Siena'),(53,'Grosseto'),(100,'Prato'),
(78,'Cosenza'),(79,'Catanzaro'),(80,'Reggio Calabria'),(101,'Crotone'),(102,'Vibo Valentia'),
(61,'Caserta'),(62,'Benevento'),(63,'Napoli'),(64,'Avellino'),(65,'Salerno'),
(1,'Torino'),(2,'Vercelli'),(3,'Novara'),(4,'Cuneo'),(5,'Asti'),(6,'Alessandria'),
(96,'Biella'),(103,'Verbano-Cusio-Ossola'),
(90,'Sassari'),(91,'Nuoro'),(92,'Cagliari'),(95,'Oristano'),
(104,'Olbia-Tempio'),(105,'Ogliastra'),(106,'Medio Campidano'),
(107,'Carbonia-Iglesias'),(111,'Sud Sardegna'),
(12,'Varese'),(13,'Como'),(14,'Sondrio'),(15,'Milano'),(16,'Bergamo'),
(17,'Brescia'),(18,'Pavia'),(19,'Cremona'),(20,'Mantova'),
(97,'Lecco'),(98,'Lodi'),(108,'Monza e della Brianza'),
(76,'Potenza'),(77,'Matera'),
(33,'Piacenza'),(34,'Parma'),(35,'Reggio nell''Emilia'),
(36,'Modena'),(37,'Bologna'),(38,'Ferrara'),
(39,'Ravenna'),(40,'Forli-Cesena'),(99,'Rimini'),
(30,'Udine'),(31,'Gorizia'),(32,'Trieste'),(93,'Pordenone'),
(21,'Bolzano/Bozen'),(22,'Trento'),
(7,'Valle d''Aosta');

SELECT 
    p.nome_provincia,
    COUNT(*) AS num_incidenti,
    SUM(i.morti_entro_30_giorni) AS tot_morti,
    SUM(i.feriti) AS tot_feriti,

    ROUND(
        SUM(i.morti_entro_30_giorni) * 1.0 / COUNT(*) * 100,
        2
    ) AS tasso_mortalita_percentuale

FROM incidenti_clean i
LEFT JOIN province p
ON i.provincia = p.provincia

GROUP BY p.nome_provincia
ORDER BY tasso_mortalita_percentuale DESC;
