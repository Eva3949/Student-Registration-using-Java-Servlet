package com.example.student.web;

import com.example.student.repo.StudentRepository;
import com.example.student.model.Student;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/show_all")
public class ShowAllServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students = StudentRepository.findAll();
        request.setAttribute("students", students);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/show_all.jsp");
        rd.forward(request, response);
    }
}
