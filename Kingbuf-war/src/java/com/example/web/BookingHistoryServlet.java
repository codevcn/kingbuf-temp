package com.example.web;

import com.example.dto.Booking;
import com.example.dto.ErrorResponse;
import com.example.dto.ReservationRequest;
import com.example.ejb.BookingHistoryService;
import com.example.ejb.ReservationService;
import java.io.BufferedReader;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

@WebServlet("/booking-history")
public class BookingHistoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private ReservationService reservationService;
    @EJB
    private BookingHistoryService bookingHistoryService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("admin");

        if (isAdmin == null) {
            isAdmin = false;
        }

        try {
            List<Booking> bookings = this.bookingHistoryService.getReservationsByUserInfo();
            request.setAttribute("isAdmin", isAdmin);
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("/WEB-INF/bookings-history/bookings-history-page.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            request.setAttribute("isAdmin", isAdmin);
            request.setAttribute("bookings", new ArrayList());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            request.getRequestDispatcher("/WEB-INF/bookings-history/bookings-history-page.jsp")
                    .forward(request, response);
        }

    }

}
