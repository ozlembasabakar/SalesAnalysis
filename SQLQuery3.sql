-- #1
SELECT IPGoreUlkeKodu, ROUND(((SUM(OdenenTutar) / (SELECT SUM(OdenenTutar)
													FROM interview_db))*100),2) as Ratio
FROM interview_db
WHERE IPGoreUlkeKodu <> 'NULL' 
	AND OdenenTutar <> 0 
GROUP BY IPGoreUlkeKodu
ORDER BY Ratio DESC


-- #2
-- Ödenen tutara göre 
SELECT Satisci, ROUND(((SUM(OdenenTutar) / (SELECT SUM(OdenenTutar)
											FROM interview_db))*100),2) as Ratio
FROM interview_db
WHERE Satisci <> 'NULL' 
	AND OdenenTutar <> 0
	AND Durum ='kayýt olmuþ'
GROUP BY Satisci
ORDER BY Satisci

-- Yapýlan satýþ sayýsýna göre
SELECT Satisci, ROUND((CAST(COUNT(FormID) AS FLOAT) / (SELECT CAST(COUNT(FormID) AS FLOAT)
														FROM interview_db)*100),2) as Ratio
FROM interview_db
WHERE Satisci <> 'NULL' AND Satisci <> 'Auto User'
	--AND OdenenTutar <> 0
	--AND Durum ='kayýt olmuþ'
GROUP BY Satisci
ORDER BY Satisci


-- #3
-- Ödenen tutara göre 
SELECT IPGoreUlkeKodu, Satisci, ROUND((SUM(OdenenTutar) / (SELECT SUM(OdenenTutar)
															FROM interview_db)*100),3) as Ratio
From interview_db
Where Satisci <> 'NULL' 
	AND IPGoreUlkeKodu <> 'NULL' 
	--AND OdenenTutar <> 0
GROUP BY IPGoreUlkeKodu, Satisci
ORDER BY IPGoreUlkeKodu, Ratio DESC


-- Yapýlan satýþ sayýsýna göre
SELECT IPGoreUlkeKodu, Satisci, ROUND((CAST(COUNT(FormID) AS FLOAT) / (SELECT CAST(COUNT(FormID) AS FLOAT)
																		FROM interview_db)*100),2) as Ratio
FROM interview_db
WHERE Satisci <> 'NULL' AND Satisci <> 'Auto User'
	AND IPGoreUlkeKodu <> 'NULL' 
	--AND OdenenTutar <> 0
	--AND Durum ='kayýt olmuþ'
GROUP BY IPGoreUlkeKodu, Satisci
ORDER BY IPGoreUlkeKodu, Ratio DESC


-- #4
-- Python ile özellik ekleme
SELECT IPGoreUlkeKodu, AdvType, ROUND((CAST(COUNT(AdvType) AS FLOAT) / (SELECT CAST(COUNT(AdvType) AS FLOAT)
																		FROM interview_table)*100),2) as Ratio
From interview_table
Where IPGoreUlkeKodu <> 'NULL' 
	AND AdvType <> 'NaN'
GROUP BY IPGoreUlkeKodu, AdvType
ORDER BY IPGoreUlkeKodu, AdvType DESC


-- SQL üzerinden yapma
UPDATE interview_db
SET UtmSource = CASE WHEN UtmSource = 'advgoogle' THEN 'Google'
	   WHEN UtmSource = 'googleadv' THEN 'Google'
	   WHEN UtmSource = 'googleseo' THEN 'Google'
	   WHEN UtmSource = 'test' THEN 'Other'
	   WHEN UtmSource = 'santral-arandi' THEN 'Other'
	   WHEN UtmSource = 'facebook' THEN 'Facebook'
	   WHEN UtmSource = 'email' THEN 'Email'
	   WHEN UtmSource = 'recommend' THEN 'Recommend'
	   WHEN UtmSource = 'Viber' THEN 'Viber'
	   ELSE UtmSource
	   END


SELECT IPGoreUlkeKodu, UtmSource, ROUND((CAST(COUNT(UtmSource) AS FLOAT) / (SELECT CAST(COUNT(UtmSource) AS FLOAT)
																			FROM interview_db)*100),2) as Ratio
From interview_db
Where IPGoreUlkeKodu <> 'NULL' 
	AND UtmSource <> 'NULL'
GROUP BY IPGoreUlkeKodu, UtmSource
ORDER BY IPGoreUlkeKodu, UtmSource DESC

