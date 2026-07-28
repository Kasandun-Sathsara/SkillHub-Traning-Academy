<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="lk.jiat.wcdve02.model.Enrollment"%>
<%@page import="lk.jiat.wcdve02.model.Student"%>
<%@page import="lk.jiat.wcdve02.model.Course"%>
<%@page import="lk.jiat.wcdve02.model.User"%>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<% 
    User user = (User) session.getAttribute("user");
%>

<div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-3">
    <h2 class="fw-bold mb-0">Enrollment Management</h2>
    <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#addEnrollmentModal">New Enrollment</button>
</div>

<div class="card mb-5">
    <div class="card-body p-0 table-responsive">
        <table class="table table-hover mb-0">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Course Name</th>
                    <th>Date</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
                    if (enrollments != null && !enrollments.isEmpty()) {
                        for (Enrollment e : enrollments) {
                %>
                    <tr>
                        <td class="align-middle"><%= e.getId() %></td>
                        <td class="align-middle fw-semibold"><%= e.getStudent() != null ? e.getStudent().getName() : "Unknown" %></td>
                        <td class="align-middle text-muted"><%= e.getCourse() != null ? e.getCourse().getName() : "Unknown" %></td>
                        <td class="align-middle"><%= e.getEnrollmentDate() %></td>
                        <td class="text-end align-middle">
                            <a href="${pageContext.request.contextPath}/enrollments?action=delete&id=<%= e.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Remove enrollment?')">Delete</a>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="5" class="text-center py-5 text-muted">No enrollments found.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Modal -->
<div class="modal fade" id="addEnrollmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">New Enrollment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="${pageContext.request.contextPath}/enrollments" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">SELECT STUDENT</label>
                        <select name="studentId" class="form-select" required>
                            <% 
                                List<Student> students = (List<Student>) request.getAttribute("students");
                                if(students != null) {
                                    for(Student s : students) {
                            %>
                                <option value="<%= s.getId() %>"><%= s.getName() %> (<%= s.getEmail() %>)</option>
                            <% 
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">SELECT COURSE</label>
                        <select name="courseId" class="form-select" required>
                            <% 
                                List<Course> courses = (List<Course>) request.getAttribute("courses");
                                if(courses != null) {
                                    for(Course c : courses) {
                            %>
                                <option value="<%= c.getId() %>"><%= c.getName() %></option>
                            <% 
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-primary w-100">Enroll Student</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
