import './bootstrap';

import * as bootstrap from 'bootstrap';
import Swiper from 'swiper';
import { Navigation } from 'swiper/modules';

import 'swiper/css';
import 'swiper/css/navigation';


document.addEventListener('DOMContentLoaded', () => {

    // Main Hero Carousel
    const heroCarouselElement = document.getElementById('heroCarousel');
    if (heroCarouselElement) {
        new bootstrap.Carousel(heroCarouselElement, {
            interval: 5000,
            wrap: true
        });
    }

    // Flash Sale Swiper
    const flashSaleSwiper = new Swiper('.flash-sale-swiper', {
        modules: [Navigation],
        slidesPerView: 2,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        breakpoints: {
            576: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 5,
                spaceBetween: 10
            },
            1200: {
                slidesPerView: 6,
                spaceBetween: 10
            }
        }
    });

    // Countdown Timer
    const countdownElement = document.getElementById('countdown');
    if (countdownElement) {
        const hoursEl = countdownElement.querySelector('.hours');
        const minutesEl = countdownElement.querySelector('.minutes');
        const secondsEl = countdownElement.querySelector('.seconds');

        // Set the end time (e.g., 2 hours from now)
        const endTime = new Date().getTime() + 2 * 60 * 60 * 1000;

        const updateCountdown = () => {
            const now = new Date().getTime();
            const distance = endTime - now;

            if (distance < 0) {
                clearInterval(timerInterval);
                if(hoursEl && minutesEl && secondsEl){
                    hoursEl.textContent = '00';
                    minutesEl.textContent = '00';
                    secondsEl.textContent = '00';
                }
                return;
            }

            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

            if(hoursEl && minutesEl && secondsEl){
                hoursEl.textContent = hours.toString().padStart(2, '0');
                minutesEl.textContent = minutes.toString().padStart(2, '0');
                secondsEl.textContent = seconds.toString().padStart(2, '0');
            }
        };

        const timerInterval = setInterval(updateCountdown, 1000);
        updateCountdown();
    }
}); 