CREATE DATABASE IF NOT EXISTS rpp;
USE rpp;

/*
CREATE USER 'visualizacao'@'localhost' IDENTIFIED BY 'rpp1234';	
GRANT SELECT ON rpp.* TO 'visualizacao'@'localhost';
GRANT INSERT ON rpp.* TO 'visualizacao'@'localhost';
*/

CREATE TABLE IF NOT EXISTS `classe` (
  `idClasse` varchar(45) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `ficha` (
  `idFicha` int NOT NULL,
  `user_idUser` int NOT NULL,
  `vivo` tinyint NOT NULL DEFAULT 1,
  `nivel` int NOT NULL DEFAULT 1,
  `deslocamento` float NOT NULL DEFAULT 9,
  `dadoDeVida` int NOT NULL DEFAULT 6,
  `pontosDeVidaBase` int NOT NULL DEFAULT 1,
  `pontosDeVIdaTemporario` int NOT NULL DEFAULT 0,
  `inspiracao` tinyint NOT NULL DEFAULT 0,
  `nomePersonagem` varchar(45) NOT NULL DEFAULT '',
  `classe_idClasse` varchar(45) DEFAULT NULL,
  `raca_idRaca` varchar(45) DEFAULT NULL,
  `antecedente` varchar(45) NOT NULL DEFAULT '',
  `tendencia` varchar(45) NOT NULL DEFAULT '',
  `xp` int NOT NULL DEFAULT 0,
  `idade` int DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `olho` varchar(45) NOT NULL DEFAULT '',
  `pele` varchar(45) NOT NULL DEFAULT '',
  `cabelo` varchar(45) NOT NULL DEFAULT '',
  `forca` int NOT NULL DEFAULT 10,
  `destreza` int NOT NULL DEFAULT 10,
  `constituicao` int NOT NULL DEFAULT 10,
  `inteligencia` int NOT NULL DEFAULT 10,
  `sabedoria` int NOT NULL DEFAULT 10,
  `carisma` int NOT NULL DEFAULT 10,
  `p_forca` tinyint NOT NULL DEFAULT 0,
  `p_destreza` tinyint NOT NULL DEFAULT 0,
  `p_constituicao` tinyint NOT NULL DEFAULT 0,
  `p_inteligencia` tinyint NOT NULL DEFAULT 0,
  `p_sabedoria` tinyint NOT NULL DEFAULT 0,
  `p_carisma` tinyint NOT NULL DEFAULT 0,
  `p_acrobacia` tinyint NOT NULL DEFAULT 0,
  `p_arcanismo` tinyint NOT NULL DEFAULT 0,
  `p_atletismo` tinyint NOT NULL DEFAULT 0,
  `p_atuacao` tinyint NOT NULL DEFAULT 0,
  `p_blefar` tinyint NOT NULL DEFAULT 0,
  `p_furtividade` tinyint NOT NULL DEFAULT 0,
  `p_historia` tinyint NOT NULL DEFAULT 0,
  `p_intimidacao` tinyint NOT NULL DEFAULT 0,
  `p_intuicao` tinyint NOT NULL DEFAULT 0,
  `p_investigacao` tinyint NOT NULL DEFAULT 0,
  `p_lidarComAnimais` tinyint NOT NULL DEFAULT 0,
  `p_medicina` tinyint NOT NULL DEFAULT 0,
  `p_natureza` tinyint NOT NULL DEFAULT 0,
  `p_percepcao` tinyint NOT NULL DEFAULT 0,
  `p_persuasao` tinyint NOT NULL DEFAULT 0,
  `p_prestigitacao` tinyint NOT NULL DEFAULT 0,
  `p_religiao` tinyint NOT NULL DEFAULT 0,
  `p_sobrevivencia` tinyint NOT NULL DEFAULT 0,
  `historia` varchar(100) NOT NULL DEFAULT '',
  `aparencia` varchar(100) NOT NULL DEFAULT '',
  `personalidade` varchar(100) NOT NULL DEFAULT '',
  `ideal` varchar(100) NOT NULL DEFAULT '',
  `ligacao` varchar(100) NOT NULL DEFAULT '',
  `defeitos` varchar(100) NOT NULL DEFAULT '',
  `idiomas` varchar(100) NOT NULL DEFAULT '',
  `proficiencias` varchar(100) NOT NULL DEFAULT '',
  `inventario_idInventario` int DEFAULT NULL,
  `magiaUser_idMagiaUser` int DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `inventario` (
  `idInventario` int NOT NULL,
  `pc` int NOT NULL DEFAULT 0,
  `pp` int NOT NULL DEFAULT 0,
  `pe` int NOT NULL DEFAULT 0,
  `po` int NOT NULL DEFAULT 0,
  `pl` int NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `item` (
  `idItem` int NOT NULL,
  `inventario_idInventario` int NOT NULL,
  `tipo` enum('comum','consumivel','magico','equipavel','equipavelMagico','arma','armaMagica') NOT NULL DEFAULT 'comum',
  `nome` varchar(45) NOT NULL DEFAULT '',
  `descricao` varchar(45) NOT NULL DEFAULT '',
  `peso` float NOT NULL DEFAULT 0.1,
  `moeda` char(1) NOT NULL DEFAULT 'o',
  `preco` int NOT NULL DEFAULT 0,
  `usosMaximo` int DEFAULT NULL,
  `usos` int DEFAULT NULL,
  `efeito` varchar(45) DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `bonus_ca` int DEFAULT NULL,
  `proficiencia` tinyint DEFAULT NULL,
  `numeroDeDados` int DEFAULT NULL,
  `dadoDeDano` int DEFAULT NULL,
  `atributo` varchar(45) DEFAULT NULL
);

CREATE TABLE `magia` (
  `idMagia` int NOT NULL,
  `magiaUser_idMagiaUser` int NOT NULL,
  `tipo` enum('ataque','cura','efeito') NOT NULL DEFAULT 'efeito',
  `nome` varchar(45) NOT NULL DEFAULT '',
  `descricao` varchar(45) NOT NULL DEFAULT '',
  `nivel` int NOT NULL DEFAULT 0,
  `tempoConjuracao` varchar(45) NOT NULL DEFAULT '',
  `duracao` varchar(45) NOT NULL DEFAULT '',
  `alcance` varchar(45) NOT NULL DEFAULT '',
  `area` varchar(45) NOT NULL DEFAULT '',
  `escola` varchar(45) NOT NULL DEFAULT '',
  `tipoAcerto` enum('resistencia','teste','nenhum') NOT NULL DEFAULT 'nenhum',
  `ladoDado` int NOT NULL DEFAULT 6,
  `numeroDados` int NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS `magiauser` (
  `idMagiaUser` int NOT NULL,
  `nivel1` int NOT NULL DEFAULT 0,
  `nivel2` int NOT NULL DEFAULT 0,
  `nivel3` int NOT NULL DEFAULT 0,
  `nivel4` int NOT NULL DEFAULT 0,
  `nivel5` int NOT NULL DEFAULT 0,
  `nivel6` int NOT NULL DEFAULT 0,
  `nivel7` int NOT NULL DEFAULT 0,
  `nivel8` int NOT NULL DEFAULT 0,
  `nivel9` int NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `raca` (
  `idRaca` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(45) NOT NULL
);

ALTER TABLE `classe`
  ADD PRIMARY KEY (`idClasse`);

ALTER TABLE `ficha`
  ADD PRIMARY KEY (`idFicha`,`user_idUser`),
  ADD KEY `raca_idRaca` (`raca_idRaca`),
  ADD KEY `classe_idClasse` (`classe_idClasse`),
  ADD KEY `inventario_idInventario` (`inventario_idInventario`),
  ADD KEY `user_idUser` (`user_idUser`),
  ADD KEY `magiaUser_idMagiaUser` (`magiaUser_idMagiaUser`);

ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`);

ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`,`inventario_idInventario`),
  ADD KEY `inventario_idInventario` (`inventario_idInventario`);

ALTER TABLE `magia`
  ADD PRIMARY KEY (`idMagia`,`magiaUser_idMagiaUser`),
  ADD KEY `magiaUser_idMagiaUser` (`magiaUser_idMagiaUser`);

ALTER TABLE `magiauser`
  ADD PRIMARY KEY (`idMagiaUser`);

ALTER TABLE `raca`
  ADD PRIMARY KEY (`idRaca`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

ALTER TABLE `ficha`
  ADD CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`raca_idRaca`) REFERENCES `raca` (`idRaca`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ficha_ibfk_2` FOREIGN KEY (`classe_idClasse`) REFERENCES `classe` (`idClasse`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ficha_ibfk_3` FOREIGN KEY (`inventario_idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ficha_ibfk_4` FOREIGN KEY (`user_idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ficha_ibfk_5` FOREIGN KEY (`magiaUser_idMagiaUser`) REFERENCES `magiauser` (`idMagiaUser`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`inventario_idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `magia`
  ADD CONSTRAINT `magia_ibfk_1` FOREIGN KEY (`magiaUser_idMagiaUser`) REFERENCES `magiauser` (`idMagiaUser`) ON DELETE CASCADE ON UPDATE CASCADE;
  
/*  
INSERT INTO raca (idRaca, nome, descricao) VALUES
  ('anao', 'Anão', 'Resistente e habilidoso em montanhas'),
  ('elfo', 'Elfo', 'Gracioso e com afinidade arcana'),
  ('halfling', 'Halfling', 'Pequeno, ágil e sortudo'),
  ('humano', 'Humano', 'Adaptável e versátil'),
  ('draconato', 'Draconato', 'Híbrido humanoide com traços de dragão'),
  ('gnomo', 'Gnomo', 'Pequeno, inventivo e ilusionista'),
  ('meio-elfo', 'Meio-Elfo', 'Mistura de humano e elfo, diplomata'),
  ('meio-orc', 'Meio-Orc', 'Forte e resistente, com herança orc'),
  ('tiefling', 'Tiefling', 'Herança infernal e poderes sombrios');
*/

/*
INSERT INTO classe (idClasse, nome, descricao) VALUES
  ('barbaro', 'Bárbaro', 'Guerreiro feroz com fúria em batalha'),
  ('bardo', 'Bardo', 'Artista mágico que inspira aliados'),
  ('bruxo', 'Bruxo', 'Conjurador com pacto sobrenatural'),
  ('clerigo', 'Clérigo', 'Devoto com magias divinas'),
  ('druida', 'Druida', 'Guardião da natureza que se transforma'),
  ('feiticeiro', 'Feiticeiro', 'Magia inata no sangue'),
  ('guerreiro', 'Guerreiro', 'Mestre em combate físico'),
  ('ladino', 'Ladino', 'Especialista em furtividade'),
  ('mago', 'Mago', 'Estudioso de magias arcanas'),
  ('monge', 'Monge', 'Guerreiro espiritual com artes marciais'),
  ('paladino', 'Paladino', 'Cavaleiro sagrado com juramentos'),
  ('patrulheiro', 'Patrulheiro', 'Caçador e explorador'),
  ('artifice', 'Artífice', 'Inventor de engenhocas mágicas');
*/