<%-- 
    Document   : eliminar
    Created on : 10-14-2020, 08:29:46 AM
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
        try{
            // obteniendo el valor de la variables desde la base de datos:
            String codigo = request.getParameter("codigo");
        // Referencia a mi driver:
        Class.forName("com.mysql.jdbc.Driver");
        // 1. obteniendo la cadena de conexion:
        Connection myCon =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cursojsp","root","");
        //2. consulta preparada:
        PreparedStatement myStmt = myCon.prepareStatement("delete from usuarios where codUsu = ? ");
        // 3. asignacion de valores a parametros:
        myStmt.setString(1,codigo);
        //4.ejecutar consulta
        myStmt.executeUpdate();
        out.println("Datos eliminados");
        request.getRequestDispatcher("Listado.jsp").forward(request, response);
        }catch(Exception exc){
        exc.printStackTrace();
        }
        
        %>
        
         
    </body>
</html>
