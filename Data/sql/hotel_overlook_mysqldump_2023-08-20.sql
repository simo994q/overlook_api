# ************************************************************
# Sequel Ace SQL dump
# Version 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.26)
# Database: hotel_overlook
# Generation Time: 2023-08-20 19:28:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `country_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;

INSERT INTO `cities` (`id`, `slug`, `name`, `description`, `country_id`, `image_id`, `created_at`, `updated_at`)
VALUES
	(1,'goteborg','Göteborg','Gøteborg er Sveriges andenstørste by og har en smuk beliggenhed på vestkysten med en betagende skærgård lige rundt om hjørnet. Byen tilbyder et bredt udvalg af seværdigheder. Du kan besøge forlystelsesparken Liseberg både sommer og vinter, og byens beliggenhed ved kysten tilbyder masser af vandaktiviteter.',2,7,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(2,'stockholm','Stockholm','Stockholm er unik. Byen består af 14 øer, som er forbundet af 57 broer. Den er omgivet af en af de smukkeste skærgårde i verden. Du kan slentre rundt i Gamla Stans middelalderlige gyder blot få skridt fra moderne arkitektur. Det får hovedstaden til at føles som en lille by og en stor metropol på én gang.',2,8,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(4,'jonkoping','Jönköping','Jönköping har en smuk beliggenhed ved Vättern. Der er mange aktiviteter, som du kan nyde i området, f.eks. et besøg til Gränna, en idyllisk lille landsby, hvor du kan se, hvordan det berømte røde og hvide slik \'Polkagrisar\' laves. Egnen byder også på gode vandremuligheder. Bo på et af vores to hoteller i Jönköping - Overlook Portalen i byens midte tæt på restauranter og butikker, eller Scandic Elmia ved siden af Elmia Udstillingscenter, 5 km fra byens centrum.',2,10,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(5,'helsinki','Helsinki','Helsinki er den største by i Finland og landets hovedstad. Byen er en perfekt blanding af øst og vest og har så meget at byde på: kulturelle begivenheder, design, restauranter med Michelin-stjerner, fæstningen Suomenlinna, der er del af UNESCOs verdensarvsliste, og meget, meget mere.',3,9,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(7,'rauma','Rauma','Havnebyen Raumas historie går langt tilbage, og den har en stærk lokal kultur og mange interessante seværdigheder. Overlook Rauma er et perfekt valg, hvis du vil udforske denne vidunderlige, unikke by!',3,11,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(8,'kobenhavn','København','København er byen, du skal besøge! Den smukke hovedstad er kåret til Best in Travel 2019 af rejseguiden Lonely Planet. Dermed indtager København en flot førsteplads på listen over storbyer, du må opleve i 2019. Når du bor på et Overlook hotel i København, har du det bedste udgangspunkt for at udforske byen. Vi har 11 hoteller at vælge imellem.',1,12,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(11,'aalborg','Aalborg','Vidste du, at Aalborg ligger på en flot 8. plads på The New York Times\' liste over \"places to go\" i 2019? Byen byder på en arkitektonisk imponerende havnefront, flere inspirerende museer, hyggelige restauranter langs strandpromenaden med udsigt over Limfjorden - og naturligvis et livligt miljø omkring Jomfru Ane Gade. Rejser du med børn, anbefaler vi et vildt besøg i Aalborg Zoo eller Jumboland. Vores ene hotel i byen ligger i centrum af byen, mens vores andet hotel ligger blot 10 minutter fra centrum og kun 500 m fra Gigantium.',1,13,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(13,'silkeborg','Silkeborg','Velkommen til rå natur - uanset hvor du retter blikket hen og rækker armene ud. Her er der ingen grænser. Udover dem du sætter for dig selv. Velkommen til \"Silkeborg Søhøjlandet - Danmarks Outdoor Hovedstad\". Bo på hotel i Silkeborg. Herfra kan du hoppe på hjuldamperen Hjejlen eller i din egen kano og udforske de skønne Silkeborgsøer, bestige Himmelbjerget og lade dig forblænde af udsigten - og måske derefter af de farverige malerier på Museum Jorn. På vores hotel i Silkeborg får du det perfekte udgangspunkt for at opleve alt det bedste inden for både kultur og natur i området.',1,14,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(14,'aarhus','Aarhus','Går turen til Danmarks andenstørste by og har du brug for hotel i Aarhus, tilbyder vi tre hoteller i byen. Hvad enten du er på udkig efter et centralt hotel i Aarhus eller et hotel lidt udenfor byen, har vi et, der passer til dig. Aarhus er bl.a. kendt for ARoS Kunstmuseum, det charmerende Latinerkvarter og Den Gamle By. Scandic Aarhus City og Scandic The Mayor ligger i hjertet af byen, og vores tredje hotel i Aarhus, Scandic Aarhus Vest ligger udenfor centrum og tilbyder fri parkering.',1,15,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(15,'lillehammer','Lillehammer','Lillehammer ligger i kommunen Oppland, 180 km nord for Oslo og ca. 100 km fra den svenske grænse. Byen blev berømt, da den afholdte vinter-OL i 1994. Her er fremragende skiforhold, og selv ikke-skiløbere kan opleve spændingen ved skibakkerne ved at tage liften til toppen af Lysgårdsbakken olympiske skihoparena. Udforsk Maihaugen frihedsmuseets fantastiske samlinger og strukturer, eller tag på vandretur langs Fåbergs kulturrute. Gå ikke glip af Lillehammer Kunstmuseum, som anses for at være et af de førende kunstmuseer i verden.',4,16,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(16,'oslo','Oslo','Hovedstaden har masser at byde på! Kultur, historie, natur, shopping og natteliv – uanset på hvilken årstid du besøger byen, har du en lang række muligheder lige uden for døren. Takket være vores store udvalg af hoteller i centrum af Oslo og de omkringliggende områder kan du finde et, som passer til dit ophold, uanset om du rejser med en gruppe venner, din partner eller familien. Hotellet er også perfekt til konferencer.',4,17,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(18,'tromso','Tromsø','Den arktiske hovedstad, Tromsø, er omgivet af et smukt landskab med fjelde, fjorde og øer, og det er let at komme til byen med bil, så du kan udforske naturen i dit eget tempo. Gå ikke glip af det pulserende natteliv i Tromsø og byens store udvalg af restauranter!',4,18,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(19,'berlin','Berlin','Tysklands hovedstad, Berlin, er altid et besøg værd og er velegnet til både personer, der rejser alene, par og familier. Foruden berømte seværdigheder som Brandenburger Tor eller resterne af Berlinmuren byder Berlin også på familiesjov med attraktioner som fx AquaDom og Sea Life Center. Scandic tilbyder to hoteller i Berlin, der begge ligger i centrum af byen.',5,19,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(20,'hamborg','Hamborg','I hansestaden Hamborg i det nordlige Tyskland sejler skibe fra hele verden til og fra Europas andenstørste havn. Hamborg handler om musicals, farverige kabareter, skjulte natklubber og livet på havnen. Sørg for at besøge det gamle havnekvarter og havnepromenaden. Om natten byder den legendariske Reeperbahn på et udvalg af barer. Vores hotel Scandic Hamburg Emporio ligger i hjertet af byen tæt på shoppingmuligheder og seværdigheder.',5,20,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(21,'frankfurt','Frankfurt','Frankfurt am Main er en af de vigtigste metropoler i Europa. Byen er ikke kun geografisk midtpunkt i Tyskland og Europa, den slog sig for mange år siden også fast som finansielt centrum og, takket være Frankfurt lufthavn, som en perfekt lufthavnsplacering. Disse to faktorer betyder, at byen ikke kun besøges af mange forretningsrejsende men også rejsende på mini- og storbyferie.',5,1,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(22,'gdansk','Gdansk','Mange mener, at den gamle hanseatiske by Gdansk er Polens smukkeste by. Vores hotel i Gdansk, Scandic Gdansk, ligger centralt og tæt på den smukke gamle bydel med dens mange caféer, restauranter, barer og forretninger. Vores hotel i Gdansk er også et oplagt udgangspunk, hvis du vil at aflægge Royal Way, Dlugi Targ eller Skt. Marys Kirke et besøg.',6,2,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(23,'wroclaw','Wroclaw','Wroclaw har hurtigt udviklet sig til et hotspot blandt turister, der rejser rundt i Europa. Faktisk er byen blevet så populær, at den er blevet kåret til \"European Best Destination\" i 2018. Og det er nemt at se hvorfor. Som en af Polens livligste byer er \"Polens Venedig\" en charmerende labyrint af øer og broer med en rig historie. Du bor komfortabelt på vores populære Scandic hotel i Wroclaw, tæt på den historiske, gamle bydel.',6,21,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(24,'reykjavik','Reykjavik','Reykjavík er en by med iøjefaldende kontraster. Byen har små huse beklædt med bølgeblik ved siden af futuristiske glasbygninger, førsteklasses faciliteter minutter væk fra barsk, vulkansk terræn og international indflydelse blandet med nationale traditioner. Det skaber tilsammen en unik kultur, hvor det traditionelle omfavner det nye.\n\nMed en befolkning på over 122.000 (2016) er Reykjavík ikke en klassisk storby af størrelse. Byen har få skyskrabere, sjældent trafikkaos og der er velkendte ansigter på gaden. Lad dig dog ikke narre af størrelsen, for Reykjavík har en pulserende åre af sprudlende kreativitet og energi, som holder byen i live med spændende begivenheder og interessante tiltag.',7,50,'2023-08-11 13:24:04','2023-08-11 13:24:04'),
	(29,'keflavik','Keflavik','Ikke langt fra Reykjavik ligger Den Blå Lagune, der efterhånden er blevet Islands varemærke. Det er en oplevelse, du bestemt ikke må snyde dig selv for, når du rejser til Island. Her kan du svømme rundt i det dejlig varmt og mineralholdigt vand ude i det fri. Herefter har du mulighed for en afslappende massage og for at fuldende besøget, kan du slutte af med et godt måltid på restauranten. Den Blå Lagune ligger mellem Reykjavik og byens internationale lufthavn, Keflavik. Det kan derfor anbefales at besøge lagunen på vej til eller fra lufthavnen med bus, eller hvis du har lejet en bil.',7,52,'2023-08-11 13:24:04','2023-08-11 13:24:04');

/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `TEST` BEFORE INSERT ON `cities` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `slug`, `name`, `description`, `image_id`, `created_at`, `updated_at`)
VALUES
	(1,'danmark','Danmark','Tag på ferie i Danmark og oplev det brede udvalg af attraktioner – fra verdensberømt design og arkitektur, restauranter i verdensklasse og fascinerende nationalhistorie til den rige og varierede natur og populære oplevelser i Danmark for hele familien. Alting er inden for rækkevidde, og afstandene er overkommelige. Hvis du planlægger din næste ferie i Danmark, så husk, at Overlook har 26 hoteller over hele landet at vælge imellem. Står du overfor at skulle arrangere et møde eller en konference, har Scandic med sine 26 hoteller i Danmark helt sikkert faciliteterne, der passer til dine krav og behov.',3,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(2,'sverige','Sverige','Udforsk Sveriges fantastiske natur, besøg historiske steder overalt i landet eller nyd den verdensberømte skærgård. Det svenske landskab veksler meget, afhængigt af hvilken del af Sverige du besøger - bjerge, endeløse skove, utallige søer og floder mod nord og blomstrende marker mod syd. I Sverige kan du både opleve sne om vinteren og masser af sol om sommeren. Glem ikke et besøg i Den Gamle By og det splinternye \"Abba The Museum\" i Stockholm. Bo på et af Overlooks 83 hoteller i Sverige.',4,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(3,'finland','Finland','Finland bliver i øjeblikket anset som en af de mest interessante rejsedestinationer. Det rå og uberørte landskab er unikt, og lyden af stilhed er landets bedst bevarede hemmelighed. Landets vidundere i naturen inkluderer nordlyset, midnatssolen og selvfølgelig det næsten uendelige antal søer. De fire årstider byder på mange forskellige aktiviteter.  I Finland tilbyder vi hoteller på 30 destinationer.',5,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(4,'norge','Norge','Fra Kristiansand mod syd til Nordkap mod nord byder Norge på et enestående udvalg af destinationer. Du kan opleve midnatssolen og nordlyset, smukke fjorde og imponerende natur samt pulserende byliv, gourmetrestauranter og festivaler! Bo på et af vores cirka 90 hoteller i Norge, og nyd vores prisvindende morgenmad.',6,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(5,'tyskland','Tyskland','Kultur, shopping og natteliv. Tyske byer har det hele! Topattraktioner i Berlin er Brandenburger Tor, Berliner Fernsehturm og Potsdamer Platz-distriktet. Vores to hoteller i Berlin ligger centralt og tæt på alle oplevelserne. Hamborg er Tysklands næststørste by, og den imødekommer især musicalfans. Metropolen Frankfurt byder på museer i stor stil samt hygge og afslapning langs Main-flodens bredder. På både hotellerne i Berlin, Hamborg og Frankfurt vil du nyde komfort, bekvemmelighed og moderne indretning.',1,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(6,'polen','Polen','Polens historiske byer er altid et besøg værd. Landets ældste by, Gdansk, og den smukke Wroclaw er ideelle destinationer til en storbyferie i Polen.',2,'2023-08-11 13:21:46','2023-08-11 13:21:46'),
	(7,'island','Island','Midt i det nordlige Atlanterhav finder du et moderne samfund bygget på traditioner og fortællinger helt tilbage fra vikingetiden. Den magiske natur byder på vulkaner, gejsere, gletsjere, fjorde og vandfald. Og i farvandet omkring øen finder du sæler, delfiner, spækhuggere og pukkelhvaler. Du finder også et rigt kulturliv med masser af festivaler, som foregår hele året rundt. ',49,'2023-08-11 13:21:46','2023-08-11 13:21:46');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `INSERT TIME` BEFORE INSERT ON `countries` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'Webudvikler','Gruppe for webudviklere. Du kan oprette dine egne brugergrupper og tilmelde brugere til disse grupper.',1,'2023-08-01 00:00:00','2023-08-01 00:00:00');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hotel_facilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotel_facilities`;

CREATE TABLE `hotel_facilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `hotel_facilities` WRITE;
/*!40000 ALTER TABLE `hotel_facilities` DISABLE KEYS */;

INSERT INTO `hotel_facilities` (`id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,'Check ind: 15:00','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(2,'Check ud: 12:00','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(3,'Fitnessrum','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(4,'Sauna','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(5,'Restaurant','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(6,'Cocktail Bar','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(7,'Udendørs terrasse','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(8,'Garage','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(9,'Møde- og konferencelokaler','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(10,'Ismaskine','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(11,'Parkering','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(12,'Roomservice','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(13,'Cykler til låns','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(14,'Fri WiFi','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(15,'Vaskeritjeneste','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(16,'Kæledyr tilladt ','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(17,'Café','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(18,'Morgenbuffet','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(19,'Døgnåben shop','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(20,'24-timers sikkerhed','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(21,'Lifestyle Concierge','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(22,'Wellness center','2023-08-11 13:26:01','2023-08-11 13:26:01'),
	(23,'SPA','2023-08-11 13:26:01','2023-08-11 13:26:01');

/*!40000 ALTER TABLE `hotel_facilities` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `SQL FACI TEST` BEFORE INSERT ON `hotel_facilities` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table hotel_facility_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotel_facility_rel`;

CREATE TABLE `hotel_facility_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `hotel_facility_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `hotel_facility_id` (`hotel_facility_id`),
  CONSTRAINT `hotel_facility_rel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_facility_rel_ibfk_2` FOREIGN KEY (`hotel_facility_id`) REFERENCES `hotel_facilities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `hotel_facility_rel` WRITE;
/*!40000 ALTER TABLE `hotel_facility_rel` DISABLE KEYS */;

INSERT INTO `hotel_facility_rel` (`id`, `hotel_id`, `hotel_facility_id`)
VALUES
	(1,1,1),
	(2,3,1),
	(3,4,1),
	(4,7,1),
	(5,10,1),
	(6,11,1),
	(7,12,1),
	(8,15,1),
	(9,16,1),
	(10,17,1),
	(11,18,1),
	(12,19,1),
	(13,20,1),
	(14,21,1),
	(15,24,1),
	(16,25,1),
	(17,27,1),
	(18,28,1),
	(19,30,1),
	(20,31,1),
	(21,1,2),
	(22,4,2),
	(23,5,2),
	(24,6,2),
	(25,7,2),
	(26,8,2),
	(27,9,2),
	(28,10,2),
	(29,11,2),
	(30,12,2),
	(31,13,2),
	(32,14,2),
	(33,15,2),
	(34,16,2),
	(35,17,2),
	(36,18,2),
	(37,19,2),
	(38,21,2),
	(39,22,2),
	(40,23,2),
	(41,24,2),
	(42,25,2),
	(43,26,2),
	(44,30,2),
	(45,31,2),
	(46,5,3),
	(47,6,3),
	(48,7,3),
	(49,8,3),
	(50,9,3),
	(51,10,3),
	(52,11,3),
	(53,12,3),
	(54,13,3),
	(55,14,3),
	(56,15,3),
	(57,17,3),
	(58,19,3),
	(59,20,3),
	(60,22,3),
	(61,23,3),
	(62,24,3),
	(63,26,3),
	(64,27,3),
	(65,28,3),
	(66,30,3),
	(67,31,3),
	(68,1,4),
	(69,3,4),
	(70,4,4),
	(71,5,4),
	(72,7,4),
	(73,9,4),
	(74,11,4),
	(75,12,4),
	(76,13,4),
	(77,14,4),
	(78,15,4),
	(79,16,4),
	(80,17,4),
	(81,18,4),
	(82,25,4),
	(83,27,4),
	(84,28,4),
	(85,30,4),
	(86,31,4),
	(87,1,5),
	(88,3,5),
	(89,4,5),
	(90,6,5),
	(91,8,5),
	(92,11,5),
	(93,12,5),
	(94,13,5),
	(95,14,5),
	(96,15,5),
	(97,17,5),
	(98,18,5),
	(99,19,5),
	(100,21,5),
	(101,23,5),
	(102,24,5),
	(103,25,5),
	(104,27,5),
	(105,28,5),
	(106,30,5),
	(107,31,5),
	(108,1,6),
	(109,5,6),
	(110,6,6),
	(111,7,6),
	(112,8,6),
	(113,9,6),
	(114,10,6),
	(115,11,6),
	(116,12,6),
	(117,13,6),
	(118,14,6),
	(119,17,6),
	(120,18,6),
	(121,19,6),
	(122,20,6),
	(123,21,6),
	(124,22,6),
	(125,23,6),
	(126,24,6),
	(127,26,6),
	(128,27,6),
	(129,28,6),
	(130,31,6),
	(131,3,7),
	(132,6,7),
	(133,7,7),
	(134,8,7),
	(135,9,7),
	(136,11,7),
	(137,12,7),
	(138,14,7),
	(139,16,7),
	(140,18,7),
	(141,21,7),
	(142,24,7),
	(143,25,7),
	(144,26,7),
	(145,31,7),
	(146,1,8),
	(147,3,8),
	(148,4,8),
	(149,5,8),
	(150,6,8),
	(151,7,8),
	(152,8,8),
	(153,9,8),
	(154,10,8),
	(155,11,8),
	(156,12,8),
	(157,13,8),
	(158,14,8),
	(159,15,8),
	(160,16,8),
	(161,19,8),
	(162,21,8),
	(163,22,8),
	(164,23,8),
	(165,24,8),
	(166,25,8),
	(167,26,8),
	(168,27,8),
	(169,28,8),
	(170,1,9),
	(171,5,9),
	(172,7,9),
	(173,8,9),
	(174,9,9),
	(175,10,9),
	(176,11,9),
	(177,13,9),
	(178,14,9),
	(179,16,9),
	(180,17,9),
	(181,18,9),
	(182,19,9),
	(183,21,9),
	(184,22,9),
	(185,23,9),
	(186,25,9),
	(187,26,9),
	(188,28,9),
	(189,30,9),
	(190,3,10),
	(191,4,10),
	(192,5,10),
	(193,6,10),
	(194,8,10),
	(195,9,10),
	(196,10,10),
	(197,11,10),
	(198,12,10),
	(199,13,10),
	(200,14,10),
	(201,15,10),
	(202,16,10),
	(203,17,10),
	(204,18,10),
	(205,19,10),
	(206,22,10),
	(207,23,10),
	(208,24,10),
	(209,25,10),
	(210,27,10),
	(211,28,10),
	(212,30,10),
	(213,31,10),
	(214,1,11),
	(215,3,11),
	(216,4,11),
	(217,5,11),
	(218,6,11),
	(219,7,11),
	(220,8,11),
	(221,9,11),
	(222,10,11),
	(223,13,11),
	(224,14,11),
	(225,15,11),
	(226,16,11),
	(227,18,11),
	(228,19,11),
	(229,20,11),
	(230,21,11),
	(231,22,11),
	(232,23,11),
	(233,24,11),
	(234,25,11),
	(235,26,11),
	(236,27,11),
	(237,30,11),
	(238,31,11),
	(239,3,12),
	(240,4,12),
	(241,5,12),
	(242,7,12),
	(243,8,12),
	(244,9,12),
	(245,11,12),
	(246,14,12),
	(247,17,12),
	(248,18,12),
	(249,19,12),
	(250,20,12),
	(251,21,12),
	(252,22,12),
	(253,23,12),
	(254,24,12),
	(255,25,12),
	(256,26,12),
	(257,27,12),
	(258,28,12),
	(259,30,12),
	(260,31,12),
	(261,1,13),
	(262,3,13),
	(263,6,13),
	(264,7,13),
	(265,8,13),
	(266,9,13),
	(267,10,13),
	(268,11,13),
	(269,12,13),
	(270,13,13),
	(271,17,13),
	(272,18,13),
	(273,19,13),
	(274,20,13),
	(275,21,13),
	(276,22,13),
	(277,23,13),
	(278,24,13),
	(279,25,13),
	(280,26,13),
	(281,27,13),
	(282,28,13),
	(283,1,14),
	(284,3,14),
	(285,4,14),
	(286,6,14),
	(287,8,14),
	(288,9,14),
	(289,11,14),
	(290,12,14),
	(291,14,14),
	(292,15,14),
	(293,16,14),
	(294,17,14),
	(295,18,14),
	(296,19,14),
	(297,20,14),
	(298,21,14),
	(299,24,14),
	(300,25,14),
	(301,26,14),
	(302,27,14),
	(303,28,14),
	(304,30,14),
	(305,31,14),
	(306,1,15),
	(307,3,15),
	(308,4,15),
	(309,5,15),
	(310,6,15),
	(311,7,15),
	(312,8,15),
	(313,10,15),
	(314,11,15),
	(315,12,15),
	(316,14,15),
	(317,15,15),
	(318,16,15),
	(319,17,15),
	(320,19,15),
	(321,21,15),
	(322,22,15),
	(323,23,15),
	(324,25,15),
	(325,26,15),
	(326,27,15),
	(327,30,15),
	(328,1,16),
	(329,3,16),
	(330,4,16),
	(331,5,16),
	(332,6,16),
	(333,7,16),
	(334,8,16),
	(335,9,16),
	(336,10,16),
	(337,11,16),
	(338,12,16),
	(339,13,16),
	(340,14,16),
	(341,15,16),
	(342,16,16),
	(343,17,16),
	(344,21,16),
	(345,23,16),
	(346,25,16),
	(347,26,16),
	(348,1,17),
	(349,4,17),
	(350,5,17),
	(351,7,17),
	(352,8,17),
	(353,9,17),
	(354,11,17),
	(355,12,17),
	(356,13,17),
	(357,16,17),
	(358,18,17),
	(359,19,17),
	(360,20,17),
	(361,21,17),
	(362,22,17),
	(363,23,17),
	(364,24,17),
	(365,26,17),
	(366,27,17),
	(367,28,17),
	(368,30,17),
	(369,1,18),
	(370,3,18),
	(371,4,18),
	(372,5,18),
	(373,6,18),
	(374,7,18),
	(375,8,18),
	(376,12,18),
	(377,13,18),
	(378,14,18),
	(379,15,18),
	(380,18,18),
	(381,20,18),
	(382,21,18),
	(383,22,18),
	(384,24,18),
	(385,25,18),
	(386,26,18),
	(387,27,18),
	(388,28,18),
	(389,30,18),
	(390,31,18),
	(391,1,19),
	(392,4,19),
	(393,5,19),
	(394,6,19),
	(395,7,19),
	(396,9,19),
	(397,13,19),
	(398,16,19),
	(399,17,19),
	(400,18,19),
	(401,19,19),
	(402,20,19),
	(403,21,19),
	(404,23,19),
	(405,24,19),
	(406,25,19),
	(407,26,19),
	(408,27,19),
	(409,1,20),
	(410,3,20),
	(411,7,20),
	(412,8,20),
	(413,9,20),
	(414,11,20),
	(415,12,20),
	(416,13,20),
	(417,15,20),
	(418,17,20),
	(419,18,20),
	(420,19,20),
	(421,20,20),
	(422,21,20),
	(423,22,20),
	(424,23,20),
	(425,25,20),
	(426,26,20),
	(427,27,20),
	(428,28,20),
	(429,30,20),
	(430,31,20),
	(431,1,21),
	(432,3,21),
	(433,5,21),
	(434,6,21),
	(435,7,21),
	(436,9,21),
	(437,10,21),
	(438,11,21),
	(439,12,21),
	(440,14,21),
	(441,15,21),
	(442,16,21),
	(443,18,21),
	(444,19,21),
	(445,20,21),
	(446,21,21),
	(447,22,21),
	(448,23,21),
	(449,25,21),
	(450,27,21),
	(451,28,21),
	(452,30,21),
	(453,31,22),
	(454,31,23);

/*!40000 ALTER TABLE `hotel_facility_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hotel_room_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotel_room_rel`;

CREATE TABLE `hotel_room_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `room_id` int NOT NULL,
  `num_rooms` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `hotel_room_rel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_room_rel_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `hotel_room_rel` WRITE;
/*!40000 ALTER TABLE `hotel_room_rel` DISABLE KEYS */;

INSERT INTO `hotel_room_rel` (`id`, `hotel_id`, `room_id`, `num_rooms`)
VALUES
	(1,1,6,35),
	(2,1,1,22),
	(3,1,7,54),
	(4,1,2,26),
	(5,1,3,25),
	(6,1,4,1),
	(7,1,5,1),
	(8,3,6,18),
	(9,3,1,49),
	(10,3,7,66),
	(11,3,2,16),
	(12,3,3,30),
	(13,3,4,3),
	(14,3,5,2),
	(15,4,6,40),
	(16,4,1,37),
	(17,4,7,51),
	(18,4,2,15),
	(19,4,3,12),
	(20,4,4,7),
	(21,4,5,2),
	(22,5,6,64),
	(23,5,1,24),
	(24,5,7,66),
	(25,5,2,16),
	(26,5,3,11),
	(27,5,5,2),
	(28,6,6,60),
	(29,6,1,23),
	(30,6,7,63),
	(31,6,2,37),
	(32,6,3,23),
	(33,6,4,2),
	(34,7,6,43),
	(35,7,1,37),
	(36,7,7,50),
	(37,7,2,30),
	(38,7,3,2),
	(39,7,4,6),
	(40,7,5,2),
	(41,8,6,19),
	(42,8,1,24),
	(43,8,7,61),
	(44,8,2,10),
	(45,8,3,22),
	(46,8,4,8),
	(47,8,5,1),
	(48,9,6,24),
	(49,9,1,36),
	(50,9,7,59),
	(51,9,2,34),
	(52,9,3,2),
	(53,9,5,1),
	(54,10,6,55),
	(55,10,1,43),
	(56,10,7,49),
	(57,10,2,35),
	(58,10,3,29),
	(59,10,4,6),
	(60,10,5,2),
	(61,11,6,36),
	(62,11,1,46),
	(63,11,7,44),
	(64,11,2,26),
	(65,11,3,11),
	(66,11,4,2),
	(67,11,5,1),
	(68,12,6,64),
	(69,12,1,39),
	(70,12,7,63),
	(71,12,2,16),
	(72,12,3,1),
	(73,12,4,5),
	(74,12,5,1),
	(75,13,6,11),
	(76,13,1,42),
	(77,13,7,25),
	(78,13,2,39),
	(79,13,3,16),
	(80,13,5,2),
	(81,14,6,27),
	(82,14,1,50),
	(83,14,7,48),
	(84,14,2,11),
	(85,14,3,30),
	(86,14,4,8),
	(87,14,5,1),
	(88,15,6,36),
	(89,15,1,20),
	(90,15,7,25),
	(91,15,2,13),
	(92,15,3,23),
	(93,15,4,1),
	(94,15,5,1),
	(95,16,6,43),
	(96,16,1,43),
	(97,16,7,21),
	(98,16,2,40),
	(99,16,3,23),
	(100,16,4,6),
	(101,17,6,42),
	(102,17,1,24),
	(103,17,7,53),
	(104,17,2,12),
	(105,17,3,5),
	(106,17,4,5),
	(107,18,6,50),
	(108,18,1,37),
	(109,18,7,70),
	(110,18,2,26),
	(111,18,3,27),
	(112,18,4,4),
	(113,18,5,2),
	(114,19,6,30),
	(115,19,1,47),
	(116,19,7,22),
	(117,19,2,36),
	(118,19,3,6),
	(119,19,4,8),
	(120,20,6,22),
	(121,20,1,35),
	(122,20,7,41),
	(123,20,2,21),
	(124,20,3,8),
	(125,20,4,6),
	(126,20,5,2),
	(127,21,6,12),
	(128,21,1,47),
	(129,21,7,26),
	(130,21,2,36),
	(131,21,3,15),
	(132,21,4,7),
	(133,21,5,2),
	(134,22,6,47),
	(135,22,1,26),
	(136,22,7,29),
	(137,22,2,15),
	(138,22,3,20),
	(139,22,5,2),
	(140,23,6,19),
	(141,23,1,35),
	(142,23,7,44),
	(143,23,2,36),
	(144,23,3,2),
	(145,23,4,3),
	(146,23,5,2),
	(147,24,6,23),
	(148,24,1,25),
	(149,24,7,39),
	(150,24,2,17),
	(151,24,3,17),
	(152,24,4,8),
	(153,24,5,2),
	(154,25,6,36),
	(155,25,1,43),
	(156,25,7,26),
	(157,25,2,36),
	(158,25,3,16),
	(159,25,4,2),
	(160,25,5,1),
	(161,26,6,30),
	(162,26,1,45),
	(163,26,7,44),
	(164,26,2,18),
	(165,26,3,14),
	(166,26,4,4),
	(167,27,6,46),
	(168,27,1,25),
	(169,27,7,28),
	(170,27,2,38),
	(171,27,3,4),
	(172,27,4,8),
	(173,27,5,1),
	(174,28,6,42),
	(175,28,1,35),
	(176,28,7,47),
	(177,28,2,28),
	(178,28,3,27),
	(179,28,4,6),
	(180,28,5,1),
	(181,30,5,2),
	(182,30,4,10),
	(183,30,1,40),
	(184,30,2,22),
	(185,30,3,35),
	(186,30,7,52),
	(187,30,6,60),
	(188,31,1,20),
	(189,31,2,40),
	(190,31,3,25),
	(191,31,6,28),
	(192,31,7,43);

/*!40000 ALTER TABLE `hotel_room_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hotels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotels`;

CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `teaser` text NOT NULL,
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `city_id` int DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `num_stars` int NOT NULL,
  `image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `image_id` (`image_id`),
  KEY `user_reservation_id` (`user_reservation_id`),
  CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `hotels_ibfk_3` FOREIGN KEY (`user_reservation_id`) REFERENCES `user_reservations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;

INSERT INTO `hotels` (`id`, `slug`, `title`, `teaser`, `description`, `address`, `city_id`, `phone`, `num_stars`, `image_id`, `created_at`, `updated_at`, `user_reservation_id`)
VALUES
	(1,'overlook-europa','Overlook Europa','Overnat blot få skridt fra hovedbanegården, lige i hjertet af bystemningen og ved siden af shoppinggaderne. HAK restaurant og bar lever og ånder for kreativiteten, hvor musik og fotoudstillinger i kombination med fantastiske mennesker skaber et skønt underholdningssted.','HAK restaurant og bar sætter tonen for vores hotel, med dens indbydende hotelbar, sociale sammenkomster, kunstudstillinger samt lækre og opfindsomme menu. Kom og spis her, eller besøg vores bar. Dagen efter kan du svømme et par omgange i vores pool, træne i vores fitnessrum eller slappe af i vores sauna, før du begiver dig ud i byen. Du kan tage en pause fra det daglige trummerum på kontoret, og booke et møde i ét af vores 12 mødelokaler. Vi hjælper dig med at tilføje et overraskelseselement med en lækker kaffepause, frokost eller måske middag som en afslutning på det hele.\n\nFra Overlook Europa er du i gåafstand til det pulserende shoppingcentrum i Nordstan, samt de mere stille, brostensbelagte gader med caféer og eksklusive butikker. Uden for vores hotel kan du tage sporvogn nr. 5 direkte til Gøteborgs mest underholdende kvarter med forlystelsesparken Liseberg, forskningscentret Universeum og Verdenskulturmuseet i en og samme gade. Hvis du stadig har overskud, ligger Avenyn kun 10 minutter fra vores hotel med butikker, caféer og restauranter samt størstedelen af Gøteborgs natteliv. Når det er tid til at rejse, ligger hovedbanegården lige over for vores hotel, hvor du finder lufthavnstransport til Landvetter lufthavn.','Nils Ericsonsgatan 21',1,'+46 31 7516500',5,22,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(3,'overlook-crown','Overlook Crown','Bare et stenkast fra hovedbanegården er dette det ideelle udgangspunkt til at udforske byen. Vi har fleksible mødefaciliteter, og der er nem adgang til Svenska Mässan. Efter en hektisk dag kan du sætte dig i spaen og nyde den imponerende udsigt.','Nyd en lækker frokostbuffet i vores restaurant Kronan Bar & Matsal, når det er tid til en pause fra dit arbejde i én af vores 26 mødefaciliteter. Om aftenen serverer vi en à la carte-menu, og efter middagen kan du slappe af i en af vores komfortable lænestole i baren. Hvis du føler, at det er blevet til lidt for meget, kan du råde bod på det på løbebåndet i fitnessrummet og derefter slappe af i saunaen eller sætte dig i spaen for at nyde den imponerende udsigt fra relaxafdelingen.\n\nOverlook Crown er det ideelle udgangspunkt til at udforske alle byens hjørner. \"Shop\'til you drop\" i Nordstan indkøbscenter, se en kamp på Scandinavium, eller oplev en koncert på Ullevi stadion. Prøv en forlystelse i Liseberg forlystelsespark, og glem ikke at sige hej til Lisebergs kaniner. Hvis du føler trang til lidt frisk vestkystluft, kan du bare tage sporvognen til Saltholmen færgeterminal. Der venter havet på dig, med Gøteborgs holme og skær.','Polhemsplatsen 3',1,'+46 31 751 51 00',3,23,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(4,'overlook-grand-central','Overlook Grand Central','Vores New York-inspirerede hotel med en karakteristisk musikprofil. Sammen med Vasateatret er dette et enestående hotel med 391 værelser, koncerter, shows, restauranter og barer i centrum af byen.','I en af Stockholms mest urbane dele, hvor bylivet aldrig sover, finder du et lille stykke af New York. Fornem historien i væggene i denne prægtige bygning fra 1885, som tager sin inspiration fra teatrene og scenerne i dette kulturrige område. Det er et naturligt midtpunkt for events og sociale arrangementer.\n\nVores hotels helt eget teater, Vasateatret, er et storslået sted, hvor både svenske og internationale kunstnere optræder. Oplev det sidste nye, som Stockholm har at byde på, hvad angår musik og kultur. Det er også de ideelle omgivelser til alle slags events, fra koncerter og filmpremierer til konferencer og andre kulturelle forestillinger. Teatret har 800 ståpladser (470 siddepladser), og vores hotel tilbyder fleksible møde- og konferencelokaler til op til 100 deltagere.\n\nDer sker altid noget på vores hotel. En energisk atmosfære i vores bar skaber rammerne. Restaurant Teaterbrasseriet tilbyder klassiske svenske retter med et twist, og i Teaterbaren mestrer vores barteam kunsten at mixe cocktails. De forskellige scener på vores hotel fyldes flere dage om ugen med alt fra akustiske optrædender til DJ-gigs, både store og små. En urban musikstil er med til at skabe stemningen blandt vores gæster. Fotografisk kunst og designudstillinger er også attraktioner, der er at finde overalt på vores hotel.\n\nDenne klassiske bygning, som ligger centralt på hjørnet af Vasagatan og Kungsgatan, er hele 130 år gammel. Tog, bus, metro og Arlanda Express ligger blot få minutter derfra. Det samme gør underholdning, kultur, seværdigheder og hovedstadens bedste shopping.','Kungsgatan 70',2,'+46 8 512 520 00',3,24,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(5,'haymarket-by-overlook','Haymarket By Overlook','Vores statelige indgang på Hötorget byder alle velkomne til at træde ind i en æra med 1920\'ernes optimisme og elegance. Her i den historiske PUB-bygning kan du bo blandt torvemarkeder, biografer og musikhuse, inden for gåafstand af både hovedbanegården og den trendy Stureplan.','Vores restauranter er særklasse, med noget til feinschmeckere og festgæster, frokostgæster, kaffeelskende vinduesshoppere, entreprenører, der er \"væk fra kontoret\" samt krævende eventarrangører. Vores fleksible eventslokale kan være vært for alt fra modeshows, filmpremierer og store nytårsfestligheder. Interiøret kan nemt tilpasses fra mødelokale til et stort, åbent område til at skabe unikke events og sociale sammenkomster. Vi har også en lille biograf med mørkerøde, fløjlslænestole til unikke møder.\n\nBygningens originale karaktertræk, hvor Greta Garbo arbejdede i 1920\'erne, er blevet omhyggeligt bevaret, gendannet eller genfortolket til de kommende 2020\'ere. Den magiske og filmagtige fornemmelse står i stærk modsætning til de moderne og kosmopolitiske karaktertræk, hvilket skaber en ekstraordinær designoplevelse.\n\nVores hotel ligger midt i centrum, ved siden af biografer, torvemarkeder og markedshaller. Det blå musikhus i klassisk svensk stil fra 1920\'erne er lige overfor. Shoppinggaderne Kungsgatan og Drottninggatan er også lige udenfor, fyldt med butikker, restauranter og caféer. Vælg enten metroen eller busserne lige uden for vores dør, eller nyd en kort gåtur til Stureplans natteliv.\n\nHar du hørt udtrykket \"de lokale ved bedst\"? Hvis du virkelig ønsker at finde disse skjulte guldkorn og give din weekend det lille ekstra, så er lidt hjælp ikke af vejen. Haymarkets livsstilsconcierge giver dit ophold det lille ekstra ved at hjælpe dig med at få bord på de hotteste restauranter, finde de der limited edition-solbriller, give dig adgang til en natklub, eller hvad du ellers kunne ønske. Tal med receptionen for yderligere oplysninger.','Hötorget 13-15',2,'+46 8 517 26 700',5,25,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(6,'overlook-portalen','Overlook Portalen','Når du bor her, er du tæt på offentlig transport, så du kan komme rundt i Jönköping. Tag en tur til Visingsö, og gå ikke glip af Tändsticksområdet med butikker, gallerier og museer. Efter en dag fyldt med oplevelser kan du slappe af i vores Sky Sauna.','Slap af i vores Sky Sauna med udsigt over Jönköping eller i Nordic Wellness, som ligger ved siden af med direkte adgang fra vores hotel. Vi arbejder sammen med Karlssons Salonger, hvor du kan nyde fremragende måltider. Vi tilbyder mødefaciliteter på vores hotel og frit trådløst internet. Du kan også låne en cykel fra receptionen og udforske Jönköping og dens omkringliggende områder.\n\nOverlook Portalen ligger midt i Jönköping Centrum, blot få minutter fra shoppingområder og populære seværdigheder. Gå ikke glip af et besøg til Tändsticksområdet med dets museer eller søen Vättern, med Jönköpings smukke landskab. Når du bor hos os på Overlook Portalen, er du også tæt på golfbaner og skibakker.','Barnarpsgatan 6',4,'+46 36 5854200',4,26,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(7,'overlook-grand-marina','Overlook Grand Marina','Dette komfortable og renoverede hotel ligger ved havet i det idylliske Katajanokka lige ved siden af Salutorvet og Helsinki centrum. Der er masser af parkeringspladser.','Hotellet ligger i en smuk lagerbygning fra begyndelsen af 1900-tallet og har store værelser, en fredfyldt atmosfære og moderne mødelokaler. De fleste af værelserne og lobbyområderne har for nylig gennemgået en stilfuld renovation. Store, bueformede vinduer og høje lofter giver en rummelig og lys atmosfære i lobbyen, restauranten og baren. Om sommeren kan gæsterne også nyde vores store terrasse. Foruden hotellets egne mødefaciliteter tilbyder det tilstødende Marina Congress Center rammerne til events og funktioner for op til 2.500 personer. Der er masser af parkeringspladser lige uden for hotellet og i garagen. Hotellet tilbyder WiFi, fitnessrum, sauna og en døgnåben shop. Du kan låne en cykel eller stave til stavgang i receptionen.\n\nHotellet ligger tæt på Helsinki centrum ved havet i det idylliske Kajanokka ved siden af Helsinki SkyWheel, Allas Sea Pool, Uspenski domkirke og Salutorvet. Hotellet er et fremragende udgangspunkt til at se byens seværdigheder, bruge lidt tid på at shoppe eller opleve byens restauranter og natteliv. Du kan nemt komme fra det nærliggende Salutorvet til det omkringliggende øhav og fæstningen Suomenlinna.','Katajanokanlaituri 7',5,'+358 9 1666 1',5,27,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(8,'overlook-seurahuone-helsinki','Overlook Seurahuone Helsinki','Et stilfuldt hotel i centrum af Helsinki. Seurahuones fascinerende historie inspirerer til eventyr i centrum af hovedstaden. Sov og spis godt i den luksuriøse atmosfære på det hyggelige hotel med en perfekt beliggenhed tæt på byens mange tilbud.','Hvis du sætter pris på stemning, historie og en praktisk beliggenhed ved siden af alle byens tilbud, er Hotel Seurahuone det rette valg. Dette fantastiske sted, hvor du kan slappe af midt i travle Helsinki, kan prale af en historie, der går mere end 180 år tilbage, luksuriøse, indbydende og veludstyrede værelser samt et værelsesudvalg, som dækker ethvert behov.\n\nNyd en morgenmadsbuffet og en lækker frokost og middag i den enkle, men elegante, atmosfære i hotellets brasserieinspirerede restaurant. I vores bar kan du fornemme fortidens luksuriøse atmosfære og mødes med venner til en forfriskende cocktail eller et glas vin.\n\nDer er fri WiFi på hele hotellet.\n\nDet er nemt at komme til og fra hotellet, der ligger i centrum af Helsinki. Hovedstadens kunstmuseer, shoppingcentre, restauranter med mere garanterer et besøg fyldt med seværdigheder og oplevelser!\n\nAl offentlig transport er lettilgængelig. Sporvognstop lige foran hotellet. Helsinki banegård og metrostation ligger lige på den anden side af gaden, og Kamppi busstation er en kort gåtur væk.','Kaivokatu 12',5,'+358 9 6899 9035',3,28,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(9,'overlook-rauma','Overlook Rauma','Det komfortable hotel med fuld service ligger ved siden af byens centrum og historiske Gamle Rauma med den smukke kanal. Renoverede værelser, en indendørs pool og et gratis parkeringsområde er garanti for et vellykket besøg. ','Overlook Rauma tilbyder sine gæster renoverede, skønne værelser og alsidig service med en fantastisk beliggenhed. I vores afslappede restaurant kan du nyde både morgenmad og aftensmad og beundre udsigten over kanalen fra den dejlige terrasse om sommeren. Børnene kan hygge sig i legeområdet ved siden af restauranten.\n\nHotellets relaxafdeling med sauna og pool giver mulighed for en varm saunatur og en forfriskende dukkert. Hvis du vil motionere, er hotellets fitnessrum perfekt til den daglige træning under dit ophold.\n\nVores lyse og praktiske konferencefaciliteter er perfekte til konferencer, events og fester. Der er fri WiFi på hele hotellet.\n\nDet er nemt at komme til og fra hotellet, som ligger i centrum af Rauma med gode transportmuligheder. Hotellet ligger ved siden af Gamle Rauma, der er en del af UNESCO’s verdensarv. Dette område med træbygninger og små, romantiske stræder er det største og bedst bevarede af sin slags i Norden og en oplevelse udover det sædvanlige. Andre af havnebyens højdepunkter inkluderer de alsidige aktiviteter til Kniplingsugen, som hylder Raumas kniplingstraditioner, samt en tur med vandbussen fra Otanlahti til fyrtårnet på øen Kylmäpihlaja.','Aittakarinkatu 9',7,'+358 2 4808 1616',4,29,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(10,'overlook-webers','Overlook Webers','Bo midt i pulserende København på hippe Vesterbro, hvor klassisk arkitektur fra 1880\'erne møder trendy indretning. Her er du tæt på restauranter, barer og små designbutikker. Vi ligger kun få minutters gang fra Tivoli, Hovedbanegården og shopping på Strøget.','Vil du bo på Vesterbro, Københavns mest populære bydel? Så er Overlook Webers hotellet for dig. Her kan du følge med i byens liv fra vores cocktailbar Cube, imens du nyder en lækker drink eller en snack. Om sommeren er vores hyggelige gårdhave et populært sted at mødes med venner eller kolleger til en forfriskende drink. Vi arrangerer gerne dit næste møde eller konference i et af vores 3 mødelokaler, der selvfølgelig har moderne av-udstyr og fri WiFi. Vores hotel har et mindre antal cykler, så du har rig mulighed for at opleve København sammen med de mange lokale cyklister. Vil du have pulsen op, ligger vi tæt på Søerne, hvor du finder en af Københavns mest populære løbestier. Ankommer du til Overlook Webers i bil, er der parkeringsmuligheder i de omkringliggende gader. Vi samarbejder desuden med Saga P-hus, ca. 100 m fra hotellet.\n\nDette unikke byhotel ligger i centrum af København i bydelen Vesterbro. På hippe Vesterbro finder du alt fra gourmetrestauranter og barer til små, sjove butikker. Husk at lægge et smut forbi Københavns største turistattraktioner som Tivoli, Strøget og Rundetaarn, der alle ligger inden for gåafstand af vores hotel. I vores reception kan du købe billetter med rabat til Københavns bedste attraktioner. Vores hotel ligger få minutter fra Københavns Hovedbanegård, og herfra kan du tage tog til Københavns Lufthavn, Kastrup. På Hovedbanegården kan du også fange bus og taxa hvert et øjeblik.','Vesterbrogade 11B',8,'+45 33 31 14 32',2,30,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(11,'overlook-copenhagen','Overlook Copenhagen','Moderne, centralt beliggende hotel med storslået udsigt til Søerne og Københavns skyline. Vores hotel hører til blandt Københavns største konferencehoteller med plads op til 1100 personer. Vi har parkeringskælder og Tivoli ligger i kort afstand fra hotellet.','Bo på Overlooks største hotel i Danmark, Overlook Copenhagen med i alt 18 etager. Alle 486 værelser er moderne indrettet i et city- eller country-tema. Hotellet hører til blandt Københavns største konferencehoteller og vores fleksible konferencelokaler kan rumme fra 2 til 1100 personer. Hotellet tilbyder rig mulighed for afslapning efter dagens oplevelser. Vores barista står klar med friskbrygget, økologisk kaffe i vores stemningsfyldte lobbybar, og hotellets restaurant ”The Grill” serverer velhængte bøffer fra fritgående, dansk Angus. Rejser du med børn, er der plads til leg og underholdning i vores legerum i stueplan. Hold formen ved lige i vores moderne fitnesslokale eller lej én af vores Overlook-cykler og oplev byen fra en ny vinkel. Skal bilen parkeres, finder du parkeringsmulighed udenfor eller i kælderen under hotellet. Om morgenen kan du vågne op til vores store morgenmadsbuffet, der er inkluderet i prisen.\n\nVil du på weekendophold i København, skal du bo på Overlook Copenhagen. Med sin moderne indretning og optimale beliggenhed, er hotellet perfekt udgangspunkt for jeres weekend her. Vi forkæler jer med middag i restauranten. \n\nOverlook Copenhagen er centralt placeret i København med naturskønt område, udsigt til Søerne, shopping og seværdigheder som Tivoli lige om hjørnet. Fra hotellet kan du gå til det meste i København, men har du brug for at rejse videre, finder du Hovedbanegården og Vesterport Station få minutter fra hotellet.\n\nHusk altid, at du får den bedste pris på Overlook Copenhagen, når du booker dit værelse her på vores website.','Vester Søgade 6',8,'+45 33143535',4,31,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(12,'overlook-aalborg-city','Overlook Aalborg City','Bo i hjertet af Aalborg med byens mange attraktioner og butikker lige udenfor din hoteldør. Vores hotel ligger i direkte tilknytning til Aalborg Kongres og Kultur Center. Hvis du ankommer i bil, kan du parkere i vores overvågede parkeringskælder under hotellet.','Du vil straks føle dig hjemme i vores 168 moderne og komfortable værelser og suiter, der alle er indrettet med skandinavisk design. Værelserne på hotellets øverste etager har en fantastisk udsigt over Aalborg by. Mød dine venner eller kolleger til en drink i vores hyggelige lobbybar, eller få lidt arbejde for hånden ved et af bordene, mens du nyder en kop kaffe eller te. Du kan selvfølgelig også læse dagens avis, eller bare slappe af mens du betragter det travle liv i receptionen. I URBAN Food & Drink tilbyder vi lækre, hjemmelavede retter, baseret på sæsonens bedste regionale og lokale råvarer. Nyd din mad i vores hyggelige spisehjørne, eller tag den med op på værelset. Efter en lang dag i Aalborg kan du lade op og stresse af i vores fitnessrum, hvor du finder moderne udstyr, der passer til alle slags workout. Ankommer du i bil, finder du en offentlig parkeringsplads foran hotellet, men vi tilbyder også en aflåst og overvåget parkeringskælder under hotellet. Vil du udforske Aalborg på to hjul? Lån en cykel i receptionen og få en sjov og udfordrende dag.\n\nNår du bor på vores hotel, bliver det ikke nemmere at opleve Danmarks fjerdestørste by, Aalborg. Byens mange gallerier, museer og butikker er i tæt gåafstand. Er du i Aalborg for at deltage i en konference i Aalborg Kongres og Kultur Center, er vores hotel oplagt, når du skal have en god nats søvn – vores hotel ligger nemlig i tilknytning til kulturcenteret. Hvis du besøger Aalborg med din familie, må I ikke gå glip af en tur i Aalborg Zoo. Både børn og voksne er også sikret en dejlig dag og udsigt fra Aalborg Tårnet, hvor den cirkulære bygning tilbyder en fantastisk 360-graders udsigt over Aalborg og naturen omkring. Hvis du ankommer med tog byen, ligger Overlook Aalborg City kun en kort gåtur fra banegården.','Europa Plads 1',11,'+45 70125151',3,32,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(13,'overlook-aalborg-øst','Overlook Aalborg Øst','Går turen til Nordjylland, ligger dette hotel i Aalborg med unik beliggenhed tæt på naturområder, 10 minutter fra Aalborg centrum og lige ved motorvej E45. Vi har en stor, fleksibel møde- og konferenceafdeling. Kommer du i bil, tilbyder vi fri parkering.','Overlook Aalborg Øst har 101 nyrenoverede værelser - alle komfortabelt indrettet og mange med kig til den smukke natur omkring hotellet. Vi byder dig velkommen i vores restaurant med hyggelig stemning og et varieret menukort. Du er sikret en lækker madoplevelse, uanset om du vælger den afslappede forretningsmiddag, dagens ret eller det lette måltid. Restauranten har plads til 200 spisende gæster.\n\nOverlook Aalborg Øst er ideelt til møder og konferencer. Vi tilbyder 9 moderne, fleksible og lyse mødelokaler med plads fra 2-300 personer. Trænger du til lidt adspredelse og afslapning, har vi en sauna og er det formen, der skal holdes ved lige, så er vores veludstyrrede fitnessrum et besøg værd. Skal bilen parkeres har vi fri parkering med ca. 90 p-pladser.\n\nOverlook Aalborg Øst ligger meget belejligt og er let at finde lige ved motorvej E45. Hotellet er blot 2 minutters kørsel fra Aalborg Gigantium, et kultur- og idrætshus, hvor der bl.a. spilles store håndboldkampe. Der er også plads til selvforkælelse i idrætshusets spa. Overlook Aalborg Øst ligger ligeledes også godt i forhold til Skagen, Blokhus, Løkken og Nordjyllands mange attraktioner. Aalborg centrum med underholdning og butikker ligger blot en kort køretur fra hotellet.','Hadsundvej 200',11,'+45 98154500',4,33,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(14,'overlook-silkeborg','Overlook Silkeborg','Bo midt i naturen! På Overlook Silkeborg har vi sat os for at skabe hoteloplevelser, som styrker dine naturoplevelser. Besøg hotellets pool for et afbræk eller opvarmning til dagen, læg vejen forbi vores lille værksted inden du begiver dig ud i naturen, og glæd dig til lækre og nærende måltider i vores restaurant om aftenen. Nyd en god nats søvn på vores værelser - medbragte cykler og kajakker overnatter også trygt i vores \"outdoor locker\".','Silkeborg er kåret til Danmarks \"outdoor hovedstad\", og besøger du området for at opleve dette unikke stykke natur er vores stemningsfulde hotel lidt uden for byen et oplagt valg. Det naturskønne område og hotellets faciliteter giver dig mulighed for at opretholde en aktiv hverdag - både når du er på farten med dit arbejde, eller når I holder ferie med familien. Din middag og morgenmad bliver en ren sanseoplevelse i vores orangeri-inspirerede restaurant Kildesø. Her sidder du så godt som midt i naturen med udsigt til trækronerne og adgang til terrassen, mens du finder din energi til dagen eller nyder en velfortjent middag. Trænger du til at varme op til eller slappe af efter en aktiv dag, anbefaler vi et besøg i vores opvarmede, indendørs pool, hvor du har direkte udsigt til Silkeborg Langsø. Begiver du dig ud i naturen på to hjul, har du mulighed for at lægge vejen forbi vores lille værksted, hvor du kan få smurt kæden og pumpet dækkene inden du sætter kurs mod skoven eller vaske og pleje cyklen, når du kommer retur igen. De naturskønne omgivelser udgør også de perfekte rammer for aktive møder eller kreative indslag på en mødedag. Indenfor i vores store og fleksible konferenceafdeling, står vi klar til at arrangere møder, konferencer og events for op til 260 personer. Ankommer du i bil, tilbyder vi 140 gratis parkeringspladser. Medbragte cykler eller kajakker kan opbevares i vores \"outdoor locker\".\n\nDu har bogstavlig talt naturen lige uden for døren, når du overnatter på Overlook Silkeborg. Hotellets idylliske placering på skråningen ned mod Silkeborg Langsø giver dig både en storslået udsigt samt de bedste muligheder for at udforske alt, hvad Silkeborg har at byde på af natur og kultur. Nyd en sejltur på Silkeborgsøerne med kurs mod Himmelbjerget ombord på dampskibet Hjejlen. Eller lej en kano og sæt din egen kurs. Forkæl synssansen med kunstoplevelser på Silkeborg Museum og Museum Jorn eller tilfreds alle shoppebehov i byens mange butikker. Familiens yngste medlemmer kan få en stor oplevelse i AQUA Akvarium & Dyrepark, hvor I kommer helt tæt på de mange dyr. Vores hotel ligger ca. 3 km. fra Silkeborg centrum og offentlig transport stopper lige ved hotellet.','Udgaardsvej 2',13,'+45 86803533',4,34,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(15,'overlook-the-mayor','Overlook The Mayor','Bo på et lækkert og indbydende hotel beliggende i hjertet af Aarhus med byens storslåede kultur- og shoppingliv lige udenfor døren. Størstedelen af hotellets værelser er nyrenoverede moderne stil, mens vores anmelderroste restaurant GÄST byder på gastronomiske oplevelser i særklasse.','Overlook The Mayor ligger i det absolutte centrum af Aarhus, omgivet af nogle af byens største attraktioner som fx Musikhuset, ARoS Aarhus kunstmuseum og Aarhus Streetfood. Desuden er der kun få skridt til gode shoppingmuligheder på både Strøget og i Bruuns Galleri. Hotellet ligger tæt på den gamle og yderst charmerende bydel, Frederiksbjerg. Kvarteret kendetegnes ved små hyggelige butikker, restauranter, madmarkeder og nye, trendy cafeer, som hele tiden kommer til. Frederiksbjergs charme kan især opleves i området omkring Jægergårdsgade, hvor pariserstemingen summer – ikke mindst om foråret, hvor de små fortovscafeer for alvor bliver vakt til live.','Banegårdspladsen 14',14,'+45 87320100',5,35,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(16,'overlook-aarhus-city','Overlook Aarhus City','Moderne hotel midt i Aarhus med unik beliggenhed tæt på shopping, attraktioner og transportmuligheder. Èt af vores bedste hoteller for dig, som rejser i hverdagene eller nyder et weekendophold. Gå ikke glip af en gourmetoplevelse på vores populære restaurant, L\'øst.','Storbyferie, romantisk ophold, konference eller netværk med kollegaer eller venner? Overlook Aarhus City har det hele! Forkæl dig selv og familien med et par dage på vores moderne hotel midt i Aarhus, der er indrettet i skandinavisk stil. Lad tænderne løbe i vand over de gode bøffer fra hotellets restaurant, L\'øst. Er du til en afterwork drink, er vores bar et hyggeligt sted at slappe af og et populært mødested for vores gæster og for århusianerne. Fra nogle af vores øverste hotelværelser kan du nyde udsigten over Aarhus by, med kig til kunstmuseet ARoS og dets kendte kunstværk \"Regnbuen\", Aarhus Havn samt skovene og strandene. På taget har vi solceller, som forsyner hotellet med strøm svarende til 90% af forbruget på værelserne. Om sommeren anbefaler vi vores hjemmeavlede honning til morgenbuffeten, som stammer fra bistaderne, som også findes på taget. Hotellet er et af Danmarks mest tilgængelige hoteller med 25 handicapvenlige værelser og har et konferenceområde, som er fuldt tilgængeligt med moderne AV-udstyr. Er du i humør til sightseeing og motion kan du låne én af vores Overlook cykler og udforske Aarhus by på to hjul. Du kan også få pulsen op i vores moderne fitnessfaciliteter, som du finder under receptionen.\n\nTættere på Aarhus midtby og byens mange shoppingmuligheder, hyggelige cafeer og restauranter samt seværdigheder og attraktioner som Den Gamle By og ARoS - kommer du ganske enkelt ikke! Overlook Aarhus City ligger i Østergade, og lige uden for hotellet ligger \"Strøget\", Aarhus\' gågade. Aarhus Banegård og busterminal er i kort afstand til hotellet.\n\nDet siger næsten sig selv - på Overlook Aarhus City har du det perfekte udgangspunkt for et weekendophold i Aarhus. Vi sørger for en lækker 2-retters middag i restaurant L\'Øst.','Østergade 10',14,'+45 89318100',3,36,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(17,'overlook-hafjell','Overlook Hafjell','Det perfekte mødested til fornøjelser og konferencer ligger cirka to timer fra Oslo. Vores alsidige faciliteter og de spændende aktiviteter i nærheden giver vores gæster mulighed for at skræddersy deres eget event.','Vi har 25 fleksible mødelokaler for to til 500 personer. Vores hotel har en stor restaurant og en skøn lobbybar med en moderne og afslappet stemning. Med vores indendørs pool, sauna og fitnessrum har vi noget for alle.\n\nHafjell er det perfekte udgangspunkt for konferencer og ferier. Vores hotel ligger kun 700 meter fra en af Norges største alpinski-faciliteter, Hafjell alpinsenter, og kun 15 minutter fra Lillehammer. Det gør os til det oplagte valg for dem, der ønsker en aktiv og spændende konference eller ferie. Hunderfossen Familiepark, bobslæde- og lugebanen og fantastiske vandrestier gør Hafjell til en skøn destination, både sommer og vinter.','Hunderveien 1',15,'+47 61 27 77 77',2,37,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(18,'overlook-victoria','Overlook Victoria','Overlook Victoria er alle tiders udgangspunkt til at opleve de aktiviteter og attraktioner, som Lillehammer har at byde på. Med sin hyggelige atmosfære og historie, som går tilbage til 1872, er dette hotel perfekt til alle, som ønsker at overnatte i et afslappet miljø på deres rejse.','Overlook Victoria er et hyggeligt hotel, som blev opført i 1872. Vi har bevaret hotellets ældste del i den gamle stil for at gøre hotellet unikt. Om morgenen bliver der serveret morgenmad i restauranten Victoriastuen, og om aftenen kan du vælge fra vores à la carte-menu, som består af lokale råvarer fra regionen. Hotellet har en konferencekapacitet for op til 200 personer og er et af de førende konferencehoteller i regionen. Vi tilbyder fri parkering, et fitnessrum og som altid, fri WiFi til vores gæster.\n\nBesøg denne charmerende turistdestination, som er kendt for de mange gamle og hyggelige træhuse. I nærheden finder du fremragende skiruter, og hotellet er alle tiders udgangspunkt til at udforske byens aktiviteter og attraktioner. Vi anbefaler, at du afsætter lidt tid til at besøge Lillehammer Kunstmuseum, der anses som et af verdens førende kunstmuseer. Hotellet ligger på gågaden, inden for gåafstand af både busser og toge.','Storgata 84 b',15,'+47 61 27 17 00',4,38,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(19,'grand-hotel-oslo-by-overlook','Grand Hotel Oslo By Overlook','Velkommen til Grand Hotel Oslo by Overlook. Grand Hotel Oslo er det mest ikoniske hotel i Norge og en sofistikeret kombination af komfort og elegance. Dette legendariske hotel har siden 1874 været vært for internationale gæster, berømtheder, modtagere af Nobel Fredspris – og dig.','Dette ikoniske, sofistikerede og elegante Grand Hotel Oslo har siden 1874 været vært for internationale gæster, berømtheder og Nobel Pris-vindere. Grand Hotel Oslo tilbyder kontraster og muligheder. Det har 274 værelser, inklusive 54 moderne suiter. Oplev de spændende restauranter, lobbybaren og en afslappende spa, og hold formen ved lige i fitnessrummet, eller nyd forfriskninger i baren på tagterrassen.\n\nGrand Hotel Oslo er et historisk landemærke beliggende midt i Norges hovedstad. Med en beliggenhed på hovedgaden Karl Johans Gate er Grand Hotel Oslo kun få minutters gang fra attraktioner og alt, hvad Oslo har at byde på.\n\nVores Signatur-hoteller er omhyggeligt udvalgte, da de alle har deres unikke særpræg. Hotellerne har en stærk individuel personlighed og er steder, der hver især stræber efter at være en totaloplevelse.','Karl Johans gate 31',16,'+47 23 21 20 00',5,39,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(20,'overlook-holmenkollen-park','Overlook Holmenkollen Park','Bring dit ophold i Oslo op på næste niveau! Overlook Holmenkollen Park ligger imponerende 350 meter over byen. Her kan du nyde udsigten over hovedstaden og spise på en af byens bedste restauranter. Vi anbefaler et besøg i vores skønne spa, træning i vores veludstyrede fitnessrum eller en svømmetur i vores pool.','Vores hotel er perfekt til konferencer, med 38 konferencelokaler og plads til op til 800 deltagere samt festmiddage for op til 500 gæster. Vores hotel er unikt, kendt for dets individuelle arkitektur og en historie, der går tilbage til 1894.\n\nMed dets beliggenhed lige ved siden af Holmenkollen National Ski Arena, skimuseet og Nordmarka-skoven er der udendørsaktiviteter for alle. Der er kilometerlange vandreruter lige uden for døren, og du kan låne en cykel gratis. Om vinteren kan du tage direkte ud på verdensmesterskabernes skibaner, som strækker sig ind i Nordmarka-skoven. Oslo Vinterpark er kun få minutter fra vores hotel, og om sommeren kan du udfordre din højdeskræk i en af Norges største klatreparker.\n\nGør din dag endnu mere mindeværdig med et besøg i vores restaurant De Fem Stuer. Her serverer vi retter i en kunstfærdig kombination af norske retter blandet med eksotiske præg fra Italien, Frankrig og Asien.\n\nVores hotel ligger kun 9 km fra byen eller 30 minutter fra Oslo Centralstation via metroen.','Kongeveien 26',16,'+47 22 92 20 00',3,40,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(21,'overlook-ishavshotel','Overlook Ishavshotel','Velkommen til Overlook Ishavshotel, som har vundet prisen for regionens bedste hotelmorgenmad 8 år i træk! Bo lige ved kajen i Tromsø, “Nordens Paris”, og nyd den fantastiske udsigt fra vores hotel. Oplev nordlyset om vinteren og midnatssolen om sommeren. I vores restaurant, Roast, kan du få frisk fisk og skaldyr. Fleksible mødelokaler og fantastiske workshop- og konferencefaciliteter.','Vores hotel har konferencefaciliteter til op til 450 deltagere, og vi kan tage os af alle typer møder, events eller konferencer. Uanset om du har været ude at udforske byen eller til konference, bør du slutte dagen af med et besøg i vores restaurant, Roast. Her kan du bestille lækker mad fra en moderne à la carte-menu, der byder på friske fisk og skaldyr samt lokalt kød – alt sammen tilberedt i vores åbne køkken. Efter aftensmaden kan du nyde en lækker drink i vores Roast Bar, som har en omfattende barmenu og et stort udvalg af lokale øl. Om morgenen er vi stolte af at tilbyde en morgenbuffet, der er blandt de bedste i landet med en 3. plads i Twinings Best Hotel Breakfast-konkurrence. Vores hotel har fri WiFi.\n\nBo i “Nordens Paris” med udsigt over Tromsø havn. Overlook Ishavshotel ligger kun 50 meter fra Hurtigrutens færge og 4 minutter fra Polarmuseet. I Tromsø kan du også tage på hvalsafari og nyde en midnatskoncert i Ishavskatadralen. Glem ikke at se nordlyset, hvis du er her om vinteren, eller Tromsø Midnight Sun Marathon om sommeren. Vores hotel ligger kun 6 km fra lufthavnen.','Fredrik Langesgate 2',18,'+47 77666400',4,41,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(22,'overlook-grand-tromsø','Overlook Grand Tromsø','Her bor du i centrum af byen med lufthavnsbussen lige uden for døren. En ideel base for alle de eventyr, Tromsø har at byde på. Dans om aftenen på Gründer afslutter en dejlig dag.','Restaurant Grand byder på en stor morgenbuffet hver dag. Vores Gründer Café & Bar serverer frokost og aftensmad i en afslappet atmosfære. I weekenden bliver den til en del af Tromsøs pulserende natteliv og forvandles til den populære Gründer by Night. Vores fire mødelokaler er store og lyse, med naturligt dagslys og fri WiFi. Det største lokale har plads til op til 150 deltagere.\n\nVores komfortable hotel ligger centralt i Tromsø, en by omgivet af bjerge, fjorde og øer med masser at kultur og historie at byde på. Byen er udgangspunktet for at jagte nordlyset, tage på hvalsafari, tage på fisketure, cykle og meget mere. Gå ikke glip af et besøg til den smukke Arktisk-alpine botaniske have, Polarmuseet eller en tur til øen Kvaløya og Tromsø Lapland.','Storgaten 44',18,'+47 77753777',2,42,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(23,'overlook-berlin-potsdamer-platz','Overlook Berlin Potsdamer Platz','Hotellet ligger på berømte Potsdamer Platz, lige ved siden af musicalteatre og indkøbscentre. Du kan gå til Brandenburger Tor og nemt nå andre dele af byen med metroen. Vores hotel er det grønneste i Berlin og har 16 konferencelokaler, som er perfekte til bæredygtige møder.','På Overlook Berlin Potsdamer Platz finder du 16 mødelokaler af forskellig størrelse, der kan være vært for bæredygtige events for op til 550 personer, inkl. en stor balsal med terrasse. Vores hotelfaciliteter og 60 værelser er alle fuldt handicapvenlige. Derudover rangerede vores hotel højest blandt Berlins hoteller i den aktuelle VDR Certified Green-rangering, hvilket gør det til det grønneste hotel i byen. Du kan nyde en stor morgenbuffet med mere end 100 produkter, foruden friske regionale og sæsonbestemte retter i vores \"3. etage\" restaurant. Slap af over en dejlig drink i vores bar. Den tilstødende terrasse er et populært mødested på vores grillaftener om sommeren. Sørg for at besøge vores fitnessrum, som har en enestående udsigt over Potsdamer Platz. Vores værelser er indrettet i de forskellige årstiders farvetemaer – vælg det værelse, der svarer til din yndlingsårstid!\n\nVores hotel, som ligger i hjertet af byen, tilbyder en fredfyldt kontrast til den travle aktivitet på Potsdamer Platz. Lige rundt om hotellet finder du Stage Theatre, som er berømt for sine musicals, Sony Center samt Filmmuseum Berlin. Der er også utroligt gode shoppingsteder, såsom Mall of Berlin, et af Europas største indkøbscentre. Efter en kort gåtur er du fremme ved Berlinmuren, Brandenburger Tor og Reichstag – Parlamentsbygningen – hvor du kan udforske Berlins historie. Andre attraktioner, samt Berlins hovedbanegård og lufthavne er lettilgængelige med offentlig transport. U2-metroen, som forbinder byens vestlige og østlige del, stopper lige foran hotellet og tager dig til Alexanderplatz, Gendarmenmarkt og Zoologischen Garten. Regionaltog stopper også ved Potsdamer Platz. Du kan nå frem til Berlin Messecenter og CityCube Messecenteret på 20 minutter med taxi eller 30 minutter med metroen, uden at skulle skifte tog.','Gabriele-Tergit-Promenade 19',19,'+49 30 7007790',5,43,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(24,'overlook-berlin-kurfurstendamm','Overlook Berlin Kurfurstendamm','Dette Overlook-hotel er det perfekte udgangspunkt til en stor shoppetur på handelsgaden Kurfürstendamm eller et besøg i Zoologisk Have. Hold dit møde på den eksklusive 7. etage med dens imponerende udsigt over Vestberlin. Berlins messecenter er inden for nem rækkevidde. ','Hele mødeetagen på vores hotel kan bruges eksklusivt til din event eller dit møde med faciliteter for op til 140 personer. Deltagere kan holde pause på vores tagterrasse og samtidig nyde den fantastiske udsigt. Efter en lang dag kan du slappe af i et af vores moderne og komfortable hotelværelser. Forkæl dig selv med en forfriskende drink eller lækker snack fra vores shop, der er åben 24 timer i døgnet. Nyd vores grønne gårdhave, træn i vores fitnessrum med udsigt over Berlins tage, eller slap af i vores finske sauna eller tyrkiske dampbad. Vores restaurant serverer lækre måltider, og vores morgenbuffet byder på et udvalg af sunde og lokale produkter hver morgen.\n\nFra vores hotel kan du gå en tur til de utallige butikker og caféer på handelsgaden Kurfürstendamm, samt til det berømte stormagasin KaDeWe med dets berømte fødevareafdeling. Du kan få design- og livsstilsprodukter i konceptindkøbscenteret Bikini Berlin. Din rejseplan må absolut omfatte et besøg til det interaktive museum The Story of Berlin og den historiske Kaiser Wilhelm Gedächtniskirche. Eller få alle tiders familieudflugt til Berlin Zoologisk Have og Aquarium Berlin! Hvis du er på forretningsrejse i Berlin, har du meget nem adgang til messecentret Berlin ExpoCenter City fra vores hotel. Efter 15 minutter med taxi eller 20 minutter med metro kan du være fremme ved CityCube.','Augsburger Straße 5',19,'+49 30 212 42 0',3,44,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(25,'overlook-hamburg-emporio','Overlook Hamburg Emporio','Vores moderne hotel kan prale af en ideel beliggenhed i det centrale Hamborg: Lige ved Gänsemarkt torv og ikke langt fra byens kongrescenter. Det giver usædvanlig god valuta for pengene, når du tager dets beliggenhed i betragtning. Hold dine møder på et hotel, der har modtaget en række priser for dets bæredygtighed!','Vi tilbyder vores gæster fremragende, meget lyse og fuldt handicapvenlige mødefaciliteter med udsigt over Hamborgs skyline. Arranger dine konferencer og events hos os – vores største lokale har plads til op til 120 personer.\n\nMotion er nøglen til et afbalanceret liv, så deltag i vores løbearrangement \"Running with Friends\" mandage og onsdage. Derefter kan du slappe af i en af vores saunaer eller fortsætte din workout i vores fitnessrum. Nyd regionale retter, der er inspireret af mottoet \"Hamburg - Stockholm\" i vores restaurant, bar og lounge H2O, hvor du også kan runde din aften af med en dejlig gin og tonic.\n\nOverlook Hamburg Emporio kan prale af en ideel beliggenhed i Hamborg centrum, lige ved siden af Gänsemarkt torv. CCH Congress Centre Hamburg ligger mindre end 1 km væk. Man skal blot træde ud af hovedindgangen for at komme til koncert i koncertsalen Laeiszhall. Byens mest berømte shoppinggader, herunder Jungfernstieg, ligger alle inden for gåafstand. Det er nemt at komme rundt til andre seværdigheder med metroen, som stopper lige ved vores hotel.\n\nHvis din Hamborg-ønskeseddel omfatter at se en musical, tage en løbetur langs floden Alster eller nyde en afslappende pause i parken Planten un Blomen, er vores hotel det perfekte udgangspunkt. Du kan også følge i Beatles\' fodspor – de begyndte deres karriere i det nærliggende underholdningsdistrikt Reeperbahn!','Dammtorwall 19',20,'+49 40 4321 870',4,45,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(26,'overlook-frankfurt-museumsufer','Overlook Frankfurt Museumsufer','Overnat på vores nyåbnede hotel Overlook Frankfurt Museumsufer midt i Frankfurts pulserende centrum, og nyd udsigten over Frankfurts skyline og Main-flodens bredder. Beliggenheden mellem Messe Frankfurt og Museumsufer giver både forretningsrejsende og turister den perfekte indkvartering.','I vores nydesignede konferenceområde finder du 7 konferencelokaler, det største med plads til 285 personer, og de er alle udstyret med den nyeste konferenceteknologi. Vores innovative konferenceprogram tilbyder forfriskende måltider, og vores prisbelønnede bæredygtighedsstrategi sørger for, at mødet forløber gnidningsfrit – og med god samvittighed.\n\nOg som en sporty modsætning til en travl dag er vores fitnessrum med et udvalg af maskiner til styrke- og kredsløbstræning åbent døgnet rundt.\n\nI vores restaurant tilbyder vi en overdådig Overlook-morgenbuffet og en omfattende menu.\n\nVores hotel ligger i centrum af Frankfurt, kun 5 minutters gang fra hovedbanegården i det livlige Bahnhofsviertel. Udover et stort udvalg af restauranter ligger Frankfurt-operaen, Schauspielhaus-teatret og Märchenbrunnen-springvandet alle få minutters gang fra vores hotel. Museumsufer over for hotellet tilbyder med mere end 20 museer et stort udvalg af moderne og historiske udstillinger. Og dem, der vil tage den med ro, kan slentre langs Main-flodens bredder.','Wilhelm-Leuschner-Straße 44',21,'+49 69 9074 59 0',5,46,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(27,'overlook-gdansk','Overlook Gdansk','Overlook Gdansk ligger centralt i hjertet af Gdansk - et stenkast fra byens fornøjelser. Vi har dampbad, fri WiFi og gode mødefaciliteter.','Gå på opdagelse i Gdansk, eller træn i hotellets veludstyrede fitnessafdeling, og slut af med et opkvikkende besøg i dampbadet. Tag en drink i den hyggelige hotelbar. Hotellets mødeafdeling har otte fleksible konferencelokaler med plads til 330 personer.\n\nOverlook Gdansk ligger centralt i kystbyen Gdansk. Hotellet er moderne og ligger tæt på den gamle bydel i Gdansk, som er fuld af restauranter, caféer, natklubber, barer og butikker. Med hotellet som udgangspunkt har du mange muligheder for at gå på opdagelse i byens smukke parker, nyde kulturtilbud eller gå en tur langs kysten.','Podwale Grodzkie 9',22,'+48 58 300 6000',3,47,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(28,'overlook-wroclaw','Overlook Wroclaw','Fra dit moderne hotelværelse i klassisk eller skandinavisk stil kan du gå til markedspladsen og den gamle bydel i Wroclaw på bare 10 minutter. Vores hotel byder på alsidige konferencefaciliteter for op til 300 deltagere samt byens bedste kaffepause. ','Med 10 alsidige møde- og konferencelokaler, moderne mødeteknologi og en lækker konferencemenu kan vi arrangere din event lige efter dine ønsker. Efter dit møde eller lidt sightseeing kan du besøge vores restaurant og bar “STOCKHOLM eat and drink”, hvor du kan prøve de lokale specialiteter, nyde live musik eller få et godt grin ved vores månedlige standup-show. Du kan også vælge at træne i fitnessrummet efterfulgt af et afslappet øjeblik i saunaen. Når dagen er slut, kan du få en god nattesøvn i vores værelser, der er dekoreret med klassisk eller moderne skandinavisk design.\n\nOverlook Wroclaw ligger tæt på masser af populære seværdigheder, hyggelige caféer, teatre, operaen og philharmonien. Vi tilbyder det perfekte udgangspunkt, når du vil udforske den fascinerende labyrint af broer og øer, som denne by består af. På bare 10 minutter er du på markedspladsen i den historiske gamle bydel eller på banegården. Gå ikke glip af Africarium, et kompleks i Wroclaw Zoo, der som det eneste i verden er dedikeret til afrikanske vandbaserede arter og økosystemer. Lufthavnen ligger kun 30 minutters kørsel væk.','49/57 Pilsudskiego Street',23,'+48 71 7870000',1,48,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(30,'overlook-grand-hotel-reykjavik','Overlook Grand Hotel Reykjavik','Grand Hotel Reykjavik ligger i centrum af Reykjavík, i nærheden af en koncertsal, bistroer og en zoo. Stedet åbnede i 1987 og ombygget i 2009, og byder gæsterne på 311 værelser. Det tilbyder en varm atmosfære og fremragende tjenester','Placeret ved Reykjavik Rådhus er stedet 2,7 km fra Islands Nationalmuseum. Stedet er 1 km væk fra centrum af Reykjavík.\n\nEn lagune og en botanisk have er også i nærheden.\n\nHvert elegant værelse udstyret med centralvarme, kabel-tv og en mikrobølgeovn. Gæsterværelserne har udsigt over havet. Der er et eget bad med en hårtørrer, et spabadekar og toiletartikler.\n\nHotellet har en buffet morgenmad dagligt. Den lokale restaurant serverer islandsk køkken. Kaffe baren tilbyder kaffe og te samt gratis WiFi og en åben pejs. Gæsterne kan nyde et måltid i VOX Restaurant, Brasserie Askur og Quest Saloon, der ligger omkring 300 meter væk.\n\nHotellet er ideelt placeret i nærheden af Keflavík International lufthavn.\n\nDer tilbydes også gratis shuttleservice til byen, tøjvask og en strygeservice på Grand Hotel Reykjavík.\n\nPå stedet er der tilgængelige indendørs opvarmet pool, en gårdhave og en fælles lounge. Ejendommen tilbyder fitness-lektioner og et træningscenter for at holde formen.','Sigtun 38',24,'+354 514 8000',4,51,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL),
	(31,'overlook-blue-lagoon','Overlook Blue Lagoon ','Bliv behandlet som en stjerne med verdensklasses service hos Overlook Blue Lagoon Iceland. Der er et underjordisk spa, geotermisk lagune og restaurant som genskaber Islands kulinariske traditioner. Dette luksushotel med 62 suiter er omgivet af Blue Lagoons mineralrige vand.\n','Hotellet ligger i hjertet af det ekstraordinære vulkanske grænseområde, og alle gæster har ubegrænset adgang til Retreat Spa, Retreat Lagoon, Blue Lagoon og Blue Lagoon Ritual samt hudplejefaciliteter. Hver suite er designet til ultimativ gæstfrihed og velvære og er fundamentet for en afslappende, foryngende og udforskende oplevelse.\n\nDette hotel byder på daglige guidede grupperejser og yoga-sessioner samt eftermiddagskinesisk kaffe i den fælles lounge. Der er døgnåben reception, concierge-service og parkeringsservice. Der serveres a la carte-morgenmad hver morgen.\n\nGæster på Retreat at Blue Lagoon Iceland vil kunne nyde aktiviteter i og omkring Grindavík såsom vandreture. Der er også fitnesscenter på overnatningsstedet som gæsterne har adgang til. Keflavík Lufthavn ligger kun 23 km fra overnatningsstedet.\n\nDette overnatningssted har fået en af de bedste karakterer i Grindavík for beliggenheden! Gæsterne synes bedre om den i forhold til andre overnatningssteder i området.\n\nPar er særligt glade for beliggenheden – de har givet den karakteren 9,8.\n\nDette overnatningssted har fået en god karakter for \"Valuta for pengene\" i Grindavík! Gæsterne får mere for pengene i forhold til andre overnatningssteder i byen.\n\n','Norðurljósavegur 9',29,'+354 420 8800',5,53,'2023-08-11 13:38:28','2023-08-11 13:38:28',NULL);

/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `HOTEL TIMES` BEFORE INSERT ON `hotels` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;

INSERT INTO `images` (`id`, `title`, `filename`, `created_at`, `updated_at`)
VALUES
	(1,'Frankfurt Skyline ©','frankfurt-skyline-germany.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(2,'Gdansk Center Church ©','gdansk-center-church-poland.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(3,'Møns Klint, Danmark ©','mons-klint-denmark.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(4,'National Park, Sverige ©','national-park-sweden.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(5,'National Park, Finland ©','nature-park-finland.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(6,'Solnedgang, Norge ©','sunset-mountains-norway.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(7,'Havnen i Gøteborg ©','harbour-gothenburg.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(8,'Havnefront, Stockholm ©','waterfront-stockholm.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(9,'Tagtoppe, Helsinki ©','rooftops-helsinki.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(10,'Landskab, Jönköbing ©','landscape-jonkobing.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(11,'Gadedøre, Rauma ©','streetdoors-rauma.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(12,'Nyhavn, København ©','nyhavn-copenhagen.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(13,'Streetart, Aalborg ©','streetart-aalborg.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(14,'Hjuldamper, Silkeborg ©','hjuldamper-silkeborg.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(15,'Solnedgang, Aarhus Havn ©','solnedgang-aarhus-havn.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(16,'Luftfoto, Lillehammer ©','luftfoto-lillehammer.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(17,'Operahuset i Oslo ©','operahus-oslo.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(18,'Luftfoto, Tromsø ©','harbour-tromso.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(19,'TV Tårnet i Berlin ©','teletower-berlin.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(20,'Fiskemarked, Hamborg ©','fishmarket-hamborg.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(21,'Center Square, Wroclaw ©','center-square-wroclaw.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(22,'Hotel Overlook Europa ©','overlook-europa.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(23,'Hotel Overlook Crown ©','overlook-crown.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(24,'Hotel Overlook Grand Central ©','overlook-gc-stockholm.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(25,'Hotel Overlook Haymarket ©','overlook-haymarket.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(26,'Hotel Overlook Portalen ©','overlook-portalen.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(27,'Hotel Overlook Grand Marina ©','overlook-grand-marina.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(28,'Hotel Overlook Seurahuone ©','overlook-seurahuone.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(29,'Hotel Overlook Rauma ©','overlook-rauma.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(30,'Hotel Overlook Webers ©','overlook-webers.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(31,'Hotel Overlook Copenhagen ©','overlook-copenhagen.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(32,'Hotel Overlook Aalborg City ©','overlook-aalborg-city.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(33,'Hotel Overlook Aalborg Øst ©','overlook-aalborg-oest.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(34,'Hotel Overlook Silkeborg ©','overlook-silkeborg.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(35,'Hotel Overlook Mayor ©','overlook-the-mayor.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(36,'Hotel Overlook Aarhus City ©','overlook-aarhus-city.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(37,'Hotel Overlook Hafjell ©','overlook-hafjell.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(38,'Hotel Overlook Victoria ©','overlook-victoria.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(39,'Hotel Overlook Grand  ©','overlook-grand-hotel.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(40,'Hotel Overlook Holmenkollen Park ©','overlook-holmenkollen.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(41,'Hotel Overlook Ishavshotel ©','overlook-ishavshotel.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(42,'Hotel Overlook Grand Tromsø ©','overlook-grand-tromsoe.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(43,'Hotel Overlook Potsdamer Platz ©','overlook-potsdamer-platz.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(44,'Hotel Overlook Kurfurstendamm ©','overlook-kurfurstendamm.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(45,'Hotel Overlook Hamburg Emporio ©','overlook-hamburg-emporio.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(46,'Hotel Overlook Frankfurt Museumsufer ©','overlook-frankfurt-museumsufer.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(47,'Hotel Overlook Gdansk ©','overlook-gdansk.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(48,'Hotel Overlook Wroclaw ©','overlook-wroclaw.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(49,'Seljalandvoss, Island ©','seljalandvoss-iceland.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(50,'Luftfoto af Reykjavik ©','city-houses-reykjavik.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(51,'Overlook Grand Hotel Reykjavik©','overlook-grand-hotel-reykjavik.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(52,'Lagune Landskab Keflavik ©','lagoon-keflavik.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(53,'Hotel Overlook The Blue Lagoon ©','the-blue-lagoon.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(62,'Economy Badeværelse ©','room-economy-bathroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(63,'Economy Soveværelse ©','room-economy-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(64,'Junior Suite Soveværelse ©','room-junior-suite-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(65,'Junior Suite Stue ©','room-junior-suite-livingroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(66,'Junior Suite Minibar ©','room-junior-suite-minibar.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(67,'Junior Suite Arbejdsplads ©','room-junior-suite-workplace.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(68,'Presidential Soveværelse ©','room-presidental-suite-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(69,'Presidential Etager ©','room-presidental-suite-floors.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(70,'Presidential Stue ©','room-presidental-suite-livingroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(71,'Standard Soveplads ©','room-standard-bed.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(72,'Standard Soveværelse ©','room-standard-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(73,'Standard Badeværelse ©','room-standard-shower.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(74,'Standard Single Soveplads ©','room-standard-single-bed.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(75,'Superior Soveplads ©','room-superior-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(76,'Superior Plus Soveværelse ©','room-superior-plus-bedroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(77,'Superior Plus Stol ©','room-superior-plus-chair.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(78,'Superior Plus Stue ©','room-superior-plus-livingroom.jpg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(79,'Landwerhkanal Berlin','nyhed-berlin.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(80,'Gdansk Havn','nyhed-gdansk.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(81,'Island ','nyhed-island.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(82,'Hamborg Kanal','nyhed-hamborg.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(83,'Frankfurt By Night','nyhed-frankfurt.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49'),
	(84,'Stockholm - Perle i Sverige','nyhed-stockholm.jpeg','2023-08-11 13:19:49','2023-08-11 13:19:49');

/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `SQL FIX` BEFORE INSERT ON `images` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_id` int DEFAULT NULL,
  `datetime` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `teaser` text NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `image_id`, `datetime`, `title`, `teaser`, `content`, `created_at`, `updated_at`)
VALUES
	(1,81,1568197083,'Island - hot og intensiv','Nyd en forlænget weekend i Islands hovedstad Reykjavik. Vi har lavet en grundpakke og kan tilføje alle de oplevelser du kunne tænke dig.','Tag med og oplev Island \"hot og intensiv\". På denne tur indkvarteres du i Reykjavik på 3-4 stjernet hotel. I perioden fra september til start april er der gode chancer for at opleve nordlys. Modsat oplever du fra april til august lange lyse dage - endda 24 timers dagslys fra maj til juli. \n\nFå fyldt batterierne på en forlænget weekend i en af verdens mindste hovedstæder. Der er gode muligheder for shopping, lækre gourmetmiddage og som en ekstra bonus ligger naturen lige udenfor døren.\nUdflugter på rejsen til Island\nDen Gyldne Cirkel, der er blandt Islands Top 3 udflugtsmål, er naturligvis inkluderet i denne rejse, samt en heldagsudflugt langs sydkysten med vandfald, gletejsere og sorte lavastrande.\nFlyv direkte med Icelandair fra København. Rejsen sammensætter vi helt efter dine ønsker. Det er naturligvis også muligt at forlænge rejsen med flere nætter eller at tage et stopover i Reykjavik på vejen til Nordamerika - på din rejse til staterne eller Canada. Mulighederne er mange, bare spørg os. Oplev skønne Island hele året - der er frit valg på alle hylder i forhold til afrejse! \nBemærk, at børn til og med 11 år kommer med gratis på de fleste udflugter.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(2,79,1568199191,'Berlin fra den anden side','Mere end 1 million turister besøger hvert år den tyske hovedstad. Vi guider til nogle af byens åndehuller, som endnu er relaltivt ukendte blandt turistmasserne.','Vil du lidt væk fra Berlins turistmylder i Mitte, så brug dagen på en gåtur langs Landwehrkanal. Gå ned gennem den jødisk/tyrkiske bydel Kreuzberg til Landwehrkanal ved Lindenstrasse og følg kanalen mod øst. På begge sider af kanalen er der grønne, parklignende stier, hvor du ugeneret af trafikken kan nyde et stykke af Berlin, som de lokale gør det. Langs kanalen ved Kottbusser Str. finder man et lille tyrkisk grøntsagsmarked. Køb et  par falafler, nogle kirsebær og lidt vand og tag det med på den fortsatte gåtur langs kanalen. Der er masser af bænke på vejen. \n\nHar man mod på at gå langt, kan man fortsætte turen helt til floden Spree. Gå over broen »Am Oberbaum« mod Østtysklands gamle hovedbanegård Ostbahnhof. Mellem broen og banegården passerer man det længste tilbageværende stykke af Berlinmuren. Muren er dekoreret af kunstnere, der har malet deres tolkning af forholdet mellem det gamle Øst- og Vesttyskland. Husk at se muren fra begge sider. På siden ud mod floden er muren udsmykket med store fotografier af »adskillelsesmure« andre steder i verden, bl.a. af den godt ti år gamle mur mellem israelere og palæstinensere på Vestbredden. Optrykt i stor størrelse gør billederne et kæmpe indtryk.\n\nSelv om muren er flittigt besøgt af turister, er murstykket så langt, at du sagtens kan gå i fred og ro og fordybe dig i billeder og fotografier.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(3,80,1568201173,'En weekend i: Besøg byen, hvor Anden Verdenskrig begyndte','Verdenshistorien har sat store spor i den polske havneby Gdansk, der netop har markeret 70-året for afslutningen af Anden Verdenskrig.','Anden Verdenskrigs første skud blev løsnet i havnebyen Gdansk 1. september 1939 og kastede Europa og resten af verden ud i krig i seks opslidende år.\n\nGodt 40 år efter blev den kommunistiske østbloks første frie fagforening dannet i Gdansk i 1980. Under ledelse af elektrikeren Lech Walesa protesterede strejkende værftsarbejdere mod de kommunistiske magthavere.\n\nStrejken og dannelsen af den frie fagforening Solidarnosc, Solidaritet, lagde grunden til det kommunistiske regimes fald og efterfølgende genforening af Europa.\n\nGdansk er en af Polens ældste og mest charmerende byer. Flere kendte personligheder, eksempelvis den tyske filosof Arthur Schopenhauer, den nyligt afdøde tyske forfatter Günter Grass og EU’s præsident, Donald Tusk, er født her.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(4,82,1568201896,'Hamborg: Det skal du opleve','Hamborg har de seneste 15 år oplevet en stadigt stigende strøm af gæster. Forståeligt. For Hamborg har meget at byde på til en lille storbyferie med et besøg i Elbphilharmonie som det absolutte højdepunkt.','Hamborg er et godt eksempel på, hvordan en by med gennemtænkt byudvikling kan ændre image og pludselig rykke højt op på turisternes rangliste.\n\nTilbage i 90\'erne var Hamborg nok for de fleste danskere en by med en tunnel under Elben, hvor der altid var kø. Et jernbaneknudepunkt, hvor man skulle skifte tog i en fart. Og en havneby med en industriel havn uden den store appel til byens gæster.\n\nI dag er det en helt anden historie. Flere og flere opdager Hamborg, som forfatter Lise Nørgaard begejstret har omtalt i mange år. Folk rejser til Hamborg for at opleve det nye liv omkring Hafen City, hvor den gamle, indre havn er blevet et stort rekreativt område med havnepromenade, caféer, butikker, boliger, Elbphilharmonie og de gamle trækplastre Speicherstadt og Fischmarkt.\n\nMen Hamborg er også fed shopping, hvad enten det skal være eksklusivt i Passagenviertel i indre by eller mere mainstream i den lange, brede gågade eller mere overraskende i St. Georg eller sjovt og skævt i de gader i St. Pauli, der er ved at blive lidt berliner-agtige. Dertil kommer det store udvalg af caféer og restauranter.\n\nHamborg har oplevet en markant stigning af turister inden for de seneste 15 år, og danskerne er i top tre, når det gælder udenlandske grupper med flest overnatninger. Vi stod for 155.000 overnatninger i første halvår i år, kun lige overgået af englændere og schweizere. Tyskerne tager sig selv af de fleste af de knap syv mio. overnatninger.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(5,83,1568202325,'Frankfurt – mere end bare en pølse','Frankfurt am Main (normalt bare omtalt som Frankfurt) er en af Tysklands vigtigste byer. Nok er Berlin hovedstaden, men Frankfurt er på mange måder det økonomiske centrum – byen huser for eksempel den europæiske centralbank, den tyske bundesbank og den største børs i Tyskland. Faktisk er der mange, der argumenterer for, at Frankfurt er en af de vigtigste finansbyer i hele verden.','Men det er ikke kun finansfolk, der kan drage nytte af en rejse til Frankfurt. Det er nemlig en super interessant by, som er nem at komme til. Trafikmæssigt er det et knudepunkt i det centrale Europa, og med en kæmpe togstation samt Tysklands mest benyttede lufthavn er det ganske overskueligt (og billigt) at finde billetter til Frankfurt.\n\nHer får du en rejseguide til Frankfurt, så du har lidt inspiration til at tage af sted – og så du ved, hvad du skal lave, når endelig beslutningen er truffet!\n\nGodt nok er Frankfurt en gammel by, men de fleste seværdigheder og attraktioner er ret nye. Byen blev nemlig gennembygget i årene efter 2. Verdenskrig, så der er primært tale om moderne seværdigheder. Men det gør ikke så meget, for de er stadig interessante. Jeg anbefaler, at du tjekker min mere gennemgående artikel om Frankfurts bedste attraktioner lige her!\n\nTransport i Frankfurt\nDu har mange muligheder, hvis du gerne vil til Frankfurt. Byen har en af verdens travleste lufthavne, idet Frankfurt er den primære base for det store selskab Lufthansa. Den centrale beliggenhed i det kontinentale Europa hjælper også til på dette punkt. Derfor er der altid propfyldt i lufthavnen, og det kan tage lidt tid at komme igennem. Heldigvis er det dog nemt at finde billige billetter til og fra Frankfurt. Der er afgange fra både København og Billund. Mange rejsende har også en mellemlanding i Frankfurt, når de skal videre til en anden destination, da der er så meget flytrafik, der går igennem.\n\nFrankfurt har også en togstation, som er ret nem at rejse fra og til. Fra Danmark kan du komme til Frankfurt via et enkelt stop i Hamborg. Forvent en pris på omkring 1.000 kroner hver vej.\n\nEllers er der langdistancebusser, der kommer forbi byen fra alle kanter af Tyskland.\n\nNår først du er i Frankfurt, kan du nemt tage metro eller sporvogn for at komme rundt. Jeg anbefaler systemet af sporvogne, som fungerer glimrende. Billeje er også en mulighed, men der er meget trafik. Ellers kan du selvfølgelig også cykle eller gå rundt. I den centrale del af Frankfurt (den historiske del) er det nemt at gå rundt og se de fleste seværdigheder.\n\nFrankfurt er en god by at besøge, hvis du gerne vil lidt rundt i området og se andre byer. Mindre interessante tyske byer ligger nemlig lige i nærheden: Darmstadt, Heidelberg, Mannheim, Stuttgart og Bonn.\n\nOvernatte i Frankfurt\nFrankfurt har et væld af hoteller, så det er aldrig svært at finde et sted at overnatte. Grundet byens ry som finansby er der mange hoteller, der specifikt henvender sig til forretningsrejsende, men der er også utroligt mange turisthoteller. Prisklassen ligger højt for Tyskland, og hoteller i Frankfurt er faktisk dyrere, end de er i Berlin – dog lidt billigere end i München.\n\nJeg anbefaler stærkt, at du ser nærmere på denne artikel, hvor jeg beskriver nogle af Frankfurts bedste hoteller for danskere, der bare gerne vil rejse til byen for at få sig en oplevelse.\n\nPrisniveauet\nPriserne i Frankfurt er i den dyre ende, når vi sammenligner med andre dele af Tyskland. Byen er dyrere at besøge end Berlin, og nok på samme niveau som Hamborg. Det er dog stadig ret rimeligt i forhold til danske priser. På flybilletter kan du spare en del (der er mange billige fly til Frankfurt), og finder du et godt hotel, så har du formentligt penge til rådighed til seværdigheder, restauranter, osv.\n\nRestauranterne i Frankfurt er rigtigt gode. Forvent at betale det samme, som hvis du skulle besøge en god restaurant i Danmark. Du bør selvfølgelig spise schnitzel og drikke æblevin, når du besøger Frankfurt. Det er nogle ting, som byen – og hele området – er kendt for!\n\nTransport rundt i byen er dog forholdsvis billigt. Det koster kun få euro at tage sporvognen rundt, så det kan stærkt anbefales.\n\nSikkerhed\nEt lidt negativt punkt ved Frankfurt er, at det er en by med forholdsvis meget kriminalitet. Den fører i hvert fald an i kriminalstatistikkerne i Tyskland. Nabobyen Offenbach er dog den største synder, så du bør være lidt forsigtig, hvis du drager lidt øst for Frankfurt.\n\nMed alt sagt så er det dog begrænset hvor meget kriminalitet, der involverer turister og rejsende. De fleste kommer aldrig ud for noget. Men brug din sunde fornuft – gå ikke alene ud om natten, hold dig fra skumle områder, og gå ikke rundt med en masse kontanter. Pas på lommetyve i metro, tog og busser. Ser du noget gadekriminalitet, så søg efter sikkerhed og anmeld det til politiet.\n\nKonklusion\nJeg håber, at du kunne bruge denne Frankfurt rejseguide til noget brugbart. Det er ikke en perfekt by, og det er nok heller ikke den mest interessante i Tyskland – der er hård konkurrence fra byer som Berlin og München! Men Frankfurt er stadig et rigtigt godt rejsemål, især hvis du ikke har set byen før. Det er en meget moderne del af Tyskland, hvor der altid sker noget nyt, og hvor det i øvrigt er nemt at tage rundt til flere andre spændende byer i nærheden.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(6,84,1568206289,'De smukkeste 24 timer i Stockholm','Stockholm er kun en times flyvetur væk og aldrig et kedeligt sted at tilbringe et døgn. Byen bliver kaldt Nordens Venedig, fordi den er fordelt på 14 øer. Læs, hvor du skal shoppe, spise, se kunst og sove i den smukkeste hovedstad tæt på Danmark.','Her skal du spise Brunch hos ABBA-stjerne\nStart med morgenmad i cafeen på Hotel Rival, som den tidligere ABBA-stjerne Benny Andersson ejer. Hotellet er indrettet i en tidligere biograf og rummer et bageri og et koncertsted, hvor du også kan opleve modeshows, standup, filmforevisninger og drikke cocktails. Men om morgenen skal du bare nyde dine croissanter og lade bydelen Södermalm eller Söder, som den kaldes af de lokale, vågne op stille og roligt omkring den blomstrende park og boulebanerne på Mariatorget.\nHotel Rival, Mariatorget 3, Rival.se\n\nUrbant madmekka\nIkke langt fra Götgatan ligger Nytorg, hvor du kan tilbringe timer, uanset hvad tid på dagen du kommer. For på torvet og i den lille, tilstødende park mødes Söderbeboerne døgnet rundt – aktivister, kunstnere, børnefamilier, ældre langhårede hippier og unge forretningsmænd i Porscher. Det bedste sted til peoplewatching er Urban Deli, der ikke bare er en restaurant, men også et øko-minimadmarked – en slags Dean & DeLuca i svensk version. Her kan du hente din yndlingsost, købe lakridser fra Gotland eller bløde kanelbullar til kaffen. Restauranten er typisk ret booket om aftenen, men det er værd at tage en drink i baren og vente på, at der kommer et bord. Hele menukortet bygger på friske råvarer fra torvehallerne eller saluhallarne, som det hedder på svensk.','2023-08-11 13:29:25','2023-08-11 13:29:25'),
	(7,84,1568207240,'Vi bygger et nyt hotel i København – Villa Copenhagen!','I 2020 kan du tage en tur i Tivoli, sætte dig i en karrusel og nyde udsigten over dit hjem for natten – vores nye hotel Villa Copenhagen.','I 2020 åbner Villa Copenhagen i den tidligere postbygning, som ligger lige ved Københavns Hovedbanegård og Tivoli. Villa Copenhagen bliver et moderne mødested lige i hjertet af kultur, kulinariske oplevelser, business og shopping i hovedstaden. Hotellet får 390 værelser og suiter, træningsrum og relaxområde med bassin, restaurant og bar samt moderne konferencefaciliteter.','2023-08-11 13:29:25','2023-08-11 13:29:25');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `NEWS TEST` BEFORE INSERT ON `news` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table orgs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orgs`;

CREATE TABLE `orgs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `orgs` WRITE;
/*!40000 ALTER TABLE `orgs` DISABLE KEYS */;

INSERT INTO `orgs` (`id`, `name`, `address`, `zipcode`, `city`, `country`, `email`, `phone`, `created_at`, `updated_at`)
VALUES
	(1,'TechCollege','Øster Uttrupvej 1A',9000,'Aalborg','Denmark','info@techcollege.dk','72501000','2023-08-11 16:29:37','2023-08-11 16:29:37');

/*!40000 ALTER TABLE `orgs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_facilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_facilities`;

CREATE TABLE `room_facilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `room_facility_category_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_facility_category_id` (`room_facility_category_id`),
  CONSTRAINT `room_facilities_ibfk_1` FOREIGN KEY (`room_facility_category_id`) REFERENCES `room_facility_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `room_facilities` WRITE;
/*!40000 ALTER TABLE `room_facilities` DISABLE KEYS */;

INSERT INTO `room_facilities` (`id`, `title`, `room_facility_category_id`, `created_at`, `updated_at`)
VALUES
	(1,'Elkedel med kaffe/te',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(2,'Fri WiFi',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(3,'Hårtørrer',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(4,'Ikke-ryger',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(5,'Luftkøling',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(6,'Minibar',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(7,'Mørklægningsgardiner',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(8,'Pengeskab',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(9,'Strygebræt og strygejern',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(10,'Fransk altan (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(11,'God plads',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(12,'Balkon (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(13,'Stol/stole',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(14,'Tilstødende værelser (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(15,'Trægulv (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(16,'Udsigt',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(17,'Separat soveværelse (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(18,'Separat stue (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(19,'Sofa med bord',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(20,'Badekåber',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(21,'Balkon eller terrasse',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(22,'Udsigt (tilgængelig i nogle værelser)',1,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(23,'Queen-size Seng',2,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(24,'Enkeltseng',2,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(25,'To separate enkeltsenge',2,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(26,'King-size seng',2,'2023-08-11 13:34:31','2023-08-11 13:34:31'),
	(27,'Senge til 3 gæster',2,'2023-08-11 13:34:31','2023-08-11 13:34:31');

/*!40000 ALTER TABLE `room_facilities` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ROOM FAC` BEFORE INSERT ON `room_facilities` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table room_facility_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_facility_categories`;

CREATE TABLE `room_facility_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `room_facility_categories` WRITE;
/*!40000 ALTER TABLE `room_facility_categories` DISABLE KEYS */;

INSERT INTO `room_facility_categories` (`id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,'Generelt udstyr','2023-08-11 13:33:38','2023-08-11 13:33:38'),
	(2,'Senge','2023-08-11 13:33:38','2023-08-11 13:33:38');

/*!40000 ALTER TABLE `room_facility_categories` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ROOM FAC CAT` BEFORE INSERT ON `room_facility_categories` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table room_facility_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_facility_rel`;

CREATE TABLE `room_facility_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `room_facility_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `room_facility_id` (`room_facility_id`),
  CONSTRAINT `room_facility_rel_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_facility_rel_ibfk_2` FOREIGN KEY (`room_facility_id`) REFERENCES `room_facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `room_facility_rel` WRITE;
/*!40000 ALTER TABLE `room_facility_rel` DISABLE KEYS */;

INSERT INTO `room_facility_rel` (`id`, `room_id`, `room_facility_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,1),
	(5,5,1),
	(6,6,1),
	(7,7,1),
	(8,1,2),
	(9,2,2),
	(10,3,2),
	(11,4,2),
	(12,5,2),
	(13,6,2),
	(14,7,2),
	(15,1,3),
	(16,2,3),
	(17,3,3),
	(18,4,3),
	(19,5,3),
	(20,6,3),
	(21,7,3),
	(22,1,4),
	(23,2,4),
	(24,3,4),
	(25,4,4),
	(26,5,4),
	(27,6,4),
	(28,7,4),
	(29,1,5),
	(30,2,5),
	(31,3,5),
	(32,4,5),
	(33,5,5),
	(34,6,5),
	(35,7,5),
	(36,1,6),
	(37,2,6),
	(38,3,6),
	(39,4,6),
	(40,5,6),
	(41,6,6),
	(42,7,6),
	(43,1,7),
	(44,2,7),
	(45,3,7),
	(46,4,7),
	(47,5,7),
	(48,6,7),
	(49,1,8),
	(50,2,8),
	(51,3,8),
	(52,4,8),
	(53,5,8),
	(54,6,8),
	(55,7,8),
	(56,1,9),
	(57,2,9),
	(58,3,9),
	(59,4,9),
	(60,5,9),
	(61,6,9),
	(62,7,9),
	(63,2,10),
	(64,3,11),
	(65,4,11),
	(66,3,12),
	(67,3,13),
	(68,3,14),
	(69,5,14),
	(70,5,15),
	(71,3,16),
	(72,5,16),
	(73,4,17),
	(74,5,17),
	(75,4,18),
	(76,5,18),
	(77,4,19),
	(78,5,19),
	(79,4,20),
	(80,5,20),
	(81,5,21),
	(82,5,22),
	(83,1,23),
	(84,7,23),
	(85,2,25),
	(86,3,25),
	(87,7,25),
	(88,2,26),
	(89,3,26),
	(90,4,27),
	(91,5,27);

/*!40000 ALTER TABLE `room_facility_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_image_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_image_rel`;

CREATE TABLE `room_image_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `image_id` int NOT NULL,
  `order_num` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `room_image_rel_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_image_rel_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `room_image_rel` WRITE;
/*!40000 ALTER TABLE `room_image_rel` DISABLE KEYS */;

INSERT INTO `room_image_rel` (`id`, `room_id`, `image_id`, `order_num`)
VALUES
	(17,1,63,1),
	(18,1,62,2),
	(19,2,75,1),
	(20,3,76,1),
	(21,3,77,2),
	(22,3,78,3),
	(23,4,64,2),
	(24,4,65,1),
	(25,4,66,3),
	(26,4,67,4),
	(27,5,68,1),
	(28,5,69,2),
	(29,5,70,3),
	(30,6,74,1),
	(31,7,72,1),
	(32,7,73,2);

/*!40000 ALTER TABLE `room_image_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `num_persons` int NOT NULL,
  `area` varchar(255) NOT NULL,
  `day_price_normal` int NOT NULL,
  `day_price_flex` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;

INSERT INTO `rooms` (`id`, `slug`, `title`, `description`, `num_persons`, `area`, `day_price_normal`, `day_price_flex`, `created_at`, `updated_at`)
VALUES
	(1,'economy','Economy','Vores economyværelser har alt, hvad du har brug for når du er på de korte ture.',2,'15 - 17 m²',1123,1403,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(2,'superior','Superior','Vores flotte superiorværelser tilbyder mere plads til at slappe af på efter en lang dag på ferien. Se en film på TV\'et eller nyd lidt afslapning i badekarret.',2,'21 - 28 m²',1318,1647,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(3,'superior-plus','Superior Plus','Giv din ferie et ekstra pift ved at bo i vores smukke superior plus-værelser. Nogle af værelserne har egen terrasse og udsigt til havet.',3,'28 - 33 m²',1555,1943,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(4,'junior-suite','Junior Suite','Vågn op til den charmerende balkon udsigt og slap af med et karbad i vores moderne badeværelser.',3,'49 - 52 m²',1811,2263,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(5,'presidental-suite','Presidential Suite','Et ophold i vores præsidentsuite, er et ophold i topklasse. Her har royale og kendte fra hele verden nydt udsigten over Overlooks smukke havelabyrint. I suiten er der 2 balkoner og walk-in closet til tøjet.',3,'58 m²',2983,3075,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(6,'standard-single','Standard Single','Hvis du er på et kort besøg, er vores standard single værelser ideelle.',1,'15 - 17 m²',1027,1283,'2023-08-11 13:42:01','2023-08-11 13:42:01'),
	(7,'standard','Standard','Vågn op til den charmerende udsigt af den gamle bydel og slap af med et karbad i vores moderne badeværelser.\n\n',2,'17 - 22 m²',1208,1509,'2023-08-11 13:42:01','2023-08-11 13:42:01');

/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ROOM` BEFORE INSERT ON `rooms` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table user_group_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_group_rel`;

CREATE TABLE `user_group_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_group_rel_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_group_rel_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `user_group_rel` WRITE;
/*!40000 ALTER TABLE `user_group_rel` DISABLE KEYS */;

INSERT INTO `user_group_rel` (`id`, `group_id`, `user_id`)
VALUES
	(2,1,1);

/*!40000 ALTER TABLE `user_group_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_reservations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_reservations`;

CREATE TABLE `user_reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `room_id` int NOT NULL,
  `is_flex` int NOT NULL,
  `num_persons` int NOT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `user_reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_reservations_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `user_reservations_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `RESERVATIONS` BEFORE INSERT ON `user_reservations` FOR EACH ROW BEGIN
    SET NEW.created_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
    SET NEW.updated_at = FROM_UNIXTIME(UNIX_TIMESTAMP());
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table user_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_reviews`;

CREATE TABLE `user_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_stars` enum('1','2','3','4','5') NOT NULL,
  `user_id` int NOT NULL,
  `hotel_id` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `org_id` int DEFAULT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `orgs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `org_id`, `refresh_token`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'John','Doe','info@overlook.dk','$2b$10$tt1jtoli2F/wrdiZBViDje1ikfaWi.PgXK7Pptb1sdWfAZwLnPNCK',1,'1234',1,'2023-08-20 19:20:57','2023-08-20 19:20:57');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
