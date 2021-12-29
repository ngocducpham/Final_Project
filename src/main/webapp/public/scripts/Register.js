let capcha_check = false;
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
    const email = $('#email-address').val();
    if ($('#password').val() !== $('#re-password').val()) {
        alert('Mật Khẩu Không Khớp !');
        return;
    }

    if (capcha_check === false) {
        alert("capcha không đúng");
        return;
    }

    $.getJSON('/Final_Project/Account/CheckAvailable?email=' + email, function (data) {
        if (data === true) {
            // alert("Đăng kí thành công !")
            $('#FormRegister').off('submit').submit();
        } else {
            alert('Email đã có người sử dụng !');
            $('#exist_email').removeClass("myClass yourClass")
        }
    });
});

//==================================================//
const captcha = document.querySelector(".captcha"),
    inputField = document.getElementById("text-box"),
    checkBtn = document.getElementById("check-btn"),
    statusTxt = document.querySelector(".status-text");

//storing all captcha characters in array
let allCharacters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
    'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function getCaptcha() {
    for (let i = 0; i < 6; i++) { //getting 6 random characters from the array
        let randomCharacter = allCharacters[Math.floor(Math.random() * allCharacters.length)];
        captcha.innerText += ` ${randomCharacter}`; //passing 6 random characters inside captcha innerText
    }
}

getCaptcha();

checkBtn.addEventListener("click", e => {
    e.preventDefault(); //preventing button from it's default behaviour
    statusTxt.style.display = "block";
    //adding space after each character of user entered values because I've added spaces while generating captcha
    let inputVal = inputField.value.split('').join(' ');
    if (inputVal === captcha.innerText) { //if captcha matched
        statusTxt.style.color = "#4db2ec";
        capcha_check = true;
        statusTxt.innerText = "Nice! You don't appear to be a robot.";
    } else {
        statusTxt.style.color = "#ff0000";
        statusTxt.innerText = "Captcha not matched. Please try again!";
    }
});

document.getElementById("reload-btn").addEventListener("click",e => {
    e.preventDefault();
    captcha.innerText="";
    getCaptcha();
});

