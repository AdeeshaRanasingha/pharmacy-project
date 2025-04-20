<!-- navbar.jsp -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<%@ page import="java.util.ArrayList" %>
            <%@ page import="Model.CartItem" %>

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
</style>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <i class="fa-solid fa-capsules"></i> PharmaOnline
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"><i class="fa fa-bars"></i></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">
        <li class="nav-item">
          <a class="nav-link " href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="medicine.jsp"><i class="fa-solid fa-pills"></i> Medicines</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="prescription.jsp"><i class="fa-solid fa-file-prescription"></i> Prescriptions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="orderListServlet"><i class="fa-solid fa-truck-fast"></i> Orders</a>
        </li>
        <li class="nav-item position-relative">
          <a class="nav-link" href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i>
            <span class="cart-badge"> 
            
            
            <%
            ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
              int cartSize = cart.size();
          %>
              <%= cartSize %>
          <%
            } else {
          %>
              0
          <%
            }
          %>
</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
            aria-expanded="false">
            <i class="fa-solid fa-user"></i> Account
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-user-plus"></i> Register</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-circle-info"></i> Help</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
