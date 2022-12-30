
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All To Do</title>
    </head>
    <body>
    <center>
        <%
            PreparedStatement statement = DbConnect.connect().prepareStatement("select*from courses order by rollno desc");//A PreparedStatement is a pre-compiled SQL statement
            ResultSet rs = statement.executeQuery();//Accesing the data from table set
            ResultSetMetaData rsmd = rs.getMetaData();//
            int n = rsmd.getColumnCount();//Returns the number of columns in this 
        %>

        <table border="1">
            <tr>
                <%
                    for (int i = 1; i <= n; i++) {
                %>
                <th><%=rsmd.getColumnLabel(i)%></th>


                <%
                    }

                %>
            </tr>
            <%    while (rs.next()) {%>//it check ResultSet contains any values or not
            <tr>
                <%
                    for (int i = 1; i <= n; i++) {
                %>
                <th><%=rs.getObject(i)%></th>//This method will return the value of the given column 


                <%
                    }
                %>
            </tr>
            <%
                }


            %>
        </table>
    </center>
</body>
</html>
