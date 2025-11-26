<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Delivery Staff</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="header.jsp" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow rounded-4">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Update Delivery Staff</h3>

                    <form action="UpdateDeliveryStaffServlet" method="post">
                        <!-- Hidden field for staff ID -->
						<div class="mb-3">
						  <label for="staffID" class="form-label">Staff ID</label>
						  <input type="number" class="form-control" id="staffID" name="staffID" value="<%= request.getParameter("staffID") %>" readonly>
						</div>

                        
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="text" name="phone" id="phone" class="form-control" value="<%= request.getParameter("phone") %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="assignedArea" class="form-label">Assigned Area</label>
                            <input type="text" name="assignedArea" id="assignedArea" class="form-control" value="<%= request.getParameter("area") %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
						<%
						    String status = request.getParameter("status");
						%>
						<select name="status" id="status" class="form-select" required>
						    <option value="Active" <%= "Active".equals(status) ? "selected" : "" %>>Active</option>
						    <option value="On Leave" <%= "On Leave".equals(status) ? "selected" : "" %>>On Leave</option>
						    <option value="Suspended" <%= "Suspended".equals(status) ? "selected" : "" %>>Suspended</option>
						    <option value="Resigned" <%= "Resigned".equals(status) ? "selected" : "" %>>Resigned</option>
						</select>

                        </div>

                        <div class="mb-3">
                            <label for="notes" class="form-label" >Notes</label>
                            <textarea name="notes" id="notes" class="form-control" rows="3"><%= request.getParameter("notes") %></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Staff</button>
                        <a href="DeliveryStaffListServlet" class="btn btn-secondary">Cancel</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
