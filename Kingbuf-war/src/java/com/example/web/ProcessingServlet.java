package com.example.web;

import com.example.dto.Booking;
import com.example.dto.ErrorResponse;
import com.example.dto.ReservationRequest;
import com.example.ejb.BookingsService;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/processing/*")
public class ProcessingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @EJB
    private BookingsService bookingsService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("admin");

        if (isAdmin == null) {
            isAdmin = false;
        }
        
        try {
            Booking booking = this.bookingsService.getOneBooking();
            request.setAttribute("isAdmin", true);
            request.setAttribute("booking", booking);
            request.getRequestDispatcher("/WEB-INF/admin/processing/processing-page.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            request.setAttribute("isAdmin", isAdmin);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            request.getRequestDispatcher("/WEB-INF/admin/processing/processing-page.jsp")
                    .forward(request, response);
        }
    }
}
