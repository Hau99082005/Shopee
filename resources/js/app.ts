import './bootstrap';

import * as bootstrap from 'bootstrap';

import 'swiper/css';

const carouselElement = document.getElementById('shopeeBanner');
if (carouselElement) {
    new bootstrap.Carousel(carouselElement, {
        interval: 3000,
        wrap: true
    });
} 