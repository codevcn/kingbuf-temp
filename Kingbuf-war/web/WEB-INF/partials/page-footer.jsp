<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<footer>
  <p>© 2025 Nhà Hàng Hương Việt. All rights reserved.</p>
  <p>Địa chỉ: 123 Đường Ẩm Thực, TP. HCM | Điện thoại: 0123 456 789</p>

  <c:if test="${isAdmin == null or not isAdmin}">
    <p>
      <a href="admin/login" id="login_with_admin" style="text-decoration: none; color: #eab308;">
        Đăng nhập với admin
      </a>
    </p>
  </c:if>
</footer>
