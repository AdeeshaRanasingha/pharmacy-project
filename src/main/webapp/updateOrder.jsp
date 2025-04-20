<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Order - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f9fd;
      color: #333;
    }
    
    .form-control {
      border-radius: 0.5rem;
    }
    .btn-primary {
      background-color: #1E3A8A;
      border-color: #1E3A8A;
    }
    .btn-primary:hover {
      background-color: #0EA5E9;
      border-color: #0EA5E9;
    }
    
  </style>
</head>
<body>



<div class="container py-5">
  <h2 class="mb-4 text-primary">✏️ Update Order</h2>

  <form action="UpdateOrderServlet" method="post" class="bg-white p-4 shadow rounded">
    <div class="mb-3">
  <label for="orderID" class="form-label">Order ID</label>
  <input type="number" class="form-control" id="orderID" name="orderID" value="<%= request.getParameter("id") %>" readonly>
</div>



    <div class="mb-3">
      <label for="address" class="form-label">Delivery Address</label>
      <textarea class="form-control" id="address" name="address" rows="3" required><%= request.getParameter("address") %></textarea>
    </div>

    <div class="mb-3">
      <label for="phone" class="form-label">Phone Number</label>
      <input type="number" class="form-control" id="phone" name="phone" value="<%= request.getParameter("telephone") %>" required>
    </div>

    <div class="text-end">
      <button type="submit" class="btn btn-primary px-4">Update Order</button>
    </div>
  </form>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
