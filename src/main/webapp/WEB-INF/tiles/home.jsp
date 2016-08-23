<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    body {
        font: 400 15px/1.8 Lato, sans-serif;
        color: #777;
    }
    .container {
        padding: 80px 120px;
    }
    .carousel-inner img {
        width: 100%; /* Set width to 100% */
        margin: auto
    }

</style>

<div class="container-fluid">
    <div id="myHome" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myHome" data-slide-to="0" class="active"></li>
            <li data-target="#myHome" data-slide-to="1"></li>
            <li data-target="#myHome" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<spring:url value="/static/img/jump.jpg"/>" alt="Jump">
                <div class="carousel-caption">
                    <h2>JUMP</h2>
                    <p>The atmosphere in jump.</p>
                </div>
            </div>

            <div class="item">
                <img src="<spring:url value="/static/img/cat.jpg"/>" alt="Cat">
                <div class="carousel-caption">
                    <h2>Cat</h2>
                    <p>Thank you, Cat - u r the best!.</p>
                </div>
            </div>

            <div class="item">
                <img src="<spring:url value="/static/img/job.jpg"/>" alt="Job">
                <div class="carousel-caption">
                    <h2>My Precious</h2>
                    <p>I wanna get a job</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myHome" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myHome" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>








