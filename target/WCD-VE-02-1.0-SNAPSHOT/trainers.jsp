<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="lk.jiat.wcdve02.model.Trainer"%>
<jsp:include page="/WEB-INF/components/header.jsp"/>

<div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-3">
    <h2 class="fw-bold mb-0">Trainer Management</h2>
    <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#addTrainerModal">Add Trainer</button>
</div>

<div class="card mb-5">
    <div class="card-body p-0 table-responsive">
        <table class="table table-hover mb-0">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Specialty</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Trainer> trainers = (List<Trainer>) request.getAttribute("trainers");
                    if (trainers != null && !trainers.isEmpty()) {
                        for (Trainer t : trainers) {
                %>
                    <tr>
                        <td class="align-middle"><%= t.getId() %></td>
                        <td class="align-middle fw-semibold"><%= t.getName() %></td>
                        <td class="align-middle text-muted"><%= t.getSpecialty() %></td>
                        <td class="text-end align-middle">
                            <button class="btn btn-sm btn-outline-secondary me-2" data-bs-toggle="modal" data-bs-target="#editTrainerModal<%= t.getId() %>">Edit</button>
                            <a href="${pageContext.request.contextPath}/trainers?action=delete&id=<%= t.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    
                    <!-- Edit Modal -->
                    <div class="modal fade" id="editTrainerModal<%= t.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content text-start">
                                <div class="modal-header border-0">
                                    <h5 class="modal-title fw-bold">Edit Trainer</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/trainers" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="<%= t.getId() %>">
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">NAME</label>
                                            <input type="text" name="name" class="form-control" value="<%= t.getName() %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">SPECIALTY</label>
                                            <input type="text" name="specialty" class="form-control" value="<%= t.getSpecialty() %>" required>
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
                    <tr><td colspan="4" class="text-center py-5 text-muted">No trainers found.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Modal -->
<div class="modal fade" id="addTrainerModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">Add New Trainer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="${pageContext.request.contextPath}/trainers" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">NAME</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">SPECIALTY</label>
                        <input type="text" name="specialty" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-primary w-100">Add Trainer</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
