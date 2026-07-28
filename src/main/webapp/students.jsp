<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="lk.jiat.wcdve02.model.Student"%>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-3">
    <h2 class="fw-bold mb-0">Student Management</h2>
    <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#addStudentModal">Add Student</button>
</div>

<div class="card mb-5">
    <div class="card-body p-0 table-responsive">
        <table class="table table-hover mb-0">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Student> students = (List<Student>) request.getAttribute("students");
                    if (students != null && !students.isEmpty()) {
                        for (Student s : students) {
                %>
                    <tr>
                        <td class="align-middle"><%= s.getId() %></td>
                        <td class="align-middle fw-semibold"><%= s.getName() %></td>
                        <td class="align-middle"><%= s.getEmail() %></td>
                        <td class="align-middle"><%= s.getPhone() %></td>
                        <td class="text-end align-middle">
                            <button class="btn btn-sm btn-outline-secondary me-2" data-bs-toggle="modal" data-bs-target="#editStudentModal<%= s.getId() %>">Edit</button>
                            <a href="${pageContext.request.contextPath}/students?action=delete&id=<%= s.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                        </td>
                    </tr>
                    
                    
                    <div class="modal fade" id="editStudentModal<%= s.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content text-start">
                                <div class="modal-header border-0">
                                    <h5 class="modal-title fw-bold">Edit Student</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/students" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="<%= s.getId() %>">
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">NAME</label>
                                            <input type="text" name="name" class="form-control" value="<%= s.getName() %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">EMAIL</label>
                                            <input type="email" name="email" class="form-control" value="<%= s.getEmail() %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">PHONE</label>
                                            <input type="text" name="phone" class="form-control" value="<%= s.getPhone() %>" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0">
                                        <button type="submit" class="btn btn-primary w-100">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="5" class="text-center py-5 text-muted">No students found.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>


<div class="modal fade" id="addStudentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">Add New Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="${pageContext.request.contextPath}/students" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">NAME</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">EMAIL</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">PHONE</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-primary w-100">Add Student</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
