<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.DeliveryStaffModel" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delivery Staff - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">Delivery Staff Management</h2>

  <table class="table table-bordered table-striped">
    <thead class="table-primary">
      <tr>
        <th>Staff ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Area</th>
        <th>Status</th>
        <th>Notes</th>
        <th>Date</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <%
        ArrayList<DeliveryStaffModel> staffList = (ArrayList<DeliveryStaffModel>) request.getAttribute("staff");
        if (staffList != null && !staffList.isEmpty()) {
          for (DeliveryStaffModel staff : staffList) {
      %>
      <tr>
        <td><%= staff.getStaffID() %></td>
        <td><%= staff.getFirstname() + " " + staff.getLastname() %></td>
        <td><%= staff.getPhone() %></td>
        <td><%= staff.getAssignedArea() %></td>
        <td><span class=""><%= staff.getStatus() %></span></td>
        <td><%= staff.getNotes() %></td>
        <td><%= staff.getDate() %></td>
       
		

        
        
        
        <td>
          <a href="updateDeliveryStaff.jsp?staffID=<%= staff.getStaffID() %>&phone=<%= staff.getPhone() %>&area=<%= staff.getAssignedArea() %>&status=<%= staff.getStatus() %>&notes=<%= staff.getNotes() %>" class="btn btn-sm btn-outline-primary mb-1">Update</a>
          <form action="DeleteDeliveryStaffServlet" method="post" style="display:inline-block">
            <input type="hidden" name="staffID" value="<%= staff.getStaffID() %>">
            <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% 
          } 
        } else { 
      %>
      <tr>
        <td colspan="8" class="text-center">No Delivery Staff found.</td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
