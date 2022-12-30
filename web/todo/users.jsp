<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <center>
                <h1> Register User </h1>

          <%
            String check = request.getParameter("check");
            
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
            String Username = "", name = "", password = "", result = "";
            System.out.println(ispostback);
            if (ispostback) {
                try {
                    Username = request.getParameter("Username");
                    name = request.getParameter("name");
                    password = request.getParameter("password");
                   
                    PreparedStatement ps = database.DbConnect.connect().prepareStatement("insert into users values(?,?,?)");
                    ps.setString(1, Username);
                    ps.setString(2, name);
                    ps.setString(3, password);
                    int n = ps.executeUpdate();
                    result = "Inserted " + n + " records";
                } catch (Exception ex) {
                    System.out.println(ex);
                    result ="Failed";//ex.getMessage();
                }
            }
            %>
            <h2><%=result%></h2>
            <form method="post">
          <input type="hidden" name="check" value="1">
            Username<input value="<%=Username%>" name="Username" type="text">
           
            name<input name="name" value="<%=name%>" type="text">
           
            password<input name="password" value="<%=password%>" type="password">
            <br>
            <br>
            <input type="submit">
          </form>
        </center>
    </body>
</html>