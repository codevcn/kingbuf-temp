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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/api/admin/login")
public class LoginServletAPI extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private ReservationService reservationService;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("admin");

        if (isAdmin == null) {
            isAdmin = false;
        }

        // Tạo đối tượng JSON phản hồi
        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("message", "Đăng nhập thành công");
        jsonResponse.put("admin", isAdmin);

        // Thiết lập response là JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Ghi JSON vào response
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.writeValue(response.getWriter(), jsonResponse);
    }
    
}
