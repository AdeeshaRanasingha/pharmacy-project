<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pharmacy Portal Navbar</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            --primary-color: #1E3A8A;
            --secondary-color: #0EA5E9;
            --text-color: #ffffff;
            --nav-gradient: linear-gradient(to right, #1E3A8A, #0EA5E9);
        }

        .navbar {
            background: var(--nav-gradient);
            position: sticky;
            top: 0;
            z-index: 1020;
            padding: 0.8rem 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            letter-spacing: 1px;
            color: var(--text-color);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-link {
            font-weight: 600;
            color: var(--text-color);
            margin: 0 12px;
            position: relative;
            transition: color 0.3s;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #ffe600;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #ffe600;
            transition: width 0.3s ease-in-out;
        }

        .nav-link:hover::before,
        .nav-link.active::before {
            width: 100%;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler:focus {
            box-shadow: none;
        }

        .navbar-toggler-icon {
            color: var(--text-color);
        }

        .cart-badge {
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 0.2em 0.5em;
            font-size: 0.75rem;
            position: absolute;
            top: -5px;
            right: -10px;
        }

        .dropdown-menu {
            border-radius: 0.75rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .dropdown-item {
            font-weight: 500;
            transition: background-color 0.2s;
        }

        .dropdown-item:hover {
            background-color: var(--secondary-color);
            color: #fff;
        }

        .hero {
            position: relative;
            width: 100%;
            height: 650px;
            overflow: hidden;
        }

        .carousel-inner img {
            width: 100%;
            height: 650px;
            object-fit: cover;
        }

        .carousel-caption {
            background: rgba(0, 0, 0, 0.65);
            padding: 30px 40px;
            border-radius: 12px;
            text-align: left;
            max-width: 600px;
        }

        .carousel-caption h1 {
            font-size: 3rem;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 15px;
        }

        .carousel-caption p {
            font-size: 1.2rem;
            color: #f1f1f1;
            margin-bottom: 20px;
        }

        .carousel-caption .btn-custom {
            padding: 10px 25px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 50px;
            background-color: var(--secondary-color);
            color: #ffffff;
            border: none;
            transition: background-color 0.3s ease-in-out;
        }

        .carousel-caption .btn-custom:hover {
            background-color: #078acb;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<!-- Hero Section -->
<div id="heroCarousel" class="carousel slide hero" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/img1.png" class="d-block w-100" alt="Banner 1">
            <div class="carousel-caption d-none d-md-block">
                <h1>Discover Trusted Health Solutions</h1>
                <p>Shop from a wide range of genuine medications and wellness essentials at PharmaOnline.</p>
                <a class="btn btn-custom" href="#">Browse Products</a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/img2.png" class="d-block w-100" alt="Banner 2">
            <div class="carousel-caption d-none d-md-block">
                <h1>Fast & Reliable Medicine Delivery</h1>
                <p>Experience hassle-free ordering and timely doorstep delivery—where care meets convenience.</p>
                <a class="btn btn-custom" href="#">Order Now</a>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Featured Products Section -->
<section class="py-5 bg-light">
    <div class="container">
      <div class="text-center mb-5">
        <h2 class="fw-bold">Featured Products</h2>
        <p class="text-muted">Explore our top-rated and most popular medicines</p>
      </div>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">
            <img src="images/img1.png" class="card-img-top" alt="Product 1">
            <div class="card-body">
              <h5 class="card-title">Paracetamol 500mg</h5>
              <p class="card-text text-muted">Fast relief from pain and fever. Trusted by millions worldwide.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 250</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
  
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">                                                
            <img src="images/img1.png" class="card-img-top" alt="Product 2">
            <div class="card-body">
              <h5 class="card-title">Vitamin C Tablets</h5>
              <p class="card-text text-muted">Boost immunity and energy levels with high-quality supplements.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 1,100</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
  
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">
            <img src="images/img1.png" class="card-img-top" alt="Product 3">
            <div class="card-body">
              <h5 class="card-title">Cough Syrup</h5>
              <p class="card-text text-muted">Soothing formula for dry and wet cough, safe for adults and children.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 890</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="py-5 bg-light">
    <div class="container">
      
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">
            <img src="images/img1.png" class="card-img-top" alt="Product 1">
            <div class="card-body">
              <h5 class="card-title">Paracetamol 500mg</h5>
              <p class="card-text text-muted">Fast relief from pain and fever. Trusted by millions worldwide.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 250</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
  
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">
            <img src="images/img1.png" class="card-img-top" alt="Product 2">
            <div class="card-body">
              <h5 class="card-title">Vitamin C Tablets</h5>
              <p class="card-text text-muted">Boost immunity and energy levels with high-quality supplements.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 1,100</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
  
        <div class="col-md-4">
          <div class="card h-100 shadow-sm">
            <img src="images/img1.png" class="card-img-top" alt="Product 3">
            <div class="card-body">
              <h5 class="card-title">Cough Syrup</h5>
              <p class="card-text text-muted">Soothing formula for dry and wet cough, safe for adults and children.</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="fw-bold text-primary">Rs. 890</span>
                <a href="#" class="btn btn-outline-primary btn-sm">Add to Cart</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<!-- Advertisement Banner -->
<section class="py-5" style="background-color: #e0f7fa;">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-8">
          <h4 class="fw-bold text-primary"> Limited Time Offer!</h4>
          <p class="mb-2">Get 10% off on your first order. Use code <strong>PHARMA10</strong> at checkout.</p>
          <a href="#" class="btn btn-primary btn-sm fw-semibold">Shop Now</a>
        </div>
        <div class="col-md-4 text-center">
          <img src="images/img4.png" alt="Offer Banner" class="img-fluid rounded">
        </div>
      </div>
    </div>
  </section>
  
  
  <!-- User Feedback Section -->
<section class="py-5 bg-white">
    <div class="container">
      <div class="text-center mb-5">
        <h2 class="fw-bold">What Our Customers Say</h2>
        <p class="text-muted">Real feedback from happy customers</p>
      </div>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card h-100 shadow-sm border-0">
            <div class="card-body">
              <p class="card-text">“Ordering was easy, and the delivery was super fast. PharmaOnline really impressed me!”</p>
              <div class="d-flex align-items-center mt-4">
                <img src="https://randomuser.me/api/portraits/men/31.jpg" class="rounded-circle me-3" width="50" height="50" alt="User 1">
                <div>
                  <h6 class="mb-0 fw-bold">Nuwan Perera</h6>
                  <small class="text-muted">Colombo, Sri Lanka</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card h-100 shadow-sm border-0">
            <div class="card-body">
              <p class="card-text">“I found all the medicines I needed and the site is very user-friendly. Highly recommend!”</p>
              <div class="d-flex align-items-center mt-4">
                <img src="https://randomuser.me/api/portraits/women/44.jpg" class="rounded-circle me-3" width="50" height="50" alt="User 2">
                <div>
                  <h6 class="mb-0 fw-bold">Dilani Fernando</h6>
                  <small class="text-muted">Kandy, Sri Lanka</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card h-100 shadow-sm border-0">
            <div class="card-body">
              <p class="card-text">“Professional service and very responsive. I appreciate the care they put into packaging.”</p>
              <div class="d-flex align-items-center mt-4">
                <img src="https://randomuser.me/api/portraits/men/65.jpg" class="rounded-circle me-3" width="50" height="50" alt="User 3">
                <div>
                  <h6 class="mb-0 fw-bold">Ravindu Silva</h6>
                  <small class="text-muted">Galle, Sri Lanka</small>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->


<jsp:include page="footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>