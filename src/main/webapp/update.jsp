<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");

    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud", "postgres", "atharva");

        PreparedStatement ps = conn.prepareStatement("UPDATE users SET name=?, contact=?, address=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, contact);
        ps.setString(3, address);
        ps.setInt(4, id);
        ps.executeUpdate();

        conn.close();

        response.sendRedirect("show.jsp");
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
