# db-university

## dipartimenti
-id
-descrizione (nome del dipartimento)
-codice univoco

## corsi di laurea
-id
-descrizione (nome del corso di laurea)
-codice univoco

## corsi
-id
-nome corso
-numero massimo di studenti

## insegnati
- id
- nome
- cognome
- cv
- cf

## esame
- id
- #appelli
- sessione
- numero univoco esame

## studenti
- nome  
- cognome 
- cf 
- contatti

## query in mysql

## Selezionare tutti gli studenti nati nel 1990 (160)
### METHOD 1
SELECT * 
FROM `students`
WHERE `date_of_birth` 
LIKE '1990%';

### METHOD 2
SELECT * 
FROM `students`
WHERE Year(date_of_birth) = '1990';


# Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * 
FROM `courses`
WHERE `cfu` > 10;

# Selezionare tutti gli studenti che hanno più di 30 anni
### METHOD 1
select *
FROM `students`
where 2025 - Year(date_of_birth) > 30;

### METHOD 2
SELECT *
FROM `students`
WHERE `date_of_birth` <= curdate() - interval 30 year

# Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea

SELECT * 
FROM  courses 
WHERE `period` = 'I semestre' AND `year`= 1

# Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 

SELECT * 
FROM  exams
WHERE `date` = '2020-06-20' and HOUR(hour)> 13


# Selezionare tutti i corsi di laurea magistrale 
SELECT * 
FROM  degrees
WHERE `level` = 'magistrale'

# Da quanti dipartimenti è composta l'università
SELECT * 
FROM departments 
count

# Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT * 
FROM teachers
where `phone` is NULL