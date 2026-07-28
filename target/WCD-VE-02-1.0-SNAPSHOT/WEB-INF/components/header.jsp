<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="lk.jiat.wcdve02.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillHub Academy</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<% 
    User user = (User) session.getAttribute("user");
    if (user != null) { 
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 py-3">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/dashboard">SkillHub</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/students">Students</a></li>
                
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/courses">Courses</a></li>
                
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/trainers">Trainers</a></li>
                
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/enrollments">Enrollments</a></li>
                
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/attendance">Attendance</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link btn btn-danger px-4 py-2 text-white ms-2" href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<% 
    } 
%>
<div class="container">
