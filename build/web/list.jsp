
<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            tr,td,th{
                padding: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <br><br><br>
    <center>
        <%!
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>
        <table border="2">
            <tr>
                <th>ID</th><th>Department</th><th>Semester</th><th>Subject</th><th>Book</th><th>Path</th><th>Added Date</th>
                <th>Download</th><th>Delete</th>
            </tr>
            <%
                con = DB.getConnection();
            String sql = "select * from materials";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getTimestamp(7)%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString(5)%>">Download</a></td>
                <td><a href="Delete?fileName=<%=rs.getString(5)%>">Delete</a></td>
            </tr>
            <%
                }
            %>
            
        </table><br>
        <a href="newhtml.html">Admin Home</a>
    </center>
    </body>
</html>
