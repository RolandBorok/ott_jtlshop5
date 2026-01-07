//Verbrauchsrechner
document.addEventListener("DOMContentLoaded", function() {
    // 1. Check: Existiert der Rechner überhaupt?
    if (!document.getElementById('width')) return;

    console.log("Material-Rechner initialisiert.");

    let currentForm = 'square';

    function getValueSafe(id) {
        const element = document.getElementById(id);
        if (!element) {
            console.warn('Warnung: Element mit ID "' + id + '" nicht gefunden!');
            return 0;
        }
        return parseFloat(element.value) || 0;
    }

    function formatNumber(num) {
        return Math.round(num).toLocaleString('de-DE');
    }

    function updateSliderFill() {
        const slider = document.getElementById('extraSlider');
        const fill = document.getElementById('sliderFill');

        if (slider && fill) {
            const value = parseFloat(slider.value) || 0;
            const max = parseFloat(slider.max) || 15;
            const percentage = (value / max) * 100;
            fill.style.width = percentage + '%';
        }
    }

    function updateProductAmount(id, totalNeed, size) {
        const el = document.getElementById(id);
        if (el) {
            el.textContent = Math.ceil(totalNeed / size);
        }
    }

    function calculate() {
        const width = getValueSafe('width');
        const height = getValueSafe('height');
        const length = getValueSafe('lengthValue');

        // Slider Sonderbehandlung
        const sliderEl = document.getElementById('extraSlider');
        const extraPercent = sliderEl ? (parseFloat(sliderEl.value) || 0) : 0;

        // Berechnung
        const widthM = width / 1000;
        const heightM = height / 1000;
        const lengthM = length;

        let volumeM3 = widthM * heightM * lengthM;

        if (currentForm === 'triangle') {
            volumeM3 = volumeM3 / 2;
        }

        const objectNeedMl = volumeM3 * 1000000;
        const totalNeedMl = objectNeedMl * (1 + extraPercent / 100);

        // --- Ausgaben aktualisieren ---
        const elObjectNeed = document.getElementById('objectNeed');
        if (elObjectNeed) elObjectNeed.textContent = formatNumber(objectNeedMl) + ' ml';

        const elTotalNeed = document.getElementById('totalNeed');
        if (elTotalNeed) elTotalNeed.textContent = formatNumber(totalNeedMl) + ' ml';

        const elExtraPercent = document.getElementById('extraPercent');
        if (elExtraPercent) elExtraPercent.textContent = extraPercent + '%';

        // --- Produkte aktualisieren ---

        // Kartuschen (Row 1)
        updateProductAmount('product290', totalNeedMl, 290);
        updateProductAmount('product300', totalNeedMl, 300);
        updateProductAmount('product310', totalNeedMl, 310);
        updateProductAmount('product450', totalNeedMl, 450);

        // Folienbeutel (Row 2)
        updateProductAmount('product400', totalNeedMl, 400);
        updateProductAmount('product600', totalNeedMl, 600);
        updateProductAmount('product1800', totalNeedMl, 1800);

        updateSliderFill();
    }

    // Event Listeners
    const inputs = ['width', 'height', 'lengthValue'];
    inputs.forEach(id => {
        const el = document.getElementById(id);
        if (el) el.addEventListener('input', calculate);
    });

    const sliderEl = document.getElementById('extraSlider');
    if (sliderEl) {
        sliderEl.addEventListener('input', function() {
            updateSliderFill();
            calculate();
        });
    }

    // Form Selector
    const formOptions = document.querySelectorAll('.form-option');
    if (formOptions.length > 0) {
        formOptions.forEach(option => {
            option.addEventListener('click', function() {
                formOptions.forEach(opt => opt.classList.remove('active'));
                this.classList.add('active');
                if (this.dataset && this.dataset.form) {
                    currentForm = this.dataset.form;
                }
                calculate();
            });
        });
    }

    updateSliderFill();
    calculate();
});

//weiterlesen produktdetail desc
document.addEventListener("DOMContentLoaded", function () {
    const desc = document.getElementById("product-description");
    const btnMore = document.getElementById("desc-more-btn");
    const btnLess = document.getElementById("desc-less-btn");

    btnMore.addEventListener("click", function () {
        desc.classList.remove("truncated");
        btnMore.style.display = "none";
        btnLess.style.display = "inline-block";
    });

    btnLess.addEventListener("click", function () {
        desc.classList.add("truncated");
        btnLess.style.display = "none";
        btnMore.style.display = "inline-block";
        window.scrollTo({ top: desc.offsetTop - 100, behavior: "smooth" });
    });
});

$(function () {
    $('.product-slider:not(.slick-initialized)').slick({
        infinite: true,
        arrows: true,
        dots: true,
        speed: 500,
        fade: true,
        cssEase: 'linear',
        autoplay: false
    });
});

$(document).ready(function(){

    //init container with class "video-slider"
    $('.video-slider > div ').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        arrows:true,
        dots:false,
        responsive:     [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    dots:false,
                    arrows:true,
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow:2,
                    slidesToScroll: 2,
                    arrows: true,
                    dots:false,
                }
            },
        ]
    });


    //init container with class "video-slider"
    $('.team-slider > div ').slick({
        infinite: true,
        lazyLoad: 'progressive',
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows:true,
        centerMode:true,
        centerPadding: '-20px',
        dots:false,
        focusOnSelect: true,
        responsive:     [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    dots:true,
                    arrows:false,
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow:1,
                    slidesToScroll: 1,
                    arrows: false,
                    dots:true,
                }
            },
        ]
    });


    //init container with class "home-slider"
    $('.slick-slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows:true,
        dots:false,
        speed: 500,
        fade: true,
        cssEase: 'linear',
        autoplay: true,
        autoplaySpeed: 4000,

    });

});

