package com.example.ejb;

import com.example.dto.ErrorResponse;
import com.example.dto.ReservationRequest;
import com.example.entity.Reservation;
import java.text.ParseException;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.Calendar;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Stateless
public class ReservationService {

    @PersistenceContext(unitName = "KingbufPU")
    private EntityManager entityManager;

    public Object reserve(ReservationRequest data) {
        System.out.print(">>> okkkkkkkk input:\n");
        try {
            // Kiểm tra tính hợp lệ của dữ liệu đầu vào
            if (data == null) {
                return new ErrorResponse(400, "Dữ liệu đầu vào không hợp lệ.");
            }

            String[] requiredFields = {"Cus_FullName", "Cus_Phone", "ArrivalTime", "NumAdults", "NumChildren"};
            for (String field : requiredFields) {
                String fieldValue = null;
                switch (field) {
                    case "Cus_FullName":
                        fieldValue = data.getCus_FullName();
                        break;
                    case "Cus_Phone":
                        fieldValue = data.getCus_Phone();
                        break;
                    case "ArrivalTime":
                        fieldValue = data.getArrivalTime();
                        break;
                    case "NumAdults":
                        fieldValue = String.valueOf(data.getNumAdults()); // Convert int to String
                        break;
                    case "NumChildren":
                        fieldValue = String.valueOf(data.getNumChildren()); // Convert int to String
                        break;
                }
                System.out.print(">>> field Value:\n");
                System.out.print(fieldValue);

                if (fieldValue == null || fieldValue.isEmpty()) {
                    return new ErrorResponse(400, "Thiếu thông tin: " + field);
                }
            }

            // Kiểm tra số điện thoại hợp lệ
            if (!validatePhoneNumber(data.getCus_Phone())) {
                return new ErrorResponse(400, "Số điện thoại không hợp lệ.");
            }

            // Kiểm tra và chuyển đổi NumAdults từ String sang int
            int numAdults;
            try {
                numAdults = Integer.parseInt(data.getNumAdults());
                if (numAdults < 1) {
                    return new ErrorResponse(400, "Số lượng người lớn phải lớn hơn hoặc bằng 1.");
                }
            } catch (NumberFormatException e) {
                return new ErrorResponse(400, "Số lượng người lớn phải là số hợp lệ.");
            }

            // Kiểm tra và chuyển đổi NumChildren từ String sang int
            int numChildren;
            try {
                numChildren = Integer.parseInt(data.getNumChildren());
                if (numChildren < 0) {
                    return new ErrorResponse(400, "Số lượng trẻ em phải lớn hơn hoặc bằng 0.");
                }
            } catch (NumberFormatException e) {
                return new ErrorResponse(400, "Số lượng trẻ em phải là số hợp lệ.");
            }

            // Chuyển đổi ArrivalTime thành đối tượng Date
            Date arrivalTime = parseDate(data.getArrivalTime());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(arrivalTime);
            calendar.add(Calendar.HOUR, -1);
            Date oneHourBefore = calendar.getTime();

            calendar.add(Calendar.HOUR, 2);
            Date oneHourAfter = calendar.getTime();

            // Kiểm tra đơn đặt chỗ trong khoảng thời gian ± 1 giờ
            String queryStr = "SELECT r FROM Reservation r WHERE r.cusPhone = :cusPhone "
                    + "AND r.arrivalTime BETWEEN :oneHourBefore AND :oneHourAfter";
            TypedQuery<Reservation> query = entityManager.createQuery(queryStr, Reservation.class);
            query.setParameter("cusPhone", data.getCus_Phone());
            query.setParameter("oneHourBefore", oneHourBefore);
            query.setParameter("oneHourAfter", oneHourAfter);

            List<Reservation> conflictingReservations = query.getResultList();

            if (!conflictingReservations.isEmpty()) {
                return new ErrorResponse(409, "Bạn chỉ có thể đặt chỗ cách nhau ít nhất 1 giờ.");
            }

            // Lưu thông tin đặt chỗ vào cơ sở dữ liệu
            Reservation reservation = new Reservation();
            reservation.setCusFullName(data.getCus_FullName());
            reservation.setCusPhone(data.getCus_Phone());
            reservation.setArrivalTime(arrivalTime);
            reservation.setNumAdults(numAdults); // Sử dụng giá trị đã chuyển đổi
            reservation.setNumChildren(numChildren); // Sử dụng giá trị đã chuyển đổi
            reservation.setNote(data.getNote());

            entityManager.persist(reservation);
            return reservation;

        } catch (Exception e) {
            e.printStackTrace();
            return new ErrorResponse(500, e.getMessage());
        }
    }

    // Chuyển chuỗi thành đối tượng Date
    private Date parseDate(String dateStr) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Kiểm tra số điện thoại hợp lệ (dùng biểu thức chính quy)
    private boolean validatePhoneNumber(String phone) {
        return phone != null && phone.matches("\\d{10,15}");
    }
}
