--link : https://leetcode.com/problems/patients-with-a-condition/?envType=study-plan-v2&envId=top-sql-50
--We need to find patients whose condition contains a code starting with **"DIAB1"**.

-- Conditions are space-separated  
-- Match "DIAB1" at the start or after a space  


SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%';
