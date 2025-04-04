<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.request.contextPath}/">
<main id="main-section">
    <section class="title-section">
        <h3>Tất cả các đơn đặt bàn</h3>
    </section>

    <form id="filter-bookings-form" action="admin/all-bookings" method="GET">
        <h2 class="filter-bookings-title">Bộ lọc đơn</h2>

        <div class="form-groups">
            <div class="form-group status">
                <label>Trạng thái đơn</label>
                <input type="text" name="status" id="booking-status-input" value="none" hidden>
                <div class="dropdown" id="booking-status-select">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        Chọn trạng thái của đơn
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="dropdown-item" data-kb-table-status="All">Tất cả</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Pending">Chưa được xử lý</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Cancelled">Đã bị hủy</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Approved">Đã duyệt</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Completed">Đã hoàn thành</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Arrived">Khách đã đến</div>
                        </li>
                        <li>
                            <div class="dropdown-item" data-kb-table-status="Rejected">Đã từ chối</div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="form-group time">
                <label for="filter-bookings-time-input">Số giờ đến hạn</label>
                <input type="number" id="filter-bookings-time-input" name="expires_in_hours">
                <div class="message"></div>
            </div>

            <div class="form-group time">
                <label for="filter-bookings-time-input">Số điện thoại</label>
                <input type="phonenumber" id="filter-bookings-time-input" name="phonenumber">
                <div class="message"></div>
            </div>
            <div class="form-group time">
                <label for="filter-bookings-time-input">Trong ngày</label>
                <input type="date" id="filter-bookings-time-input" name="date">
                <div class="message"></div>
            </div>
        </div>

        <div class="btns">
            <button class="submit-btn">
                <i class="bi bi-check-lg"></i>
                <span>Áp dụng bộ lọc</span>
            </button>
        </div>
    </form>

    <section class="result-summary">
        <p>
            <i class="bi bi-card-text"></i>
            <span>Tổng cộng <c:out value="${bookings != null ? bookings.size() : 0}" /> đơn đặt bàn.</span>
        </p>
    </section>

    <section class="result-section">
        <c:choose>
            <c:when test="${not empty bookings}">
                <div class="booking-list">
                    <c:forEach var="booking" items="${bookings}" varStatus="status">
                        <div class="booking-card" data-kb-booking-id="${booking.reservationID}">
                            <div class="card-title">
                                <h5>Đơn #${booking.reservationID}</h5>
                                <c:choose>
                                    <c:when test="${booking.status == 'Pending'}">
                                        <div class="status pending">Chưa được xử lý</div>
                                    </c:when>
                                    <c:when test="${booking.status == 'Approved'}">
                                        <div class="status approved">Đã duyệt</div>
                                    </c:when>
                                    <c:when test="${booking.status == 'Cancelled'}">
                                        <div class="status cancelled">Đã hủy</div>
                                    </c:when>
                                    <c:when test="${booking.status == 'Arrived'}">
                                        <div class="status arrived">Khách đã đến</div>
                                    </c:when>
                                    <c:when test="${booking.status == 'Completed'}">
                                        <div class="status completed">Đã hoàn thành</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="status rejected">Đã từ chối</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="card-info">
                                <p><strong>Họ tên:</strong> ${booking.cusFullName}</p>
                                <p><strong>Số điện thoại:</strong> ${booking.cusPhone}</p>
                                <p><strong>Thời gian đến:</strong> ${booking.arrivalTime}</p>
                                <p><strong>Người lớn:</strong> ${booking.numAdults}, <strong>Trẻ em:</strong> ${booking.numChildren}</p>
                                <p><strong>Ghi chú:</strong> ${not empty booking.note ? booking.note : 'Không có'}</p>
                                <p><strong>Ngày tạo đơn:</strong> ${booking.createdAt}</p>
                            </div>

                            <c:choose>
                                <c:when test="${booking.status == 'Rejected'}">
                                    <div class="reject-reason">
                                        <strong>Lý do từ chối:</strong>
                                        <c:choose>
                                            <c:when test="${not empty booking.reason}">
                                                ${booking.reason}
                                            </c:when>
                                            <c:otherwise>
                                                Không có lý do
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:when>
                                <c:when test="${booking.status == 'Approved' and not empty booking.tablesList}">
                                    <div class="tables-list">
                                        <span>Danh sách bàn:</span>
                                        <c:forEach var="table" items="${booking.tablesList}" varStatus="loop">
                                            <span>${table.tableNumber}<c:if test="${!loop.last}">,</c:if></span>
                                        </c:forEach>
                                    </div>
                                </c:when>
                            </c:choose>

                            <div class="booking-actions">
                                <c:set var="bookingJson" value="${booking.toStringJSON()}" />
                                <c:if test="${booking.status == 'Pending'}">
                                    <button type="button" class="action-btn" id="reject-booking-btn" data-kb-booking-data='${bookingJson}' onclick="showConfirmRejectBookingModal(event)">
                                        <i class="bi bi-x-lg"></i>
                                        <span>Từ chối đơn</span>
                                    </button>
                                </c:if>
                                <c:if test="${booking.status == 'Arrived'}">
                                    <button type="button" class="action-btn" id="complete-booking-btn" data-kb-booking-data='${bookingJson}' onclick="showConfirmCompleteBookingModal(event)">
                                        <i class="bi bi-clipboard-check"></i>
                                        <span>Hoàn thành đơn</span>
                                    </button>
                                </c:if>
                                <c:if test="${booking.status == 'Approved'}">
                                    <button type="button" class="action-btn" id="set-arrived-cus-btn" data-kb-booking-data='${bookingJson}' onclick="showConfirmArrivedCusModal(event)">
                                        <i class="bi bi-person-fill-check"></i>
                                        <span>Khách đã đến</span>
                                    </button>
                                    <button type="button" class="action-btn" id="cancel-booking-btn" data-kb-booking-data='${bookingJson}' onclick="showConfirmCancelBookingModal(event)">
                                        <i class="bi bi-trash"></i>
                                        <span>Hủy đơn</span>
                                    </button>
                                </c:if>
                                <c:if test="${booking.status == 'Pending' || booking.status == 'Approved'}">
                                    <a class="action-btn" href="admin/processing/${booking.reservationID}">
                                        <span>Xử lý đơn</span>
                                        <i class="bi bi-arrow-right-circle"></i>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-result">
                    <p class="empty-content">
                        <i class="bi bi-exclamation-circle"></i>
                        <span>Không có kết quả nào</span>
                    </p>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>

