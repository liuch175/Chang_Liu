
---IST 659 Final Project
---Chenghao Wu
CREATE DATABASE LOL 
GO
--------------------------------------------------DOWN---------------------------------------------------------------------------
---Purchases table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_purchase_champion_id')
ALTER TABLE purchases DROP CONSTRAINT fk_purchase_champion_id
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_purchase_mythic_id')
ALTER TABLE purchases DROP CONSTRAINT fk_purchase_mythic_id
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_purchase_legendary_id')
ALTER TABLE purchases DROP CONSTRAINT fk_purchase_legendary_id
GO
DROP TABLE IF EXISTS purchases

---Battles table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Battles_playerid')
ALTER TABLE Battles DROP CONSTRAINT fk_Battles_playerid
GO
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Battles_Championid')
ALTER TABLE Battles DROP CONSTRAINT fk_Battles_Championid
GO
DROP TABLE IF EXISTS Battles
GO

---Player table
DROP TABLE IF EXISTS Players
GO

---Basic_Mythic table

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_basic_mythic_forge')
ALTER TABLE Basic_Mythic_forge DROP CONSTRAINT fk_basic_mythic_forge
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_basic_mythic_forge2')
ALTER TABLE  Basic_Mythic_forge DROP CONSTRAINT fk_basic_mythic_forge2
GO

DROP TABLE IF EXISTS Basic_Mythic_forge
GO

---Basic_legendary table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_basic_legendary_forge')
ALTER TABLE Basic_Legendary_forge DROP CONSTRAINT fk_basic_legendary_forge
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_basic_legendary_forge2')
ALTER TABLE  Basic_Legendary_forge DROP CONSTRAINT fk_basic_legendary_forge2
GO

DROP TABLE IF EXISTS Basic_Legendary_forge


--Epic_Mythic_forge table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_epic_mythic_forge')
ALTER TABLE Epic_Mythic_forge DROP CONSTRAINT fk_epic_myhtic_forge
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_epic_mythic_forge2')
ALTER TABLE  Epic_Mythic_forge DROP CONSTRAINT fk_epic_mythic_forge2
GO

DROP TABLE IF EXISTS Epic_Mythic_forge
GO

--Epic_Legendary_forge table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_epic_legendary_forge')
ALTER TABLE Epic_Legendary_forge DROP CONSTRAINT fk_epic_legendary_forge
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_epic_legendary_forge2')
ALTER TABLE  Epic_Legendary_forge DROP CONSTRAINT fk_epic_legendary_forge2
GO

DROP TABLE IF EXISTS Epic_Legendary_forge
GO

---Basic_Epic forge table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Basic_Epic_forge')
ALTER TABLE Basic_Epic_forge DROP CONSTRAINT fk_Basic_Epic_forge
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Basic_Epic_forge2')
ALTER TABLE  Basic_Epic_forge DROP CONSTRAINT fk_Basic_Epic_forge2
GO

DROP TABLE IF EXISTS Basic_Epic_forge

---Mythic items table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_myth_item_tags')
ALTER TABLE Mythic_item_tags DROP CONSTRAINT fk_myth_item_tags

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_myth_item_tags1')
ALTER TABLE  Mythic_item_tags DROP CONSTRAINT fk_myth_item_tags1

DROP TABLE IF EXISTS Mythic_item_tags

DROP TABLE IF EXISTS Mythic_item_tags1

DROP TABLE IF EXISTS Mythic_items

--Legendary items table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Legen_item_tags')
ALTER TABLE Legendary_item_tags DROP CONSTRAINT fk_Legen_item_tags
GO
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Legedary_item_tags1')
ALTER TABLE  Legendary_item_tags DROP CONSTRAINT fk_Legedary_item_tags1
GO

DROP table if EXISTS Legendary_item_tags

DROP table if EXISTS Legendary_item_tags1

DROP TABLE IF EXISTS Legendary_items


---Epic_items table
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Epic_item_tags')
ALTER TABLE Epic_item_tags DROP CONSTRAINT fk_Epic_item_tags
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Epic_item_tags1')
ALTER TABLE  Epic_item_tags DROP CONSTRAINT fk_Epic_item_tags1
GO

DROP table if EXISTS Epic_item_tags

DROP table if EXISTS Epic_item_tags1

DROP TABLE IF EXISTS Epic_items

-- Basic_items table

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Basic_item_tags')
ALTER TABLE Basic_item_tags DROP CONSTRAINT fk_Basic_item_tags
GO

IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Basic_item_tags1')
ALTER TABLE  Basic_item_tags DROP CONSTRAINT fk_Basic_item_tags1
GO

DROP TABLE IF EXISTS Basic_item_tags

DROP TABLE IF EXISTS Basic_item_tags1

DROP TABLE IF EXISTS Basic_items

