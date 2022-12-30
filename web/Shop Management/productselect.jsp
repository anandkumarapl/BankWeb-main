
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
            PreparedStatement statement = DbConnect.connect().prepareStatement("select productid,productname from products  order by productname");
            ResultSet rs = statement.executeQuery();


        %>
        <form>
            <input type="hidden" name="check">
            <%                String check = "";
                check = request.getParameter("check");
                boolean ispostback = true;
                if (check == null) {
                    ispostback = false;
                }
            %>
            <select name="product">
                <option>Select</option>

                <%                while (rs.next()) {
                        String productid = "" + rs.getObject("productid");
                        String productname = "" + rs.getObject("productname");
                %>
                <option value="<%=productid%>"><%=productname%></option>
                <%
                    }
                %>


                Quantity<input name="quantity" value="1" type="number" min="1">
                <input type="submit" value="Submit">

            </select>
                <%
                if(ispostback)
                {
                    String productid=request.getParameter("product");
                    String quantity=request.getParameter("quantity");
                    PreparedStatement ps=DbConnect.connect().prepareStatement("insert into productstock values(?,?)");
                    ps.setString(1, productid);
                    ps.setString(2, quantity);
                    ps.executeUpdate();
                }
                
                %>
        </form>
    </center>
</body>
</html>
