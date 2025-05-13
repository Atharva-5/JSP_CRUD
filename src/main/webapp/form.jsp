<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h3>Enter details</h3>
    <form class="form-control p-4" action="form.jsp" method="post">
        <input name="name" type="text" class="form-control mb-3" placeholder="Enter name" required>
        <input name="contact" type="text" class="form-control mb-3" placeholder="Enter contact" required>
        <input name="address" type="text" class="form-control mb-3" placeholder="Enter address" required>
        <button class="btn btn-primary">Submit</button>
    </form>

<%
    // if method is post then only run
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

            try {
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud", "postgres", "atharva");

                PreparedStatement ps = con.prepareStatement("INSERT INTO users(name, contact, address) VALUES (?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, contact);
                ps.setString(3, address);
                ps.executeUpdate();
                con.close();

                // redirect to show.jsp after insetion
                response.sendRedirect("show.jsp");
            } catch(Exception e) {
                
            }
        }
%>
</div>
</body>
</html>
