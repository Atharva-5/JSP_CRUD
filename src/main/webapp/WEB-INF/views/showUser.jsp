<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Table</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

</head>
<body class="bg-dark text-light">
<div class="container mt-5">
    <h2 class="text-center text-info mb-4">User Details</h2>
    <a href="form" class="btn btn-primary mb-3">
    <i class="bi bi-person-plus-fill"></i> Add User
</a>

    <div class="table-responsive">
        <table class="table table-dark table-bordered table-hover align-middle text-center">
            <thead class="table-secondary text-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Password</th>
                    <th>Confirm Password</th>
                    <th>Age</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${temp}" var="e">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>${e.pass}</td>
                        <td>${e.cpass}</td>
                        <td>${e.age}</td>
                        <td>
                            <a class="btn btn-sm btn-outline-info me-2" href="editUser?id=${e.id}"><i class="bi bi-pencil-square"></i> Edit</a>
							<a class="btn btn-sm btn-outline-danger" href="deleteUser?id=${e.id}"><i class="bi bi-trash"></i> Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
