<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students</title>
    </head>
    <body>
        <%
            String postback = request.getParameter("postback"), option = "";
            int n1 = 0, n2 = 0;
            boolean ispostback;
            if (postback == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
            System.out.println(ispostback);

            if (ispostback) {
                
                option = request.getParameter("option");
                System.out.println(option);
            }
         %>        
        <center>
       <h1>Students Details:</h1>
       <form method="get">
       <b> <div><input placeholder="Enter Name" name="option" value="" size="30" style="height:20px"</div></b><br><br>
        <div><input placeholder="Enter Roll No" name="option"  value=""size="30" style="height:20px"</div><br><br>
         <input type="submit" name="option" value="Add"/>
        </form>
    </body>
</html>
