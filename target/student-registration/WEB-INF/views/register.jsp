<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Student</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="academic-shape shape-1"></div>
<div class="academic-shape shape-2"></div>

<header class="hero-section">
    <div class="hero-content">
        <div class="hero-icon">
            <i class="fas fa-university"></i>
        </div>
        <h1 class="hero-title">Academic Gateway</h1>
        <p class="hero-subtitle">Welcome to the central student registration portal. Secure your academic future with our streamlined enrollment process.</p>
    </div>
</header>

<main class="main-content">
    <div class="container" style="max-width: 450px;">
        <div class="card">
            <h2>Student Registration</h2>
            <p class="subtitle">Enter student details to register</p>

            <% String error = (String) request.getAttribute("error"); 
               if(error != null) { %>
                <div class="alert error">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><%= error %></span>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <input type="text" name="name" placeholder="Student Name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" required>
                    <i class="fas fa-user"></i>
                </div>
                
                <div class="form-group">
                    <input type="email" name="email" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>
                
                <div class="form-group">
                    <input type="text" name="year" placeholder="Academic Year" value="<%= request.getAttribute("year") != null ? request.getAttribute("year") : "" %>" required>
                    <i class="fas fa-calendar-alt"></i>
                </div>

                <button type="submit">
                    <span>Register Student</span>
                    <i class="fas fa-arrow-right"></i>
                </button>
            </form>

            <div class="link-container">
                <a href="${pageContext.request.contextPath}/show_all">
                    <i class="fas fa-list"></i> View All Students
                </a>
            </div>
        </div>
    </div>
</main>

</body>
</html>
