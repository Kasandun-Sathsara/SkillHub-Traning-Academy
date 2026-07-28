package lk.jiat.wcdve02.model;

import java.time.LocalDate;

public class Attendance {
    private int id;
    private Student student;
    private Course course;
    private LocalDate date;
    private boolean present;

    public Attendance() {}

    public Attendance(int id, Student student, Course course, LocalDate date, boolean present) {
        this.id = id;
        this.student = student;
        this.course = course;
        this.date = date;
        this.present = present;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }

    public Course getCourse() { return course; }
    public void setCourse(Course course) { this.course = course; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public boolean isPresent() { return present; }
    public void setPresent(boolean present) { this.present = present; }
}
