SELECT IPGoreUlkeKodu, Satisci, (CAST(COUNT(FormID) AS FLOAT) / (SELECT CAST(COUNT(FormID) AS FLOAT)
														FROM interview_db)*100) as Ratio
FROM interview_db
WHERE Satisci <> 'NULL' AND Satisci <> 'Auto User'
	AND IPGoreUlkeKodu <> 'NULL' 
	--AND OdenenTutar <> 0
	--AND Durum ='kayýt olmuþ'
GROUP BY IPGoreUlkeKodu, Satisci
ORDER BY IPGoreUlkeKodu, Ratio DESC
