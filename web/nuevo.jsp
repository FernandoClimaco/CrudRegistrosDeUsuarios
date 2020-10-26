 

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo</title>
    </head>
    <body>
        
        <h2 aling="center">Registro de usuarios</h2>
        <form action="">
            <table border="1" width="250px" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td> <input type="text" name="txtcodigo"> </td>
                </tr>
                
                <tr>
                    <td>Nombre:</td>
                    <td> <input type="text" name="txtnombre"> </td>
                </tr>
               
                <tr>
                    <td>Edad:</td>
                    <td> <input type="text" name="txtedad"> </td>
                </tr>
                
                
                <tr>
                    <td>Sexo:</td>
                    <td> <input type="text" name="txtsexo"> </td>
                </tr>
                
                
                <tr>
                    <td>Password:</td>
                    <td> <input type="text" name="txtpassword"> </td>
                </tr>
                
                <tr>
                    <td colspan="2"> <input type="submit" name="btnGrabar" value="Grabar usuario"></td>
                    
                </tr> 
            </table> 
        </form>
        
        
        
        <%
            if(request.getParameter("btnGrabar")!= null){
                
         // codigo para insertar los datos
         String codigo = request.getParameter("txtcodigo");
         String nombre = request.getParameter("txtnombre");
         int edad = Integer.parseInt(request.getParameter("txtedad"));
         String sexo = request.getParameter("txtsexo");
         String pass = request.getParameter("txtpassword");
        
         // conectarnos a la bd:
         try{ 
             // referenciar el driver:
             Class.forName("com.mysql.jdbc.Driver");
         // 1. Obtener la cadena de conexion:
         Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/cursojsp","root","");
         //2. consulta preparada:
         PreparedStatement myStmt = myCon.prepareStatement("insert into usuarios values(?,?,?,?,?)");
         //3. asignar valores a los parametros:
         myStmt.setString(1,codigo);
         myStmt.setString(2,nombre);
         myStmt.setInt(3,edad);
         myStmt.setString(4,sexo);
         myStmt.setString(5,pass);
         //4. Ejecutar consulta:
         myStmt.executeUpdate();
         out.println("los datos han sido insertados");
         request.getRequestDispatcher("Listado.jsp").forward(request,response); 
         }catch(Exception exc){
         exc.printStackTrace();
         }
         }
        %>
        
    </body>
</html>
