<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "", contact = "", address = "";

    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud", "postgres", "atharva");

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            contact = rs.getString("contact");
            address = rs.getString("address");
        }

        conn.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<div class="container mt-5">
    <h2>Edit User</h2>
    <form action="update.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" class="form-control" value="<%= name %>" required>
        </div>
        <div class="mb-3">
            <label for="contact" class="form-label">Contact</label>
            <input type="text" name="contact" class="form-control" value="<%= contact %>" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" name="address" class="form-control" value="<%= address %>" required>
        </div>
        <button type="submit" class="btn btn-success">Update</button>
        <a href="show.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
