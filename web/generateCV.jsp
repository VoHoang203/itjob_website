<%-- 
    Document   : generateCV
    Created on : Mar 29, 2024, 2:08:25 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>CV Automation Generate</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Responsive Resume Template">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
        <link rel="shortcut icon" href="favicon.ico">

        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link id="theme-style" rel="stylesheet" href="assets/css/pillar-1.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    </head>

    <body>


        <article class="resume-wrapper text-center position-relative">
            <div class="resume-wrapper-inner mx-auto text-start bg-white shadow-lg">
                <div id="content-to-convert">
                    <header class="resume-header pt-4 pt-md-0">
                        <div class="row">
                            <div class="col-block col-md-auto resume-picture-holder text-center text-md-start">
                                <img class="picture" src="${requestScope.imgURL}" alt="">
                            </div><!--//col-->
                            <div class="col">
                                <div class="row p-4 justify-content-center justify-content-md-between">
                                    <div class="primary-info col-auto">
                                        <h1 class="name mt-0 mb-1 text-white text-uppercase text-uppercase">${requestScope.name}</h1>
                                        <div class="title mb-3">Developer</div>
                                        <ul class="list-unstyled">
                                            <li class="mb-2"><a class="text-link" href="#">${requestScope.emailContact}</a></li>
                                            <li><a class="text-link mb-2" href="#">${requestScope.phone}</a></li>
                                            <li><a class="text-link mb-2" href="#">${requestScope.dateOfBirth}</a></li>
                                        </ul>
                                    </div><!--//primary-info-->
                                    <div class="secondary-info col-auto mt-2">
                                    </div><!--//secondary-info-->
                                </div><!--//row-->

                            </div><!--//col-->
                        </div><!--//row-->
                    </header>
                    <div class="resume-body p-5">
                        <section class="resume-section summary-section mb-5">
                            <h2 class="resume-section-title text-uppercase font-weight-bold pb-3 mb-3">Career Summary</h2>
                            <div class="resume-section-content">
                                <p class="mb-0">${requestScope.aboutYou}</p>
                            </div>
                        </section><!--//summary-section-->
                        <div class="row">
                            <div class="col-lg-9">
                                <section class="resume-section experience-section mb-5">
                                    <h2 class="resume-section-title text-uppercase font-weight-bold pb-3 mb-3">Work
                                        Experience
                                    </h2>
                                    <div class="resume-section-content">
                                        <div class="resume-timeline position-relative">
                                            <c:forEach items="${requestScope.workExperiences}" var="workExp">
                                                <article class="resume-timeline-item position-relative pb-5">
                                                    <div class="resume-timeline-item-header mb-2">
                                                        <div class="d-flex flex-column flex-md-row">
                                                            <h3 class="resume-position-title font-weight-bold mb-1">${workExp.title}
                                                            </h3>
                                                            <div class="resume-company-name ms-auto">${workExp.companyName}</div>
                                                        </div><!--//row-->
                                                        <div class="resume-position-time">${workExp.startTime} - ${workExp.endTime}</div>
                                                    </div><!--//resume-timeline-item-header-->
                                                    <div class="resume-timeline-item-desc">
                                                        <p>${workExp.description}</p>
                                                    </div><!--//resume-timeline-item-desc-->
                                                </article><!--//resume-timeline-item-->
                                            </c:forEach>
                                        </div><!--//resume-timeline-->
                                    </div>
                                </section>
                            </div>
                            <div class="col-lg-3">
                                <section class="resume-section skills-section mb-5">
                                    <h2 class="resume-section-title text-uppercase font-weight-bold pb-3 mb-3">Skills &amp;
                                        Tools</h2>
                                    <div class="resume-section-content">
                                        <div class="resume-skill-item">
                                            <ul class="list-inline">
                                                <c:forEach items="${requestScope.skills}" var="skill">
                                                    <li class="list-inline-item"><span class="badge badge-light">${skill.skillName}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div><!--//resume-skill-item-->
                                    </div><!--resume-section-content-->
                                </section><!--//skills-section-->
                                <section class="resume-section education-section mb-5">
                                    <h2 class="resume-section-title text-uppercase font-weight-bold pb-3 mb-3">Education
                                    </h2>
                                    <div class="resume-section-content">
                                        <ul class="list-unstyled">
                                            <c:forEach items="${requestScope.educations}" var="education">
                                                <li class="mb-2">
                                                    <div class="resume-degree font-weight-bold">${education.degree}</div>
                                                    <div class="resume-degree-org">${education.schoolName}</div>
                                                    <div class="resume-degree-org">${education.description}</div>
                                                    <div class="resume-degree-time">${education.startTime} - ${education.endTime}</div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </section><!--//education-section-->
                            </div>
                        </div><!--//row-->
                    </div><!--//resume-body-->
                </div>
            </div>
        </article>
        <button id="preview-pdf" style="display:none;">Preview PDF</button>
        <footer class="footer text-center pt-2 pb-5">
        </footer>

        <script>
            window.onload = function () {
                var opt = {
                    margin: 0,
                    filename: 'mypdf.pdf',
                    image: {type: 'jpeg', quality: 1},
                    html2canvas: {scale: 3},
                    jsPDF: {unit: 'mm', format: 'a4', orientation: 'portrait'} // Đã sửa từ 'in' sang 'mm' để phù hợp với A4
                };

                var element = document.getElementById('content-to-convert');

                html2pdf().set(opt).from(element).toPdf().get('pdf').then(function (pdf) {
                    var blob = pdf.output('blob');
                    var blobURL = URL.createObjectURL(blob);

                    window.open(blobURL, '_blank');
                });
            };
        </script>

    </body>
</html>
