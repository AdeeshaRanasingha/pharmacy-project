<%@ page contentType="text/html;charset=UTF-8"
         import="java.time.LocalDate,java.util.Map,Model.InventoryModel" %>
<%
  Map<String,String> errors = (Map<String,String>)request.getAttribute("errors");
  InventoryModel form = (InventoryModel)request.getAttribute("InventMod");
  if (form == null) form = new InventoryModel();
  String expiryVal = form.getExpiryDate() != null ? form.getExpiryDate() : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Pharmacy Inventory Dashboard</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f7fd;
      display: flex;
      font-family: 'Segoe UI', sans-serif;
    }

    .sidebar {
      width: 250px;
      height: 100vh;
      background-color: #ffffff;
      padding: 20px;
      position: fixed;
      top: 0;
      left: 0;
      overflow-y: auto;
      box-shadow: 2px 0 5px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      z-index: 1000;
    }

    .sidebar h2 {
      color: #6a5acd;
      margin-bottom: 30px;
      text-align: center;
    }

    .sidebar a {
      text-decoration: none;
      color: #333;
      padding: 12px 10px;
      font-size: 16px;
      border-radius: 6px;
      display: flex;
      align-items: center;
      transition: background 0.2s;
    }

    .sidebar a:hover {
      background-color: #f0f0ff;
      color: #6a5acd;
    }

    .logout-link {
      margin-top: auto;
      color: red;
      font-weight: bold;
    }

    .logout-link:hover {
      color: darkred;
    }

    .main-content {
      margin-left: 250px;
      padding: 40px 20px;
      width: 100%;
    }

    .form-section {
      background-color: #ffffff;
      padding: 30px;
      max-width: 700px;
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .form-section label {
      display: block;
      margin-top: 18px;
      font-weight: 500;
    }

    .form-section input,
    .form-section select,
    .form-section textarea {
      width: 100%;
      padding: 12px;
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 6px;
      background-color: #fafafa;
      font-size: 15px;
    }

    .radio-group {
      margin-top: 10px;
      display: flex;
      gap: 25px;
      align-items: center;
    }

    .radio-group label {
      font-weight: normal;
    }

    .submit-btn {
      background-color: black;
      color: black;
      border: none;
      padding: 14px;
      font-size: 16px;
      width: 100%;
      border-radius: 6px;
      margin-top: 30px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .submit-btn:hover {
      background-color: #6a5acd;
      color:white;
    }

    .error-msg {
      color: red;
      font-size: 0.9rem;
      margin-top: 4px;
    }
  </style>
</head>
<body>

<div class="sidebar">
  <h2>eRemedy</h2>
  <a href="adminPanel.jsp"><i class="fas fa-tachometer-alt"></i>&nbsp; Dashboard</a>
  <a href="InventoryReadServelet"><i class="fas fa-pills"></i>&nbsp; Manage Medicines</a>
  <a href="Inventory.jsp"><i class="fas fa-user-nurse"></i>&nbsp; Add Medicine</a>
  <a href="#"><i class="fas fa-users"></i>&nbsp; Manage Customers</a>
  <a href="ManageOrdersServlet"><i class="fas fa-clipboard-list"></i>&nbsp; Orders</a>
  <a href="addDeliveryStaff.jsp"><i class="fas fa-truck"></i>&nbsp; Add Delivery Staff</a>
  <a href="DeliveryStaffListServlet"><i class="fas fa-list-ul"></i>&nbsp; Delivery Staff Management</a>
  <a href="adminViewFeedback.jsp"><i class="fas fa-list-ul"></i>&nbsp; Messages</a>
  <a href="LogoutServlet" class="logout-link"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
</div>

<div class="main-content d-flex justify-content-center align-items-center" style="min-height: 100vh;">
  <div class="form-section">
    <h2 class="text-center mb-4">💊 Pharmacist Inventory Form</h2>
    <form id="inventoryForm" action="InventoryInsertServelet" method="post">

      <label for="medicineName">Medicine Name:</label>
      <input type="text" id="medicineName" name="medicineName">
      <div id="medicineNameError" class="error-msg"></div>

      <label for="description">Description:</label>
      <textarea id="description" name="description" rows="4"></textarea>
      <div id="descriptionError" class="error-msg"></div>

      <label for="category">Category:</label>
      <select id="category" name="category">
        <option value="">--Select Category--</option>
        <option value="Painkiller">Painkiller</option>
        <option value="Allergy">Allergy</option>
        <option value="Injection">Injection</option>
        <option value="Antibiotic">Antibiotic</option>
        <option value="Ointment">Ointment</option>
        <option value="Drops">Drops</option>
      </select>
      <div id="categoryError" class="error-msg"></div>

      <label for="quantity">Quantity:</label>
      <input type="number" id="quantity" name="quantity">
      <div id="quantityError" class="error-msg"></div>

      <label for="unitPrice">Unit Price (Rs.):</label>
      <input type="number" step="0.01" id="unitPrice" name="unitPrice">
      <div id="unitPriceError" class="error-msg"></div>

      <label>Prescription Required?</label>
      <div class="radio-group">
        <label><input type="radio" name="prescriptionRequired" value="Yes"> Yes</label>
        <label><input type="radio" name="prescriptionRequired" value="No"> No</label>
      </div>
      <div id="prescriptionRequiredError" class="error-msg"></div>

      <label for="expiryDate">Expiry Date:</label>
      <input type="date" id="expiryDate" name="expiryDate" min="<%= LocalDate.now().toString() %>" value="<%= expiryVal %>">
      <div id="expiryDateError" class="error-msg"></div>

      <input type="submit" value="Add Medicine" class="submit-btn">
    </form>
  </div>
</div>

<script>
document.getElementById("inventoryForm").addEventListener("submit", function (e) {
  let valid = true;

  function showError(id, message) {
    document.getElementById(id).value = "";
    document.getElementById(id + "Error").innerText = message;
    valid = false;
  }

  // Clear all errors
  document.querySelectorAll(".error-msg").forEach(el => el.innerText = "");

  const name = document.getElementById("medicineName");
  if (!name.value.trim() || name.value.length <= 3) showError("medicineName", "Enter at least 3 characters");

  const desc = document.getElementById("description");
  if (!desc.value.trim() || desc.value.length < 5) showError("description", "Description must be at least 5 characters");

  const cat = document.getElementById("category");
  if (cat.value === "") {
    document.getElementById("categoryError").innerText = "Please select a category";
    valid = false;
  }

  const qty = document.getElementById("quantity");
  if (!qty.value || qty.value <= 0) showError("quantity", "Enter a valid quantity");

  const price = document.getElementById("unitPrice");
  if (!price.value || price.value <= 0) showError("unitPrice", "Enter a valid price");

  const prescrip = document.querySelector('input[name="prescriptionRequired"]:checked');
  if (!prescrip) {
    document.getElementById("prescriptionRequiredError").innerText = "Select Yes or No";
    valid = false;
  }

  const expiry = document.getElementById("expiryDate");
  const today = new Date().toISOString().split("T")[0];
  if (!expiry.value || expiry.value < today) showError("expiryDate", "Date must be in the future");

  if (!valid) e.preventDefault();
});
</script>
</body>
</html>
