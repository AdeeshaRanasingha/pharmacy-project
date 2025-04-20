<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Medicine Display</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f9fd;
    }
    .medicine-img {
      height: 200px;
      object-fit: cover;
    }
    .card {
      border-radius: 0.75rem;
    }
    .qty-input {
      width: 70px;
      margin: 0 auto;
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
<div class="row g-4">

  <!-- Card 1: Paracetamol -->
  <form action="CartServlet" method="post" class="col-md-4">
    <div class="card h-100 shadow-sm border-0 rounded-3">
      <img src="https://source.unsplash.com/400x250/?pharmacy,medicine" class="card-img-top medicine-img" alt="Paracetamol">
      <div class="card-body">
        <h5 class="card-title fw-semibold">Paracetamol 500mg</h5>
        <input type="hidden" name="productName" value="Paracetamol 500mg">
        <input type="hidden" name="price" value="250">
        <p class="card-text text-muted small">Fast relief from pain and fever. Trusted by millions worldwide.</p>
      </div>
      <div class="card-footer bg-white border-0 d-flex justify-content-between align-items-center px-3 pb-3">
        <div><span class="text-primary fw-bold">Rs. 250</span></div>
        <div class="text-center">
          <label for="quantity1" class="form-label mb-1 small">Qty (Days)</label>
          <input type="number" class="form-control form-control-sm qty-input" name="quantity" id="quantity1" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-outline-primary btn-sm ms-2">Add to Cart</button>
      </div>
    </div>
  </form>

  <!-- Card 2: Vitamin C -->
  <form action="CartServlet" method="post" class="col-md-4">
    <div class="card h-100 shadow-sm border-0 rounded-3">
      <img src="https://source.unsplash.com/400x250/?vitamin,capsule" class="card-img-top medicine-img" alt="Vitamin C">
      <div class="card-body">
        <h5 class="card-title fw-semibold">Vitamin C Tablets</h5>
        <input type="hidden" name="productName" value="Vitamin C Tablets">
        <input type="hidden" name="price" value="1100">
        <p class="card-text text-muted small">Boost immunity and energy levels. Recommended for daily use.</p>
      </div>
      <div class="card-footer bg-white border-0 d-flex justify-content-between align-items-center px-3 pb-3">
        <div><span class="text-primary fw-bold">Rs. 1,100</span></div>
        <div class="text-center">
          <label for="quantity2" class="form-label mb-1 small">Qty (Days)</label>
          <input type="number" class="form-control form-control-sm qty-input" name="quantity" id="quantity2" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-outline-primary btn-sm ms-2">Add to Cart</button>
      </div>
    </div>
  </form>

  <!-- Card 3: Cough Syrup -->
  <form action="CartServlet" method="post" class="col-md-4">
    <div class="card h-100 shadow-sm border-0 rounded-3">
      <img src="https://source.unsplash.com/400x250/?cough,syrup" class="card-img-top medicine-img" alt="Cough Syrup">
      <div class="card-body">
        <h5 class="card-title fw-semibold">Cough Syrup</h5>
        <input type="hidden" name="productName" value="Cough Syrup">
        <input type="hidden" name="price" value="890">
        <p class="card-text text-muted small">Relieves throat irritation and dry cough. Suitable for all ages.</p>
      </div>
      <div class="card-footer bg-white border-0 d-flex justify-content-between align-items-center px-3 pb-3">
        <div><span class="text-primary fw-bold">Rs. 890</span></div>
        <div class="text-center">
          <label for="quantity3" class="form-label mb-1 small">Qty (Days)</label>
          <input type="number" class="form-control form-control-sm qty-input" name="quantity" id="quantity3" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-outline-primary btn-sm ms-2">Add to Cart</button>
      </div>
    </div>
  </form>

  <!-- Card 4: Pain Relief Balm -->
  <form action="CartServlet" method="post" class="col-md-4">
    <div class="card h-100 shadow-sm border-0 rounded-3">
      <img src="https://source.unsplash.com/400x250/?pain,balm" class="card-img-top medicine-img" alt="Pain Balm">
      <div class="card-body">
        <h5 class="card-title fw-semibold">Pain Relief Balm</h5>
        <input type="hidden" name="productName" value="Pain Relief Balm">
        <input type="hidden" name="price" value="320">
        <p class="card-text text-muted small">Instant relief from muscle and joint pain. Non-greasy formula.</p>
      </div>
      <div class="card-footer bg-white border-0 d-flex justify-content-between align-items-center px-3 pb-3">
        <div><span class="text-primary fw-bold">Rs. 320</span></div>
        <div class="text-center">
          <label for="quantity4" class="form-label mb-1 small">Qty (Days)</label>
          <input type="number" class="form-control form-control-sm qty-input" name="quantity" id="quantity4" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-outline-primary btn-sm ms-2">Add to Cart</button>
      </div>
    </div>
  </form>

</div>
</div>


<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>