<div class="modal fade" id="cancel-booking-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Hủy đơn</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <h3 class="booking-details-title">Thông tin đặt chỗ</h3>
                <section class="booking-details">
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
                            <label>Thời gian đến</label>
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
                        <div class="form-group created-at">
                            <label>Thời gian tạo đơn</label>
                            <p></p>
                        </div>
                    </div>
                </section>

                <form class="cancel-form" id="confirm-cancel-form">
                    <div class="btns">
                        <button class="submit-btn" onclick="cancelBooking(event)">
                            <i class="bi bi-trash"></i>
                            <span>Xác nhận hủy đơn</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="reject-booking-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Từ chối đơn</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <h3 class="booking-details-title">Thông tin đặt chỗ</h3>
                <section class="booking-details">
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
                            <label>Thời gian đến</label>
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
                        <div class="form-group created-at">
                            <label>Thời gian tạo đơn</label>
                            <p></p>
                        </div>
                    </div>
                </section>

                <h3 class="booking-details-title mt-5">Lý do từ chối đơn</h3>
                <form class="reject-form" id="confirm-reject-form">
                    <div class="form-groups">
                        <div class="form-group">
                            <label for="cancel-reject-input">Lý do từ chối đơn</label>
                            <textarea id="reject-booking-input" rows="3" placeholder="Nhập lý do từ chối đơn ở đây..."></textarea>
                        </div>
                    </div>

                    <div class="btns">
                        <button class="submit-btn" onclick="rejectBooking(event)">
                            <i class="bi bi-trash"></i>
                            <span>Xác nhận từ chối đơn</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="complete-booking-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Hoàn thành đơn</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <h3 class="booking-details-title">Thông tin đặt chỗ</h3>
                <section class="booking-details">
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
                            <label>Thời gian đến</label>
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
                        <div class="form-group created-at">
                            <label>Thời gian tạo đơn</label>
                            <p></p>
                        </div>
                    </div>
                </section>

                <form class="complete-form" id="confirm-complete-form">
                    <div class="btns">
                        <button class="submit-btn complete-btn" onclick="completeBooking(event)">
                            <i class="bi bi-trash"></i>
                            <span>Xác nhận hoàn thành đơn</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="arrived-cus-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Khách hàng đã đến</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <h3 class="booking-details-title">Thông tin đặt chỗ</h3>
                <section class="booking-details">
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
                            <label>Thời gian đến</label>
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
                        <div class="form-group created-at">
                            <label>Thời gian tạo đơn</label>
                            <p></p>
                        </div>
                    </div>
                </section>

                <form class="complete-form" id="confirm-complete-form">
                    <div class="btns">
                        <button class="submit-btn complete-btn" onclick="arrivedCustomer(event)">
                            <i class="bi bi-check-lg"></i>
                            <span>Xác nhận khách đã đến</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>