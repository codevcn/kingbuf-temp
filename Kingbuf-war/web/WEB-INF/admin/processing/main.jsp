
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>

<main id="main-section">
    <section id="booking-details">
        <h3 class="top-title">Chi tiết đơn</h3>

        <section class="details">
            <h3 class="booking-id">
                Đơn #<span>${booking.ReservationID}</span> -
                <c:choose>
                    <c:when test="${booking.Status eq 'Pending'}">
                        <span class="status pending" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Đơn hiện chưa được xử lý">Chưa được xử lý</span>
                    </c:when>
                    <c:when test="${booking.Status eq 'Approved'}">
                        <span class="status approved" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Đơn đã được xử lý">Đã duyệt</span>
                    </c:when>
                    <c:when test="${booking.Status eq 'Completed'}">
                        <span class="status arrived" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Khách đã đến">Khách đã đến</span>
                    </c:when>
                    <c:when test="${booking.Status eq 'Arrived'}">
                        <span class="status completed" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Đơn đã được xử lý">Đã hoàn thành</span>
                    </c:when>
                    <c:when test="${booking.Status eq 'Cancelled'}">
                        <span class="status cancelled" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Đơn đã bị hủy">Đã hủy</span>
                    </c:when>
                    <c:otherwise>
                        <span class="status rejected" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Đơn đã bị từ chối">Đã từ chối</span>
                    </c:otherwise>
                </c:choose>
            </h3>

            <form id="update-booking-form" data-kb-booking-id="${booking.ReservationID}">
                <div class="form-groups">
                    <div class="form-group full-name">
                        <label for="fullname-input">Họ và tên người đặt</label>
                        <input value="${booking.Cus_FullName}" id="fullname-input" name="full-name" <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>
                        <div class="message"></div>
                    </div>
                    <div class="form-group phone">
                        <label for="phone-input">Số điện thoại người đặt</label>
                        <input value="${booking.Cus_Phone}" id="phone-input" name="phone" disabled>
                        <div class="message"></div>
                    </div>
                    <div class="form-group date">
                        <label for="date-input">Ngày đến</label>
                        <!-- Sử dụng JSTL để định dạng ngày -->
                        <input type="date" id="date-input" name="date" 
                               value="${booking.arrivalTime}" 
                        <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>
                        <div class="message"></div>
                    </div>
                    <div class="form-group time">
                        <label for="time-input">Giờ đến</label>
                        <!-- Sử dụng JSTL để định dạng giờ -->
                        <input type="time" id="time-input" name="time" 
                               value="${booking.arrivalTime}" 
                        <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>
                        <div class="message"></div>
                    </div>
                    <div class="form-group note">
                        <label for="note-input">Ghi chú</label>
                        <textarea rows="5" id="note-input" name="note" <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>${booking.Note}</textarea>
                        <div class="message"></div>
                    </div>
                    <div class="form-group created-at">
                        <label>Ngày tạo đơn</label>
                        <p>${booking.CreatedAt}</p>
                    </div>
                    <div class="form-group adults-count">
                        <label for="adults-count-input">Số người lớn</label>
                        <input value="${booking.NumAdults}" id="adults-count-input" name="adults-count" <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>
                        <div class="message"></div>
                    </div>
                    <div class="form-group children-count">
                        <label for="children-count-input">Số trẻ em</label>
                        <input value="${booking.NumChildren}" id="children-count-input" name="children-count" <c:if test="${booking.Status == 'Completed'}">disabled</c:if>>
                        <div class="message"></div>
                    </div>
                    <div class="form-group status">
                        <label>Trạng thái</label>
                        <p>
                        <c:choose>
                            <c:when test="${booking.Status == 'Pending'}">Chưa được xử lý</c:when>
                            <c:when test="${booking.Status == 'Approved'}">Đã duyệt</c:when>
                            <c:when test="${booking.Status == 'Cancelled'}">Đã hủy</c:when>
                            <c:when test="${booking.Status == 'Completed'}">Đã hoàn thành</c:when>
                            <c:otherwise>Đã từ chối</c:otherwise>
                        </c:choose>
                        </p>
                    </div>
                </div>
                <div class="form-group assigned-tables">
                    <label>Các bàn đã gán</label>
                    <div class="table-tags">
                        <c:forEach var="table" items="${assignedTables}">
                            <button type="button" class="btn table-tag assigned" data-kb-table-id="${table.TableID}">
                                ${table.TableName}
                                <i class="fa-solid fa-xmark remove-assigned-table-btn"></i>
                            </button>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group available-tables">
                    <label>Các bàn trống</label>
                    <div class="table-tags">
                        <c:forEach var="table" items="${availableTables}">
                            <button type="button" class="btn table-tag available" data-kb-table-id="${table.TableID}">
                                ${table.TableName}
                                <i class="fa-solid fa-plus add-available-table-btn"></i>
                            </button>
                        </c:forEach>
                    </div>
                </div>
            </form>

            <c:if test="${booking.Status == 'Approved'}">
                <section id="update-assign-tables" data-kb-tab-type="update-assign-tables">
                    <div class="update-assign-tables-title">
                        <i class="bi bi-list-columns"></i>
                        <span>Cập nhật danh sách bàn</span>
                    </div>

                    <c:if test="${not empty emptyTables and emptyTables.size() > 0}">
                        <form id="filter-tables-form" class="filter-tables-form">
                            <div class="form-groups">
                                <div class="form-group date">
                                    <label for="filter-tables-date-input">Ngày phục vụ</label>
                                    <input type="date" id="filter-tables-date-input" name="date" value="${date}" disabled>
                                    <div class="message"></div>
                                </div>
                                <div class="form-group time">
                                    <label for="filter-tables-time-input">Giờ phục vụ</label>
                                    <input type="time" id="filter-tables-time-input" name="time" value="${time}" disabled>
                                    <div class="message"></div>
                                </div>
                                <div class="form-group capacity">
                                    <label for="filter-capacity-input">Sức chứa</label>
                                    <input type="number" id="filter-capacity-input" name="capacity">
                                    <div class="message"></div>
                                </div>
                                <div class="form-group location">
                                    <label>Vị trí</label>
                                    <input type="text" id="filter-location-input" name="location" hidden>
                                    <div class="dropdown" id="filter-location-select">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            Chọn vị trí
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="loca" items="${locations}">
                                                <li>
                                                    <div class="dropdown-item" data-kb-location-status="${loca}">${loca}</div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="btns">
                                <button class="submit-btn">
                                    <i class="bi bi-check-lg"></i>
                                    <span>Áp dụng bộ lọc</span>
                                </button>
                            </div>
                        </form>

                        <div class="restaurant-tables">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Số hiệu</th>
                                        <th>Sức chứa (người)</th>
                                        <th>Vị trí</th>
                                        <th>Trạng thái</th>
                                        <th>Chọn bàn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="table" items="${emptyTables}">
                                    <tr class="${table.Status == 'Maintenance' ? 'maintained' : ''}">
                                        <td>${table.TableNumber}</td>
                                        <td>${table.Capacity}</td>
                                        <td>${table.Location}</td>
                                    <c:if test="${table.Status == 'Maintenance'}">
                                        <td>Đang bảo trì</td>
                                    </c:if>
                                    <c:if test="${table.Status != 'Maintenance'}">
                                        <td>Còn trống</td>
                                    </c:if>
                                    <c:if test="${table.Status != 'Maintenance'}">
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" ${booking.TablesList.contains(table.TableNumber) ? 'checked' : ''} type="checkbox" value="${table.TableID}" id="table-pick-id-${table.TableID}">
                                            </div>
                                        </td>
                                    </c:if>
                                    <c:if test="${table.Status == 'Maintenance'}">
                                        <td></td>
                                    </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="confirm-assign-tables complete-processing">
                                <button type="button" class="update-assign-tables-submit-btn" onclick="approveBooking(this)">
                                    <i class="bi bi-check-all"></i>
                                    <span>Xác nhận cập nhật bàn</span>
                                </button>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty emptyTables or emptyTables.size() == 0}">
                        <section class="empty-result">
                            <p class="empty-content">
                                <i class="bi bi-exclamation-circle"></i>
                                <span>Không có bàn trống trong vòng 12 giờ.</span>
                            </p>
                        </section>
                    </c:if>
                </section>
            </c:if>

        </section>
    </section>

    <section id="booking-processing">
        <h3 class="top-title">Xử lý đơn</h3>

        <c:choose>
            <c:when test="${booking.Status == 'Approved' || booking.Status == 'Completed'}">
                <section class="processed-booking">
                    <c:if test="${not empty booking.TablesList}">
                        <c:choose>
                            <c:when test="${booking.Status == 'Approved'}">
                                <div class="notice approved">
                                    <i class="bi bi-check2-circle"></i>
                                    <span>Đơn đã được xử lý</span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="notice completed">
                                    <i class="bi bi-clipboard2-check"></i>
                                    <span>Đơn đã hoàn thành</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="form-group">
                            <label>Danh sách bàn được gán cho đơn</label>
                            <p>
                            <c:forEach var="table" items="${booking.TablesList}" varStatus="status">
                                <span>${table.TableNumber}<c:if test="${status.index < booking.TablesList.size() - 1}">,</c:if></span>
                            </c:forEach>
                            </p>
                        </div>
                    </c:if>
                </section>
            </c:when>

            <c:when test="${booking.Status == 'Rejected'}">
                <section class="processed-booking">
                    <c:if test="${not empty booking.Reason}">
                        <div class="notice rejected">
                            <i class="bi bi-x-lg"></i>
                            <span>Đơn đã bị từ chối</span>
                        </div>
                        <div class="form-group">
                            <label>Lý do từ chối đơn</label>
                            <p>
                                ${booking.Reason}
                            </p>
                        </div>
                    </c:if>
                </section>
            </c:when>

            <c:when test="${booking.Status == 'Cancelled'}">
                <section class="processed-booking">
                    <c:if test="${not empty booking.Reason}">
                        <div class="notice cancelled">
                            <i class="bi bi-trash"></i>
                            <span>Đơn đã bị hủy</span>
                        </div>
                        <div class="form-group">
                            <label>Lý do hủy đơn</label>
                            <p>
                                ${booking.Reason}
                            </p>
                        </div>
                    </c:if>
                </section>
            </c:when>

            <c:otherwise>
                <section class="processing">
                    <ul class="nav nav-tabs">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="cancel-tab" data-bs-toggle="tab" data-bs-target="#cancel-tab-pane" type="button" role="tab">
                                <i class="bi bi-x-lg"></i>
                                <span>Hủy đơn</span>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="approve-tab" data-bs-toggle="tab" data-bs-target="#approve-tab-pane" type="button" role="tab">
                                <i class="bi bi-check-circle-fill"></i>
                                <span>Duyệt đơn</span>
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade" id="cancel-tab-pane" role="tabpanel" tabindex="0" data-kb-tab-type="cancel">
                            <form class="cancel-form">
                                <div class="form-group">
                                    <label for="cancel-reject-input">Lý do hủy đơn</label>
                                    <textarea id="cancel-booking-input" rows="3" placeholder="Nhập lý do hủy đơn ở đây..."></textarea>
                                </div>
                            </form>

                            <section hidden class="processing-result">
                                <div class="result-title">
                                    <i class="bi bi-exclamation-triangle-fill"></i>
                                    <span>Xử lý đơn thất bại</span>
                                </div>
                                <p class="result-message"></p>
                            </section>

                            <div class="complete-processing">
                                <span></span>
                                <button class="submit-btn">
                                    <i class="bi bi-check-all"></i>
                                    <span>Hoàn tất xử lý đơn</span>
                                </button>
                            </div>
                        </div>

                        <div class="tab-pane fade show active" id="approve-tab-pane" role="tabpanel" tabindex="0" data-kb-tab-type="approve">
                            <section id="approve-booking">
                                <label class="approve-booking-title">Danh sách bàn còn trống</label>

                                <c:if test="${not empty emptyTables}">
                                    <form id="filter-tables-form" action="" method="get">
                                        <div class="form-groups">
                                            <div class="form-group date">
                                                <label for="filter-tables-date-input">Ngày phục vụ</label>
                                                <input type="date" id="filter-tables-date-input" name="date" value="${date}" disabled>
                                                <div class="message"></div>
                                            </div>
                                            <div class="form-group time">
                                                <label for="filter-tables-time-input">Giờ phục vụ</label>
                                                <input type="time" id="filter-tables-time-input" name="time" value="${time}" disabled>
                                                <div class="message"></div>
                                            </div>
                                            <div class="form-group capacity">
                                                <label for="filter-capacity-input">Sức chứa</label>
                                                <input type="number" id="filter-capacity-input" name="capacity">
                                                <div class="message"></div>
                                            </div>
                                            <div class="form-group location">
                                                <label>Vị trí</label>
                                                <input type="text" id="filter-location-input" name="location" hidden>
                                                <div class="dropdown" id="filter-location-select">
                                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                        Chọn vị trí
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <c:forEach var="loca" items="${localtions}">
                                                            <li>
                                                                <div class="dropdown-item" data-kb-location-status="${loca}">${loca}</div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="btns">
                                            <button class="submit-btn">
                                                <i class="bi bi-check-lg"></i>
                                                <span>Áp dụng bộ lọc</span>
                                            </button>
                                        </div>
                                    </form>

                                    <section class="summary">
                                        <p>
                                            <i class="bi bi-card-text"></i>
                                            <span>Tổng cộng: <span>${emptyTables != null ? emptyTables.length : 0}</span> bàn còn trống trong vòng 12 giờ.</span>
                                        </p>
                                    </section>

                                    <div class="restaurant-tables">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Số hiệu</th>
                                                    <th>Sức chứa (người)</th>
                                                    <th>Vị trí</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chọn bàn</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="table" items="${emptyTables}">
                                                <tr class="${table.Status == 'Maintenance' ? 'maintained' : ''}">
                                                    <td>${table.TableNumber}</td>
                                                    <td>${table.Capacity}</td>
                                                    <td>${table.Location}</td>
                                                    <td>${table.Status == 'Maintenance' ? 'Đang bảo trì' : 'Khả dụng'}</td>
                                                    <td>
                                                <c:if test="${table.Status != 'Maintenance'}">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="${table.TableID}" id="table-pick-id-${table.TableID}">
                                                    </div>
                                                </c:if>
                                                </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>

                                <c:if test="${emptyTables == null || emptyTables.isEmpty()}">
                                    <div class="empty-result">
                                        <p class="empty-content">
                                            <i class="bi bi-exclamation-circle"></i>
                                            <span>Không có bàn trống trong vòng 12 giờ.</span>
                                        </p>
                                    </div>
                                </c:if>
                            </section>

                            <section hidden class="processing-result">
                                <div class="result-title">
                                    <i class="bi bi-exclamation-triangle-fill"></i>
                                    <span>Xử lý đơn thất bại</span>
                                </div>
                                <p class="result-message"></p>
                            </section>

                            <c:if test="${not empty emptyTables}">
                                <div class="complete-processing">
                                    <span></span>
                                    <button class="submit-btn">
                                        <i class="bi bi-check-all"></i>
                                        <span>Hoàn tất xử lý đơn</span>
                                    </button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>
            </c:otherwise>
        </c:choose>
    </section>
</main>