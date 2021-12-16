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

home_address.addEventListener("keyup",function (){
    full_address.value = home_address.value + ", " + ward.options[ward.selectedIndex].text + ", " + district.options[district.selectedIndex].text + ", " + province.options[province.selectedIndex].text;
})