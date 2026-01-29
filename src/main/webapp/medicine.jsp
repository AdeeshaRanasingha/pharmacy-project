<%@ page import="java.util.*, Model.InventoryModel" %>
<%
    ArrayList<InventoryModel> list = (ArrayList<InventoryModel>) request.getAttribute("medicineList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Medicine Display</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f4f9fd; }
    .medicine-img { height: 200px; object-fit: cover; }
    
    .qty-input { width: 70px; margin: 0 auto; }
    
    
    
     /* Hero section styles */
    .hero-section {
      margin-bottom: 2rem;
    }
    
    .hero-search .form-control {
      border-radius: 30px 0 0 30px;
      border: none;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    
    .hero-search .btn {
      border-radius: 0 30px 30px 0;
      border: none;
      background: white;
      color: var(--primary);
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    
    
 .card {
      background-color: #ebeef0; /* Light grey */
      border-radius: 12px;
      padding: 16px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      transition: all 0.3s ease;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      height: 100%;
    }

    .card:hover {
     /*  background-color:#5a87a6; */
    /*   color: white; */
      transform: translateY(-4px);
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    }

.card-body {
  flex-grow: 1;
}

.card-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 8px;
}

.card-text {
  font-size: 14px;
  color: #666;
}

.card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 12px;
  gap: 12px;
  flex-wrap: wrap;
}

.price {
  font-weight: bold;
  color: #0077cc;
}

.quantity label {
  font-size: 12px;
  display: block;
  margin-bottom: 4px;
}

.quantity input {
  width: 60px;
  padding: 4px 6px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.add-to-cart {
  padding: 6px 12px;
  font-size: 14px;
  border: 1px solid #0077cc;
  background-color: transparent;
  color: #0077cc;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.add-to-cart:hover {
  background-color: #0077cc;
  color: #fff;

}
    
  </style>
</head>
<body>

<jsp:include page="header.jsp" />


<!-- Hero Section with Image -->
<div class="hero-section position-relative">
 <div class="hero-image" style="background-image: url('images/img1.png'); height: 400px; background-position: center; background-size: cover; position: relative;">
  <div class="hero-overlay" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: linear-gradient(80deg, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.2) 20%, rgba(0, 0, 0, 0) 60%);">

      <div class="container h-100 d-flex flex-column justify-content-center">
        <div class="row align-items-center h-100">
          <div class="col-lg-6">
            <h1 class="display-4 text-white fw-bold mb-3">Find Your Medications</h1>
            <p class="lead text-white mb-4">Browse our complete inventory of quality medicines with fast delivery and best prices.</p>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br>
  <div class="text-center mb-5">
        <h2 class="fw-bold"> Products</h2>
        <p class="text-muted">Order genuine medicines and health products from the comfort of your home</p>
      </div>
      
      
<div class="container py-5">
   <div class="row g-4">
    <%
        for (InventoryModel med : list) {
    %>
        <form action="CartServlet" method="post" class="col-md-4">
         <div class="card">
  <div class="card-body">
    <h5 class="card-title"><%= med.getMedicineName() %></h5>
    <input type="hidden" name="productName" value="<%= med.getMedicineName() %>">
    <input type="hidden" name="price" value="<%= med.getUnitPrice() %>">
    <p class="card-text"><%= med.getdescription() %></p>
  </div>
  <div class="card-footer">
    <div class="price">Rs. <%= med.getUnitPrice() %></div>
    <div class="quantity">
      <label>Qty (Days)</label>
      <input type="number" name="quantity" value="1" min="1">
    </div>
    <button type="submit" class="add-to-cart">Add to Cart</button>
  </div>
</div>

        </form>
    <%
        }
    %>
  </div>
</div> 

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>