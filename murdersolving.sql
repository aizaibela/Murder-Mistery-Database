-- SQLite
--Searching for the date of the crime using the filters city, type and date
SELECT * FROM crime_scene_report
 WHERE date = 20180115 
 AND city = 'SQL City'
   AND type = 'murder'
   --Security footage shows
   -- that there were 2 witnesses.
    --The first witness lives at the
    -- last house on "Northwestern Dr".
     -- The second witness, 
     --named Annabel, lives somewhere
     -- on "Franklin Ave"
     --Searching for the Witnesses
     SELECT * FROM person
      WHERE address_street_name = 'Northwestern Dr' ORDER BY address_number ASC
     --14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
     SELECT * FROM person
      WHERE address_street_name = 'Franklin Ave' 
      AND name LIKE '%Annabel%'
      --16371	Annabel Miller	490173	103	Franklin Ave	318771143
      --Searching for the Witnesses characteristics
      SELECT * FROM drivers_license WHERE id = 118009
     --118009	64	84	blue	white	male	00NU00	Mercedes-Benz	E-Class 
          SELECT * FROM drivers_license WHERE id = 490173  
      --490173	35	65	green	brown	female	23AM98	Toyota	Yaris
    --Searching for the witnesses interview
 SELECT * FROM interview WHERE person_id = 14887
      --I heard a gunshot and then saw a man 
      --run out. He had a "Get Fit Now Gym" bag.
      -- The membership number on the bag started
       -- with "48Z". Only gold members have 
       -- those bags. The man got into a car
       --  with a plate that included "H42W".
       SELECT * FROM interview WHERE person_id = '16371'
      --16371	I saw the murder happen, 
      --and I recognized the killer from 
      --my gym when I was working out
      -- last week on January the 9th.
 --Suspect is a member of the gym, also info about a vehicule's plate number     
SELECT * FROM get_fit_now_member Where membership_status = 'gold' AND id LIKE '%48Z%'
      --48Z7A	28819	Joe Germuska	20160305	gold
--48Z55--67318	Jeremy Bowers	20160101	gold
SELECT * FROM drivers_license WHERE plate_number LIKE '%H42W%'
--183779	21	65	blue	blonde	female	H42W0X	Toyota	Prius
--423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
--664760	21	71	black	black	male	4H42WR	Nissan	Altima
--Suspect according to Annabel was at the gym on January 9th
SELECT * FROM get_fit_now_check_in WHERE membership_id = '48Z7A' OR membership_id = '48Z55'
-- Both suspects Joe and Jeremy checked in on the 09th
SELECT * FROM get_fit_now_check_in WHERE check_in_date = 20180115 
--D2KY6	20180115	746	836
--344VM	20180115	1087	1195
--3BRSC	20180115	354	825
--HM6U8	20180115	525	800
SELECT * FROM get_fit_now_member Where id = 'D2KY6' OR '344VM' OR '3BRSC' OR 'HM6U8'
SELECT * from person WHERE name = 'Joe Germuska'
--28819	Joe Germuska	173289	111	Fisk Rd	138909730
SELECT * from person WHERE name = 'Jeremy Bowers'
--67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279
--Jeremy licence plate matches with the 'H42W', making him the main suspect
--Suspect interview
SELECT * from interview where person_id = 67318
--67318	I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65")
 --or 5'7" (67"). She has red hair and she drives a Tesla Model
 -- S. I know that she attended the 
 -- SQL Symphony Concert 3 times in December 2017.
 --Now it seems like there are two suspects, the mind behind the murder and the executer
 SELECT * FROM drivers_license 
 WHERE car_make LIKE '%Tesla%' AND car_model
  LIKE 'Model S' AND gender = 'female' AND hair_color = 'red'
  --202298 68	66	green	red	female	500123	Tesla	Model S
--291182   65	66	blue	red	female	08CM64	Tesla	Model S
--918773   48	65	black	red	female	917UU3	Tesla	Model S
--Searching the event
SELECT * FROM facebook_event_checkin WHERE event_name LIKE '%SQL%' AND date LIKE '201712%' ORDER BY person_id
--USERs id 99716, 24556 attended 3 times
SELECT * FROM person WHERE id = '99716' OR id = '24556'
24556	Bryan Pardo	101191	703	Machine Ln	816663882
99716	Miranda Priestly	202298	1883	Golden Ave	987756388
--Miranda Priestly is the main mind 
SELECT * FROM income WHERE ssn = 987756388
--987756388	310000 - a lot of money
--So the killer mastermind is Miranda Priestly and the executer is Jeremy Bowers