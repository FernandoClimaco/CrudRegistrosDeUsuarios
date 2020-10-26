<%-- 
    Document   : editar1
    Created on : 10-15-2020, 02:47:36 PM
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
         
        <%
         Connection myCon = null;
         PreparedStatement myStmt = null;
         
      //  try{
            
             // obtener los valores del formulario
            String codigoUsu = request.getParameter("txtcodigo");
            String nombre = request.getParameter("txtnombre");
            int edad = Integer.parseInt(request.getParameter("txtedad"));
            String sexo = request.getParameter("txtsexo");
            String pass = request.getParameter("txtpassword");
            
             // referencia al driver
             Class.forName("com.mysql.jdbc.Driver");
             
            //1. cadena de conexion:
             myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/cursojsp", "root","");
             // 2. crear consulta preparada:
             myStmt = myCon.prepareStatement(" update usuarios set nomUsu = ?, edadUsu = ?, sexoUsu = ? , passUsu = ? where codUsu = ? ");
             // 3. asignacion parametos
             myStmt.setString(1,nombre);
             myStmt.setInt(2,edad);
             myStmt.setString(3,sexo);
             myStmt.setString(4,pass);
             myStmt.setString(5,codigoUsu);
             // 4.ejecutar consulta:
             myStmt.executeUpdate();
             out.println("Los datos han sido modificados");
             request.getRequestDispatcher("Listado.jsp").forward(request, response);
         
      /*  } catch(Exception exc){
        exc.printStackTrace();
        }
        */
        %>
         
    </body>
</html>
