<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main id="main-section">
    <section class="title-section">
        <h3>Tất cả các bàn của nhà hàng</h3>
    </section>

    <div class="top-actions">
        <button class="action" data-bs-toggle="modal" data-bs-target="#add-table-modal">
            <i class="bi bi-plus-lg"></i>
            <span>Thêm bàn mới</span>
        </button>
    </div>

    <div id="restaurant-tables">
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
                <c:forEach var="table" items="${tables}">
                    <c:set var="tableJSON" value="${table.toJson()}" />
                    <tr class="${table.status == 'Maintenance' ? 'maintained' : ''}">
                        <td>${table.tableNumber}</td>
                        <td>${table.capacity}</td>
                        <td>${table.location}</td>
                        <td>
                            <c:choose>
                                <c:when test="${table.status == 'Maintenance'}">
                                    Đang bảo trì
                                </c:when>
                                <c:otherwise>
                                    Khả dụng
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <div class="actions">
                                <button class="action delete" data-kb-table-id="${table.tableID}">Xóa bàn</button>
                                <button class="action update"
                                        data-kb-table-id="${table.tableID}"
                                        data-kb-table-data='${tableJSON}'>Cập nhật bàn</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<div class="modal fade" id="add-table-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thêm bàn mới</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="add-new-table-form">
                    <div class="form-groups">
                        <div class="form-group table-number">
                            <label for="add-table-table-number-input">Số hiệu bàn</label>
                            <input id="add-table-table-number-input" name="table-number" placeholder="Nhập số hiệu bàn, ví dụ: 1">
                            <div class="message" hidden></div>
                        </div>
                        <div class="form-group capacity">
                            <label for="add-table-capacity-input">Sức chứa</label>
                            <input id="add-table-capacity-input" name="capacity"  type="number"
                                   placeholder="Nhập sức chứa của bàn (số người)">
                            <div class="message" hidden></div>
                        </div>
                        <div class="form-group location">
                            <label for="add-table-location-input">Vị trí</label>
                            <input type="text" id="add-table-location-input" name="location"
                                   placeholder="Nhập vị trí của bàn, ví dụ: Sảnh VIP">
                            <div class="message" hidden></div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="submit-btn" id="add-table-button">
                            <i class="bi bi-check-lg"></i>
                            <span>Thêm bàn</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete-table-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Xóa bàn</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <section id="confirm-delete-section">
                    <p class="notice"></p>
                    <div class="btns">
                        <button class="submit-btn">
                            <i class="bi bi-trash"></i>
                            <span>Xác nhận xóa bàn</span>
                        </button>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="update-table-modal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Cập nhật bàn</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="update-table-form">
                    <div class="form-groups">
                        <input type="text" id="add-table-table-id-input" name="table-id" hidden>
                        <div class="form-group table-number">
                            <label for="update-table-table-number-input">Số hiệu bàn</label>
                            <input id="update-table-table-number-input" name="table-number" disabled placeholder="Nhập số hiệu bàn, ví dụ: 1">
                            <div class="message" hidden></div>
                        </div>
                        <div class="form-group capacity">
                            <label for="update-table-capacity-input">Sức chứa</label>
                            <input id="update-table-capacity-input" name="capacity"  type="number"
                                   placeholder="Nhập sức chứa của bàn (số người)">
                            <div class="message" hidden></div>
                        </div>
                        <div class="form-group location">
                            <label for="update-table-location-input">Vị trí</label>
                            <input type="text" id="update-table-location-input" name="location"
                                   placeholder="Nhập vị trí của bàn, ví dụ: Sảnh VIP">
                            <div class="message" hidden></div>
                        </div>
                        <div class="form-group status">
                            <label>Trạng thái</label>
                            <input type="text" id="update-table-status-input" name="status" hidden>
                            <div class="dropdown" id="table-status-select">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="dropdown-item" data-kb-table-status="Available">Còn trống</div>
                                    </li>
                                    <li>
                                        <div class="dropdown-item" data-kb-table-status="Maintenance">Bảo trì</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="submit-btn" id="update-table-button">
                            <i class="bi bi-check-lg"></i>
                            <span>Cập nhật bàn</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>