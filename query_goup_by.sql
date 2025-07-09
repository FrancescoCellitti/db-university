#Contare quanti iscritti ci sono stati ogni anno
SELECT year(enrolment_date), count(*)
FROM students
GROUP BY year(enrolment_date);

#Contare gli insegnanti che hanno ufficio nello stesso edificio

SELECT office_address, count(*)
FROM teachers
GROUP BY office_address;

# Calcolare la media dei voti di ogni appello d_esame
SELECT exam_id, AVG(vote)
FROM exam_student
GROUP BY exam_id;

#Contare quanti corsi di laurea ci sono per ogni dipartimento
Select degree_id, count(description)
FROM courses 
GROUP BY degree_id


