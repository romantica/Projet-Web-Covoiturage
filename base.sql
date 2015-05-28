-- MySQL Script generated by MySQL Workbench
-- mar. 12 mai 2015 16:54:24 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Utilisateurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utilisateurs` (
  `id_utilisteurs` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `annee_naissance` DATE NULL,
  `civilite` TINYINT(1) NULL,
  `photo` VARCHAR(100) NULL,
  `description` VARCHAR(200) NULL,
  `type_compte` TINYINT(1) NULL,
  `telephone` INT NULL,
  `score` INT NULL,
  PRIMARY KEY (`id_utilisteurs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trajets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trajets` (
  `id_trajets` INT NOT NULL AUTO_INCREMENT,
  `nombres_places` INT NULL,
  `modele_voiture` VARCHAR(45) NULL,
  `date_depart` VARCHAR(45) NULL,
  `ville_depart` VARCHAR(45) NULL,
  `ville_arrivee` VARCHAR(45) NULL,
  `fumeur_auth` TINYINT(1) NULL,
  `animal_auth` TINYINT(1) NULL,
  `handicape_auth` TINYINT(1) NULL,
  `femmes_uniquement` TINYINT(1) NULL,
  `hommes_uniquement` TINYINT(1) NULL,
  `taille_bagage` VARCHAR(45) NULL,
  `dates_publication` DATE NULL,
  PRIMARY KEY (`id_trajets`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Messages` (
  `idmessage` INT NOT NULL AUTO_INCREMENT,
  `sujet` VARCHAR(45) NULL,
  `message` VARCHAR(300) NULL,
  `id_emetteur` INT NULL,
  `id_destinataire` INT NULL,
  PRIMARY KEY (`idmessage`),
  INDEX `fk_messagerie_1_idx` (`id_emetteur` ASC),
  INDEX `fk_messagerie_2_idx` (`id_destinataire` ASC),
  CONSTRAINT `fk_messagerie_1`
    FOREIGN KEY (`id_emetteur`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messagerie_2`
    FOREIGN KEY (`id_destinataire`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserver` (
  `id_reservation` INT NOT NULL AUTO_INCREMENT,
  `id_passager` INT NOT NULL,
  `id_trajet` INT,
  PRIMARY KEY (`id_reservation`),
  INDEX `fk_Reserver_1_idx` (`id_passager` ASC),
  INDEX `fk_Reserver_2_idx` (`id_trajet` ASC),
  CONSTRAINT `fk_Reserver_1`
    FOREIGN KEY (`id_passager`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserver_2`
    FOREIGN KEY (`id_trajet`)
    REFERENCES `mydb`.`Trajets` (`id_trajets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proposer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proposer` (
  `id_proposer` INT NOT NULL AUTO_INCREMENT,
  `id_conducteur` INT NULL,
  `id_trajet` INT,
  INDEX `fk_Proposer_1_idx` (`id_trajet` ASC),
  PRIMARY KEY (`id_proposer`),
  CONSTRAINT `fk_Proposer_1`
    FOREIGN KEY (`id_trajet`)
    REFERENCES `mydb`.`Trajets` (`id_trajets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proposer_2`
    FOREIGN KEY (`id_conducteur`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Commentaire_utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Commentaire_utilisateur` (
  `id_commentaire_utilisateur` INT NOT NULL AUTO_INCREMENT,
  `id_utilisateur` INT NULL,
  `commentaire_utilisateur` VARCHAR(200) NULL,
  PRIMARY KEY (`id_commentaire_utilisateur`),
  INDEX `fk_Commentaire_utilisateur_1_idx` (`id_utilisateur` ASC),
  CONSTRAINT `fk_Commentaire_utilisateur_1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historique_trajets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Historique_trajets` (
  `id_historique_trajets` INT NOT NULL AUTO_INCREMENT,
  `date_depart` VARCHAR(45) NULL,
  `ville_depart` VARCHAR(45) NULL,
  `ville_arrivee` VARCHAR(45) NULL,
  `id_conducteur` INT NULL,
  `Historique_trajetscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_historique_trajets`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partenaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Partenaires` (
  `id_partenaires` INT NOT NULL AUTO_INCREMENT,
  `nom_partenaire` VARCHAR(100) NULL,
  `nom_contact` VARCHAR(45) NULL,
  `adresse_mail` VARCHAR(100) NULL,
  PRIMARY KEY (`id_partenaires`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cadeaux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadeaux` (
  `id_cadeaux` INT NOT NULL AUTO_INCREMENT,
  `id_partenaire` INT NULL,
  `nom_cadeau` VARCHAR(100) NULL,
  `nom_image_cadeau` VARCHAR(100) NULL,
  `score_necessaire` INT NULL,
  PRIMARY KEY (`id_cadeaux`),
  INDEX `fk_Cadeaux_1_idx` (`id_partenaire` ASC),
  CONSTRAINT `fk_Cadeaux_1`
    FOREIGN KEY (`id_partenaire`)
    REFERENCES `mydb`.`Partenaires` (`id_partenaires`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Noter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Noter` (
  `id_Noter` INT NOT NULL AUTO_INCREMENT,
  `id_receveur_note` INT NULL,
  `id_donneur_note` INT NULL,
  `note` INT NULL,
  PRIMARY KEY (`id_Noter`),
  INDEX `fk_Noter_1_idx` (`id_receveur_note` ASC),
  INDEX `fk_Noter_2_idx` (`id_donneur_note` ASC),
  CONSTRAINT `fk_Noter_1`
    FOREIGN KEY (`id_receveur_note`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Noter_2`
    FOREIGN KEY (`id_donneur_note`)
    REFERENCES `mydb`.`Utilisateurs` (`id_utilisteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET foreign_key_checks = 0;

-- Partenaires
INSERT INTO Partenaires VALUES (1, 'SPIDEE', 'John', 'john.snow@gmail.com');
INSERT INTO Partenaires VALUES (2, 'CARGLACE', 'Jack', 'jack.leventreur@gmail.com');
INSERT INTO Partenaires VALUES (3, 'MICKELIN', 'Joe', 'joe.dassens@gmail.com');

-- Cadeaux
INSERT INTO Cadeaux VALUES (1, 1, 'porte clé', 'porte_cles_1.png', 1000);
INSERT INTO Cadeaux VALUES (2, 1, 'balle plastique', 'balle_plastique_1.png', 1000);

INSERT INTO Cadeaux VALUES (3, 2, 'porte clé', 'porte_cles_2.png', 1000);
INSERT INTO Cadeaux VALUES (4, 2, 'balle rebondissante', 'balle_rebondissante_1.png', 1000);

INSERT INTO Cadeaux VALUES (5, 3, 'porte clé', 'porte_cles_3.png', 1000);
INSERT INTO Cadeaux VALUES (6, 3, 'carte postale', 'carte_postale_1.png', 1000);

-- Utilisateurs
INSERT INTO Utilisateurs VALUES (1, 'damien.flahou@hotmail.com', 'damien', 'Damien', 'Flahou', '01/01/1993', 0, '', 'Jeune cadre dynamique', 0, 0123456789, 0);
INSERT INTO Utilisateurs VALUES (2, 'maichristine.hoang@gmail.com', 'mai', 'Mai', 'Hoang', '07/04/1994', 1, '', 'Développeuse web Front-end', 0, 0246813579, 0);
INSERT INTO Utilisateurs VALUES (3, 'paul.sfeir@gmail.com', 'paul', 'Paul', 'Sfeir', '01/06/1994', 0, '', 'Jeune cadre dynamique', 1, 0987654321, 1000);

SET foreign_key_checks = 1;
