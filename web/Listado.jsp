<%-- 
    Document   : Listado
    Created on : 10-13-2020, 07:43:13 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Resultado de la busqueda: </h1>
        
        <form>
            <center>
            <table border="1" width="600px">
                <tr bgcolor="skyblue">
                    <td colspan="5"> Mantenimiento de usuarios </td>
                   
                    <td> 
                        <a href="nuevo.jsp">
                        <img src="Imagenes/nuevo.png" width="30px"> </a>
                    </td>
                </tr>
                
                
                
                <tr style="background:green; color:yellow">
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Edad</td>
                    <td>Sexo</td>
                    <td>Password</td>
                    <td>Accion</td>
                </tr>
                
                <%
                
                // Conectandome a la bd:
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                // 1. Obtener la cadena de conexion:
                Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/cursojsp","root","");
                // 2. hacer preparedStatement:
                PreparedStatement myStmt = myCon.prepareStatement("select * from usuarios");
                //3. asignando valor a parametros:
                
                //4.Ejecutar consulta y recorrerla:
                ResultSet myRs = myStmt.executeQuery();
              
                while(myRs.next()){
                
                %>
                
                <tr>
                    <td> <%= myRs.getString(1)%> </td>
                    <td> <%= myRs.getString(2)%> </td>
                    <td> <%= myRs.getInt(3)%> </td>
                    <td> <%= myRs.getString(4)%> </td>
                    <td> <%= myRs.getString(5)%> </td>
                    <td>
                        <a href="editar.jsp?cod=<%= myRs.getString(1)%>">
                        <img src="Imagenes/editar.png" width="30px"> 
                        </a>
                        //
                        
                        <a href="eliminar.jsp?codigo=<%= myRs.getString(1)%>">
                        <img src="Imagenes/eliminar.png" width="30px">  </a>
                    </td>
                </tr>
                 
                <%
                }
                }catch(Exception exc){
                exc.printStackTrace();
                }

                %>
                
            </table>
            </center>
        </form>
                
                
    </body>
</html>