---CHAMPIONS 
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Champion_tags')
ALTER TABLE Champion_tags DROP CONSTRAINT fk_Champion_tags
GO
IF EXISTS (SELECT* FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_Champion_tags1')
ALTER TABLE  Champion_tags DROP CONSTRAINT fk_Champion_tags1
GO

DROP TABLE IF EXISTS Champions

DROP TABLE iF EXISTS Tags

DROP table if EXISTS Champion_tags1

DROP TABLE IF EXISTS Champion_tags

---------------------------------------------------UP----------------------------------------------------------------------------------------
---champions table
 CREATE TABLE Champions (
    [Champion_id] INT IDENTITY NOT NULL,
    [Champion_name] NVARCHAR(14) NOT NULL,
    [Tag] VARCHAR(18) NOT NULL,
    [Type] NVARCHAR(12) NOT NULL,
    [HP] NUMERIC(5, 2) NOT NULL,
    [HP_per_level] INT NOT NULL,
    [Magic_power] NUMERIC(5, 2) NOT NULL,
    [MP_per_level] NUMERIC(3, 1) NOT NULL,
    [Movespeed] INT NOT NULL,
    [Armor] NUMERIC(5, 3) NOT NULL,
    [Armor_per_level] NUMERIC(3, 2) NOT NULL,
    [Magic_resist] NUMERIC(3, 1) NOT NULL,
    [Magic_resist_per_level] NUMERIC(3, 2) NOT NULL,
    [HP_regen] NUMERIC(4, 2) NOT NULL,
    [HP_regen_per_level] NUMERIC(3, 2) NOT NULL,
    [MP_regen] NUMERIC(5, 3) NOT NULL,
    [MP_regen_per_level] NUMERIC(4, 3) NOT NULL,
    [Crit] INT NOT NULL,
    [attack_damage] NUMERIC(6, 4) NOT NULL,
    [attackdamage_per_level] NUMERIC(5, 4) NOT NULL,
    [attackspeed_per_level] NUMERIC(4, 3) NOT NULL,
    [attackspeed] NUMERIC(6, 5)  NOT NULL,
    CONSTRAINT pk_champions_Champion_id PRIMARY KEY(Champion_id),
    CONSTRAINT u_champion_Champion_name UNIQUE(Champion_name)
);
INSERT INTO champions VALUES
    (N'Aatrox','Fighter, Tank',N'Blood Well',580,90,0,0,345,38,3.25,32.1,1.25,3,1,0,0,0,60,5,2.5,0.651),
    (N'Ahri','Mage, Assassin',N'Mana',526,92,418,25,330,20.88,3.5,30,0.5,6.5,0.6,8,0.8,0,53.04,3,2,0.668),
    (N'Akali','Assassin',N'Energy',575,95,200,0,345,23,3.5,37,1.25,8,0.5,50,0,0,62.4,3.3,3.2,0.625),
    (N'Alistar','Tank, Support',N'Mana',600,106,350,40,330,44,3.5,32.1,1.25,8.5,0.85,8.5,0.8,0,62,3.75,2.125,0.625),
    (N'Amumu','Tank, Mage',N'Mana',613.12,84,287.2,40,335,33,3.8,32.1,1.25,9,0.85,7.382,0.525,0,53.38,3.8,2.18,0.736),
    (N'Anivia','Mage, Support',N'Mana',480,82,495,25,325,21.22,4,30,0.5,5.5,0.55,8,0.8,0,51.376,3.2,1.68,0.625),
    (N'Annie','Mage',N'Mana',524,88,418,25,335,19.22,4,30,0.5,5.5,0.55,8,0.8,0,50.41,2.625,1.36,0.579),
    (N'Aphelios','Marksman',N'Mana',500,86,348,42,325,28,3,26,0.5,3.25,0.55,6.5,0.4,0,57,2.2,2.1,0.64),
    (N'Ashe','Marksman, Support',N'Mana',539,85,280,32,325,26,3.4,30,0.5,3.5,0.55,6.972,0.4,0,61,2.96,3.33,0.658),
    (N'Aurelion Sol','Mage',N'Mana',575,92,350,50,325,19,3.6,30,0.5,7,0.6,6,0.8,0,57,3.2,1.36,0.625),
    (N'Azir','Mage, Marksman',N'Mana',552,92,480,21,335,19.04,3,30,0.5,7,0.75,8,0.8,0,52,2.8,3,0.625),
    (N'Bard','Support, Mage',N'Mana',575,89,350,50,330,34,4,30,0.5,5.5,0.55,6,0.45,0,52,3,2,0.625),
    (N'Blitzcrank','Tank, Fighter',N'Mana',582.6,95,267.2,40,325,37,3.5,32.1,1.25,8.5,0.75,8.5,0.8,0,61.54,3.5,1.13,0.625),
    (N'Brand','Mage',N'Mana',519.68,88,469,21,340,21.88,3.5,30,0.5,5.5,0.55,10.665,0.6,0,57.04,3,1.36,0.625),
    (N'Braum','Support, Tank',N'Mana',540,98,310.6,45,335,47,4,32.1,1.25,8.5,1,6,0.8,0,55.376,3.2,3.5,0.644),
    (N'Caitlyn','Marksman',N'Mana',481,91,313.7,35,325,28,3.5,30,0.5,3.5,0.55,7.4,0.55,0,62,2.88,4,0.681),
    (N'Camille','Fighter, Tank',N'Mana',575.6,85,338.8,32,340,35,3.8,32.1,1.25,8.5,0.8,8.15,0.75,0,68,3.5,2.5,0.644),
    (N'Cassiopeia','Mage',N'Mana',575,90,350,40,328,20,3.5,30,0.5,5.5,0.5,8,0.8,0,53,3,1.5,0.647),
    (N'Cho''Gath','Tank, Mage',N'Mana',574.4,80,272.2,40,345,38,3.5,32.1,1.25,9,0.85,7.206,0.45,0,69,4.2,1.44,0.625),
    (N'Corki','Marksman',N'Mana',518,87,350.16,34,325,28,3.5,30,0.5,5.5,0.55,7.424,0.55,0,55,2.5,2.3,0.638),
    (N'Darius','Fighter, Tank',N'Mana',582.24,100,263,37.5,340,39,4,32.1,1.25,10,0.95,6.6,0.35,0,64,5,1,0.625),
    (N'Diana','Fighter, Mage',N'Mana',594,95,375,25,345,31,3.6,32.1,1.25,7.5,0.85,8,0.8,0,57.04,3,2.25,0.625),
    (N'Draven','Marksman',N'Mana',574,88,360.56,39,330,29,3.3,30,0.5,3.75,0.7,8.042,0.65,0,60,3.61,2.7,0.679),
    (N'Dr. Mundo','Fighter, Tank',N'None',582.52,89,0,0,345,36,3.5,32.1,1.25,8,0.75,0,0,0,61.27,3.5,2.8,0.721),
    (N'Ekko','Assassin, Fighter',N'Mana',585,85,280,50,340,32,3,32,1.25,9,0.9,7,0.8,0,58,3,3.3,0.688),
    (N'Elise','Mage, Fighter',N'Mana',534,93,324,50,330,27,3.35,30,0.5,5.5,0.6,6,0.8,0,55,3,1.75,0.625),
    (N'Evelynn','Assassin, Mage',N'Mana',572,84,315.6,42,335,37,3.5,32.1,1.25,8.5,0.75,8.108,0.6,0,61,3,2.1,0.667),
    (N'Ezreal','Marksman, Mage',N'Mana',500,86,375,50,325,22,3.5,30,0.5,4,0.55,8.5,0.65,0,60,2.5,2.9,0.625),
    (N'Fiddlesticks','Mage, Support',N'Mana',524.4,80,500,28,335,30,3.5,30,0.5,5.5,0.6,8,0.8,0,48.36,2.625,2.11,0.625),
    (N'Fiora','Fighter, Assassin',N'Mana',550,85,300,40,345,33,3.5,32.1,1.25,8.5,0.55,8,0.7,0,68,3.3,3.2,0.69),
    (N'Fizz','Assassin, Fighter',N'Mana',570,98,317.2,37,335,22.412,3.4,32.1,1.25,8,0.7,6,0.8,0,58.04,3,3.1,0.658),
    (N'Galio','Tank, Mage',N'Mana',562,112,500,40,335,24,3.5,32,1.25,8,0.8,9.5,0.7,0,59,3.5,1.5,0.625),
    (N'Gangplank','Fighter',N'Mana',540,82,282,40,345,35,3,32.1,1.25,6,0.6,7.5,0.7,0,64,3,3.2,0.658),
    (N'Garen','Fighter, Tank',N'None',620,84,0,0,340,36,3,32.1,0.75,8,0.5,0,0,0,66,4.5,3.65,0.625),
    (N'Gnar','Fighter, Tank',N'Rage',510,65,100,0,335,32,2.5,30,0.5,4.5,1.75,0,0,0,59,3,6,0.625),
    (N'Gragas','Fighter, Mage',N'Mana',600,95,400,47,330,35,3.6,32.1,1.25,5.5,0.5,6,0.8,0,64,3.5,2.05,0.675),
    (N'Graves','Marksman',N'Mana',555,92,325,40,340,33,3.4,32,1.25,8,0.7,8,0.7,0,68,3,2.6,0.475),
    (N'Hecarim','Fighter, Tank',N'Mana',580,90,277.2,40,345,36,4,32.1,1.25,7,0.75,6.5,0.6,0,66,3.2,2.5,0.67),
    (N'Heimerdinger','Mage, Support',N'Mana',488,87,385,20,340,19.04,3,30,0.5,7,0.55,8,0.8,0,55.536,2.7,1.36,0.625),
    (N'Illaoi','Fighter, Tank',N'Mana',585.6,95,300,40,340,35,3.8,32.1,1.25,9.5,0.8,7.5,0.75,0,68,5,2.5,0.571),
    (N'Irelia','Fighter, Assassin',N'Mana',580,95,350,30,335,36,3,32,1.25,8.5,0.85,8,0.8,0,63,4,2.5,0.656),
    (N'Ivern','Support, Mage',N'Mana',585,95,450,60,330,27,3.5,32.1,1.25,7,0.85,6,0.75,0,50,3,3.4,0.644),
    (N'Janna','Support, Mage',N'Mana',500,70,350,64,315,28,3.8,30,0.5,5.5,0.55,11.5,0.4,0,46,1.5,2.95,0.625),
    (N'Jarvan IV','Tank, Fighter',N'Mana',570,90,300,40,340,34,3.6,32.1,1.25,8,0.7,6.5,0.45,0,64,3.4,2.5,0.658),
    (N'Jax','Fighter, Assassin',N'Mana',592.8,85,338.8,32,350,36,3,32.1,1.25,8.5,0.55,7.576,0.7,0,68,3.375,3.4,0.638),
    (N'Jayce','Fighter, Marksman',N'Mana',560,90,375,45,335,27,3.5,30,0.5,6,0.6,6,0.8,0,54,4.25,3,0.658),
    (N'Jhin','Marksman, Mage',N'Mana',556,91,300,50,330,24,3.5,30,0.5,3.75,0.55,6,0.8,0,59,4.7,0,0.625),
    (N'Jinx','Marksman',N'Mana',581,84,245,45,325,28,3.5,30,0.5,3.75,0.5,6.7,1,0,57,3.4,1,0.625),
    (N'Kai''Sa','Marksman',N'Mana',571,86,344.88,38,335,28,3,30,0.5,3.5,0.55,8.2,0.45,0,59,1.7,1.8,0.644),
    (N'Kalista','Marksman',N'Mana',534,100,250,45,325,23,4,30,0.5,3.75,0.55,6.3,0.4,0,69,4,4,0.694),
    (N'Karma','Mage, Support',N'Mana',534,95,374,50,335,26,3.8,30,0.5,5.5,0.55,11.5,0.5,0,53.544,3.3,2.3,0.625),
    (N'Karthus','Mage',N'Mana',528,87,467,30.5,335,20.88,3.5,30,0.5,6.5,0.55,8,0.8,0,45.66,3.25,2.11,0.625),
    (N'Kassadin','Assassin, Mage',N'Mana',576,90,397.6,67,335,19,2.8,30,0.5,6,0.5,6,0.8,0,58.852,3.9,3.7,0.64),
    (N'Katarina','Assassin, Mage',N'None',602,94,0,0,340,27.88,3.5,32.1,1.25,7.5,0.7,0,0,0,58,3.2,2.74,0.658),
    (N'Kayle','Fighter, Support',N'Mana',600,85,330,50,335,26,3,34,0.5,5,0.5,8,0.8,0,50,2.5,1.5,0.625),
    (N'Kayn','Fighter, Assassin',N'Mana',585,85,410,50,340,38,3.3,32.1,1.25,8,0.75,11.5,0.95,0,68,3.3,2.7,0.669),
    (N'Kennen','Mage, Marksman',N'Energy',541,84,200,0,335,29,3.75,30,0.5,5.5,0.65,50,0,0,48,3.75,3.4,0.625),
    (N'Kha''Zix','Assassin',N'Mana',572.8,85,327.2,40,350,36,3,32.1,1.25,7.5,0.75,7.59,0.5,0,63,3.1,2.7,0.668),
    (N'Kindred','Marksman',N'Mana',540,85,300,35,325,29,3.5,30,0.5,7,0.55,7,0.4,0,65,2.5,3.5,0.625),
    (N'Kled','Fighter, Tank',N'Courage',340,70,100,0,345,35,4,32.1,1.25,6,0.75,0,0,0,65,3.5,3.5,0.625),
    (N'Kog''Maw','Marksman, Mage',N'Mana',534,88,325,40,330,24,3.5,30,0.5,3.75,0.55,8.75,0.7,0,61,3.11,2.65,0.665),
    (N'LeBlanc','Assassin, Mage',N'Mana',528,92,334,50,340,21.88,3.5,30,0.5,7.5,0.55,6,0.8,0,54.88,3.5,1.4,0.625),
    (N'Lee Sin','Fighter, Assassin',N'Energy',575,85,200,0,345,33,3.7,32.1,1.25,7.5,0.7,50,0,0,70,3.2,3,0.651),
    (N'Leona','Tank, Support',N'Mana',576.16,87,302.2,40,335,47,3.6,32.1,1.25,8.5,0.85,6,0.8,0,60.04,3,2.9,0.625),
    (N'Lissandra','Mage',N'Mana',550,90,475,30,325,22,3.7,30,0.5,7,0.55,8,0.4,0,53,2.7,1.36,0.656),
    (N'Lucian','Marksman',N'Mana',571,86,348.88,38,335,28,3,30,0.5,3.75,0.65,8.176,0.7,0,64,2.75,3.3,0.638),
    (N'Lulu','Support, Mage',N'Mana',525,74,350,55,330,29,3.7,30,0.5,6,0.6,11,0.6,0,47,2.6,2.25,0.625),
    (N'Lux','Mage, Support',N'Mana',490,85,480,23.5,330,18.72,4,30,0.5,5.5,0.55,8,0.8,0,53.54,3.3,1,0.669),
    (N'Malphite','Tank, Fighter',N'Mana',574.2,90,282.2,40,335,37,3.75,32.1,1.25,7,0.55,7.324,0.55,0,61.97,4,3.4,0.736),
    (N'Malzahar','Mage, Assassin',N'Mana',537,87,375,27.5,335,18,3.5,30,0.5,6,0.6,8,0.8,0,55,3,1.5,0.625),
    (N'Maokai','Tank, Mage',N'Mana',565,95,377.28,43,335,39,4,32.1,1.25,5,0.75,7.2,0.6,0,63.54,3.3,2.125,0.8),
    (N'Master Yi','Assassin, Fighter',N'Mana',598.56,92,250.56,42,355,33,3,32.1,1.25,7.5,0.65,7.256,0.45,0,66,3,2,0.679),
    (N'Miss Fortune','Marksman',N'Mana',541,91,325.84,35,325,28,3,30,0.5,3.75,0.65,8.042,0.65,0,50,2.7,2.25,0.656),
    (N'Wukong','Fighter, Tank',N'Mana',540,85,300,45,345,34,3.5,28,1.25,5,0.65,8,0.65,0,68,4,3,0.711),
    (N'Mordekaiser','Fighter',N'Shield',575,90,100,0,335,37,3,32,1.25,5,0.75,0,0,0,61,4,1,0.625),
    (N'Morgana','Mage, Support',N'Mana',560,90,340,60,335,25,3.8,30,0.5,5.5,0.4,11,0.4,0,56,3.5,1.53,0.625),
    (N'Nami','Support, Mage',N'Mana',489.32,74,377.24,43,335,29,4,30,0.5,5.5,0.55,11.5,0.4,0,51.208,3.1,2.61,0.644),
    (N'Nasus','Fighter, Tank',N'Mana',561.2,90,325.6,42,350,34,3.5,32.1,1.25,9,0.9,7.44,0.5,0,67,3.5,3.48,0.638),
    (N'Nautilus','Tank, Fighter',N'Mana',576.48,86,400,47,325,39,3.75,32.1,1.25,8.5,0.55,8.626,0.5,0,61,3.3,1,0.706),
    (N'Neeko','Mage, Support',N'Mana',540,90,450,30,340,21,4,30,0.5,7.5,0.75,7,0.7,0,48,2.5,3.5,0.625),
    (N'Nidalee','Assassin, Mage',N'Mana',545,85,295.6,45,335,28,3.5,30,0.5,6,0.6,6,0.8,0,61,3.5,3.22,0.638),
    (N'Nocturne','Assassin, Fighter',N'Mana',585,85,275,35,345,38,3.5,32.1,1.25,8.5,0.75,7,0.45,0,62,3.1,2.7,0.721),
    (N'Nunu & Willump','Tank, Fighter',N'Mana',570,82,280,42,345,32,3,32.1,1.25,5,0.8,7,0.5,0,61,3,2.25,0.625),
    (N'Olaf','Fighter, Tank',N'Mana',597.24,93,315.6,42,350,35,3,32.1,1.25,8.5,0.9,7.466,0.575,0,68,3.5,2.7,0.694),
    (N'Orianna','Mage, Support',N'Mana',530,91,418,25,325,17.04,3,26,0.5,7,0.55,8,0.8,0,40.368,2.6,3.5,0.658),
    (N'Ornn','Tank, Fighter',N'Mana',590,95,340.6,45,335,36,4,32.1,1.25,9,0.9,8.01,0.6,0,69,3.5,2,0.625),
    (N'Pantheon','Fighter, Assassin',N'Mana',580,95,317.12,31,355,40,3.75,28,1.25,10,0.65,7.356,0.45,0,64,3.3,2.95,0.644),
    (N'Poppy','Tank, Fighter',N'Mana',540,90,280,40,345,38,3.5,32,1.25,8,0.8,7,0.7,0,64,4,2.5,0.625),
    (N'Pyke','Support, Assassin',N'Mana',600,90,415,50,330,45,5,32,1.5,7,0.5,8,1,0,62,2,2.5,0.667),
    (N'Qiyana','Assassin, Fighter',N'Mana',590,90,320,50,335,28,3.5,32.1,1.25,8.5,0.65,8,0.7,0,64,3.1,2.1,0.625),
    (N'Quinn','Marksman, Assassin',N'Mana',532.8,85,268.8,35,335,28,3.5,30,0.5,5.5,0.55,6.972,0.4,0,59,2.4,3.1,0.668),
    (N'Rakan','Support',N'Mana',540,85,315,50,335,32,3.9,32.1,1.25,5,0.5,8.75,0.5,0,62,3.5,3,0.635),
    (N'Rammus','Tank, Fighter',N'Mana',564.48,95,310.44,33,335,36,4.3,32.1,1.25,8,0.55,7.84,0.5,0,55.88,3.5,2.215,0.656),
    (N'Rek''Sai','Fighter',N'Rage',570,85,100,0,335,36,3.75,32.1,1.25,7.5,0.65,0,0,0,64,3,2,0.667),
    (N'Renekton','Fighter, Tank',N'Fury',575,87,100,0,345,35,4,32.1,1.25,8,0.75,0,0,0,69,3.75,2.75,0.665),
    (N'Rengar','Assassin, Fighter',N'Ferocity',585,90,4,0,345,34,3,32.1,1.25,7,0.5,0,0,0,68,3,3,0.667),
    (N'Riven','Fighter, Assassin',N'None',558.48,86,0,0,340,33,3.2,32.1,1.25,7,0.5,0,0,0,64,3,3.5,0.625),
    (N'Rumble','Fighter, Mage',N'Heat',589,85,100,0,345,31,3.5,32.1,1.25,8,0.6,0,0,0,61,3.2,1.85,0.644),
    (N'Ryze','Mage, Fighter',N'Mana',570.48,98,300,50,340,21.552,3,34,0.5,8,0.8,8,1,0,55.04,3,2.112,0.625),
    (N'Sejuani','Tank, Fighter',N'Mana',560,100,400,40,340,34,4.25,32.1,1.25,8.5,1,7,0.7,0,66,4,3.5,0.688),
    (N'Senna','Marksman, Support',N'Mana',520,75,350,45,330,28,3.5,30,0.5,3.5,0.55,11.5,0.4,0,50,0,4,0.625),
    (N'Sett','Fighter, Tank',N'Grit',600,93,0,0,340,33,4,32,1.25,7,0.5,0,0,0,60,4,1.75,0.625),
    (N'Shaco','Assassin',N'Mana',587,89,297.2,40,350,30,3.5,32.1,1.25,8.5,0.55,7.156,0.45,0,63,3,3,0.694),
    (N'Shen','Tank',N'Energy',540,85,400,0,340,34,3,32.1,1.25,8.5,0.75,50,0,0,60,3,3,0.751),
    (N'Shyvana','Fighter, Tank',N'Fury',595,95,100,0,350,38,3.35,32.1,1.25,8.5,0.8,0,0,0,66,3.4,2.5,0.658),
    (N'Singed','Tank, Fighter',N'Mana',580,85,330,45,345,34,3.5,32.1,1.25,9.5,0.55,7.5,0.55,0,63,3.375,1.9,0.613),
    (N'Sion','Tank, Fighter',N'Mana',545,73,330,42,345,32,3,32.1,1.25,7.5,0.8,8,0.6,0,68,4,1.3,0.679),
    (N'Sivir','Marksman',N'Mana',532,88,284,50,335,26,3.25,30,0.5,3.25,0.55,8,0.9,0,63,3,1.6,0.625),
    (N'Skarner','Fighter, Tank',N'Mana',601.28,90,320,40,335,38,3.8,32.1,1.25,9,0.85,7.206,0.45,0,65,4.5,2.1,0.625),
    (N'Sona','Support, Mage',N'Mana',482.36,77,340.6,45,325,28,3.3,30,0.5,5.5,0.55,11.5,0.4,0,49,3,2.3,0.644),
    (N'Soraka','Support, Mage',N'Mana',535,74,375,40,325,32,3.8,30,0.5,2.5,0.5,11.5,0.4,0,50,3,2.14,0.625),
    (N'Swain','Mage, Fighter',N'Mana',525,85,468,28.5,335,22.72,4,30,0.5,7,0.65,8,0.8,0,58,2.7,2.11,0.625),
    (N'Sylas','Mage, Assassin',N'Mana',525,115,280,50,340,27,4,32,1.75,9,0.9,7,0.8,0,61,3,3.5,0.645),
    (N'Syndra','Mage, Support',N'Mana',523,90,480,40,330,24.712,3.4,30,0.5,6.5,0.6,8,0.8,0,53.872,2.9,2,0.625),
    (N'Tahm Kench','Support, Tank',N'Mana',600,100,325,40,335,47,3.5,32.1,1.25,6.5,0.55,8,1,0,56,3.2,2.5,0.658),
    (N'Taliyah','Mage, Support',N'Mana',532,90,425,30,335,20,3.5,30,0.5,7,0.7,9.335,0.85,0,58,3.3,1.36,0.625),
    (N'Talon','Assassin',N'Mana',588,95,377.2,37,335,30,3.5,39,1.25,8.5,0.75,7.6,0.8,0,68,3.1,2.9,0.625),
    (N'Taric','Support, Fighter',N'Mana',575,90,300,60,340,40,3.4,32.1,1.25,6,0.5,8.5,0.8,0,55,3.5,2,0.625),
    (N'Teemo','Marksman, Assassin',N'Mana',528,90,334,20,330,24.3,3.75,30,0.5,5.5,0.65,9.6,0.45,0,54,3,3.38,0.69),
    (N'Thresh','Support, Fighter',N'Mana',560.52,93,273.92,44,335,28,0,30,0.5,7,0.55,6,0.8,0,56,2.2,3.5,0.625),
    (N'Tristana','Marksman, Assassin',N'Mana',559,88,250,32,325,26,3,30,0.5,3.75,0.65,7.2,0.45,0,61,3.3,1.5,0.656),
    (N'Trundle','Fighter, Tank',N'Mana',616.28,96,281.6,45,350,37,2.7,32.1,1.25,6,0.75,7.508,0.6,0,68,3,2.9,0.67),
    (N'Tryndamere','Fighter, Assassin',N'Fury',625.64,98,100,0,345,33,3.1,32.1,1.25,8.5,0.9,0,0,0,69,3.7,2.9,0.67),
    (N'Twisted Fate','Mage',N'Mana',534,94,333,19,335,20.542,3.15,30,0.5,5.5,0.6,8,0.8,0,49.954,3.3,3.22,0.651),
    (N'Twitch','Marksman, Assassin',N'Mana',582,84,287.2,40,330,27,3,30,0.5,3.75,0.6,7.256,0.45,0,59,3.11,3.38,0.679),
    (N'Udyr','Fighter, Tank',N'Mana',593.32,99,270.4,30,345,34,4,32.1,1.25,6,0.75,7.506,0.45,0,66,5,2.67,0.658),
    (N'Urgot','Fighter, Tank',N'Mana',585,88,340,45,330,36,4.25,32.1,1.25,7.5,0.7,7.25,0.8,0,63,4,3.75,0.625),
    (N'Varus','Marksman, Mage',N'Mana',500,89,360,33,330,27,3.4,30,0.5,3.5,0.55,8,0.8,0,61,3.11,3,0.658),
    (N'Vayne','Marksman, Assassin',N'Mana',515,89,231.8,35,330,23,3.4,30,0.5,3.5,0.55,6.972,0.4,0,60,2.36,3.3,0.658),
    (N'Veigar','Mage',N'Mana',505,94,490,26,340,23,3.75,30,0.5,6.5,0.6,8,0.8,0,52,2.7,2.24,0.625),
    (N'Vel''Koz','Mage',N'Mana',520,88,469,21,340,21.88,3.5,30,0.5,5.5,0.55,8,0.8,0,54.9379,3.1416,1.36,0.625),
    (N'Vi','Fighter, Assassin',N'Mana',585,85,295,45,340,30,4,32.1,1.25,10,1,8,0.65,0,63,3.5,2,0.644),
    (N'Viktor','Mage',N'Mana',530,90,405,25,335,23,4,30,0.5,8,0.65,8,0.8,0,53,3,2.11,0.658),
    (N'Vladimir','Mage',N'Crimson Rush',537,96,2,0,330,23,3.3,30,0.5,7,0.6,0,0,0,55,3,2,0.658),
    (N'Volibear','Fighter, Tank',N'Mana',584.48,86,270.4,30,345,35,3.5,32.1,1.25,8,0.65,8.092,0.65,0,68,3.3,2.67,0.658),
    (N'Warwick','Fighter, Tank',N'Mana',550,85,280,35,335,33,3.2,32.1,1.25,4,0.75,7.466,0.575,0,65,3,2.3,0.638),
    (N'Xayah','Marksman',N'Mana',561,86,340,40,325,25,3,30,0.5,3.25,0.75,8.25,0.75,0,60,2.9,3.3,0.625),
    (N'Xerath','Mage',N'Mana',526,92,459,22,340,21.88,3.5,30,0.5,5.5,0.55,8,0.8,0,54.7,3,1.36,0.625),
    (N'Xin Zhao','Fighter, Assassin',N'Mana',570,92,273.8,35,345,35,3.5,32.1,1.25,8,0.7,7.256,0.45,0,66,3,3.5,0.645),
    (N'Yasuo','Fighter, Assassin',N'Flow',523,87,100,0,345,30,3.4,30,1.25,6.5,0.9,0,0,0,60,3.2,2.5,0.697),
    (N'Yorick','Fighter, Tank',N'Mana',580,100,300,40,340,39,4,32,1.25,8,0.8,7.5,0.75,0,62,5,2,0.625),
    (N'Yuumi','Support, Mage',N'Mana',480,70,400,45,330,25,3,25,0.3,7,0.55,10,0.4,0,55,3.1,1,0.625),
    (N'Zac','Tank, Fighter',N'None',615,95,0,0,340,33,3.5,32,1.25,8,0.5,0,0,0,60,3.4,1.6,0.736),
    (N'Zed','Assassin',N'Energy',584,85,200,0,345,32,3.5,32.1,1.25,7,0.65,50,0,0,63,3.4,3.3,0.651),
    (N'Ziggs','Mage',N'Mana',536,92,480,23.5,325,21.544,3.3,30,0.5,6.5,0.6,8,0.8,0,54.208,3.1,2,0.656),
    (N'Zilean','Support, Mage',N'Mana',504,82,452,30,335,24,3.8,30,0.5,5.5,0.5,11.335,0.8,0,51.64,3,2.13,0.625),
    (N'Zoe','Mage, Support',N'Mana',560,92,425,25,340,20.8,3.5,30,0.5,6.5,0.6,8,0.65,0,58,3.3,2.5,0.625),
    (N'Zyra','Mage, Support',N'Mana',504,79,418,25,340,29,3,30,0.5,5.5,0.5,13,0.4,0,53.376,3.2,2.11,0.62525);

---transfer champion table to 3th form
--tags lookup table
SELECT distinct TRIM(value) as tag
INTO Tags
FROM Champions cross apply string_split(Tag,',')
ALTER TABLE Tags ADD tag_id INT IDENTITY NOT NULL
ALter table Tags ADD CONSTRAINT pk_tag PRIMARY KEY(tag_id)
GO

---champion_tags temp table
SELECT Champion_id, TRIM(value) as Tag 
INTO Champion_tags1
FROM Champions cross apply string_split(Tag,',')
---build brige table
SELECT Champion_id,tag_id
INTO Champion_tags
FROM Champion_tags1 as bt JOIN Tags as it ON it.tag=bt.Tag

ALTER TABLE Champion_tags
ADD CONSTRAINT pk_Chmpion_tag PRIMARY KEY (Champion_id,tag_id)

ALTER TABLE Champion_tags
ADD CONSTRAINT fk_Champion_tags FOREIGN KEY(tag_id)
    REFERENCES Tags(tag_id)

ALTER TABLE Champion_tags
ADD CONSTRAINT fk_Champion_tags1 FOREIGN KEY(Champion_id)
    REFERENCES Champions(Champion_id)


---drop tag column in champions and temp table
DROP table if EXISTS Champion_tags1

ALTER TABLE Champions
DROP COLUMN Tag
GO


---Basic item table
CREATE TABLE  Basic_items (
    Basic_Item_id INT IDENTITY(1,1) NOT NULL,
    Basic_Item_Name VARCHAR(20) NOT NULL,
    Tag VARCHAR(25) NOT NULL,
    Price INT NOT NULL,
    Abilty_power INT NOT NULL,
    Attack_damage INT NOT NULL,
    Crit_chance INT NOT NULL,
    Armor INT,
    Magic_resist INT,
    Attack_speed NUMERIC(3, 2),
    Health INT NOT NULL,
    Magic_power INT NOT NULL,
    Health_regen NUMERIC(2, 1) NOT NULL,
    MP_regen NUMERIC(2, 1) NOT NULL
    CONSTRAINT pk_BI_BI_id PRIMARY KEY(Basic_Item_id),
    CONSTRAINT u__BI_BI_name UNIQUE(Basic_Item_Name)
);
INSERT INTO Basic_items VALUES
    ('Amplifying Tome','Mage',435,20,0,0,0,0,0,0,0,0,0),
    ('B. F. Sword','Marksman',1300,0,40,0,0,0,0,0,0,0,0),
    ('Blasting wand','Mage',850,40,0,0,0,0,0,0,0,0,0),
    ('Cloak of Agility ','Marksman,Fighter',600,0,0,15,0,0,0,0,0,0,0),
    ('Cloth Armor ','Tank,Fighter',300,0,0,0,15,0,0,0,0,0,0),
    ('Dagger','Marksman,Fighter',300,0,0,0,0,0,0.12,0,0,0,0),
    ('Dark Seal','Mage',350,15,0,0,0,0,0,40,0,0,0),
    ('Faerie Charm','Mage',250,0,0,0,0,0,0,0,0,0,0.5),
    ('Long Sword','Fighter,Assassin,Marksman',350,0,10,0,0,0,0,0,0,0,0),
    ('Needlessly Large Rod','Mage',1250,60,0,0,0,0,0,0,0,0,0),
    ('Null-Magic Mantle','Tank',450,0,0,0,0,25,0,0,0,0,0),
    ('Pickaxe','Fighter,Assassin,Marksman',875,0,25,0,0,0,0,0,0,0,0),
    ('Rejuvenation Bead','Tank',150,0,0,0,0,0,0,0,0,0.5,0),
    ('Ruby Crystal','Tank',400,0,0,0,0,0,0,150,0,0,0),
    ('Sapphire Crystal','Mage',350,0,0,0,0,0,0,0,250,0,0),
    ('Stopwatch','Mage',650,0,0,0,0,0,0,0,0,0,0),
    ('Tear of the Goddess ','Mage',400,0,0,0,0,0,0,0,240,0,0);


--CONVERTINT TO 1st Form
---build temp brige table 
SELECT Basic_Item_id, value as Tag
INTO Basic_item_tags1
FROM Basic_items cross apply string_split(Tag,',')
GO

--build brige table
SELECT Basic_Item_id,tag_id
INTO Basic_item_tags
FROM Basic_item_tags1 as bt JOIN Tags as it ON it.tag=bt.Tag

ALTER TABLE Basic_item_tags
ADD CONSTRAINT pk_basic_item_tag PRIMARY KEY (Basic_Item_id,tag_id)

ALTER TABLE Basic_item_tags
ADD CONSTRAINT fk_Basic_item_tags FOREIGN KEY(tag_id)
    REFERENCES Tags(tag_id)

ALTER TABLE Basic_item_tags
ADD CONSTRAINT fk_Basic_item_tags1 FOREIGN KEY(Basic_item_id)
    REFERENCES Basic_items(Basic_item_id)

---Drop temp table and column
DROP table if EXISTS Basic_item_tags1

ALTER TABLE Basic_items
DROP COLUMN Tag
GO

---Create Epic Item Table
GO
CREATE TABLE Epic_items (
    [Epic_Item_id]INT IDENTITY(18,1) NOT NULL,
    [Item_name] VARCHAR(21)NOT NULL,
    [Tag] VARCHAR(25) NOT NULL,
    [Price] INT NOT NULL,
    [Abilty_power] INT NOT NULL,
    [Attack_damage] INT NOT NULL,
    [Crit_chance] NUMERIC(3, 2) NOT NULL,
    [Armor] INT NOT NULL,
    [Magic_resist] INT NOT NULL,
    [Attack_speed] NUMERIC(3, 2) NOT NULL,
    [Health] INT NOT NULL,
    [Magic_power] INT NOT NULL,
    [Health_regen] NUMERIC(2, 1) NOT NULL,
    [MP_regen] NUMERIC(2, 1) NOT NULL,
    [Ability_haste] INT NOT NULL,
    [Movespeed] NUMERIC(3, 2) NOT NULL,
    [Armor_penetration] NUMERIC(3, 1) NOT NULL,
    [life_steal] NUMERIC(2, 1) NOT NULL,
    [Magic_penetration] NUMERIC(3, 2) NOT NULL,
    [Passive] NVARCHAR(21),
    [Active] NVARCHAR(13)
    CONSTRAINT pk_epic_items_item_id PRIMARY KEY (Epic_Item_id)
);
INSERT INTO Epic_items VALUES
    ('Aegis of the Legion','Tank',1500,0,0,0,30,30,0,0,0,0,0,10,0,0,0,0,N'None',N'None'),
    ('Aether Wisp','Mage',850,30,0,0,0,0,0,0,0,0,0,0,0.05,0,0,0,N'None',N'None'),
    ('Bami''s Cinder','Tank',1000,12,0,0,0,0,0,300,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Bandleglass Mirror','Mage',1050,20,0,0.15,0,0,0,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Blighting Jewel','Mage',1250,25,0,0,15,0,0,0,0,0,0.5,10,0,0,0,0.15,N'None',N'None'),
    ('Bramble Vest','Tank',800,3,0,0,35,0,0.12,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Caulfield''s Warhammer','Fighter',1100,15,25,0,0,0,0,40,0,0,0,10,0,0,0,0,N'None',N'None'),
    ('Chain Vest ','Tank',800,0,0,0,40,0,0,0,0,0,0.5,0,0,0,0,0,N'None',N'None'),
    ('Crystalline Bracer','Tank',650,0,15,0,0,0,0,200,0,0.5,0,0,0,0,0,0,N'None',N'None'),
    ('Executioner''s Calling','Fighter,Assassin,Marksman',800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Wound',N'None'),
    ('Fiendish Codex ','Mage',900,35,0,0,0,0,0,0,0,0,0,10,0,0,0,0,N'None',N'None'),
    ('Forbidden Idol','Support, Mage',800,0,0,0,0,0,0,0,0,0,0.5,0,0,0,0,0,N'Heal and shield',N'None'),
    ('Frostfang','Support, Mage',150,15,0,0,0,0,0,70,0,0,0.7,0,0,0,0,0,N'gold',N'None'),
    ('Giant''s Belt ','Tank',900,0,0,0,0,0,0,350,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Glacial Buckler','Tank',900,0,0,0,20,0,0,0,250,0,0,10,0,0,0,0,N'None',N'None'),
    ('Harrowing Crescent','Support',400,0,10,0,0,0,0,60,0,0,0.5,0,0,0,0,0,N'gold',N'None'),
    ('Hearthbound Axe','Fighter',1100,0,15,0,0,0,0.15,0,0,0,0,0,0,0,0,0,N'MS',N'None'),
    ('Hexdrinker','Fighter',1300,0,20,0,0,35,0,0,0,0,0,0,0,0,0,0,N'shield',N'None'),
    ('Hextech Alternator','Mage',1050,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Bonus damage',N'None'),
    ('Ironspike Whip','Fighter',1200,0,30,0,0,0,0,200,0,0,0,10,0,0,0,0,N'None',N'Extra damage'),
    ('Kindlegem','Tank',800,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Kircheis Shard','Marksman',700,0,0,0,0,0,0.15,0,0,0,0,0,0,0,0,0,N'Bonus damage',N'None'),
    ('Last Whisper','Assassin,Marksman',1450,0,20,0,0,0,0,0,0,0,0,0,0,0.2,0,0,N'None',N'None'),
    ('Leeching Leer','Mage',1300,20,0,0,0,0,0,150,0,0,0,0,0,0,0.1,0,N'None',N'None'),
    ('Lost Chapter','Mage',1300,40,0,0,0,0,0,0,300,0,0,10,0,0,0,0,N'MP regen',N'None'),
    ('Negatron Cloak','Tank',900,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Noonquiver','Fighter,Assassin,Marksman',1300,0,30,0,0,0,0.15,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Oblivion Orb','Mage',800,30,0,0,0,0,0,200,0,0,0,0,0,0,0,0,N'Wound',N'None'),
    ('Phage','Fighter',1100,0,15,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Heal',N'None'),
    ('Quicksilver Sash','Fighter,Assassin',1300,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,N'None',N'remove debuff'),
    ('Rageknife','Fighter,Marksman',800,0,0,0,0,0,0.25,0,0,0,0,0,0,0,0,0,N'Bonuss damage by crit',N'None'),
    ('Recurve Bow','Fighter,Assassin',1000,0,0,0,0,0,0.25,0,0,0,0,0,0,0,0,0,N'Bonus damage',N'None'),
    ('Runesteel Spaulders','Support,tank',400,0,6,0,0,0,0,100,0,0.5,0,0,0,0,0,0,N'gold',N'ward'),
    ('Seeker''s Armguard','Mage,Fighter,Assassin',900,30,0,0,15,0,0,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    ('Serrated Dirk ','Assassin',1100,0,30,0,0,0,0,0,0,0,0,0,0,10,0,0,N'None',N'None'),
    ('Sheen ','Fighter,Mage,Assassin',700,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Bonus damage',N'None'),
    ('Spectre''s Cowl','Tank',1250,0,0,0,0,25,0,250,0,0,0,0,0,0,0,0,N'HP regen',N'None'),
    ('Tiamat ','Fighter,Assassin,Marksman',1200,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,N'AOE',N'None'),
    ('Vampiric Scepte','Fighter,Assassin,Marksman',900,0,15,0,0,0,0,0,0,0,0,0,0,0,0.1,0,N'None',N'None'),
    ('Verdant Barrier','Mage',1200,0,25,0,0,25,0,0,0,0,0,0,0,0,0,0,N'Bonus MG resist',N'None'),
    ('Warden''s Mail','Tank',1000,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,N'Bonus armor by HP',N'None'),
    ('Winged Moonplate','Tank',800,0,0,0,0,0,0,150,0,0,0,0,0.05,0,0,0,N'None',N'None'),
    ('Zeal','Marksman',1200,0,0,0.15,0,0,0.18,0,0,0,0,0,0,0,0,0.07,N'None',N'None');

---Transfer to 1st form
---build temp brige table 
SELECT Epic_Item_id, value as Tag
INTO Epic_item_tags1
FROM Epic_items cross apply string_split(Tag,',')
GO
--build brige table
SELECT Epic_Item_id,tag_id
INTO Epic_item_tags
FROM EPic_item_tags1 as bt JOIN Tags as it ON it.tag=bt.Tag

ALTER TABLE Epic_item_tags
ADD CONSTRAINT pk_epic_item_tag PRIMARY KEY (Epic_Item_id,tag_id)

ALTER TABLE Epic_item_tags
ADD CONSTRAINT fk_Epic_item_tags FOREIGN KEY(tag_id)
    REFERENCES Tags(tag_id)

ALTER TABLE Epic_item_tags
ADD CONSTRAINT fk_Epic_item_tags1 FOREIGN KEY(Epic_item_id)
    REFERENCES Epic_items(Epic_item_id)

---Drop temp table and column
DROP table if EXISTS Epic_item_tags1

ALTER TABLE Epic_items
DROP COLUMN Tag
GO

---create Legendary item table
GO
CREATE TABLE Legendary_items (
    [Legendary_Item_id] INT IDENTITY(61,1) NOT NULL,
    [Item_name] NVARCHAR(24) NOT NULL,
    [Tag] NVARCHAR(25) NOT NULL,
    [Price] INT NOT NULL,
    [Abilty_power] INT NOT NULL,
    [Attack_damage] INT NOT NULL,
    [Crit_chance] INT NOT NULL,
    [Armor] INT NOT NULL,
    [Magic_resist] INT NOT NULL,
    [Attack_speed] NUMERIC(3, 2) NOT NULL,
    [Health] INT NOT NULL,
    [Magic_power] INT NOT NULL,
    [Health_regen] INT NOT NULL,
    [MP_regen] INT NOT NULL,
    [Ability_haste] INT NOT NULL,
    [Movespeed] NUMERIC(3, 2) NOT NULL,
    [Armor_penetration] NUMERIC(3, 2) NOT NULL,
    [life_steal] NUMERIC(3, 2) NOT NULL,
    [Magic_penetration] INT NOT NULL,
    [Passive] NVARCHAR(160),
    [Active] NVARCHAR(150)
    CONSTRAINT pk_Legendary_items_item_id PRIMARY KEY (Legendary_Item_id)
);
INSERT INTO Legendary_items VALUES
    (N'Abyssal Mask',N'Tank',2700,0,0,0,0,60,0,350,0,0,0,0,0,0,0,0,N'None',N'None'),
    (N'Archangel''s Staff',N'Mage',3000,60,0,0,0,0,0,0,500,0,0,0,0,0,0,0,N'Bouns AP by MP',N'None'),
    (N'Ardent Censer',N'Support,Mage',2300,60,0,0,0,0,0,0,0,0,1,0,0,0,0,0,N'heal and shield',N'None'),
    (N'Banshee''s Veil',N'Mage,Tank',2500,65,0,0,0,45,0,0,0,0,0,10,0,0,0,0,N'shield',N'None'),
    (N'Black Cleaver',N'Fighter,Assassin',3300,0,40,0,0,0,0,300,0,0,0,25,0,0,0,0,N'armor reduce and bonus damage after 6 hit',N'None'),
    (N'Black Mist Scythe',N'Support,Mage',400,0,20,0,0,0,0,75,0,0,0,0,0,0,0,0,N'bonus gold',N'ward'),
    (N'Blade of the Ruined King',N'Fighter,Marksman',3200,0,40,0,0,0,0.25,0,0,0,0,0,0,0,0.12,0,N'bonus damage and slow enemy and MS',N'None'),
    (N'Bloodthirster',N'Marksman',3400,0,55,20,0,0,0,0,0,0,0,0,0,0,0.2,0,N'shield',N'None'),
    (N'Bulwark of the Mountain',N'Support,Tank',400,20,0,0,0,0,0,250,0,0,1,0,0,0,0,0,N'bonus gold',N'ward'),
    (N'Chempunk Chainsword',N'Fighter',2700,45,0,0,0,0,0,200,0,0,0,15,0,0,0,0,N'wound',N'None'),
    (N'Chemtech Putrifier',N'Mage',2300,50,0,0,0,0,0,0,0,0,1,15,0,0,0,0,N'wound',N'None'),
    (N'Cosmic Drive',N'Mage',3000,75,0,0,0,0,0,200,0,0,0,30,0,0,0,0,N'MS after damage',N'None'),
    (N'Dead Man''s Plate',N'Tank',2900,0,0,0,40,0,0,475,0,0,0,0,0.05,0,0,0,N'MS and slow enemy(melee attacker)',N'None'),
    (N'Death''s Dance',N'Fighter',3100,0,50,0,40,0,0,0,0,0,0,15,0,0,0,0,N'MS after takedown heal and true damage',N'None'),
    (N'Demonic Embrace',N'Mage',3000,0,70,0,0,0,0,350,0,0,0,0,0,0,0,0,N'Bonus damage Armor and MG_resist',N'None'),
    (N'Edge of Night',N'Assassin,Marksman',2900,0,50,0,0,0,0,325,0,0,0,0,0,0,0,10,N'Shield for first spell',N'None'),
    (N'Essence Reaver',N'Marksman',2900,0,50,20,0,0,0,0,0,0,0,20,0.05,0,0,0,N'Bonus damage',N'None'),
    (N'Force of Nature',N'Tank',2900,0,0,0,0,60,0,350,400,0,0,20,0,0,0,0,N'None',N'None'),
    (N'Frozen Heart',N'Tank',2700,0,0,0,80,0,0,0,0,0,0,0,0,0,0,0,N'Bonus armor by Max HP',N'None'),
    (N'Gargoyle Stoneplate',N'Tank',3300,0,0,0,60,60,0,0,0,0,0,15,0,0,0,0,N'Bonus  Armor and MG_resist',N'None'),
    (N'Guardian Angel',N'Fighter,Marksman,Assassin',2800,0,40,0,40,0,0,0,0,0,0,0,0,0,0,0,N'Revive after fatal damage',N'None'),
    (N'Guinsoo''s Rageblade',N'Fighter,Marksman',2800,0,40,20,0,0,0.4,0,0,0,0,0,0,0,0,0,N'Crit to damage after 20 and more damage per 2 hit',N'None'),
    (N'Horizon Focus',N'Mage',3000,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Not understand',N'None'),
    (N'Infinity Edge',N'Marksman',3400,0,70,20,0,0,0,0,0,0,0,0,0,0,0,0,N'None',N'None'),
    (N'Knight''s Vow',N'Tank',2300,0,0,0,0,0,0,400,0,3,0,10,0,0,0,0,N'MS towards align champion and take damage for them',N'bind with align champion'),
    (N'Lich Bane',N'Mage',3000,0,80,0,0,0,0,0,0,0,0,0,0.1,0,0,0,N'More attack damage after using spell',N'None'),
    (N'Lord Dominik''s Regards',N'Marksman,Assassin',2900,0,30,20,0,0,0,0,0,0,0,0,0,0.25,0,0,N'Bonus damage by HP difference',N'None'),
    (N'Manamune',N'Marksman,Mage',2600,0,35,0,0,0,0,0,500,0,0,15,0,0,0,0,N'Bonus MP every  hitted spell and bonus AD by max MP',N'None'),
    (N'Maw of Malmortius',N'Fighter',3100,0,50,0,0,50,0,0,0,0,0,15,0,0,0,0,N'shield absorb magic damage',N'None'),
    (N'Mejai''s Soulstealer',N'Mage,Assassin',1600,20,0,0,0,0,0,100,0,0,0,0,0,0,0,0,N'Bonus 5 AP every  stack,MS after 10 each kill get 4 stacks 2 ffor assist',N'None'),
    (N'Mercurial Scimitar',N'Fighter,Marksman,Assassin',2900,0,30,20,0,30,0,0,0,0,0,0,0,0,0,0,N'Remove all debuff and grant MS',N'Remove all debuff and grant MS'),
    (N'Mikael''s Blessing',N'Support,Mage',2300,0,0,0,0,50,0,0,0,0,1,15,0,0,0,0,N'heal and shield',N'Remove all debuff for one align champion or himself'),
    (N'Morellonomicon',N'Mage',2500,0,70,0,0,0,0,250,0,0,0,0,0,0,0,0,N'wound',N'None'),
    (N'Mortal Reminder',N'Marksman',2700,0,20,20,0,0,0.25,0,0,0,0,0,0.07,0,0,0,N'wound',N'None'),
    (N'Muramana',N'Marksman,Mage',2600,0,35,0,0,0,0,0,860,0,0,15,0,0,0,0,N'same as Manamune',N'None'),
    (N'Nashor''s Tooth',N'Mage,Fighter',3000,100,0,0,0,0,0.5,0,0,0,0,0,0,0,0,0,N'more attack damage based on AP',N'None'),
    (N'Navori Quickblades',N'Marksman',3400,0,60,20,0,0,0,0,0,0,0,30,0,0,0,0,N'each crit hit reduce ability cooldown',N'None'),
    (N'Pauldrons of Whiterock',N'Support,Tank',400,0,15,0,0,0,0,250,0,1,0,0,0,0,0,0,N'None',N'ward'),
    (N'Phantom Dancer',N'Marksman',2700,0,0,20,0,0,0.4,0,0,0,0,0,0.07,0,0,0,N'MS and AS after 5 stack',N'None'),
    (N'Rabadon''s Deathcap',N'Mage',3800,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Increase AP by 35%',N'None'),
    (N'Randuin''s Omen',N'Tank',2700,0,0,0,80,0,0,250,0,0,0,10,0,0,0,0,N'Every incoming instance of Basic Attack.png basic damage is Damage reduction  reduced by 5 per 1000 maximum health post-mitigation (maximum 40% reduction each).',N'slow earby enemies by 99% for 0.25 seconds and reduce their attack damage by 10% and critical strike damage by 20% for 4 seconds (60 second cooldown).'),
    (N'Rapid Firecannon',N'Marksman',2700,0,0,0,0,0,0.35,0,0,0,0,0,0,0,0,0,N'Bonus damage and range',N'None'),
    (N'Ravenous Hydra',N'Fighter,Assassin',3300,0,65,0,0,0,0,0,0,0,0,20,0,0,0.15,0,N'AOE 60%- 20%AD based on distance',N'None'),
    (N'Redemption',N'Support,Mage',2300,0,0,0,0,0,0,200,0,1,0,15,0,0,0,0,N'AOE heal(180-360)',N'None'),
    (N'Runaan''s Hurricane',N'Marksman',3400,0,25,20,0,0,0.4,0,0,0,0,0,0.07,0,0,0,N'2 more arrow 40-70% AD',N'None'),
    (N'Rylai''s Crystal Scepter',N'Mage,tank',3000,90,0,0,0,0,0,350,0,0,0,0,0,0,0,0,N'every hit slow enemy 30% MS',N'None'),
    (N'Sanguine Blade',N'Assassin',3000,50,0,0,0,0,0,0,860,0,0,0,0,0,0.12,0,N'more ad penrtration and 20-80 crit when fewer enemy visiable',N'None'),
    (N'Seraph''s Embrace',N'Mage',3000,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'5% of maxMP AP',N'None'),
    (N'Serpent''s Fang',N'Assassin',2800,0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,N'18 penetration and 70+0.4AD when attacking shield',N'None'),
    (N'Serylda''s Grudge',N'Fighter,Assassin',3400,0,45,0,0,0,0,0,0,0,0,20,0,0.3,0,0,N'Slow enemy champion 30% ms',N'None'),
    (N'Shard of True Ice',N'Support,Mage',400,40,0,0,0,0,0,75,0,0,0,0,0,0,0,0,N'None',N'ward'),
    (N'Silvermere Dawn',N'Fighter',3000,0,35,0,0,35,0,200,0,0,0,0,0,0,0,0,N'None',N'Remove all debuff and grant MS and slow resist'),
    (N'Spirit Visage',N'Tank',2900,0,0,0,0,40,0,450,0,1,1,10,0,0,0,0,N'Increase recived heal and shield 25%',N'None'),
    (N'Staff of Flowing Water',N'Support,Mage',2300,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Heal and shield more MS when do them',N'None'),
    (N'Sterak''s Gage',N'Fighter',3100,0,50,0,0,0,0,400,0,0,0,0,0,0,0,0,N'heal after damge or get damaged by champiom get a shield when hp reduced to 30%',N'None'),
    (N'Stormrazor',N'Marksman',2700,0,40,20,0,0,0.15,0,0,0,0,0,0,0,0,0,N'Bonus damage after movement stacks',N'None'),
    (N'The Collector',N'Assassin',3000,0,55,20,0,0,0,0,0,0,0,0,0,0,0,0,N'more penetration and ,execute champion below 5% HP',N'None'),
    (N'Thornmail',N'Tank',2700,0,0,0,60,0,0,350,0,0,0,0,0,0,0,0,N'refelct 10+10%(armor) ap damage to champion and wound',N'None'),
    (N'Titanic Hydra',N'Fighter',3300,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,N'Bonus armor by Max HP and AOE damage',N'None'),
    (N'Umbral Glaive',N'Assassin',2800,0,55,0,0,0,0,500,0,0,0,15,0,0,0,0,N'12 ad penetration more damage to ward reveal trap',N'None'),
    (N'Vigilant Wardstone',N'Support',2300,0,0,0,0,0,0,0,0,0,0,40,0.1,0,0,0,N'None',N'store 3 control wards'),
    (N'Void Staff',N'Mage',2500,65,0,0,0,0,0,0,0,0,0,0,0,0,0,40,N'None',N'None'),
    (N'Warmog''s Armor',N'Tank',3000,0,0,0,0,0,0,800,0,2,0,10,0,0,0,0,N'regenerate 5% max HP if max HP above3000',N'None'),
    (N'Wit''s End',N'Fighter',3100,0,30,0,0,50,0.4,0,0,0,0,0,0,0,0,0,N'Bonus damage per hit based on level and 20% more MS',N'None'),
    (N'Youmuu''s Ghostblade',N'Assassin',3000,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,N'11-18 penetration and 40 MS out of combat',N'Gain 20% MS'),
    (N'Zeke''s Convergence',N'Support,Tank',2400,0,0,0,30,0,0,300,250,0,0,20,0,0,0,0,N'more attack damage based on AP',N'bind with align champion'),
    (N'Zhonya''s Hourglass',N'Mage',2500,65,0,0,45,0,0,0,0,0,0,10,0,0,0,0,N'None',N'untarget for 2.5s and in stasis status');

---build temp brige table 
DROP table if EXISTS Legendary_item_tags1
SELECT Legendary_Item_id, value as Tag
INTO Legendary_item_tags1
FROM Legendary_items cross apply string_split(Tag,',')
GO
--build brige table
SELECT Legendary_Item_id,tag_id
INTO Legendary_item_tags
FROM Legendary_item_tags1 as bt JOIN Tags as it ON it.tag=bt.Tag

ALTER TABLE Legendary_item_tags
ADD CONSTRAINT pk_legen_item_tag PRIMARY KEY (Legendary_Item_id,tag_id)

ALTER TABLE Legendary_item_tags
ADD CONSTRAINT fk_Legen_item_tags FOREIGN KEY(tag_id)
    REFERENCES Tags(tag_id)

ALTER TABLE Legendary_item_tags
ADD CONSTRAINT fk_Legedary_item_tags1 FOREIGN KEY(Legendary_item_id)
    REFERENCES Legendary_items(Legendary_item_id)

---Drop temp table and column
DROP table if EXISTS Legendary_item_tags1
GO

ALTER TABLE Legendary_items
DROP COLUMN Tag
GO


---Create Mythic items table
CREATE TABLE Mythic_Items (
    [Mythic_Item_id] INT IDENTITY(128,1) NOT NULL,
    [Item_name] VARCHAR(25) NOT NULL,
    [Tag] VARCHAR(25) NOT NULL,
    [Price] INT NOT NULL,
    [Abilty_power] INT NOT NULL,
    [Attack_damage] INT NOT NULL,
    [Crit_chance] INT NOT NULL,
    [Armor] INT NOT NULL,
    [Magic_resist] INT NOT NULL,
    [Attack_speed] NUMERIC(3, 2) NOT NULL,
    [Health] INT NOT NULL,
    [Magic_power] INT NOT NULL,
    [Health_regen] NUMERIC(2, 1) NOT NULL,
    [MP_regen] NUMERIC(2, 1) NOT NULL,
    [Ability_haste] INT NOT NULL,
    [Movespeed] NUMERIC(3, 2) NOT NULL,
    [Armor_penetration] INT NOT NULL,
    [life_steal] NUMERIC(3, 2) NOT NULL,
    [Magic_penetration] INT NOT NULL,
    [Mythic_passive] NVARCHAR(87) NOT NULL,
    [Passive] NVARCHAR(244),
    [Active] NVARCHAR(204)
    CONSTRAINT pk_Mythic_Item_id PRIMARY KEY (Mythic_Item_id)
);
INSERT INTO Mythic_Items VALUES
    ('Divine Sunderer','Fighter,Assassin',3300,0,40,0,0,0,0,400,0,0,0,20,0,0,0,0,N'Empowers your other Legendary items with 5% armor penetration and 5%magic penetration. ',N'After using an ability, your next basic attack within 10 seconds deals 10% of target''s maximum health bonus physical damage on-hit, with a minimum damage equal to 150% of base AD and a maximum damage against monsters equal to 250% base AD. I',N'None'),
    ('Duskblade of Draktharr','Assassin',3200,0,55,0,0,0,0,0,0,0,0,20,0,0,0,0,N'Empowers your other Legendary items with 5 ability haste',N'18 penetration based on level   bouns damage and invisible slow',N'None'),
    ('Eclipse','Assassin,Fighter',3200,0,55,0,0,0,0,0,0,0,0,0,0,0,0.1,0,N'Empowers your other Legendary items with 4% armor penetration.',N' 6% of target''s maximum health as bonus physical damage and grants you 15% bonus movement speed,shield',N'None'),
    ('Everfrost','Mage',3400,80,0,0,0,0,0,200,600,0,0,10,0,0,0,0,N'Empowers your other Legendary items with 15 ability power.',N'None',N'Slow stun and AP damage'),
    ('Frostfire Gauntlet','Tank',3200,0,0,0,50,25,0,350,0,0,0,15,0,0,0,0,N'Empowers your other Legendary items with 100 health and 7.5% increased size.',N'Deal 12 − 30 (based on level) (+ 1% bonus health) magic damage, slow',N'None'),
    ('Galeforce','Fighter,Assassin,Marksman',3400,0,55,20,0,0,0.22,0,0,0,0,0,0,0,0,0,N' Empowers your other Legendary items with 3% bonus movement speed.',N'None',N'Dash and AOE damage'),
    ('Goredrinker','Fighter,Assassin',3300,0,45,0,0,0,0,400,0,1.5,0,20,0,0,0,0,N'Empowers your other Legendary items with 5 ability hast',N'Gain 0% − 15% (based on missing health) bonus attack damage.',N'AOE and heal 20% AD (+ 12% of your missing health)(by each chapmion hitted)'),
    ('Hextech Rocketbelt','Mage,Assassin',3200,80,0,0,0,0,0,250,0,0,0,15,0,0,0,0,N'Empowers your other Legendary items with 5 magic penetration.',N'None',N'Dash and AOE damage, gain MS,basic attack rest'),
    ('Immortal Shieldbow','Marksman',3400,0,50,20,0,0,0.15,0,0,0,0,0,0,0,0.12,0,N'Empowers your other Legendary items with 5 bonus attack damage and 50 bonus health.',N'reduce you below 30% maximum health, gain a 250 − 700 (based on level) Hybrid resistances shield for 3 seconds and 15% life steal for 8 seconds ',N'None'),
    ('Imperial Mandate','Support,Tank',2700,40,0,0,0,0,0,200,0,0,1,20,0,0,0,0,N'Empowers your other Legendary items with 15 ability power.',N'MS, all champion do  bonus damage after stun or slow the target',N'None'),
    ('Kraken Slayer','Fighter,Assassin,Marksman',3400,0,65,20,0,0,0.25,0,0,0,0,0,0,0,0,0,N'Empowers your other Legendary items with 10% bonus attack speed.',N'Bonus true damage every 3 attacks',N'None'),
    ('Liandry''s Anguish','Mage',3400,80,0,0,30,30,0,200,600,0,0,20,0,0,0,0,N'Empowers your other Legendary items with 5 ability haste.',N'「 60 (+ 6% AP) (+ 4% target''s maximum health) magic damage over 4 seconds 」and the user to ignore 5% of their magic resistance for the duration, increasing by 5% per second over the duration, up to 15%',N'None'),
    ('Locket of the Iron Solari','Tank,Support',2700,0,0,0,0,0,0,0,0,0,0,20,0,0,0,0,N'mpowers your other Legendary items to increase Consecrate''s bonus resistances by 2.',N'Grant nearby allied champions 5 bonus armor and 5 bonus magic resistance.',N'None'),
    ('Luden''s Tempest','Mage,Assassin',3400,80,0,0,0,0,0,0,600,0,0,10,0,0,0,10,N'Empowers your other Legendary items with 5 magic penetration.',N'Dealing ability damage to an enemy deals 100 (+ 10% AP) bonus magic damage to your target and 3 nearby enemies and grants you 15% bonus movement speed for 2 second',N'None'),
    ('Moonstone Renewer','Support,Tank',2700,40,0,0,0,0,0,200,0,0,1,20,0,0,0,0,N'Empowers your other Legendary items with 5 ability haste.',N'heal  nearby allied champion with the most missing health for 60 − 90 (based on target''s level) (2 second cooldown).',N'None'),
    ('Night Harvester','Mage,Assassin',3200,80,0,0,0,0,0,250,0,0,0,15,0,0,0,0,N'Empowers your other Legendary items with 5 ability haste.',N'Damaging an enemy champion deals 125 − 200 (based on level) (+ 15% AP) bonus magic damage and grants you 25% bonus movement speed for 1.5 seconds. Can apply to different champion without cd',N'None'),
    ('Prowler''s Claw','Fighter,Assassin',3200,0,60,0,0,0,0,0,0,0,0,10,0,0,0,0,N'Empowers your other Legendary items with 5 lethality.',N'21 Lethality (13.07 − 21 (based on level) armor penetration)',N'Dash a line through the target enemy''s location, and upon completing the dash, deal 100 (+ 30% bonus AD) physical damage to the target and increase your damage dealt to them by 15% for the next 3 seconds '),
    ('Riftmaker','Mage,Assassin',3200,80,0,0,0,0,0,150,0,0,0,15,0,0,0.15,0,N'Empowers your other Legendary items with 5% magic penetration.',N'deal 2% increased damage, stacking up to 5 times for a maximum of 10%. While this effect is fully stacked, convert 100% of the bonus damage into true damage.',N'None'),
    ('Shurelya''s Battlesong','Support,Tank',2700,0,0,0,0,0,0,350,0,0,0.5,20,0.05,0,0,0,N'Empowers your other Legendary items with 2.5% bonus movement speed.',N'Grants you and nearby allies 40% bonus movement speed that decays over 4 seconds. Additionally, you and affected allied champions deal 40 − 60 (based on target''s level) bonus magic damage on the next 3 attacks or ability hits against champions ',N'None'),
    ('Stridebreaker','Fighter,Assassin',3300,0,50,0,0,0,0.2,300,0,0,0,10,0,0,0,0,N'Empowers your other Legendary items with 3% bonus movement speed.',N'Dealing physical damage grants you 30 bonus movement speed for 2 seconds.',N'Dash,deal 110% AD physical damage to enemies in a 400-unit-radius circle centered around 100 units front of you,  slowing them by 60% decaying over 2 seconds'),
    ('Sunfire Aegis','Tank',3200,0,0,0,30,30,0,450,0,0,0,15,0,0,0,0,N'Empowers other Legendary items with 5 ability haste',N'Deal 12 − 30 (based on level) (+ 1% bonus health) magic damage every second to enemies withi 325,basic attacks explode around you, burning nearby enemies for your current Immolate damage for 3 seconds.',N'None'),
    ('Trinity Force','Fighter',3333,0,35,0,0,0,0.35,200,0,0,0,10,0,0,0,0,N'Empowers your other Legendary items with 10% bonus attack speed.',N'deals 200% base AD bonus physical damage on-hit ,MS after damage target',N'None'),
    ('Turbo Chemtank','Tank,Support',3200,0,0,0,25,50,0,350,0,0,0,15,0,0,0,0,N' Empowers your other Legendary items with 5% slow resist and tenacity',N'Deal 12 − 30 (based on level) (+ 1% bonus health) magic damage every second to enemies within 325.',N'grants 75% bonus movement speed and Ghost.png ghosting when moving towards a turrent or enemy,slow them.');

----1st form transform
SELECT Mythic_Item_id, value as Tag
INTO Mythic_item_tags1
FROM Mythic_items cross apply string_split(Tag,',')
GO
--build brige table
SELECT Mythic_Item_id,tag_id
INTO Mythic_item_tags
FROM Mythic_item_tags1 as bt JOIN Tags as it ON it.tag=bt.Tag

ALTER TABLE Mythic_item_tags
ADD CONSTRAINT pk_myth_item_tag PRIMARY KEY (Mythic_Item_id,tag_id)

ALTER TABLE Mythic_item_tags
ADD CONSTRAINT fk_myth_item_tags FOREIGN KEY(tag_id)
    REFERENCES Tags(tag_id)

ALTER TABLE Mythic_item_tags
ADD CONSTRAINT fk_myth_item_tags1 FOREIGN KEY(Mythic_item_id)
    REFERENCES Mythic_items(Mythic_item_id)

---Drop temp table and column
DROP table if EXISTS Mythic_item_tags1
GO
ALTER TABLE Mythic_items
DROP COLUMN Tag
GO

---CREATE BASIC_EPIC Upgrade table
Create TABLE Basic_Epic_forge(
    Basic_Item_id INT NOT NULL,
    Epic_Item_id INT NOT NULL,
    upgrade_cost INT NOT NULL
    CONSTRAINT pk_basic_epic_forge PRIMARY KEY (Basic_Item_id,Epic_Item_id)
)
GO
ALTER TABLE Basic_Epic_forge ADD CONSTRAINT fk_Basic_Epic_forge FOREIGN KEY(Basic_Item_id)
REFERENCES Basic_items(Basic_Item_id)

ALTER TABLE Basic_Epic_forge ADD CONSTRAINT fk_Basic_Epic_forge2 FOREIGN KEY(Epic_Item_id)
REFERENCES Epic_items(Epic_Item_id)
GO
 
INSERT INTO Basic_Epic_forge VALUES
('1','19','415'),
('1','21','365'),
('1','22','815'),
('1','28','465'),
('1','36','180'),
('1','41','465'),
('1','42','80'),
('1','45','365'),
('1','51','165'),
('1','57','315'),
('4','60','300'),
('5','18','750'),
('5','23','200'),
('5','25','500'),
('5','51','165'),
('5','58','400'),
('6','34','450'),
('6','39','400'),
('6','48','200'),
('6','49','400'),
('6','60','300'),
('8','20','365'),
('8','29','550'),
('9','24','400'),
('9','34','450'),
('9','35','500'),
('9','40','365'),
('9','44','300'),
('9','46','350'),
('9','52','400'),
('9','56','550'),
('11','18','750'),
('11','35','500'),
('11','43','450'),
('11','47','850'),
('11','54','400'),
('11','57','315'),
('12','37','325'),
('12','55','365'),
('13','26','650'),
('14','20','200'),
('14','26','650'),
('14','31','500'),
('14','38','400'),
('14','41','465'),
('14','46','350'),
('14','54','400'),
('14','59','400'),
('15','32','250'),
('15','42','80')


---Create Epic_Legendary transform table
Create TABLE Epic_Legendary_forge(
    Epic_Item_id INT NOT NULL,
    Legendary_Item_id INT NOT NULL,
    upgrade_cost INT NOT NULL
    CONSTRAINT pk_epic_legendary_forge PRIMARY KEY (Epic_Item_id,Legendary_Item_id)
)
GO
ALTER TABLE Epic_Legendary_forge ADD CONSTRAINT fk_epic_legendary_forge FOREIGN KEY(Epic_Item_id)
REFERENCES Epic_items(Epic_Item_id)

ALTER TABLE Epic_Legendary_forge ADD CONSTRAINT fk_epic_legendary_forge2 FOREIGN KEY(Legendary_Item_id)
REFERENCES Legendary_items(Legendary_Item_id)
GO
 
INSERT INTO Epic_Legendary_forge VALUES
('18','80','1050'),
('19','86','600'),
('21','71','450'),
('22','122','400'),
('23','118','1000'),
('24','65','1050'),
('24','70','400'),
('24','74','325'),
('24','77','500'),
('24','88','750'),
('24','97','825'),
('24','103','100'),
('24','110','850'),
('24','120','800'),
('25','73','900'),
('25','74','325'),
('25','81','50'),
('26','85','700'),
('26','123','650'),
('27','70','400'),
('27','94','700'),
('28','64','400'),
('28','72','865'),
('28','127','50'),
('29','63','400'),
('29','92','600'),
('29','104','700'),
('29','114','650'),
('30','111','0'),
('31','61','900'),
('31','75','815'),
('31','106','815'),
('31','118','1000'),
('31','119','800'),
('31','123','650'),
('32','79','800'),
('32','126','700'),
('33','66','0'),
('34','124','800'),
('35','89','700'),
('36','83','700'),
('38','65','1050'),
('38','72','865'),
('38','85','700'),
('38','101','600'),
('38','104','700'),
('38','113','850'),
('38','123','650'),
('38','126','700'),
('39','102','800'),
('39','116','100'),
('40','87','850'),
('40','108','850'),
('43','61','900'),
('43','78','800'),
('43','92','600'),
('43','124','800'),
('45','71','450'),
('45','93','450'),
('46','115','725'),
('47','91','125'),
('47','112','425'),
('48','82','1100'),
('49','67','425'),
('49','96','715'),
('50','98','0'),
('51','127','50'),
('52','76','1050'),
('52','107','1000'),
('52','109','825'),
('52','117','425'),
('52','120','600'),
('52','125','1025'),
('53','77','500'),
('53','86','600'),
('54','113','850'),
('55','103','100'),
('55','119','800'),
('56','67','425'),
('56','68','600'),
('56','103','100'),
('56','107','1000'),
('57','64','400'),
('58','79','800'),
('58','101','600'),
('59','73','900'),
('59','78','800'),
('60','94','400'),
('60','99','400'),
('60','102','400'),
('60','105','400')

---Create Epic_Mythic transform table
Create TABLE Epic_Mythic_forge(
    Epic_Item_id INT NOT NULL,
    Mythic_Item_id INT NOT NULL,
    upgrade_cost INT NOT NULL
    CONSTRAINT pk_epic_mythic_forge PRIMARY KEY (Epic_Item_id,Mythic_Item_id)
)
GO
ALTER TABLE Epic_Mythic_forge ADD CONSTRAINT fk_epic_mythic_forge FOREIGN KEY(Epic_Item_id)
REFERENCES Epic_items(Epic_Item_id)

ALTER TABLE Epic_Mythic_forge ADD CONSTRAINT fk_epic_mythic_forge2 FOREIGN KEY(Mythic_Item_id)
REFERENCES Mythic_items(Mythic_Item_id)
GO

INSERT INTO Epic_Mythic_forge VALUES
('18','140','950'),
('18','148','700'),
('20','132','950'),
('20','148','700'),
('20','150','1000'),
('21','137','850'),
('21','142','850'),
('24','129','1000'),
('24','144','650'),
('25','132','950'),
('28','139','1200'),
('34','147','200'),
('34','149','700'),
('36','135','900'),
('36','143','900'),
('37','134','200'),
('37','147','200'),
('38','128','700'),
('38','134','200'),
('38','137','850'),
('38','140','400'),
('38','142','850'),
('38','146','850'),
('38','147','200'),
('38','149','733'),
('41','146','1050'),
('42','131','1250'),
('42','139','1200'),
('42','141','1250'),
('43','150','1000'),
('44','133','625'),
('44','136','600'),
('44','138','625'),
('46','128','700'),
('46','134','200'),
('52','129','1000'),
('52','130','850'),
('52','144','650'),
('53','128','700'),
('53','149','733'),
('56','130','850'),
('56','136','600'),
('59','146','850')

----Create Basic_Legendary transform table
Create TABLE Basic_Legendary_forge(
    Basic_Item_id INT NOT NULL,
    Legendary_Item_id INT NOT NULL,
    upgrade_cost INT NOT NULL
    CONSTRAINT pk_basic_legendary_forge PRIMARY KEY (Basic_Item_id,Legendary_Item_id)
)
GO
ALTER TABLE Basic_Legendary_forge ADD CONSTRAINT fk_basic_legendary_forge FOREIGN KEY(Basic_Item_id)
REFERENCES Basic_items(Basic_Item_id)

ALTER TABLE Basic_Legendary_forge ADD CONSTRAINT fk_basic_legendary_forge2 FOREIGN KEY(Legendary_Item_id)
REFERENCES Legendary_items(Legendary_Item_id)
GO

INSERT INTO Basic_Legendary_forge VALUES
('1','72','865'),
('1','75','815'),
('1','96','715'),
('1','106','815'),
('2','68','600'),
('2','81','50'),
('2','84','625'),
('2','116','100'),
('3','63','650'),
('3','75','815'),
('3','86','600'),
('3','93','450'),
('3','96','715'),
('3','106','815'),
('3','114','650'),
('3','122','400'),
('4','68','600'),
('4','77','500'),
('4','82','1100'),
('4','84','625'),
('4','87','850'),
('4','91','125'),
('4','97','825'),
('4','116','100'),
('4','117','425'),
('5','80','1050'),
('5','101','600'),
('5','127','850'),
('6','82','1100'),
('6','99','900'),
('6','105','1025'),
('6','124','800'),
('7','90','1250'),
('9','65','1050'),
('9','76','1050'),
('10','62','1000'),
('10','83','700'),
('10','100','1300'),
('11','88','1050'),
('12','67','425'),
('12','74','325'),
('12','84','625'),
('12','91','125'),
('12','97','825'),
('12','105','1025'),
('12','109','825'),
('12','112','425'),
('12','115','725'),
('12','117','425'),
('12','125','1025'),
('13','85','700'),
('14','70','400'),
('14','73','900'),
('14','76','1050'),
('14','93','800'),
('14','112','425'),
('14','115','725'),
('15','62','1000'),
('15','88','750'),
('16','81','50'),
('16','127','50'),
('17','62','1000'),
('17','88','750')

----create Basic_Mythic table
Create TABLE Basic_Mythic_forge(
    Basic_Item_id INT NOT NULL,
    Mythic_Item_id INT NOT NULL,
    upgrade_cost INT NOT NULL
    CONSTRAINT pk_basic_mythic_forge PRIMARY KEY (Basic_Item_id,Mythic_Item_id)
)
GO
ALTER TABLE Basic_Mythic_forge ADD CONSTRAINT fk_basic_mythic_forge FOREIGN KEY(Basic_Item_id)
REFERENCES Basic_items(Basic_Item_id)

ALTER TABLE Basic_Mythic_forge ADD CONSTRAINT fk_basic_mythic_forge2 FOREIGN KEY(Mythic_Item_id)
REFERENCES Mythic_items(Mythic_Item_id)
GO

INSERT INTO Basic_Mythic_forge VALUES
('3','131','1250'),
('3','135','900'),
('3','143','900'),
('3','145','1050'),
('4','133','625'),
('4','136','600'),
('4','138','625'),
('5','150','1000'),
('8','146','850'),
('9','130','850'),
('11','132','950'),
('12','133','625'),
('12','138','625'),
('14','135','900'),
('14','143','900')

---create player table
Create table Players(
    Player_id INT IDENTITY NOT NULL,
    Player_firstname Varchar(20)NOT NULL,
    Player_lastname Varchar(20),
    Player_rank Varchar(20) NOT NUll,
    Player_email Varchar(50) NOT NULL,
    Player_gender VARCHAR(10) NOT NULL,
    CONSTRAINT pk_players_player_id PRIMARY KEY (Player_id)
)

INSERT INTO Players VALUES
('The','Shy','Diamond','TheshyNO1@gmail.com','male'),
('zihao','jian','Master','uzirng@sina.com','male'),
('mala','xiangguo','Master','MLXGgood@gmail.com','male'),
('Jinlong','han','Bronze','DSMeatmore@qq.com','male'),
('Mou','Liu','Diamond','PDDDD@gmail.com','male'),
('zhi','xiao','Diamond','wsxz123@gmail.com','male'),
('miss','miss','Platinum','topmiss@sina.com','female'),
('Mayumi ','Big','Master','mayumi111@gmail.com','female'),
('Benwei','Lu','Diamond','55open@qq.com','male'),
('Feng','Ruo','Diamond','misayawe@gmail.com','male'),
('Rookie','','Diamond','Roooookie@gmail.com','male'),
('Hu','xiao','Master','xiaohu332@sina.com','male'),
('Kai','Ming','Master','clearlove777@gmail.com','male'),
('yalong','Sun','diamond','xiaoxiao123@qq.com','male'),
('Showermaker','','Diamond','welose555@gmail.com','male'),
('Kayle','big','Diamond','BKgood765@gmail.com','male'),
('Double','Lift','Master','DLdsx12@sina.com','male'),
('Shawn','Michaels','Gold','HBK123@gmail.com','male'),
('su','su','Diamond','susuzac@qq.com','female'),
('Chen','yixun','brozne','lovetosing@gmail.com','male'),
('Bingbing','Fan','silver','imrichaf@gmail.com','male'),
('Huateng','Ma','Challenger','Iownthisgame@sina.com','male'),
('Jack','Ma','Master','Ihatethisgame@gmail.com','male'),
('Chen','He','Diamond','xiaoxian222e@qq.com','male'),
('Big','Mac','Diamond','Mcdobk@gmail.com','male')

--create battle table
Create table Battles(
    Battle_id INT NOT NULL,
    Player_id INT NOT NULL,
    Champion_id INT NOT NULL,
    Battle_mode Varchar(20) NOT NUll,
    Battle_date DATETIME NOT NULL,
    Battle_length INT NOT NULL,
    CONSTRAINT pk_Battles_playerchampion_id PRIMARY KEY (Player_id,Champion_id)
)
ALTER TABLE Battles 
ADD CONSTRAINT fk_Battles_playerid FOREIGN KEY(Player_id)
    REFERENCES Players(Player_id)

ALTER TABLE Battles 
ADD CONSTRAINT fk_Battles_Championid FOREIGN KEY(Champion_id)
    REFERENCES Champions(Champion_id)


INSERT INTO Battles VALUES
('20201123','1','1','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','2','16','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','3','37','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','4','21','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','5','32','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','9','17','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','15','3','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','17','20','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','8','60','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201123','7','100','ranksoloduo','2020-11-23 00:00:00.000',29),
('20201204','20','6','Aram','2020-12-04 00:00:00.000',20),
('20201204','17','50','Aram','2020-12-04 00:00:00.000',20),
('20201204','16','44','Aram','2020-12-04 00:00:00.000',20),
('20201204','20','73','Aram','2020-12-04 00:00:00.000',20),
('20201204','14','9','Aram','2020-12-04 00:00:00.000',20),
('20201204','25','11','Aram','2020-12-04 00:00:00.000',20),
('20201204','1','77','Aram','2020-12-04 00:00:00.000',20),
('20201204','23','47','Aram','2020-12-04 00:00:00.000',20),
('20201204','19','6','Aram','2020-12-04 00:00:00.000',20),
('20201204','13','7','Aram','2020-12-04 00:00:00.000',20)


---Create Purchase table
CREATE TABLE purchases(
    Purchase_id INT IDENTITY NOT NULL,
    Battle_id INT,
    Champion_id INT NOT NULL,
    Mythic_Item_id INT,
    Legendary_Item_id INT,
    CONSTRAINT pk_purchase_id PRIMARY KEY (Purchase_id)
)

INSERT INTO purchases VALUES
('20201123','1','134','74'),
('20201123','1','134','73'),
('20201123','1','134','81'),
('20201123','16','136','68'),
('20201123','16','136','81'),
('20201123','16','136','84'),
('20201123','16','136','105')

ALTER TABLE purchases
ADD CONSTRAINT fk_purchase_champion_id FOREIGN KEY(Champion_id)
    REFERENCES Champions(Champion_id)

ALTER TABLE purchases
ADD CONSTRAINT fk_purchase_mythic_id FOREIGN KEY(Mythic_Item_id)
    REFERENCES Mythic_items(Mythic_Item_id)

ALTER TABLE purchases
ADD CONSTRAINT fk_purchase_legendary_id FOREIGN KEY(Legendary_Item_id)
    REFERENCES Legendary_items(Legendary_Item_id)


----------------------------------------------------------VERIFY-------------------------------------------------------------------------
SELECT * FROM Champions

SELECT* FROM Tags

SELECT * FROM Champion_tags

SELECT * FROM Basic_items

SELECT * FROM Basic_item_tags

SELECT * FROM Epic_items

SELECT * FROM Epic_item_tags

SELECT * FROM Legendary_items

SELECT * FROM Legendary_item_tags

SELECT * FROM Mythic_Items

SELECT * FROM Mythic_item_tags

SELECT * FROM Basic_Epic_forge

SELECT * FROM Basic_Legendary_forge

SELECT * FROM Basic_Mythic_forge

SELECT * FROM Epic_Legendary_forge

SELECT * FROM Epic_Mythic_forge

SELECT * FROM Players

SELECT * FROM Battles

SELECT * FROM purchases
GO

-------
----------------------------------------------story 1
---As a Player, I should be able to view any Item forge recipe and which items can I buy,
---so that the champion I picked could have more fighting capacity in the the game.

DROP PROC IF EXISTS p_items_recipe
GO

CREATE PROC p_items_recipe(
    @Item_class VARCHAR(50),
    @Gold INT ,
    @For VARCHAR (50)
)  
AS BEGIN
BEGIN TRY       
    BEGIN TRANSACTION
        IF @Item_class='Mythic' 
            BEGIN
             SELECT m.Item_name AS Mythic_Item_Name ,e.Item_name AS Epic_Item_Name,b.Basic_Item_Name,m.Price AS Total_cost
             FROM Mythic_Items m 
             JOIN Basic_Mythic_forge bm ON M.Mythic_Item_id=bm.Mythic_Item_id
             JOIN Basic_items b ON b.Basic_Item_id=bm.Basic_Item_id
             JOIN Epic_Mythic_forge em ON em.Mythic_Item_id=m.Mythic_Item_id
             JOIN Epic_items e  ON e.Epic_Item_id=em.Epic_Item_id
             JOIN Mythic_item_tags mit ON mit.Mythic_Item_id=m.Mythic_Item_id
             JOIN Tags t ON t.tag_id=mit.tag_id 
             WHERE m.Price< @Gold AND tag=@For
             IF @@ROWCOUNT =0 THROW 500001, 'You dont have enough gold,try Epic items',1
             END
        ELSE IF @Item_class='Legendary' 
            BEGIN
             SELECT l.Item_name AS Legedary_Item_Name ,e.Item_name AS Epic_Item_Name,b.Basic_Item_Name,l.Price AS Total_cost
             FROM Legendary_Items l 
             JOIN Basic_Legendary_forge bl ON l.Legendary_Item_id=bl.Legendary_Item_id
             JOIN Basic_items b ON b.Basic_Item_id=bl.Basic_Item_id
             JOIN Epic_Legendary_forge el ON el.Legendary_Item_id=l.Legendary_Item_id
             JOIN Epic_items e  ON e.Epic_Item_id=el.Epic_Item_id
             JOIN Legendary_item_tags lit ON lit.Legendary_Item_id=l.Legendary_Item_id
             JOIN Tags t ON t.tag_id=lit.tag_id 
             WHERE l.Price< @Gold AND tag=@For
             IF @@ROWCOUNT =0 THROW 500001, 'You dont have enough gold,try Epic items',1
            END
        ELSE IF @Item_class='Epic' 
            BEGIN
             SELECT e.Item_name AS Epic_Item_Name,b.Basic_Item_Name,e.Price AS Total_cost
             FROM Epic_items e
             JOIN Basic_Epic_forge be ON e.Epic_Item_id=be.Epic_Item_id
             JOIN Basic_items b ON b.Basic_Item_id=be.Basic_Item_id
             JOIN Epic_item_tags eit ON eit.Epic_Item_id=e.Epic_Item_id
             JOIN Tags t ON t.tag_id=eit.tag_id 
             WHERE e.Price< @Gold AND tag=@For
             IF @@ROWCOUNT =0 THROW 500002, 'You dont have enough gold,try basic items',2
            END
        ELSE IF @Item_class='Basic'
            BEGIN 
             SELECT b.Basic_Item_Name,b.Price AS Total_cost
             FROM Basic_items b 
             JOIN Basic_item_tags bit ON b.Basic_Item_id=bit.Basic_Item_id
             JOIN Tags t ON t.tag_id=bit.tag_id
             WHERE b.Price< @Gold AND tag=@For
             IF @@ROWCOUNT =0 THROW 500003, 'You poor as fuck,please FF 15',3
            END
    COMMIT
END TRY
BEGIN CATCH
      SELECT  
      ERROR_MESSAGE() AS ErrorMessage;
      ROLLBACK
END CATCH
END
---test


EXEC p_items_recipe basic,400,assassin
GO

-------------------------------------------story2
----- As a Player, I should be able to test my damage of any combination between champions and items in each level
---- so that I could get inspiration of new style of how to use a champion.

GO
DROP PROC IF EXISTS p_champ_item_strategy
GO
CREATE PROC p_champ_item_strategy(
    @Champion_id INT,
    @legendary_item_id VARCHAR(50),
    @mythic_item_id VARCHAR(50),
    @legendary_item_id1 VARCHAR(50),
    @legendary_item_id2 VARCHAR(50),
    @legendary_item_id3 VARCHAR(50),
    @legendary_item_id4 VARCHAR(50),
    @legendary_item_id5 VARCHAR(50),
    @level INT
)  
AS BEGIN 
declare @lastest_id int
set @lastest_id = (select max(purchase_id) from purchases)

INSERT INTO purchases(Champion_id,Legendary_Item_id,Mythic_Item_id)
VALUES(@Champion_id,@legendary_item_id,@mythic_item_id),
      (@Champion_id,@legendary_item_id1,@mythic_item_id),
      (@Champion_id,@legendary_item_id2,@mythic_item_id),
      (@Champion_id,@legendary_item_id3,@mythic_item_id),
      (@Champion_id,@legendary_item_id4,@mythic_item_id),
      (@Champion_id,@legendary_item_id5,@mythic_item_id)
END
BEGIN
WITH s1 AS
(
SELECT Champion_name,SUM(l.Attack_damage) as TOTAL_AD
FROM Champions c 
JOIN purchases pu ON c.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
WHERE Purchase_id > @lastest_id
GROUP BY Champion_name
UNION
SELECT distinct Champion_name,
c.attack_damage+@level*c.attackdamage_per_level+m.Attack_damage as ad_at_thislevel
FROM Champions c 
JOIN purchases pu ON c.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
WHERE Purchase_id > @lastest_id
)
SELECT  Champion_name,SUM(TOTAL_AD) AS Your_attack_damage_ad FROM s1
GROUP BY Champion_name
END
---test

EXEC p_champ_item_strategy 1,84,149,96,101,115,118,119,10

-----AFTER manuly caculate to conform Aartox damage when 60(basic_ad)+50(whenLvl10,5X10)+35+70+50+30(other4 items ad buff,2 of them dont provide ad)=295, 
-----which eauqals to my procdure result, means it works!!!!!

-------------------------------------story3--------------
-------As a LOL developer, I should be able to input any new users’ information so that I can track their rank and game records.
DROP PROC IF EXISTS p_upsert_player
GO
create procedure p_upsert_player (
    @firstname varchar(50),
    @lastname varchar(50),
    @rank varchar(50),
    @email varchar(50),
    @gender varchar(50)

) as begin
insert into Players (Player_firstname,Player_lastname, Player_rank,Player_email,Player_gender)
values (@firstname , @lastname, @rank,@email, @gender)
END

EXEC p_upsert_player BIG,ASS,Challlenger,'fdfidfjid@dfdf.com',gay

------------A TRIGGER TO PUNISH BIG MOUTH
--------trigger on player table: if new user input bragged rank(you cannot be a challenger(higgest rank) so fast), change it back to bronze.
drop trigger if exists to_bronze
GO
create trigger to_bronze on Players
    after insert, update
as BEGIN
    update Players
        set Player_rank= 'Bronze'
        from inserted 
    where inserted.Player_id = Players.Player_id
END
GO


EXEC p_upsert_player big,ben,Challlenger,'ff151234@.ggcom',male
SELECT * FROM Players

GO
DELETE 
FROM Players  where Player_id > 26

----Now it works :)


---------------------------------------------story4
---As a Player and developer, I should be able to see all the players’ game records as well as the champions and items they used.
GO
Drop VIEW IF EXISTS v_game_records
GO
CREATE VIEW v_game_records AS
SELECT b.Battle_id,p.Player_firstname+' '+Player_lastname AS playername,Battle_mode,Champion_name,m.Item_name as mythic,l.Item_name as legendary
FROM Battles b 
JOIN Players p ON b.Player_id=p.Player_id 
JOIN Champions c ON c.Champion_id=b.Champion_id
JOIN purchases pu ON b.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
WHERE b.Battle_id IS NOT NULL
GO
SELECT * FROM v_game_records

GO
----------------------Sample data
----1. Which game mode the shy played and which champion he used, how he build his items?
SELECT b.Battle_id,p.Player_firstname+' '+Player_lastname AS playername,Battle_mode,Champion_name,m.Item_name as mythic,l.Item_name as legendary
FROM Battles b 
JOIN Players p ON b.Player_id=p.Player_id 
JOIN Champions c ON c.Champion_id=b.Champion_id
JOIN purchases pu ON b.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
WHERE p.Player_id=1

GO
---2.Which items are required to forge Mythic item "Eclipse"? How much gold do I need?

--SELECT pv.Basic_Item_Name,Epic_Item_Name1,Epic_Item_Name2,pv.Total_cost
--FROM (
SELECT m.Item_name AS Mythic_Item_Name ,e.Item_name AS Epic_Item_Name,b.Basic_Item_Name,m.Price AS Total_cost
FROM Mythic_Items m 
JOIN Basic_Mythic_forge bm ON M.Mythic_Item_id=bm.Mythic_Item_id
JOIN Basic_items b ON b.Basic_Item_id=bm.Basic_Item_id
JOIN Epic_Mythic_forge em ON em.Mythic_Item_id=m.Mythic_Item_id
JOIN Epic_items e  ON e.Epic_Item_id=em.Epic_Item_id
WHERE m.Item_name='Eclipse'
---) AS t
---PIVOT(max(Epic_Item_Name) FOR Mythic_Item_Name IN (Epic_Item_Name1,Epic_Item_Name2))AS pv

----3.Which Champions has the Hightest AD when Level 3?
SELECT TOP 10 Champion_name, (attack_damage + attackdamage_per_level*3) AS AD
FROM Champions
ORDER BY AD DESC
SELECT * FROM Champions

---4.Which Epic items Should Tank Champion purchase to get the most Magic_resist
SELECT TOP 3 item_name,Magic_resist
FROM Epic_items ei 
JOIN Epic_item_tags eit ON ei.Epic_Item_id=eit.Epic_Item_id 
JOIN Tags t ON t.tag_id=eit.tag_id
WHERE tag ='Tank'
ORDER BY Magic_resist DESC

---5.How many champions are there based on there type?
SELECT COUNT(*) as num_of_champions,tag
FROM Champions c 
JOIN Champion_tags ct ON c.Champion_id=ct.Champion_id
JOIN Tags t ON t.tag_id=ct.tag_id
GROUP BY tag
ORDER BY num_of_champions DESC
,
---6.Who has highest damage if Aatrox has Goredrinker,Death's Dance,Dead Man's Plate,Guardian Angel and Caitlyn has Immortal Shieldbow,
---Bloodthirster,Guardian Angel,Infinity Edge,Runaan's Hurricane When they are both in Level 15?(take only damage in considration)

WITH s1 AS
(
SELECT Champion_name,SUM(l.Attack_damage) as TOTAL_AD
FROM Battles b 
JOIN Players p ON b.Player_id=p.Player_id 
JOIN Champions c ON c.Champion_id=b.Champion_id
JOIN purchases pu ON b.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
GROUP BY b.player_id,Champion_name
UNION
SELECT distinct Champion_name,
c.attack_damage+15*c.attackdamage_per_level+m.Attack_damage as ad_at_15
FROM Battles b 
JOIN Players p ON b.Player_id=p.Player_id 
JOIN Champions c ON c.Champion_id=b.Champion_id
JOIN purchases pu ON b.Champion_id=pu.Champion_id
JOIN Mythic_Items m ON pu.Mythic_Item_id=m.Mythic_Item_id
JOIN Legendary_items l ON pu.Legendary_Item_id=l.Legendary_Item_id
)
SELECT  Champion_name,SUM(TOTAL_AD) AS lv_15_ad FROM s1
GROUP BY Champion_name

----Aatrox win!!!!it works well!!!!



 

