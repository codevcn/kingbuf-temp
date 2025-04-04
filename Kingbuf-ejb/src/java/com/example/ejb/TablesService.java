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
public class TablesService {

    @PersistenceContext(unitName = "KingbufPU")
    private EntityManager em;

    public List<Table> getAllTables() {
        // Tạo danh sách bàn
        List<Table> tables = new ArrayList<>();
        tables.add(new Table(1, 1, 2, "Sảnh chính", "Maintenance"));
        tables.add(new Table(2, 2, 4, "Sảnh 1", "Available"));
        tables.add(new Table(3, 3, 6, "Sảnh 3", "Available"));
        tables.add(new Table(4, 4, 2, "Ban công", "Available"));
        tables.add(new Table(5, 5, 8, "Sân thượng", "Maintenance"));

        return tables;
    }
}

