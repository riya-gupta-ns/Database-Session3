USE EMPDB

SELECT  EmployeeId FROM Employee
UNION
SELECT EmployeeId FROM EmployeeDetail
ORDER BY(EmployeeId)

SELECT  EmployeeId FROM Employee
UNION ALL
SELECT EmployeeId FROM EmployeeDetail
ORDER BY(EmployeeId)

SELECT  EmployeeId, DateOfBirth FROM Employee
UNION ALL
SELECT EmployeeId, JoiningDate FROM EmployeeDetail
ORDER BY(EmployeeId)

CREATE TABLE EmployeeUniversityDetail (
	UniversityId bigint PRIMARY KEY IDENTITY(1,1),
    UniversityName varchar(500),
    UniversityAddres varchar(500),
	EmployeeId bigint,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
)

INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('AA','A',2);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('AA','A',4);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('AA','A',6);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('BB','B',8);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('BB','B',10);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('BB','B',12);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('CC','C',14);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('CC','C',16);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('CC','C',18);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('DD','D',20);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('DD','D',22);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('DD','D',24);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('EE','E',26);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('EE','E',28);
INSERT INTO EmployeeUniversityDetail (UniversityName, UniversityAddres, EmployeeId) VALUES ('EE','E',30);

SELECT * FROM EmployeeUniversityDetail


SELECT EmployeeDetailId, Salary, EmployeeId, JoiningDate,
CASE
    WHEN Salary > 15000 THEN 'The salary is greater than 15000'
    WHEN Salary = 12000 THEN 'The salary is 12000'
    ELSE 'The quantity is under 12000 or greater than 15000'
END AS EmployeeSalary
FROM EmployeeDetail

CREATE VIEW [EmployeeDetailsInner] 
AS
select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate from  Employee e 
inner join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
Inner join EmployeeUniversityDetail eud on ed.EmployeeId=eud.EmployeeId where eud.UniversityName='AA' AND e.EmployeeId=4

SELECT * FROM [EmployeeDetailsInner]

CREATE VIEW [EmployeeDetailsLeft] 
AS
select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate, eud.UniversityName, eud.UniversityAddres from  Employee e 
left join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
left join EmployeeUniversityDetail eud on ed.EmployeeId=eud.EmployeeId where eud.UniversityName='AA' AND e.EmployeeId=4

SELECT * FROM [EmployeeDetailsLeft]

CREATE VIEW [EmployeeDetailsRight] 
AS
select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate, eud.UniversityName, eud.UniversityAddres from  Employee e 
right join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
right join EmployeeUniversityDetail eud on ed.EmployeeId=eud.EmployeeId where eud.UniversityName='AA' AND e.EmployeeId=4

SELECT * FROM [EmployeeDetailsRight]


SELECT Top 2 * from Employee
SELECT Top 2 * from EmployeeDetail
SELECT Top 2 * from EmployeeUniversityDetail

select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate,eud.UniversityName, eud.UniversityAddres from  Employee e 
inner join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
Inner join EmployeeUniversityDetail eud on ed.EmployeeId=eud.EmployeeId 
