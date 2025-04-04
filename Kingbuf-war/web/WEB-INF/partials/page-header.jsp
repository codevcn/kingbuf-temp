<header>
  <a class="app-title" href="reservation">Nhà Hàng KingBuf</a>
  <nav>
    <% Boolean isAdmin = (Boolean) request.getAttribute("isAdmin"); %>
    
    <% if (isAdmin != null && isAdmin) { %>
    <ul>
      <li>
        <a href="admin/all-tables" class="nav-item">
          <i class="bi bi-border-style"></i>
          <span>Danh sách bàn</span>
        </a>
      </li>
      <li>
        <a href="admin/all-bookings" class="nav-item">
          <i class="bi bi-list-columns-reverse"></i>
          <span>Danh sách đơn đặt bàn</span>
        </a>
      </li>
      <li>
        <a href="/api/admin/logout" class="nav-item" id="logout-btn">
          <i class="bi bi-box-arrow-right"></i>
          <span>Đăng xuất</span>
        </a>
      </li>
    </ul>
    <% } else { %>
    <ul>
      <li>
        <a href="#booking" class="nav-item">
          <i class="bi bi-journal-check"></i>
          <span>Đặt Chỗ</span>
        </a>
      </li>
      <li>
        <a href="tel:0123456789" class="nav-item">
          <i class="bi bi-telephone-fill"></i>
          <span>Liên Hệ</span>
        </a>
      </li>
      <li>
        <a href="booking-history" class="nav-item">
          <i class="bi bi-search"></i>
          <span>Tra cứu đơn đặt</span>
        </a>
      </li>
    </ul>
    <% } %>
  </nav>
</header>
