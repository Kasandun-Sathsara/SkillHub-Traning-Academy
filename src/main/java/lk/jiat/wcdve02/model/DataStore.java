package lk.jiat.wcdve02.model;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class DataStore {
    private final List<User> users = new ArrayList<>();
    private final List<Student> students = new ArrayList<>();
    private final List<Course> courses = new ArrayList<>();
    private final List<Trainer> trainers = new ArrayList<>();
    private final List<Enrollment> enrollments = new ArrayList<>();
    private final List<Attendance> attendances = new ArrayList<>();

    private final AtomicInteger studentIdGen = new AtomicInteger(1);
    private final AtomicInteger courseIdGen = new AtomicInteger(1);
    private final AtomicInteger trainerIdGen = new AtomicInteger(1);
    private final AtomicInteger enrollmentIdGen = new AtomicInteger(1);
    private final AtomicInteger attendanceIdGen = new AtomicInteger(1);

    public DataStore() {
        users.add(new User("admin", "1234", "ADMIN"));
    }

    public List<User> getUsers() { return users; }

    public List<Student> getStudents() { return students; }
    public int generateStudentId() { return studentIdGen.getAndIncrement(); }

    public List<Course> getCourses() { return courses; }
    public int generateCourseId() { return courseIdGen.getAndIncrement(); }

    public List<Trainer> getTrainers() { return trainers; }
    public int generateTrainerId() { return trainerIdGen.getAndIncrement(); }

    public List<Enrollment> getEnrollments() { return enrollments; }
    public int generateEnrollmentId() { return enrollmentIdGen.getAndIncrement(); }

    public List<Attendance> getAttendances() { return attendances; }
    public int generateAttendanceId() { return attendanceIdGen.getAndIncrement(); }
}
