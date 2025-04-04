package com.example.web;

import com.example.dto.ErrorResponse;
import com.example.dto.ReservationRequest;
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

@WebServlet("/booking-history")
public class BookingHistoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private ReservationService reservationService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("admin");

        if (isAdmin == null) {
            isAdmin = false;
        }

        request.setAttribute("isAdmin", isAdmin);
        request.getRequestDispatcher("/WEB-INF/bookings-history/bookings-history-page.jsp")
                .forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder jsonBody = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonBody.append(line);
                System.out.print(line);
            }
            ObjectMapper objectMapper = new ObjectMapper();
            System.out.print(">>> 1");
            System.out.print(jsonBody.toString());
            ReservationRequest reservationRequest = objectMapper.readValue(jsonBody.toString(), ReservationRequest.class);
            System.out.print(">>> 2");
            System.out.print(reservationRequest);
            Object result = this.reservationService.reserve(reservationRequest);

            // Kiểm tra kết quả trả về
            if (result instanceof ErrorResponse) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
                response.getWriter().write("{\"message\": " + ((ErrorResponse) result).getMessage());
            }

            // Trả về thành công
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"message\": \"success\"}");
        } catch (Exception e) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            response.getWriter().write("{\"message\": " + e.getMessage());
        }
    }
}
