package com.example.ejb;

import com.example.dto.ReservationDTO;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.*;
import java.util.regex.Pattern;
import com.example.entity.Reservation;

@Stateless
public class BookingHistoryService {

    @PersistenceContext(unitName = "KingbufPU")
    private EntityManager em;

//    public Object getReservationsByUserInfo(Map<String, String> data) {
//        // Kiểm tra dữ liệu đầu vào
//        if (data == null || data.isEmpty()) {
//            return new ErrorResponse(400, "Dữ liệu đầu vào không hợp lệ.");
//        }
//
//        // Danh sách các trường bắt buộc
//        String[] requiredFields = {"Cus_FullName", "Cus_Phone"};
//        Map<String, String> errorText = new HashMap<>();
//        errorText.put("Cus_FullName", "Họ và tên");
//        errorText.put("Cus_Phone", "Số điện thoại");
//
//        // Kiểm tra từng trường
//        for (String field : requiredFields) {
//            if (!data.containsKey(field) || data.get(field) == null || data.get(field).trim().isEmpty()) {
//                return new ErrorResponse(400, "Thiếu thông tin: " + errorText.get(field));
//            }
//        }
//
//        // Kiểm tra số điện thoại
//        if (!validatePhoneNumber(data.get("Cus_Phone"))) {
//            return new ErrorResponse(400, "Số điện thoại không hợp lệ.");
//        }
//
//        try {
//            // Truy vấn JPA
//            TypedQuery<Reservation> query = em.createQuery(
//                "SELECT r FROM Reservation r JOIN FETCH r.reservationTables rt JOIN FETCH rt.diningTable dt " +
//                "WHERE r.cusPhone = :cusPhone AND r.cusFullName = :cusFullName",
//                Reservation.class
//            );
//            query.setParameter("cusPhone", data.get("Cus_Phone"));
//            query.setParameter("cusFullName", data.get("Cus_FullName"));
//
//            List<Reservation> reservations = query.getResultList();
//
//            // Chuyển đổi sang DTO
//            Map<Integer, ReservationDTO> reservationMap = new HashMap<>();
//            for (Reservation reservation : reservations) {
//                ReservationDTO dto = reservationMap.computeIfAbsent((int)reservation.getReservationID(), k -> {
//                    ReservationDTO newDto = new ReservationDTO();
//                    newDto.setReservationID(reservation.getReservationID());
//                    newDto.setCusFullName(reservation.getCusFullName());
//                    newDto.setCusPhone(reservation.getCusPhone());
//                    newDto.setArrivalTime(reservation.getArrivalTime());
//                    newDto.setCreatedAt(reservation.getCreatedAt());
//                    newDto.setNumAdults(reservation.getNumAdults());
//                    newDto.setNumChildren(reservation.getNumChildren());
//                    newDto.setNote(reservation.getNote());
//                    newDto.setStatus(reservation.getStatus().name());
//                    newDto.setTablesList(new ArrayList<>());
//                    return newDto;
//                });
//
//                if (reservation.getReservationTables() != null) {
//                    for (ReservationTable rt : reservation.getReservationTables()) {
//                        if (rt.getDiningTable() != null && rt.getDiningTable().getTableNumber() != null) {
//                            dto.getTablesList().add(new ReservationDTO.TableDTO(rt.getDiningTable().getTableNumber()));
//                        }
//                    }
//                }
//            }
//
//            return new ArrayList<>(reservationMap.values());
//        } catch (Exception e) {
//            return new ErrorResponse(500, e.getMessage());
//        }
//    }

    private boolean validatePhoneNumber(String phone) {
        // Giả định kiểm tra số điện thoại (10-11 chữ số, bắt đầu bằng 0)
        return Pattern.matches("0[0-9]{9,10}", phone);
    }

    // Lớp nội bộ để trả về lỗi
    public static class ErrorResponse {
        private int errorCode;
        private String message;

        public ErrorResponse(int errorCode, String message) {
            this.errorCode = errorCode;
            this.message = message;
        }

        public int getErrorCode() { return errorCode; }
        public String getMessage() { return message; }
    }
}