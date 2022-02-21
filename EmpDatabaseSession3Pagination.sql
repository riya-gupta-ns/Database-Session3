CREATE PROCEDURE UspPagination
@istartRowIndex INT,                                          
@imaximumRows INT                          
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM                            
  (                          
   SELECT ROW_NUMBER() OVER (ORDER BY EmployeeId)-1 AS Row,* FROM Employee                        
  )Employee                          
WHERE (Row between (@istartRowIndex) AND @istartRowIndex + (@imaximumRows -1))    
END
GO
EXEC UspPagination @istartRowIndex=1, @imaximumRows=4
