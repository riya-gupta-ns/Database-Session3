CREATE PROCEDURE UspGetEmployees

	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate,eud.UniversityName, eud.UniversityAddres FROM  Employee e 
	INNER JOIN EmployeeDetail ed ON e.EmployeeId=ed.EmployeeId 
	INNER JOIN EmployeeUniversityDetail eud ON ed.EmployeeId=eud.EmployeeId WHERE eud.UniversityName='AA' AND e.EmployeeId=4

END
GO
EXEC uspgetEmployeeDetail
