
    if (localStorage.getItem("fbchatclose") == 1) {

        jQuery('.fb-page').toggleClass('hide');

    jQuery('#closefbchat').html('<i class="fa fa-comments fa-2x"></i> Hỗ Trợ Khách Hàng').css({'bottom': 0 });
}

    setTimeout(function () {
        $("#closefbchat").removeClass("hide");
    }, 1000);


    jQuery('#closefbchat').click(function () {
        jQuery('.fb-page').toggleClass('hide');
    if (jQuery('.fb-page').hasClass('hide')) {
        localStorage.setItem("fbchatclose", 1);

    jQuery('#closefbchat').html('<i class="fa fa-comments fa-2x"></i> Hỗ Trợ Khách Hàng').css({'bottom': 0 });
}
        else {
        localStorage.setItem("fbchatclose", 0);
    jQuery('#closefbchat').text('Tắt Hỗ Trợ').css({'bottom': 299 });
}
});

