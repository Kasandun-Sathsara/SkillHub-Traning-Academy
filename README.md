# SkillHub Training Academy (WCD-VE-02)

SkillHub is a simple, in-memory Java Jakarta EE Web Application for managing a training academy's operations. This project implements a Model-View-Controller (MVC) architecture using Servlets for controllers and JSP (JavaServer Pages) for views.

## 🚀 Features

- **Authentication & Authorization**: Secure login system with an authentication filter (`AuthFilter`).
- **Dashboard**: A central view for quick navigation and overview.
- **Student Management**: Add, view, and manage student details.
- **Course Management**: Manage different courses offered by the institute.
- **Trainer Management**: Keep track of trainers/instructors.
- **Enrollments**: Enroll students into specific courses.
- **Attendance Tracking**: Mark and track daily attendance for enrolled students.

## 🛠️ Technologies Used

- **Backend**: Java 11, Jakarta EE 10 (Servlets, Filters, Listeners)
- **Frontend**: JSP (JavaServer Pages), HTML, CSS, JavaScript (Bootstrap 5 for styling)
- **Data Persistence**: In-Memory Data Store (using `java.util.List` and `AtomicInteger` for ID generation). *Note: Data is not saved permanently and resets on server restart.*
- **Build Tool**: Maven (Wrapper included)
- **Packaging**: WAR (Web Application Archive)

## 📁 Project Structure

```text
Skillhub_training_academy/
├── .mvn/                  # Maven wrapper config
├── src/
│   └── main/
│       ├── java/lk/jiat/wcdve02/
│       │   ├── config/       # Application configuration (Listeners, Filters)
│       │   ├── controller/   # Servlets handling HTTP requests
│       │   └── model/        # POJOs and In-Memory DataStore
│       └── webapp/
│           ├── WEB-INF/      # Secure components
│           ├── css/          # Stylesheets
│           ├── js/           # JavaScript assets
│           └── *.jsp         # JSP views (login, dashboard, etc.)
├── pom.xml                # Maven configuration
├── mvnw                   # Maven wrapper for Linux/Mac
├── mvnw.cmd               # Maven wrapper for Windows
└── README.md              # Project documentation
```

## ⚙️ Getting Started

### Prerequisites
- JDK 11 or higher
- Apache Tomcat (version 10+ recommended for Jakarta EE 10 support) or a similar servlet container

### Installation & Execution

1. **Clone the repository:**
   ```bash
   git clone <your-repository-url>
   cd Skillhub_traning_academy
   ```

2. **Build the project using Maven Wrapper:**
   - On Windows:
     ```cmd
     mvnw.cmd clean package
     ```
   - On Linux/Mac:
     ```bash
     ./mvnw clean package
     ```

3. **Deploy to Tomcat:**
   - The build process will generate a `.war` file in the `target/` directory (e.g., `target/WCD-VE-02-1.0-SNAPSHOT.war`).
   - Copy this `.war` file to your Tomcat `webapps/` directory.
   - Start your Tomcat server.

4. **Access the application:**
   - Open your browser and navigate to `http://localhost:8080/WCD-VE-02-1.0-SNAPSHOT` (or whichever context path you configured).
   
### 🔐 Default Credentials
- **Username:** `admin`
- **Password:** `1234`

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page if you want to contribute.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.
