# Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.name,
students.surname,
students.date_of_birth
FROM students 
join degrees on degrees.id = students.degree_id
where degrees.name = 'corso di laurea in economia';

# Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT degrees.name
FROM degrees
join departments on departments.id = degrees.department_id
where departments.name = 'dipartimento di Neuroscienze';

#Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) 
SELECT courses.name
FROM courses       
JOIN course_teacher  ON course_teacher.course_id = courses.id
WHERE course_teacher.teacher_id = 44;

#Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.*,
       degrees.name,
       departments.name
FROM students
JOIN degrees ON degrees.id = students.degree_id
JOIN departments ON departments.id = degrees.department_id
ORDER BY students.surname, students.name;

#Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name,
       courses.name,
       teachers.name,
       teachers.surname
FROM degrees
JOIN courses ON courses.degree_id = degrees.id
JOIN course_teacher ON course_teacher.course_id = courses.id
JOIN teachers ON teachers.id = course_teacher.teacher_id;

#Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT teachers.*
FROM teachers
JOIN course_teacher ON course_teacher.teacher_id = teachers.id
JOIN courses ON courses.id = course_teacher.course_id
JOIN degrees ON degrees.id = courses.degree_id
WHERE degrees.department_id = 5;

#Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.
SELECT exam_student.student_id,
       exam_student.exam_id,
       COUNT(*) AS num_tentativi,
       MAX(exam_student.vote) AS voto_massimo
FROM exam_student
WHERE exam_student.vote >= 18
GROUP BY exam_student.student_id, exam_student.exam_id;