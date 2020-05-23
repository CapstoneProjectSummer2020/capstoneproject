$(document).ready(function () {
    $('#accordion a').each(function () {
        if ($(this).attr('href') == window.location.pathname) {
            $(this).parents('.panel-collapse').addClass('in');
        }
    });

    $(window).load(function () {
        $(".loader").fadeOut("slow");
    });

    if (window.location.pathname == '/' || window.location.pathname == '/Default.aspx' || window.location.pathname == '') {
        $('.f-slleft').show();
        $('.main_menu').show();
    }
    else {
        $('.f-slleft').hide();
        $('.main_menu').hide();
        $('.menu_title').mouseover(function () {
            $('.main_menu').show();
        });
        $('.main_menu').mouseover(function () {
            $('.main_menu').show();
        });
        $('.menu_title').mouseout(function () {
            $('.main_menu').hide();
        });
        $('.main_menu').mouseout(function () {
            $('.main_menu').hide();
        });
    }
    $('#m-nav').click(function () {
        $('#menuWrapper').toggleClass('active');
    });
    $('.glyphicon').click(function () {
        $('.fns-menunews').toggleClass('fns-mnshow');
    });

    $('.tab-content').each(function () {
        $(this).find('.tab-pane').first().addClass('active');
    });

    //$('.panel').find('.panel-collapse').first().addClass('in');

    $('.nav-pills li:first-child').addClass('active');

    $('#back-to-top').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 300);
    });

    $('.tab-content').each(function () {
        var numItems = $(this).find('.col-lg-3').length;
        if (numItems == 0) {
            $(this).find($('p.image a')).css('display', 'none');
        }
        else if (numItems <= 8) {
            $(this).find($('p.image img:nth-child(2)')).css('display', 'none');
        }
    });

    $('.nav a').click(function () {
        var id = $(this).attr('href');
        var numItems = $(id).find('.col-lg-3').length;
        if (numItems == 0) {
            $(id).find($('p.image a')).css('display', 'none');
        }
        else if (numItems <= 8) {
            $(id).find($('p.image img:nth-child(2)')).css('display', 'none');
        }
    });

    $(window).on('scroll', function () {
        backToTop();
    });
    $('#showOrderInfo').on('click', function () {
        $('#order-info').addClass('animated fadeInUp');
        $('#order-info').css('display', 'block');
        $('.send-order').show();
        $('body,html').animate({ scrollTop: $('.shipping').height() + 220 + $('.hp-bntopmain').height() }, 500);
    });

    $("input:checkbox").change(function () {
        var rfvShipName = document.getElementById('phMain_rfvShipName');
        var rfvShipNameFormat = document.getElementById('phMain_rfvShipNameFormat');
        var rfvShipEmail = document.getElementById('phMain_rfvShipEmail');
        var rfvShipEmailFormat = document.getElementById('phMain_rfvShipEmailFormat');
        var rfvShipPhone = document.getElementById('phMain_rfvShipPhone');
        var rfvShipPhoneFormat = document.getElementById('phMain_rfvShipPhoneFormat');
        var rfvShipAddress = document.getElementById('phMain_rfvShipAddress');
        var rfvShipProvince = document.getElementById('phMain_rfvShipProvince');
        var rfvShipDistrict = document.getElementById('phMain_rfvShipDistrict');
        if (!$(this).is(':checked')) {
            $('#ship-info').removeClass('animated fadeOutRight');
            $('#ship-info').addClass('animated fadeInUp');
            $('#ship-info').css('display', 'block');
            ValidatorEnable(rfvShipName, true);
            ValidatorEnable(rfvShipNameFormat, true);
            ValidatorEnable(rfvShipEmail, true);
            ValidatorEnable(rfvShipEmailFormat, true);
            ValidatorEnable(rfvShipPhone, true);
            ValidatorEnable(rfvShipNameFormat, true);
            ValidatorEnable(rfvShipPhoneFormat, true);
            ValidatorEnable(rfvShipAddress, true);
            ValidatorEnable(rfvShipProvince, true);
            ValidatorEnable(rfvShipDistrict, true);
        }
        if (($(this).is(':checked'))) {
            $('#ship-info').removeClass('animated fadeInUp');
            $('#ship-info').addClass('animated fadeOutRight');
            ValidatorEnable(rfvShipName, false);
            ValidatorEnable(rfvShipNameFormat, false);
            ValidatorEnable(rfvShipEmail, false);
            ValidatorEnable(rfvShipEmailFormat, false);
            ValidatorEnable(rfvShipPhone, false);
            ValidatorEnable(rfvShipNameFormat, false);
            ValidatorEnable(rfvShipPhoneFormat, false);
            ValidatorEnable(rfvShipAddress, false);
            ValidatorEnable(rfvShipProvince, false);
            ValidatorEnable(rfvShipDistrict, false);
        }
    });

    $('.form-group').find('span').each(function () {
        if ($(this).css('visibility') == 'hidden') {
            $(this).css('display', 'none');
        }
    })
    $('.send-order').on('click', function () {
        $('.form-group').removeClass('has-error');
        $('.form-group > div').removeClass('has-error');
        $('.form-group').find('span').each(function () {
            $(this).css('display', 'block');
            if ($(this).css('visibility') == 'hidden') {
                $(this).css('display', 'none');
            }
            if ($(this).css('visibility') == 'visible') {
                $(this).css('display', 'block');
                $(this).parent().addClass('has-error');
                $(this).parent().find('input').focus();
            }
        })
    });

})

function backToTop() {
    var scrollTop = $(window).scrollTop();
    if (scrollTop > 100) {
        $('#back-to-top').addClass('show');
    } else {
        $('#back-to-top').removeClass('show');
    }
}