<?php
session_start();

require('includes/html_form.class.php');

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

// Logout functionality
if(isset($_GET['logout'])) {
    $_SESSION = array();
    session_destroy();
    header("location: login.php");
    exit;
}

// Get current month and year
$currentMonth = date('n'); // Numeric representation of month (1-12)
$currentYear = date('Y');  // 4-digit year

// arrays for select list demos
$cryptos = array('XMR', 'BTC', 'STORJ', 'XRP', 'ETH', 'BCN', 'TNC');
$months = array(
    1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April',
    5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August',
    9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
); 

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CryptoPredict - Advanced Cryptocurrency Forecasting</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Global Styles */
        :root {
            --primary-color: #44365b;
            --secondary-color: #a282af;
            --accent-color: #4776E6;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --font-main: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: var(--font-main);
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }
        
        a {
            text-decoration: none;
            color: var(--primary-color);
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .btn {
            display: inline-block;
            background: var(--primary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .btn-outline {
            background: transparent;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-outline:hover {
            background: var(--primary-color);
            color: white;
        }
        
        /* Header Styles */
        header {
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 10px;
            color: var(--accent-color);
        }
        
        .nav-links {
            display: flex;
            list-style: none;
        }
        
        .nav-links li {
            margin-left: 30px;
        }
        
        .nav-links a {
            color: var(--dark-color);
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-links a:hover {
            color: var(--primary-color);
        }
        
        .menu-toggle {
            display: none;
            cursor: pointer;
            font-size: 24px;
        }
        
        /* Hero Section */
        .hero {
            background: url('pics/img1.jpg') no-repeat center center/cover, linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 150px 0 100px;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 1px 1px 0 #44365b, -1px -1px 0 #44365b, 1px -1px 0 #44365b, -1px 1px 0 #44365b;
        }
        
        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
            text-shadow: 1px 1px 0 #44365b, -1px -1px 0 #44365b, 1px -1px 0 #44365b, -1px 1px 0 #44365b;
        }
        
        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }
        
        .hero-buttons .btn {
            padding: 12px 30px;
        }
        
        .hero-buttons .btn-outline {
            border-color: white;
            color: white;
        }
        
        .hero-buttons .btn-outline:hover {
            background: white;
            color: var(--primary-color);
        }
        
        /* Login Form Section */
        .login-section {
            padding: 80px 0;
            background: white;
        }
        
        .login-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--dark-color);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .login-btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
        }
        
        .social-login {
            margin-top: 30px;
            text-align: center;
        }
        
        .social-login p {
            margin-bottom: 15px;
            position: relative;
        }
        
        .social-login p::before,
        .social-login p::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background: #ddd;
        }
        
        .social-login p::before {
            left: 0;
        }
        
        .social-login p::after {
            right: 0;
        }
        
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            transition: transform 0.3s;
        }
        
        .social-icon:hover {
            transform: translateY(-3px);
        }
        
        .facebook {
            background: #3b5998;
        }
        
        .twitter {
            background: #1da1f2;
        }
        
        .google {
            background: #db4437;
        }
        
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
        
        /* Features Section */
        .features {
            padding: 80px 0;
            background: #f9f9f9;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark-color);
            margin-bottom: 15px;
        }
        
        .section-title p {
            color: #666;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--dark-color);
        }
        
        /* Testimonials */
        .testimonials {
            padding: 80px 0;
            background: white;
        }
        
        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .testimonial-card {
            background: #f9f9f9;
            padding: 30px;
            border-radius: 10px;
            position: relative;
        }
        
        .testimonial-card::before {
            content: """;
            font-size: 5rem;
            color: rgba(110, 72, 170, 0.1);
            position: absolute;
            top: 10px;
            left: 20px;
            line-height: 1;
        }
        
        .testimonial-content {
            margin-bottom: 20px;
            font-style: italic;
            color: #555;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
        }
        
        .author-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        
        .author-info h4 {
            font-size: 1.1rem;
            margin-bottom: 5px;
        }
        
        .author-info p {
            color: #777;
            font-size: 0.9rem;
        }
        
        /* Footer */
        footer {
            background: var(--dark-color);
            color: white;
            padding: 60px 0 20px;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .footer-column h3 {
            font-size: 1.2rem;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-column h3::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 2px;
            background: var(--primary-color);
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: #bbb;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #bbb;
            font-size: 0.9rem;
        }
        
        /* Responsive Styles */
        @media (max-width: 992px) {
            .hero h1 {
                font-size: 2.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }
            
            .nav-links {
                position: fixed;
                top: 80px;
                left: -100%;
                width: 100%;
                height: calc(100vh - 80px);
                background: white;
                flex-direction: column;
                align-items: center;
                padding: 40px 0;
                transition: left 0.3s;
            }
            
            .nav-links.active {
                left: 0;
            }
            
            .nav-links li {
                margin: 15px 0;
            }
            
            .hero {
                padding: 120px 0 80px;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .hero p {
                font-size: 1rem;
            }
            
            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .login-container {
                padding: 30px 20px;
            }
        }
        
        @media (max-width: 576px) {
            .hero h1 {
                font-size: 1.8rem;
            }
            
            .section-title h2 {
                font-size: 2rem;
            }
            
            .feature-card, .testimonial-card {
                padding: 20px;
            }
        }
 
<!-- new section -->
        /* Image Sections Styles */
        .image-section {
            padding: 80px 0;
            background: white;
        }

        .image-section.alternate {
            background: #f9f9f9;
        }

        .image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            align-items: center;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .image-content {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
        }

        .image-wrapper {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
        }

        .image-wrapper img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .image-wrapper img:hover {
            transform: scale(1.02);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .image-container {
                flex-direction: column;
            }
            
            .image-content, .image-wrapper {
                min-width: 100%;
            }
            
            .image-section .section-title {
                text-align: center;
            }
        }

        /* Visualization Styles */
        .visualization-section {
            padding: 80px 0;
            background: #f9f9f9;
        }

        .chart-container {
            position: relative;
            height: 400px;
            margin-bottom: 60px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .data-table {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: var(--primary-color);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .signal-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-weight: bold;
            font-size: 0.8em;
            color: white;
        }

        .signal-badge.buy {
            background-color: var(--success-color);
        }

        .signal-badge.sell {
            background-color: var(--danger-color);
        }

    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <i class="fas fa-chart-line"></i>
                    <span>CryptoPredict</span>
                </div>
                <ul class="nav-links">
                    <li><a href="welcome.php">Home</a></li>
                    <li><a href="analysis.php">Analysis</a></li>
                    <li><a href="report.php">Report</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="?logout=1">Logout</a></li>
                </ul>
                <div class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </div>
            </nav>
            <div class="welcome-message">
                <p align="right"><span>You're logged! Welcome <strong><?php echo $_SESSION["username"]; ?></strong>!</span></p><br>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <br>
            <h1>CryptoCurrency Predictions</h1>
            <p>AI-powered analyzes.</p>
        </div>
    </section>

    <!-- new section -->

    <!-- Visualization Section -->
<section class="visualization-section">
    <div class="container">
        <div class="section-title">
            <h2>STORJ Market Analysis</h2>
            <p>Real-time price data and predictions</p>
        </div>
        
        <div class="chart-container">
            <canvas id="priceChart"></canvas>
        </div>
        
        <div class="chart-container">
            <canvas id="signalChart"></canvas>
        </div>
        
        <div class="data-table">
            <h3>Recent Data Points</h3>
            <div class="table-responsive" id="dataTable"></div>
        </div>
    </div>
</section>

    <!-- old Sections -->

    <!-- Footer -->
    <section class="contact" id="contact">
        <div class="container">     
    <footer>    
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>CryptoPredict</h3>
                    <p>Advanced cryptocurrency prediction platform using artificial intelligence to help traders and investors make better decisions.</p>
                </div>
                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="#">Home</a></li>
                        <li><a href="#features">Features</a></li>
                        <li><a href="#testimonials">Testimonials</a></li>
                        <li><a href="#pricing">Pricing</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Legal</h3>
                    <ul class="footer-links">
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Disclaimer</a></li>
                        <li><a href="#">Risk Disclosure</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Contact Us</h3>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope"></i> support@cryptopredict.com</li>
                        <li><i class="fas fa-phone"></i> +359(0) 876 222-222</li>
                        <li><i class="fas fa-map-marker-alt"></i> 13 Wall Street, Blockchain City</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 CryptoPredict. All rights reserved.</p>
            </div>
        </div>
    </footer>
    </div>
    </section>

    <script>
        // Mobile menu toggle
        const menuToggle = document.querySelector('.menu-toggle');
        const navLinks = document.querySelector('.nav-links');
        
        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
        
        // Close menu when clicking on a link
        document.querySelectorAll('.nav-links a').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('active');
            });
        });
        
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                if (targetId === '#') return;
                
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 80,
                        behavior: 'smooth'
                    });
                }
            });
        });
        
        // Form submission
        const loginForm = document.querySelector('.login-container form');
        if (loginForm) {
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                
                // Here you would typically send the data to your server
                console.log('Login attempt with:', { email, password });
                
                // For demo purposes, just show an alert
                alert('Login functionality would connect to your backend system. Submitted: ' + email);
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    // Fetch and display data
    document.addEventListener('DOMContentLoaded', function() {
        fetch('data_processor.php')
            .then(response => response.json())
            .then(data => {
                // Create Price Chart
                const priceCtx = document.getElementById('priceChart').getContext('2d');
                new Chart(priceCtx, {
                    type: 'line',
                    data: {
                        labels: data.labels,
                        datasets: [
                            {
                                label: 'Actual Price',
                                data: data.price,
                                borderColor: 'rgba(75, 192, 192, 1)',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                tension: 0.1,
                                fill: true
                            },
                            {
                                label: 'Predicted Price',
                                data: data.pred_price,
                                borderColor: 'rgb(79, 37, 163)',
                                backgroundColor: 'rgba(153, 102, 255, 0.2)',
                                tension: 0.1,
                                fill: true
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'STORJ Price vs Predicted Price'
                            },
                            tooltip: {
                                mode: 'index',
                                intersect: false
                            }
                        },
                        scales: {
                            x: {
                                ticks: {
                                    maxRotation: 45,
                                    minRotation: 45
                                }
                            }
                        }
                    }
                });

                // Create Signal Chart
                const signalCtx = document.getElementById('signalChart').getContext('2d');
                new Chart(signalCtx, {
                    type: 'bar',
                    data: {
                        labels: data.labels,
                        datasets: [
                            {
                                label: 'Buy/Sell Signal',
                                data: data.signal,
                                backgroundColor: data.signal.map(val => 
                                    val === 1 ? 'rgba(54, 162, 235, 0.7)' : 'rgba(255, 99, 132, 0.7)'
                                ),
                                borderColor: data.signal.map(val => 
                                    val === 1 ? 'rgba(54, 162, 235, 1)' : 'rgba(255, 99, 132, 1)'
                                ),
                                borderWidth: 1
                            },
                            {
                                label: 'Percent Change',
                                data: data.percent_change,
                                type: 'line',
                                borderColor: 'rgba(255, 206, 86, 1)',
                                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                tension: 0.1
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'Buy/Sell Signals with Percent Change'
                            },
                            tooltip: {
                                mode: 'index',
                                intersect: false
                            },
                            legend: {
                                onClick: (e) => e.stopPropagation()
                            }
                        },
                        scales: {
                            x: {
                                stacked: true,
                                ticks: {
                                    maxRotation: 45,
                                    minRotation: 45
                                }
                            },
                            y: {
                                beginAtZero: false
                            }
                        }
                    }
                });

                // Create data table (showing first 10 entries from the reversed data)

                const tableHtml = `
                    <table>
                        <thead>
                            <tr>
                                <th>Date & Time (UTC)</th>
                                <th>Price</th>
                                <th>Predicted</th>
                                <th>% Change</th>
                                <th>Signal</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${data.labels.slice(0, 20).map((label, index) => `
                                <tr>
                                    <td>${label}</td>
                                    <td>${data.price[index].toFixed(6)}</td>
                                    <td>${data.pred_price[index].toFixed(6)}</td>
                                    <td style="color: ${data.percent_change[index] >= 0 ? 'green' : 'red'}">
                                        ${data.percent_change[index].toFixed(2)}%
                                    </td>
                                    <td>
                                        <span class="signal-badge ${data.signal[index] === 1 ? 'buy' : 'sell'}">
                                            ${data.signal[index] === 1 ? 'BUY' : 'SELL'}
                                        </span>
                                    </td>
                                </tr>
                            `).join('')}
                        </tbody>
                    </table>
                `;

                document.getElementById('dataTable').innerHTML = tableHtml;
            })
            .catch(error => console.error('Error loading data:', error));
    });
    </script>


</body>
</html>
<!-- This is a simple HTML template for a cryptocurrency prediction platform. It includes sections for the header, hero, login form, features, testimonials, and footer. The CSS styles are included in the head section for easy customization. The JavaScript at the end handles mobile menu toggling and form submission. -->
