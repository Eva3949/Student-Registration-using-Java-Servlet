package com.example.student.model;

public class Student {

    private int id;
    private String name;
    private String email;
    private String year;

    public Student(String name, String email, String year) {
        this.name = name;
        this.email = email;
        this.year = year;
    }

    public Student(int id, String name, String email, String year) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.year = year;
    }

    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getYear() { return year; }
}
