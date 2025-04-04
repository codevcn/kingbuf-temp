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

@WebServlet("/admin/processing")
public class ProcessingServlet extends HttpServlet {

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
        request.getRequestDispatcher("/WEB-INF/admin/processing/processing-page.jsp")
                .forward(request, response);
    }
}
