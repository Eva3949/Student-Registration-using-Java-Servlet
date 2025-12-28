package com.example.student.repo;

import com.example.student.db.Db;
import com.example.student.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository {

    public static void save(Student student) {
        try {
            Connection con = Db.getConnection();
            String sql = "INSERT INTO students(name,email,year) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getYear());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean existsByEmail(String email) {
        boolean exists = false;
        try {
            Connection con = Db.getConnection();
            String sql = "SELECT COUNT(*) FROM students WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    public static List<Student> findAll() {
        List<Student> list = new ArrayList<>();

        try {
            Connection con = Db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                list.add(new Student(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("year")
                ));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
