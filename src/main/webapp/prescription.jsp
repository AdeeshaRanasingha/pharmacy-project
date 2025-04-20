
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Place Order - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f9fd;
      color: #333;
    }
    .card {
      border: none;
      border-radius: 1rem;
    }
    .card-header {
      border-top-left-radius: 1rem;
      border-top-right-radius: 1rem;
    }
    .form-control, .form-select {
      border-radius: 0.5rem;
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp" />

<section class="py-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow">
          <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fa-solid fa-truck-medical me-2"></i>Place Your Order</h4>
          </div>
          <div class="card-body text-dark">
            <form action="prescriptionServlet" method="post" enctype="multipart/form-data">
              <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
              </div>
              <div class="mb-3">
                <label for="address" class="form-label">Delivery Address</label>
                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
              </div>
              <div class="mb-3">
                <label for="fullName" class="form-label">Phone Number</label>
                <input type="number" class="form-control" id="fullName" name="phone" required>
              </div>
              <div class="mb-3">
                <label for="quantity" class="form-label">Time Period (days)</label>
                <input type="number" class="form-control" id="quantity" name="quantity" min="1" default = "1"required>
              </div>
              <div class="mb-3">
                <label for="payment" class="form-label">Payment Method</label>
                <select class="form-select" id="payment" name="payment" required>
                  <option selected disabled>Choose...</option>
                  <option value="Cash">Cash on Delivery</option>
                  <option value="Card">Credit/Debit Card</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="prescription" class="form-label">Upload Prescription (if required)</label>
                <input class="form-control" type="file" id="prescription" name="prescription" accept=".jpg,.jpeg,.png,.pdf">
              </div>
              <button type="submit" class="btn btn-primary w-100">Confirm Order</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
