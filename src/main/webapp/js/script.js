
    $(document).ready(function() {
    // Enable scroll spy
    $('body').scrollspy({ target: '.navbar', offset: 100 });

    // Smooth scrolling when clicking on a navigation link
    $('.nav-link').on('click', function(event) {
    if (this.hash !== '') {
    event.preventDefault();
    var hash = this.hash;

    $('html, body').animate(
{
    scrollTop: $(hash).offset().top
},
    800,
    function() {
    // Update URL hash on scroll completion
    window.location.hash = hash;
}
    );
}
});
        $('#vehicleCarousel').carousel({
            interval: 5000, // Set the interval between slide transitions (in milliseconds)
        });
            (function () {
            'use strict';
            window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
        }
            form.classList.add('was-validated');
        }, false);
        });
        }, false);
        })();
});

