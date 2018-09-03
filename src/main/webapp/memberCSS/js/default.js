$(document).ready(function () {
    $(".success-story-slider").owlCarousel({
        lazyLoad: true,
        loop: true,
        navText: false,
        dots: false,
        nav: true,
        autoplay: true,
        autoplayTimeout: 5000,
        responsive: {
            0: {
                items: 1
            },           
            768: {
                items: 2
            }
        }
    });
});