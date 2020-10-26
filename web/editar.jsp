 <%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h2 aling="center">Editar usuarios</h2>
         
         <%  
              try{
             // Obtener el valor de la variable:
             String codigo = request.getParameter("cod"); 
             
             //Inicializacion en NULL para la conexion 
             Connection myCon = null;
             PreparedStatement myStmt = null;
             ResultSet myRs = null;
             
            // referencia al driver:
            Class.forName("com.mysql.jdbc.Driver");
            // 1. obtener la cadena de conexion
            myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/cursojsp", "root","");
            // 2. consulta preparada:
            myStmt = myCon.prepareStatement("select * from usuarios where codUsu = ? ");
            // 3. valores a los parametros:
            myStmt.setString(1,codigo);
         // 4. ejecutar consulta y recorrerla
             myRs = myStmt.executeQuery();
         while(myRs.next()){
         %> 
         
         <form action="editar1.jsp" method="get">
            <table border="1" width="250px" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td> <input type="text" name="txtcodigo" value="<%= myRs.getString(1)%>" readonly="readonly" > </td>
                </tr>
                
                <tr>
                    <td>Nombre:</td>
                    <td> <input type="text" name="txtnombre" value="<%= myRs.getString(2)%>"> </td>
                </tr>
               
                <tr>
                    <td>Edad:</td>
                    <td> <input type="text" name="txtedad" value="<%= myRs.getInt(3)%>"> </td>
                </tr>
                
                
                <tr>
                    <td>Sexo:</td>
                    <td> <input type="text" name="txtsexo" value="<%= myRs.getString(4)%>"> </td>
                </tr>
                
                
                <tr>
                    <td>Password:</td>
                    <td> <input type="text" name="txtpassword" value="<%= myRs.getString(5)%>"> </td>
                </tr>
                
                <tr>
                    <td colspan="2"> <input type="submit" name="btnEditar" value="Editar usuario"></td>
                    
                </tr> 
            </table> 
        </form>
        
        <%
        }
           }catch(Exception exc){

         exc.printStackTrace();
         
          
           }
        %>
         
        
       
    </body>
</html>
