<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main id="main-section">
    <section class="title-section">
        <h3>Tra cứu đơn đặt bàn</h3>
    </section>

    <form action="/bookings-history/" method="GET" class="search-form" id="search-form">
        <input type="number" id="phone-input" name="Cus_Phone" placeholder="Nhập số điện thoại của bạn... Ví dụ: 0123456789">
        <input type="text" id="name-input" name="Cus_FullName" placeholder="Nhập tên của bạn... Ví dụ: Nguyễn Văn A">
        <button type="submit" class="submit-btn">Tra cứu</button>
    </form>

    <section class="result-section">
        <c:choose>
            <c:when test="${not empty bookings}">
                <div class="booking-list">
                    <c:forEach var="booking" items="${bookings}">
                        <div class="booking-card">
                            <div class="card-title">
                                <h5>Đơn #<c:out value="${booking.ReservationID}" /></h5>
                                <c:choose>
                                    <c:when test="${booking.Status == 'Pending'}">
                                        <div class="status pending">Chưa được xử lý</div>
                                    </c:when>
                                    <c:when test="${booking.Status == 'Approved'}">
                                        <div class="status approved">Đã duyệt</div>
                                    </c:when>
                                    <c:when test="${booking.Status == 'Cancelled'}">
                                        <div class="status cancelled">Đã hủy</div>
                                    </c:when>
                                    <c:when test="${booking.Status == 'Arrived'}">
                                        <div class="status arrived">Khách đã đến</div>
                                    </c:when>
                                    <c:when test="${booking.Status == 'Completed'}">
                                        <div class="status completed">Đã hoàn thành</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="status rejected">Đã từ chối</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="card-info">
                                <p><strong>Họ tên:</strong> <c:out value="${booking.Cus_FullName}" /></p>
                                <p><strong>Số điện thoại:</strong> <c:out value="${booking.Cus_Phone}" /></p>
                                <p><strong>Thời gian đến:</strong> <c:out value="${booking.ArrivalTime}" /></p>
                                <p><strong>Người lớn:</strong> <c:out value="${booking.NumAdults}" />, <strong>Trẻ em:</strong> <c:out value="${booking.NumChildren}" /></p>
                                <p><strong>Ghi chú:</strong> <c:out value="${booking.Note != null ? booking.Note : 'Không có'}" /></p>
                                <p><strong>Ngày tạo đơn:</strong> <c:out value="${booking.CreatedAt}" /></p>
                            </div>
                            <c:if test="${booking.Reason != null}">
                                <div class="reason">
                                    <strong>Lý do:</strong> <c:out value="${booking.Reason}" />
                                </div>
                            </c:if>
                            <c:if test="${not empty booking.TablesList}">
                                <div class="tables-list">
                                    <span>Danh sách bàn:</span>
                                    <c:forEach var="table" items="${booking.TablesList}" varStatus="loop">
                                        <span><c:out value="${table.TableNumber}" /><c:if test="${not loop.last}">,</c:if></span>
                                    </c:forEach>
                                </div>
                            </c:if>
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