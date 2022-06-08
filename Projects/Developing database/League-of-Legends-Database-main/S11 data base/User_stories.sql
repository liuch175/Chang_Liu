USE LOL

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
EXEC p_items_recipe Mythic,3500,Mage
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

EXEC p_upsert_player BIGq,ASSq,Challlenger,'fdwwfidfjid@dfdf.com',gay
SELECT * FROM Players


----Now it works :)


---------------------------------------------story4
---As a Player and developer, I should be able to see all the players’ game records as well as the champions and items they used.
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






