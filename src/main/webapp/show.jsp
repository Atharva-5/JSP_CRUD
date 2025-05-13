<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>All Users</h2>
    <a href="form.jsp" class="btn btn-success mb-3">+ Add New User</a>
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<%
    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud", "postgres", "atharva");

        PreparedStatement st = conn.prepareStatement("SELECT * FROM users order by id asc");
        ResultSet rs = st.executeQuery();

        while(rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("contact") %></td>
                <td><%= rs.getString("address") %></td>
                <td>
            <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Edit</a>
            <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-outline-danger">Delete</a>
        </td>
            </tr>
<%
        }
        conn.close();
    } catch(Exception e) {
     
    }
%>
        </tbody>
    </table>
</div>
</body>
</html>
