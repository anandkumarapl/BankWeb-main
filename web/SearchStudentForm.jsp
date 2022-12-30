<%@page import="java.sql.ResultSet"%>
<%@page import="database.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <center><title>Search</title>
    </head>
    <body>
        <%
            String check = request.getParameter("check");
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
            String name = "", rollno = "", age = "", result = "";
            System.out.println(ispostback);

            if (ispostback) {
                try {
                   
                    rollno = request.getParameter("rollno");
                   
                    PreparedStatement ps = DbConnect.connect().prepareStatement("select * from students where rollno=?");
                    ps.setString(1, rollno);
             
                    ResultSet rs = ps.executeQuery();
                    if(!rs.next())
                    {
                        result = "RollNo " + rollno + " not found";
                    }
                    else
                    {
                        name="" + rs.getObject("name");
                        age="" + rs.getObject("age");
                        result = "Record Found ";
                    }
                   
                } catch (Exception ex) {
                    System.out.println(ex);
                    result = ex.getMessage();
                }
            }

        %>


        <h1>Students</h1>
        <form>
            <h3><%=result%></h3>
            <form>
            <input type="hidden" name="check" value="2">
            Name<input name="name" value="<%=name%>" type="text">
            Roll no.<input value="<%=rollno%>" name="rollno" type="number">
            age<input value="<%=age%>" name="age" type="number">
            <br>
            <br>
            <input type="submit" value="Search"/>
            </form>
    </body>
</form>
</html>