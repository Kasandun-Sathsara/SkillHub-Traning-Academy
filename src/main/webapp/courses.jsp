<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="lk.jiat.wcdve02.model.Course"%>
<%@page import="lk.jiat.wcdve02.model.Trainer"%>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-3">
    <h2 class="fw-bold mb-0">Course Management</h2>
    <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#addCourseModal">Add Course</button>
</div>

<div class="card mb-5">
    <div class="card-body p-0 table-responsive">
        <table class="table table-hover mb-0">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Duration (Months)</th>
                    <th>Trainer</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Course> courses = (List<Course>) request.getAttribute("courses");
                    if (courses != null && !courses.isEmpty()) {
                        for (Course c : courses) {
                %>
                    <tr>
                        <td class="align-middle"><%= c.getId() %></td>
                        <td class="align-middle fw-semibold"><%= c.getName() %></td>
                        <td class="align-middle text-muted"><%= c.getDescription() %></td>
                        <td class="align-middle"><%= c.getDurationMonths() %></td>
                        <td class="align-middle text-info"><%= c.getTrainer() != null ? c.getTrainer().getName() : "Not Assigned" %></td>
                        <td class="text-end align-middle">
                            <button class="btn btn-sm btn-outline-secondary me-2" data-bs-toggle="modal" data-bs-target="#editCourseModal<%= c.getId() %>">Edit</button>
                            <a href="${pageContext.request.contextPath}/courses?action=delete&id=<%= c.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    
                    
                    <div class="modal fade" id="editCourseModal<%= c.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content text-start">
                                <div class="modal-header border-0">
                                    <h5 class="modal-title fw-bold">Edit Course</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/courses" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="<%= c.getId() %>">
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">NAME</label>
                                            <input type="text" name="name" class="form-control" value="<%= c.getName() %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">DESCRIPTION</label>
                                            <textarea name="description" class="form-control" rows="3" required><%= c.getDescription() %></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">DURATION (MONTHS)</label>
                                            <input type="number" name="durationMonths" class="form-control" value="<%= c.getDurationMonths() %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">ASSIGN TRAINER</label>
                                            <select name="trainerId" class="form-select" required>
                                                <% 
                                                    List<Trainer> trainers = (List<Trainer>) request.getAttribute("trainers");
                                                    if (trainers != null) {
                                                        for(Trainer t : trainers) {
                                                %>
                                                    <option value="<%= t.getId() %>" <%= (c.getTrainer() != null && c.getTrainer().getId() == t.getId()) ? "selected" : "" %>><%= t.getName() %> (<%= t.getSpecialty() %>)</option>
                                                <% 
                                                        }
                                                    }
                                                %>
                                            </select>
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
                    <tr><td colspan="6" class="text-center py-5 text-muted">No courses found.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>


<div class="modal fade" id="addCourseModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">Add New Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="${pageContext.request.contextPath}/courses" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">NAME</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">DESCRIPTION</label>
                        <textarea name="description" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">DURATION (MONTHS)</label>
                        <input type="number" name="durationMonths" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">ASSIGN TRAINER</label>
                        <select name="trainerId" class="form-select" required>
                            <% 
                                List<Trainer> allTrainers = (List<Trainer>) request.getAttribute("trainers");
                                if (allTrainers != null) {
                                    for(Trainer t : allTrainers) {
                            %>
                                <option value="<%= t.getId() %>"><%= t.getName() %> (<%= t.getSpecialty() %>)</option>
                            <% 
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-primary w-100">Add Course</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
