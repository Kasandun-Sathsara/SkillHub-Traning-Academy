<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<div class="row justify-content-center align-items-center px-3" style="min-height: 80vh;">
    <div class="col-12 col-md-8 col-lg-5 col-xl-4">
        <div class="card p-4 p-md-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold">Welcome Back</h2>
                <p class="text-muted">Sign in to your SkillHub account</p>
            </div>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center"><%= request.getAttribute("error") %></div>
            <% } %>
            <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">USERNAME</label>
                    <input type="text" name="username" class="form-control form-control-lg" required>
                </div>
                <div class="mb-4">
                    <label class="form-label text-muted small fw-bold">PASSWORD</label>
                    <input type="password" name="password" class="form-control form-control-lg" required>
                </div>
                <button type="submit" class="btn btn-primary btn-lg w-100">Sign In</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
