---sample data to test if database works
USE LOL

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

----catilyn win!!!!it works well!!!!



 


      

