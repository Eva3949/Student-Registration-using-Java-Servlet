package com.example.student.web;

import com.example.student.model.Student;
import com.example.student.repo.StudentRepository;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String year = request.getParameter("year");

        if (StudentRepository.existsByEmail(email)) {
            request.setAttribute("error", "This student is already registered with email: " + email);
            request.setAttribute("name", name);
            request.setAttribute("year", year);
            request.getRequestDispatcher("WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        Student student = new Student(name, email, year);
        StudentRepository.save(student);

        response.sendRedirect("show_all");
    }
}
