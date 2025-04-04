<!-- Hero Section -->
<section class="hero">
  <div class="hero-modal"></div>
  <div class="hero-content">
    <h2>Chào Mừng Đến Với Nhà Hàng KingBuf</h2>
    <p>Thưởng thức ẩm thực tuyệt vời và đặt chỗ ngay hôm nay!</p>
    <a href="#booking">Đặt Chỗ Ngay</a>
  </div>
</section>

<section class="description-and-booking">
  <section class="description-box">
    <section class="description">
      <h4 class="section-title">Review nhanh</h4>
      <div class="card">
        <h4 class="title">King BBQ Buffet - Lê Văn Sỹ</h4>
        <div class="info">
          <div class="info-item">
            <i class="bi bi-geo-alt icon"></i>
            <span>Số 347 Lê Văn Sỹ, P. 1, Q. Tân Bình</span>
          </div>
          <div class="info-item">
            <i class="bi bi-flag icon"></i>
            <span>Loại hình: <span class="category">Buffet nướng Hàn Quốc</span></span>
          </div>
          <div class="info-item">
            <i class="bi bi-currency-dollar icon"></i>
            <span>Khoảng giá <span class="price">$$$</span>: 250.000 - 350.000 đ/người</span>
          </div>
        </div>
      </div>
    </section>

    <section class="summary-container card">
      <h4>Tóm tắt King BBQ Buffet - Lê Văn Sỹ</h4>
      <div class="section">
        <h5>PHÙ HỢP:</h5>
        <p>Đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm, gia đình...</p>
      </div>
      <div class="section">
        <h5>MÓN ĐẶC SẮC:</h5>
        <p>Dẻ Sườn bò mỹ, Cổ bò mỹ sốt King BBQ, Bắp bò sốt muối ớt, ...</p>
      </div>
      <div class="section">
        <h5>KHÔNG GIAN:</h5>
        <p>- Hàn Quốc. Hiện đại.</p>
        <p>- Sức chứa: 120 Khách</p>
      </div>
      <div class="section">
        <h5>ĐỂ Ô TÔ:</h5>
        <p>Không</p>
      </div>
      <div class="section">
        <h5>ĐIỂM ĐẶC TRƯNG:</h5>
        <p>- King BBQ thuộc sở hữu của Tập đoàn RedSun ITI.</p>
      </div>
      <div class="section">
        <h5>LIÊN HỆ NHÀ HÀNG:</h5>
        <p>- Số điện thoại: 0123 456 789</p>
      </div>
    </section>
  </section>

  <section id="booking" class="booking">
    <h4 class="section-title">Đặt Chỗ Nhà Hàng</h4>
    <form id="booking-form" class="card">
      <div class="form-group full-name">
        <label for="full-name-input">Họ và tên</label>
        <input type="text" id="full-name-input" name="full-name" placeholder="Nhập họ và tên">
      </div>
      <div class="form-group phone">
        <label for="phone-input">Số điện thoại</label>
        <input type="number" id="phone-input" name="phone" placeholder="Nhập số điện thoại">
      </div>
      <div class="form-group-row">
        <div class="form-group date">
          <label for="date-input">Ngày đặt</label>
          <input type="date" id="date-input" name="date">
        </div>
        <div class="form-group time">
          <label for="time-inp">Giờ đặt</label>
          <input type="time" id="time-inp" name="time">
        </div>
      </div>
      <div class="form-group-row">
        <div class="form-group adults-count">
          <label for="adults-count-input">Số người lớn</label>
          <input type="number" id="adults-count-input" name="adults-count" placeholder="Số lượng khách">
        </div>
        <div class="form-group children-count">
          <label for="children-count-input">Số trẻ em</label>
          <input type="number" id="children-count-input" name="children-count" placeholder="Số lượng khách">
        </div>
      </div>
      <div class="form-group note">
        <label for="note-input">Ghi chú</label>
        <textarea id="note-input" name="note" rows="3" placeholder="Nhập ghi chú cho nhà hàng..."></textarea>
      </div>
      <button type="submit">Đặt Chỗ</button>
    </form>
  </section>
</section>

<div class="modal fade" tabindex="-1" id="confirm-booking-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header pt-3 pb-3">
        <h5 class="modal-title fw-bold">Xác nhận đặt chỗ</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <h3 class="confirm-booking-title">Thông tin đặt chỗ</h3>
        <section id="confirm-booking-details">
          <div class="form-groups">
            <div class="form-group full-name">
              <label>Họ và tên người đặt</label>
              <p></p>
            </div>
            <div class="form-group phone">
              <label>Số điện thoại người đặt</label>
              <p></p>
            </div>
            <div class="form-group date-time">
              <label>Thời gian đặt</label>
              <p></p>
            </div>
            <div class="form-group people-count">
              <label>Số người lớn và trẻ em</label>
              <p></p>
            </div>
            <div class="form-group note">
              <label>Ghi chú cho nhà hàng</label>
              <p></p>
            </div>
          </div>
          <button class="submit-btn">
            <span>Xác nhận đặt chỗ</span>
          </button>
        </section>
      </div>
    </div>
  </div>
</div>
