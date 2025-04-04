package com.example.ejb;

import com.example.dto.Booking;
import com.example.dto.ReservationDTO;
import com.example.dto.Table;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.*;
import java.util.regex.Pattern;
import com.example.entity.Reservation;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Stateless
public class BookingsService {

    @PersistenceContext(unitName = "KingbufPU")
    private EntityManager em;

    public List<Booking> getAllBookings() throws ParseException {

        // Định dạng ngày tháng
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.getDefault());
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

        // Tạo danh sách bàn
        List<Table> tables1 = new ArrayList<>();
        tables1.add(new Table(1, 1, 2, "Sảnh chính", "Maintenance"));
        tables1.add(new Table(5, 5, 8, "Sân thượng", "Reserved"));

        List<Table> tables2 = new ArrayList<>();
        tables2.add(new Table(3, 3, 6, "Sảnh 3", "Available"));

        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking(
                1,
                "Nguyễn Văn A",
                "0987654321",
                dateFormat.parse("2025/07/21 14:32:10"), // Arrival Time
                dateFormat.parse("2025/07/21 14:32:10"), // Created At
                2, // NumAdults
                1, // NumChildren
                "Yêu cầu bàn gần cửa sổ...",
                null,
                "Approved",
                tables1
        ));
        bookings.add(new Booking(
                2,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                null,
                "Pending",
                null
        ));
        bookings.add(new Booking(
                3,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                "Khách hàng đổi ý",
                "Rejected",
                null
        ));
        bookings.add(new Booking(
                4,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                null,
                "Arrived",
                tables1
        ));
        bookings.add(new Booking(
                5,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                null,
                "Completed",
                tables2
        ));
        bookings.add(new Booking(
                6,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                null,
                "Cancelled",
                null
        ));

        return bookings;
    }

    public Booking getOneBooking() throws ParseException {
        // Định dạng ngày tháng
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.getDefault());
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        
        List<Table> tables1 = new ArrayList<>();
        tables1.add(new Table(1, 1, 2, "Sảnh chính", "Maintenance"));
        tables1.add(new Table(5, 5, 8, "Sân thượng", "Reserved"));
        return new Booking(
                6,
                "Trần Thị B",
                "0988765432",
                dateFormat.parse("2025/07/22 16:00:00"),
                dateFormat.parse("2025/07/22 16:00:00"),
                4,
                2,
                "Yêu cầu món ăn hải sản tươi ngon...",
                null,
                "Approved",
                tables1);
    }
}
