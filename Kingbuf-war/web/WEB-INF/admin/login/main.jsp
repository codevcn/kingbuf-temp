<main id="main-section">
  <div class="login-container card">
    <h1>Đăng nhập quản trị viên KingBuf</h1>
    <form id="login-form">
      <div class="form-group">
        <label for="username-input">Tên người dùng</label>
        <div class="input-wrapper">
          <input type="text" id="username-input" name="username" placeholder="Nhập username của bạn">
        </div>
      </div>
      <div class="form-group">
        <label for="password-input">Mật khẩu</label>
        <div class="input-wrapper">
          <input type="password" id="password-input" name="password" placeholder="Nhập mật khẩu">
          <button type="button" hidden class="hide-show-password-btn show">
            <i class="bi bi-eye-fill"></i>
          </button>
          <button type="button" class="hide-show-password-btn hide">
            <i class="bi bi-eye-slash-fill"></i>
          </button>
        </div>
      </div>
      <button type="submit" class="submit-btn">Đăng nhập</button>
    </form>
  </div>
</main>