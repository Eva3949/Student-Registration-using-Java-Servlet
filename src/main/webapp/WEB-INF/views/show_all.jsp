<%@ page import="java.util.*,com.example.student.model.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    int totalStudents = (students != null) ? students.size() : 0;
    Map<String, Integer> yearCounts = new HashMap<>();
    if (students != null) {
        for (Student s : students) {
            yearCounts.put(s.getYear(), yearCounts.getOrDefault(s.getYear(), 0) + 1);
        }
    }
    
    // Convert map to JS arrays
    StringBuilder labels = new StringBuilder("[");
    StringBuilder data = new StringBuilder("[");
    for (Map.Entry<String, Integer> entry : yearCounts.entrySet()) {
        labels.append("'").append(entry.getKey()).append("',");
        data.append(entry.getValue()).append(",");
    }
    if (!yearCounts.isEmpty()) {
        labels.deleteCharAt(labels.length() - 1);
        data.deleteCharAt(data.length() - 1);
    }
    labels.append("]");
    data.append("]");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Students</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="academic-shape shape-1"></div>
<div class="academic-shape shape-2"></div>

<header class="hero-section">
    <div class="hero-content">
        <div class="hero-icon">
            <i class="fas fa-graduation-cap"></i>
        </div>
        <h1 class="hero-title">Student Directory</h1>
        <p class="hero-subtitle">Comprehensive overview of our academic community. Monitor enrollment trends and manage student records in real-time.</p>
    </div>
</header>

<main class="main-content">
    <div class="container" style="max-width: 1100px;">
        <div class="dashboard-grid">
            <!-- Analysis Chart Section -->
            <div class="card chart-card">
                <h3><i class="fas fa-chart-pie"></i> Enrollment Analysis</h3>
                <div class="total-stats">
                    <span class="total-count"><%= totalStudents %></span>
                    <span class="total-label">Total Students</span>
                </div>
                <p class="subtitle">Distribution by Academic Year</p>
                <div class="chart-container-inner">
                    <canvas id="studentChart"></canvas>
                </div>
            </div>

            <!-- Student List Section -->
            <div class="card wide">
                <h2>Registered Students</h2>
                <p class="subtitle">A list of all students currently in the system</p>

                <div class="search-container">
                    <div class="search-wrapper">
                        <i class="fas fa-search"></i>
                        <input type="text" id="studentSearch" placeholder="Filter by name or email..." onkeyup="filterStudents()">
                    </div>
                </div>

                <div class="table-container">
                    <table id="studentTable">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user"></i> Name</th>
                                <th><i class="fas fa-envelope"></i> Email</th>
                                <th><i class="fas fa-calendar-alt"></i> Year</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (students != null && !students.isEmpty()) {
                                    students.sort(Comparator.comparing(Student::getName));
                                    for (Student s : students) {
                            %>
                            <tr>
                                <td><%= s.getName() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getYear() %></td>
                            </tr>
                            <% 
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3" style="text-align: center; color: var(--text-muted);">No students registered yet.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <div class="link-container">
                    <a href="<%= request.getContextPath() %>">
                        <i class="fas fa-plus-circle"></i> Add New Student
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    function filterStudents() {
        const input = document.getElementById('studentSearch');
        const filter = input.value.toLowerCase();
        const table = document.getElementById('studentTable');
        const tr = table.getElementsByTagName('tr');

        for (let i = 1; i < tr.length; i++) {
            const tdName = tr[i].getElementsByTagName('td')[0];
            const tdEmail = tr[i].getElementsByTagName('td')[1];
            if (tdName || tdEmail) {
                const nameValue = tdName.textContent || tdName.innerText;
                const emailValue = tdEmail.textContent || tdEmail.innerText;
                if (nameValue.toLowerCase().indexOf(filter) > -1 || emailValue.toLowerCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    const ctx = document.getElementById('studentChart').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: <%= labels.toString() %>,
            datasets: [{
                label: 'Students per Year',
                data: <%= data.toString() %>,
                backgroundColor: [
                    'rgba(26, 54, 93, 0.8)',
                    'rgba(236, 201, 75, 0.8)',
                    'rgba(45, 55, 72, 0.8)',
                    'rgba(74, 85, 104, 0.8)',
                    'rgba(160, 174, 192, 0.8)'
                ],
                borderColor: '#ffffff',
                borderWidth: 2,
                hoverOffset: 15
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        font: {
                            family: "'Poppins', sans-serif",
                            size: 12
                        },
                        padding: 20
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(26, 54, 93, 0.9)',
                    titleFont: { size: 14, family: "'Poppins', sans-serif" },
                    bodyFont: { size: 13, family: "'Poppins', sans-serif" },
                    padding: 12,
                    cornerRadius: 8
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true,
                duration: 2000,
                easing: 'easeOutQuart'
            }
        }
    });
</script>

</body>
</html>
