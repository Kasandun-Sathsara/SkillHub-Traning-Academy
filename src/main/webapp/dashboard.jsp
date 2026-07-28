<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="lk.jiat.wcdve02.model.User" %>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<% 
    User user = (User) session.getAttribute("user");
    String role = user != null ? user.getRole() : "";
%>

<div class="d-flex justify-content-between align-items-center mb-4 mt-2 flex-wrap">
    <h2 class="fw-bold text-dark mb-2 mb-md-0">Dashboard Overview</h2>
</div>

<div class="row g-4">
    <div class="col">
        <div class="card text-center p-4 h-100">
            <div class="mb-3 text-primary"></div>
            <h1 class="display-4 fw-bold text-dark">${studentCount}</h1>
            <p class="text-muted mb-0 fw-bold small">TOTAL STUDENTS</p>
        </div>
    </div>

    <div class="col">
        <div class="card text-center p-4 h-100">
            <div class="mb-3 text-success"></div>
            <h1 class="display-4 fw-bold text-dark">${courseCount}</h1>
            <p class="text-muted mb-0 fw-bold small">ACTIVE COURSES</p>
        </div>
    </div>

    <div class="col">
        <div class="card text-center p-4 h-100">
            <div class="mb-3 text-warning"></div>
            <h1 class="display-4 fw-bold text-dark">${trainerCount}</h1>
            <p class="text-muted mb-0 fw-bold small">EXPERT TRAINERS</p>
        </div>
    </div>

    <div class="col">
        <div class="card text-center p-4 h-100">
            <div class="mb-3 text-info"></div>
            <h1 class="display-4 fw-bold text-dark">${enrollmentCount}</h1>
            <p class="text-muted mb-0 fw-bold small">TOTAL ENROLLMENTS</p>
        </div>
    </div>
</div>

<div class="row mt-4 mb-5">
    <div class="col-12">
        <div class="card p-4 p-md-5 text-center">
                <h3 class="fw-bold mb-3 text-dark">Welcome to SkillHub Management Portal</h3>
                <p class="text-muted">Manage the entire academy from this dashboard.</p>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
