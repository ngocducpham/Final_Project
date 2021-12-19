let full_address = document.getElementById("full_address"),
    province = document.getElementById("ls_province"),
    district = document.getElementById("ls_district"),
    ward = document.getElementById("ls_ward"),
    home_address = document.getElementById("home_address");


province.addEventListener("change", function () {
    full_address.value = home_address.value + ", " + ward.options[ward.selectedIndex].text + ", " + district.options[district.selectedIndex].text + ", " + province.options[province.selectedIndex].text;
});

ward.addEventListener("change", function () {
    full_address.value = home_address.value + ", " + ward.options[ward.selectedIndex].text + ", " + district.options[district.selectedIndex].text + ", " + province.options[province.selectedIndex].text;
});

district.addEventListener("change", function () {
    full_address.value = home_address.value + ", " + ward.options[ward.selectedIndex].text + ", " + district.options[district.selectedIndex].text + ", " + province.options[province.selectedIndex].text;
});

home_address.addEventListener("keyup", function () {
    full_address.value = home_address.value + ", " + ward.options[ward.selectedIndex].text + ", " + district.options[district.selectedIndex].text + ", " + province.options[province.selectedIndex].text;
})

$('#FormRegister').on('submit', function (e) {
    e.preventDefault();

    const email = $('#email').val();
    if ($('#password').val() !== $('#re-password').val()) {
        alert('Mật Khẩu Không Khớp !');
        return;
    }

    $.getJSON('/Final_Project/Account/CheckAvailable?email=' + email, function (data) {
        if (data === true) {
            alert("Đăng kí thành công !")
            $('#FormRegister').off('submit').submit();
        } else {
            alert('Email đã có người sử dụng !');
            $('#exist_email').removeClass("myClass yourClass")
        }
    });
});