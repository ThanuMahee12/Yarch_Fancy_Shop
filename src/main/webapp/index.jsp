<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>One Page App with Scroll Spy</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body data-spy="scroll" data-target="#navbar" data-offset="50">

<!-- Navigation Bar -->
<%@include file="header.jsp"%>
<%@include file="bean.jsp"%>
<!-- Main Content -->
<div class="container-fluid mt-3">
    <div id="home">
        <div id="hero" class="py-2 mt-5">
            <div class="container">
                <div id="vehicleCarousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://post.healthline.com/wp-content/uploads/2020/11/771253-The-Best-Baby-Soaps-on-the-Market-Today-According-to-Dermatologists-1200x628-Facebook-81b9bf-1-1200x628.jpg" class="d-block w-100" alt="Vehicle 1">
                            <div class="carousel-caption">
                                <h3>Baby shambo</h3>
                                <p>No surprise if you find yourself browsing ingredient lists and combing through endless reviews to settle on the perfect products for your baby</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://www.lookgoodcenter.com/wp-content/uploads/2014/11/Post4-e1424075851475.png" class="d-block w-100" alt="Vehicle 2">
                            <div class="carousel-caption">
                                <h3>Moizalizer</h3>
                                <p>It is easy to feel overwhelmed when looking through the variety of moisturizers available in store</p>
                            </div>
                        </div>
                        <!-- Add more carousel items as needed -->
                        <div class="carousel-item">
                            <img src="https://www.sltrib.com/resizer/yRzj8x5OFhJubK38axV71CNeTN4=/1024x650/cloudfront-us-east-1.images.arcpublishing.com/sltrib/PHY7SHPR7VA4JNEJYYLJ2B25BA.png" class="d-block w-100" alt="Vehicle 2">
                            <div class="carousel-caption">
                                <h3>Hair Oil</h3>
                                <p>Many cultures have used hair oil since ancient times</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#vehicleCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#vehicleCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row" id="features-section">
                <div class="col-md-3">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1204502523/vector/fast-delivery-icon-design-element-vector-truck-and-timer-illustration-speed-shipping-concept.jpg?s=170667a&w=0&k=20&c=Zy8tRpd83blYtB9SWOB52GSay9Ych6qnhe62_-43o2w=" class="card-img-top"  height="200px" alt="Feature 1">
                        <div class="card-body">
                            <h5 class="card-title">Fast Delivery</h5>
                            <p class="card-text">Products has been deliverd quickly</p>
                        </div>
                    </div>
                </div>

                <!-- Feature Card 2 -->
                <div class="col-md-3">
                    <div class="card">
                        <img src="https://img.freepik.com/free-vector/24-hour-service-everyday-concept-background_1017-38129.jpg?w=2000" height="200px" class="card-img-top" alt="Feature 2">
                        <div class="card-body">
                            <h5 class="card-title">24hrs Service</h5>
                            <p class="card-text">Any Time Service</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="https://clipart-library.com/img/1942483.jpg" class="card-img-top" height="200px" alt="Feature 1">
                        <div class="card-body">
                            <h5 class="card-title">Good Quality</h5>
                            <p class="card-text">100% Trust us</p>
                        </div>
                    </div>
                </div>

                <!-- Feature Card 2 -->
                <div class="col-md-3">
                    <div class="card">
                        <img src="https://st2.depositphotos.com/1031343/9276/v/950/depositphotos_92764768-stock-illustration-low-price-label-or-price.jpg" class="card-img-top" height="200px" alt="Feature 2">
                        <div class="card-body">
                            <h5 class="card-title">very Low Budget</h5>
                            <p class="card-text">Very low price</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Your content goes here -->
    </div>



</div>
<%@include file="Footer.jsp"%>
<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
