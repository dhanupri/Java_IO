--uc1 create database
mysql>  CREATE database employee_payroll_service;
Query OK, 1 row affected (0.04 sec)

mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| address_book             |
| bootcamp                 |
| college                  |
| cric                     |
| cric_field               |
| cric_ppl                 |
| cricket                  |
| day1bootcamp             |
| dhanu                    |
| emp                      |
| emp_det                  |
| employee                 |
| employee_payroll_service |
| information_schema       |
| ipl                      |
| lab                      |
| mysql                    |
| payroll_service          |
| people                   |
| performance_schema       |
| ppl                      |
| rough                    |
| sakila                   |
| stu                      |
| stud_det                 |
| student_d                |
| student_db               |
| student_details          |
| student_info             |
| sys                      |
| team                     |
| todo1                    |
| todo2                    |
| todo_list                |
| world                    |
+--------------------------+
35 rows in set (0.01 sec)
--uc2 create table
mysql>  USE employee_payroll_service;
Database changed
mysql> Create table employee_payroll (
    -> id int NOT NULL auto_increment,
    ->  name varchar(100) NOT NULL,
    -> salary int NOT NULL,
    ->  start date,
    -> primary key (id));
Query OK, 0 rows affected (0.21 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | NO   |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.02 sec)

--uc3 insert values in table
mysql> INSERT INTO employee_payroll
    -> (name, salary, start) VALUES
    -> ('Bill',1000000, '2021-07-09');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO employee_payroll
    -> (name, salary, start) VALUES
    -> ('Mark',1200000, '2021-07-09'),
    -> ('David',2200000, '2021-07-02'),
    -> ('John',5000000, '2021-04-06');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0
--uc4 display table
mysql>  SELECT * FROM employee_payroll;
+----+-------+---------+------------+
| id | name  | salary  | start      |
+----+-------+---------+------------+
|  1 | Bill  | 1000000 | 2021-07-09 |
|  2 | Mark  | 1200000 | 2021-07-09 |
|  3 | David | 2200000 | 2021-07-02 |
|  4 | John  | 5000000 | 2021-04-06 |
+----+-------+---------+------------+
4 rows in set (0.00 sec)
--uc5 using where clause
mysql>  SELECT salary FROM employee_payroll WHERE name = 'Bill';
+---------+
| salary  |
+---------+
| 1000000 |
+---------+
1 row in set (0.00 sec)

mysql>  SELECT salary FROM employee_payroll WHERE start BETWEEN CAST('2021-07-09' AS DATE) AND DATE(NOW());
+---------+
| salary  |
+---------+
| 1000000 |
| 1200000 |
+---------+
2 rows in set (0.00 sec)

--uc6 alter table adding new column and updating values
mysql>  ALTER table employee_payroll
    -> ADD gender CHAR(1);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> SELECT * FROM employee_payroll;
+----+-------+---------+------------+--------+
| id | name  | salary  | start      | gender |
+----+-------+---------+------------+--------+
|  1 | Bill  | 1000000 | 2021-07-09 | NULL   |
|  2 | Mark  | 1200000 | 2021-07-09 | NULL   |
|  3 | David | 2200000 | 2021-07-02 | NULL   |
|  4 | John  | 5000000 | 2021-04-06 | NULL   |
+----+-------+---------+------------+--------+
4 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Bill' or name = 'David' or name = 'John';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql>  SELECT * FROM employee_payroll;
+----+-------+---------+------------+--------+
| id | name  | salary  | start      | gender |
+----+-------+---------+------------+--------+
|  1 | Bill  | 1000000 | 2021-07-09 | M      |
|  2 | Mark  | 1200000 | 2021-07-09 | NULL   |
|  3 | David | 2200000 | 2021-07-02 | M      |
|  4 | John  | 5000000 | 2021-04-06 | M      |
+----+-------+---------+------------+--------+
4 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Merrisa' or name = 'Mary';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Bill' or name = 'Mary';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+---------+------------+--------+
| id | name  | salary  | start      | gender |
+----+-------+---------+------------+--------+
|  1 | Bill  | 1000000 | 2021-07-09 | M      |
|  2 | Mark  | 1200000 | 2021-07-09 | NULL   |
|  3 | David | 2200000 | 2021-07-02 | M      |
|  4 | John  | 5000000 | 2021-04-06 | M      |
+----+-------+---------+------------+--------+
4 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'M' WHERE  name = 'Mark';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------+---------+------------+--------+
| id | name  | salary  | start      | gender |
+----+-------+---------+------------+--------+
|  1 | Bill  | 1000000 | 2021-07-09 | M      |
|  2 | Mark  | 1200000 | 2021-07-09 | M      |
|  3 | David | 2200000 | 2021-07-02 | M      |
|  4 | John  | 5000000 | 2021-04-06 | M      |
+----+-------+---------+------------+--------+
4 rows in set (0.00 sec)

