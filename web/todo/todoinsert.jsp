<%@page import="database.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <center><title>To Do App: Insert</title>
    </head>
    <body>
        <%
        String check=request.getParameter("check");
        boolean ispostback;
        if(check==null)
        ispostback=false;
        else
        ispostback=true;
        String Sno="",Task="",Description="",Status="",result="";
        System.out.println(ispostback);
       
        if(ispostback)
        {
            try
            {
            Sno=request.getParameter("Sno");
            Task=request.getParameter("Task");
             Description=request.getParameter("Description");
              Status=request.getParameter("Status");
            PreparedStatement ps=DbConnect.connect().prepareStatement("insert into todo values(todosno.nextval,?,?,?)");
          //  ps.setString(1,Sno);
            ps.setString(1, Task);
             ps.setString(2, Description);
               ps.setString(3, Status);
                    int n=ps.executeUpdate();
                    result="Inserted " + n + " records";
            }
            catch(Exception ex)
            {
                System.out.println(ex);
                result=ex.getMessage();
            }
        }
   
        %>
       
       
        <h1>To Do App</h1>
        <form>
            <h3><%=result%></h3>
            <input type="hidden" name="check" value="1">
          Sno<input value="<%=Sno%>" name="Sno" type="number">
            Task<input name="Task" value="<%=Task%>" type="text">
            Description<input name="Description" value="<%=Description%>" type="text">
            Status<input name="Status" value="<%=Status%>" type="text">
        <br>
        <br>
        <input type="submit">
    </body>
        </form>
</html>