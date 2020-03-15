select TABLE_NAME,SUM(TABLE_ROWS) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='cr09_zolfi' GROUP BY TABLE_NAME
 
 customer
6
date
6
description
4
employee
4
location
6
package
6
payments
5
process
6
recieve
6
transport
6


----------------------------
SELECT COUNT(customer_id) FROM customer WHERE first_name='MARK'
the result:
COUNT(customer_id)
1

----------------------------

SELECT COUNT(payments_id) FROM payments WHERE payment_date>'2020-01-01'
the result :
5
SELECT amount FROM employees WHERE payment_date>'2020-01-01'
the result:
3
23
53
44
67
------------------------
SELECT weight, delivery_date,recieve_date
FROM `package`
INNER JOIN `date` on fk_date_id = date_id
WHERE weight >500
the result:
weight
delivery_date
recieve_date

670
2020-03-01
2020-03-11

511
2020-02-02
2020-02-11

------------------------
SELECT first_name, last_name,street
FROM `customer`
RIGHT JOIN `location` on fk_customer_id = customer_id
WHERE city ='vienna'
the result:

first_name
last_name
street

karlos
zobrek
springergasse

mark
zorbek
landstrasse

ali
hasan
darwingasse

micha
müller
mührengasse

manuel
hoffer
zichystrasse

john
smeth
münzergasse

------------------------
SELECT first_name, last_name
FROM `employee`
RIGHT JOIN `process` on employee_id = fk_employee_id
RIGHT JOIN `package` on fk_package_id = package_id
WHERE package_id =5

the result:
first_name
last_name

zolfi
hasan

-------------------