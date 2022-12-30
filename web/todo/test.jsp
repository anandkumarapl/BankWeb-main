<%@page import="authpackage.LoginManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       boolean b=LoginManager.isUsernameAndPasswordCorrect("anand", "0000");
       out.println(b);
       
       
       %>

    </body>
</html>