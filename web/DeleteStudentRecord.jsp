<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    String check=request.getParameter("check");
    boolean ispostback;
    if(check==null)
    {
        ispostback=false;
    }
    else
    {
        ispostback=true;
    }
    String name="",rollno="",age="",result="";
    System.out.println(ispostback);
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
