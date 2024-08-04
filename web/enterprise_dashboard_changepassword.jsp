<%@page import="Model.EnterprisesClone"%>
<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="pxp-root">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Change Password</title>
    </head>
    <body style="background-color: var(--pxpMainColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>
        <%
            String userRole = (String) request.getAttribute("userRole");
            String displayName = (String) request.getAttribute("displayName");
            String imgUrl = "images/default-avatar.jpg";
            int status = 0;
            if ("enterprise".equals(userRole)) {
                EnterprisesClone enterprise = (EnterprisesClone) request.getAttribute("user");
                imgUrl = enterprise.getLogoUrl();
                status = enterprise.getStatus();
        %>
        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                <ul class="list-unstyled">
                    <li><a href="/ITJob/EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                        <c:if test="<%= status == 2 || status == 3%>">

                        <li><a href="/ITJob/PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                        <li><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                        <li><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
                        </c:if>
                    <li class="pxp-active"><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                </ul>
                <div class="pxp-dashboard-side-label mt-3 mt-lg-4">Insights</div>
                <ul class="list-unstyled">
                    <li>
                        <a href="company-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                            <span class="badge rounded-pill">5</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <nav class="pxp-dashboard-side-user-nav-container">

                <div class="dropdown pxp-user-nav-dropdown">
                    <a href="/ITJob/Home" class="dropdown-toggle" data-bs-toggle="dropdown">
                        <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                        <div style="color: black" class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) { %>
                        <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                            <% } %>
                            <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                        <li><a class="dropdown-item" href="<%="/ITJob/EnterpriseDashBoard"%>">Dashboard</a></li>
                            <% }%>
                        <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="pxp-dashboard-content">
            <div class="pxp-dashboard-content-header">
                <div class="pxp-nav-trigger navbar pxp-is-dashboard d-lg-none">
                    <a role="button" data-bs-toggle="offcanvas" data-bs-target="#pxpMobileNav" aria-controls="pxpMobileNav">
                        <div class="pxp-line-1"></div>
                        <div class="pxp-line-2"></div>
                        <div class="pxp-line-3"></div>
                    </a>
                    <div class="offcanvas offcanvas-start pxp-nav-mobile-container pxp-is-dashboard" tabindex="-1" id="pxpMobileNav">
                        <div class="offcanvas-header">
                            <div class="pxp-logo">
                                <a href="index.html" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                            </div>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                                <ul class="list-unstyled">
                                    <li><a href="EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li><a href="EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li><a href="PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                                    <li><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                                    <li><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
                                    <li class="pxp-active"><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                                </ul>
                                <div class="pxp-dashboard-side-label mt-3 mt-lg-4">Insights</div>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="company-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
                                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                                            <span class="badge rounded-pill">5</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <nav class="pxp-user-nav pxp-on-light">
                    <c:if test="<%= status == 2 || status == 3%>">

                        <a href="/ITJob/PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a>
                    </c:if>
                    <div class="dropdown pxp-user-nav-dropdown pxp-user-notifications">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="fa fa-bell-o"></span>
                            <div class="pxp-user-notifications-counter">5</div>
                        </a>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                            <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) { %>
                            <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                                <% } %>
                                <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                            <li><a class="dropdown-item" href="<%="/ITJob/EnterpriseDashBoard"%>">Dashboard</a></li>
                                <% } %>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                    <%
                    } else {
                    %>
                    <a href="/ITJob/Login" style="text-decoration: none; background-color: transparent; color: white; padding: 5px 18px; border: 1px solid white; border-radius: 25px;font-size: 15px; font-weight: 500; display: inline-block; text-align: center;">Sign in</a>
                    <%
                        }
                    %>
                </nav>
            </div>

            <div class="pxp-dashboard-content-details">
                <h1>Change Password</h1>
                <p class="pxp-text-light">Choose a new account password.</p>

                <form action="profilepass" method="post">
                    <div class="row mt-4 mt-lg-5">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-old-password" class="form-label">Old password</label>
                                <input type="password" id="pxp-candidate-old-password" class="form-control" placeholder="Enter old password" name="pass" value="${requestScope.pass}">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-new-password" class="form-label">New password</label>
                                <input type="password" id="pxp-candidate-new-password" class="form-control" placeholder="Enter new password" name="newpass" value="${requestScope.newpass}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-new-password-repeat" class="form-label">New password repeat</label>
                                <input type="password" id="pxp-candidate-new-password-repeat" class="form-control" placeholder="Repeat new password" name="check" value="${requestScope.check}">
                            </div>
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">

                        <button class="btn btn-primary" type="submit">Save New Password</button>
                        <input type="text" name="passc" value="${requestScope.passc}" hidden>
                        <input type="text" name="userName" value="${requestScope.user}" hidden>
                    </div>
                </form>
                <c:choose>
                    <c:when test="${requestScope.mess == 'Update Success!'}">
                        <p style="color:red"><a href="Home">${requestScope.mess}</a></p>
                        </c:when>
                        <c:otherwise>
                        <p style="color:red">${requestScope.mess}</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <footer>

                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>
    </div>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
