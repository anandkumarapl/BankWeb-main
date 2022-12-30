<%@page import="java.sql.ResultSet"%>
<%@page import="database.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and Delete</title>
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
//out.println(ispostback);
            String option = "", sno = "", status = "", description = "", task = "",result="";
            if (ispostback) {
                option = request.getParameter("option");
                // out.println(option);
                if (option.equals("Search")) {
                    out.println("Search Code");
                    sno = request.getParameter("sno");
                    PreparedStatement ps = DbConnect.connect().prepareStatement("select * from todo where sno=?");
                    ps.setString(1, sno);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        task = "" + rs.getObject("task");
                        description = "" + rs.getObject("description");
                        status = "" + rs.getObject("status");
                    }
                }
                if (option.equals("Delete")) {
                    out.println("Delete Code");
                    
                    sno = request.getParameter("sno");
                    PreparedStatement ps = DbConnect.connect().prepareStatement("delete from todo where sno=?");
                    ps.setString(1, sno);
                    int n=ps.executeUpdate();
                     result="Deleted " + n + " records";
                   
            }
            }
        %>
    <center>
        <%=result%>
        <%=task%>
        <%=description%>
        <%=status%>
        <h1> Todo List Search and Delete </h1>

        <form method="post">
            <input type="hidden" name="check"/>
            <br>
            <br>
            sno<input value="<%=sno%>" name="sno" type="number">
            <br>
            <br>

            <input type="submit" name="option" value="Search"/>

            <input type="submit" name="option" value="Delete"/>
        </form>
    </center>
</body>
</html>