mysql> INSERT INTO employee_payroll
    -> (name, salary, start,gender) VALUES
    -> ('Aarthi',1200000, '2021-07-09','F'),
    -> ('Mary',1270000, '2021-07-09','F'),
    -> ('Merrisa',3270000, '2021-07-09','F');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+------------+--------+
| id | name    | salary  | start      | gender |
+----+---------+---------+------------+--------+
|  1 | Bill    | 1000000 | 2021-07-09 | M      |
|  2 | Mark    | 1200000 | 2021-07-09 | M      |
|  3 | David   | 2200000 | 2021-07-02 | M      |
|  4 | John    | 5000000 | 2021-04-06 | M      |
|  5 | Aarthi  | 1200000 | 2021-07-09 | F      |
|  6 | Mary    | 1270000 | 2021-07-09 | F      |
|  7 | Merrisa | 3270000 | 2021-07-09 | F      |
+----+---------+---------+------------+--------+
7 rows in set (0.00 sec)
--uc7 using aggregate functions

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|     5740000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|     3270000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|     1200000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+--------------+
| AVG(salary)  |
+--------------+
| 1913333.3333 |
+--------------+
1 row in set (0.00 sec)

mysql>  SELECT gender, count(gender) FROM employee_payroll GROUP BY gender;
+--------+---------------+
| gender | count(gender) |
+--------+---------------+
| M      |             4 |
| F      |             3 |
+--------+---------------+
2 rows in set (0.00 sec)
--uc8 alter table add new columns
mysql>  ALTER TABLE employee_payroll ADD phone_number VARCHAR(250) AFTER name;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD address VARCHAR(250) AFTER phone_number;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(100) | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| address      | varchar(250) | YES  |     | TBD     |                |
| department   | varchar(150) | NO   |     | NULL    |                |
| salary       | int          | NO   |     | NULL    |                |
| start        | date         | YES  |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)
--uc9 alter table column names

mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  SELECT * FROM employee_payroll;
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
| id | name    | phone_number | address | department | basic_pay | deductions | taxable_pay | tax | net_pay | start      | gender |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
|  1 | Bill    | NULL         | NULL    |            |   1000000 |
0 |           0 |   0 |       0 | 2021-07-09 | M      |
|  2 | Mark    | NULL         | NULL    |            |   1200000 |
0 |           0 |   0 |       0 | 2021-07-09 | M      |
|  3 | David   | NULL         | NULL    |            |   2200000 |
0 |           0 |   0 |       0 | 2021-07-02 | M      |
|  4 | John    | NULL         | NULL    |            |   5000000 |
0 |           0 |   0 |       0 | 2021-04-06 | M      |
|  5 | Aarthi  | NULL         | NULL    |            |   1200000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
|  6 | Mary    | NULL         | NULL    |            |   1270000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
|  7 | Merrisa | NULL         | NULL    |            |   3270000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
7 rows in set (0.00 sec)
--uc10 update table
mysql> UPDATE employee_payroll
    -> SET department = 'Sales' WHERE name = 'Merrisa';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
| id | name    | phone_number | address | department | basic_pay | deductions | taxable_pay | tax | net_pay | start      | gender |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
|  1 | Bill    | NULL         | NULL    |            |   1000000 |
0 |           0 |   0 |       0 | 2021-07-09 | M      |
|  2 | Mark    | NULL         | NULL    |            |   1200000 |
0 |           0 |   0 |       0 | 2021-07-09 | M      |
|  3 | David   | NULL         | NULL    |            |   2200000 |
0 |           0 |   0 |       0 | 2021-07-02 | M      |
|  4 | John    | NULL         | NULL    |            |   5000000 |
0 |           0 |   0 |       0 | 2021-04-06 | M      |
|  5 | Aarthi  | NULL         | NULL    |            |   1200000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
|  6 | Mary    | NULL         | NULL    |            |   1270000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
|  7 | Merrisa | NULL         | NULL    | Sales      |   3270000 |
0 |           0 |   0 |       0 | 2021-07-09 | F      |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
7 rows in set (0.00 sec)

mysql> NSERT INTO employee_payroll
    -> NSERT INTO employee_payroll^C
mysql> INSERT INTO employee_payroll
    -> (name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
    -> ('Merrisa', 'Marketing', 'F', 300000.00, 100000.00, 200000.00, 500000.00, 150000.00, '2021-03-01');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE name = 'Merrisa';
+----+---------+--------------+---------+------------+-----------+------------+-------------+--------+---------+------------+--------+
| id | name    | phone_number | address | department | basic_pay | deductions | taxable_pay | tax    | net_pay | start      | gender |
+----+---------+--------------+---------+------------+-----------+------------+-------------+--------+---------+------------+--------+
|  7 | Merrisa | NULL         | NULL    | Sales      |   3270000 |
0 |           0 |      0 |       0 | 2021-07-09 | F      |
|  8 | Merrisa | NULL         | TBD     | Marketing  |    300000 |     100000 |      200000 | 500000 |  150000 | 2021-03-01 | F      |
+----+---------+--------------+---------+------------+-----------+------------+-------------+--------+---------+------------+--------+
2 rows in set (0.00 sec)
