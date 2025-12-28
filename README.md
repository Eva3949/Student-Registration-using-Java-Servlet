# Student-Registration-using-Java-Servlet
Student Registration System  A modern, attractive, and responsive Student Registration System built with Java (Jakarta EE), JSP, and MySQL. Featuring a Glassmorphism UI, real-time analytics with Chart.js, and student management capabilities.

## Features

- **Modern Glassmorphism UI**: Beautiful, academic-themed design with motion graphics and animations.
- **Student Registration**: Simple and secure enrollment process with duplicate email validation.
- **Student Directory**: View all registered students in a clean, searchable table.
- **Real-time Analytics**: Visual representation of student distribution by academic year using a doughnut chart.
- **Search & Filter**: Quickly find students by name or email.
- **Responsive Design**: Optimized for both desktop and mobile devices.

## Tech Stack

- **Backend**: Java 17, Jakarta Servlet API, Jakarta Server Pages (JSP)
- **Database**: MySQL 8.x
- **Frontend**: HTML5, CSS3 (Modern Flexbox/Grid), JavaScript (ES6+)
- **Libraries**: 
  - [Chart.js](https://www.chartjs.org/) for data visualization
  - [Font Awesome](https://fontawesome.com/) for iconography
  - [Google Fonts (Poppins)](https://fonts.google.com/) for typography

## Prerequisites

Before you begin, ensure you have the following installed:
- [Java Development Kit (JDK) 17 or higher](https://www.oracle.com/java/technologies/downloads/)
- [Apache Maven](https://maven.apache.org/download.cgi)
- [MySQL Server](https://dev.mysql.com/downloads/installer/)
- A Servlet Container like [Apache Tomcat 10+](https://tomcat.apache.org/download-10.cgi)

## Configuration & Setup

### 1. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench or phpMyAdmin).
2. Create a new database named `student_registration`.
3. Import the provided SQL schema:
   - File: `student_registration.sql`
   - This will create the `students` table and populate it with initial data.

### 2. Project Configuration
1. Open `src/main/java/com/example/student/db/Db.java`.
2. Update the database credentials to match your local setup:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/student_registration";
   private static final String USER = "your_username"; // Default is "root"
   private static final String PASS = "your_password"; // Default is ""
   ```

### 3. Build the Project
Use Maven to build the project and generate the WAR file:
```bash
mvn clean install
```
The generated WAR file `student-registration.war` will be located in the `target/` directory.

### 4. Deployment
1. Copy the `student-registration.war` file.
2. Paste it into the `webapps` folder of your Tomcat installation.
3. Start (or restart) the Tomcat server.
4. Access the application at: `http://localhost:8080/student-registration/`

## Project Structure

- `src/main/java`: Java source files (Servlets, Models, Repositories).
- `src/main/webapp`: JSP files and web configuration.
- `src/main/webapp/assets`: CSS styles and static assets.
- `student_registration.sql`: Database schema and initial data.
- `pom.xml`: Maven configuration and dependencies.

## Author

Samuel Tenkir
