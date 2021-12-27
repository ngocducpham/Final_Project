<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Đăng kí</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/Register.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body style='background-image: url("${pageContext.request.contextPath}/public/imgs/top-5-bg.jpg");'>
<div class='max-w-2xl mx-auto'>
    <div class='flex flex-col mt-5'>
        <div class='w-14 h-14 mx-auto'>
            <img src="${pageContext.request.contextPath}/public/imgs/icon.svg" alt="">
        </div>
        <div class='mt-5 text-center text-xl font-medium text-gray-700'>
            Đăng kí tài khoản
        </div>
    </div>
    <div>
        <form id="FormRegister" method="post" class="shadow-lg rounded-lg p-8 bg-white">
            <div class='grid grid-cols-2 auto-rows-auto gap-2'>
                <div>
                    <label for='user-name' class='font-medium text-gray-600'>Họ và tên</label>
                    <input id="user-name" name="username" type="text" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                </div>


                <div>
                    <label for='DOB' class='font-medium text-gray-600'>Ngày Sinh (dd/MM/yyyy)</label>
                    <input id="DOB" name="DOB" type="text" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                </div>

                <div>
                    <label for="ls_province" class='font-medium text-gray-600'>Tỉnh / Thành Phố</label>
                    <select class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700"
                            name="ls_province" id="ls_province"></select>
                </div>
                <div>
                    <label for="ls_district" class='font-medium text-gray-600'>Quận / Huyện</label>
                    <select class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700"
                            name="ls_district" id="ls_district"></select>
                </div>
                <div>
                    <label for="ls_ward" class='font-medium text-gray-600'>Phường/Xã</label>
                    <select class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700"
                            name="ls_ward" id="ls_ward"></select>
                </div>
                <div>
                    <label for="home_address" class='font-medium text-gray-600'>Số Nhà, Tên Đường</label>
                    <input id="home_address" name="username" type="text" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                </div>
                <div class="hidden">
                    <label for="full_address" class='font-medium text-gray-600 hidden' style="visibility: hidden">Địa
                        Chỉ</label>
                    <input id="full_address" name="full_address" type="text" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700 hidden'
                           style="visibility: hidden"
                           readonly>
                </div>


                <div>
                    <label for='email-address' class='font-medium text-gray-600'>Địa chỉ email</label>
                    <input id="email-address" name="email" type="email" autocomplete="email" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                    <div id="exist_email" class='alert__email hidden text-red-600 mt-2 text-sm'>Email đã tồn tại</div>
                </div>
                <!--                <div class='mt-2'>-->
                <!--                    <label for='vetification' class='font-medium text-gray-600'>Mã xác nhận</label>-->
                <!--                    <div class='relative'>-->
                <!--                        <input id="vetification" name="vetification" type="text" required-->
                <!--                               class='mt-2 w-full pl-2 pr-24 py-1 outline-none block border-2 rounded-md  border-gray-300'>-->
                <!--                        <a href='#' style='transform: translateY(-55%);'-->
                <!--                           class='pl-3 border-l-2 text-sm absolute right-3 top-2/4 text-indigo-700 hover:underline'>Nhận-->
                <!--                            mã</a>-->
                <!--                    </div>-->
                <!--                    <div class='alert__vetification hidden text-red-600 mt-2 text-sm'>Mã xác nhận không đúng</div>-->
                <!--                </div>-->
                <div>
                    <label for='password' class='font-medium text-gray-600'>Mật khẩu</label>
                    <input id="password" name="password" type="password" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300'>
                </div>
                <div>
                    <label for='re-password' class='font-medium text-gray-600'>Xác nhận mật khẩu</label>
                    <input id="re-password" name="repassword" type="password" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300'>
                    <div class='alert__password hidden text-red-600 mt-2 text-sm'>Mật khẩu không trùng khớp</div>
                </div>
            </div>

            <div class="wrapper">
                <header>Captcha in JavaScript</header>
                <div class="captcha-area">
                    <div class="captcha-img">
                        <%--                        <img src="captcha-bg.png" alt="Captch Background">--%>
                        <span class="captcha"></span>
                    </div>
                    <button class="reload-btn"><i class="fas fa-redo-alt"></i></button>
                </div>
                <input type="text" placeholder="Enter captcha" maxlength="6" spellcheck="false" id="text-box" required>
                <button class="check-btn">Check</button>
                <div class="status-text"></div>
            </div>

            <div class='mt-6'>
                <button type="submit"
                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none">
                            <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                <svg class="h-5 w-5 text-indigo-500 group-hover:text-indigo-400"
                                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                     aria-hidden="true">
                                    <path fill-rule="evenodd"
                                          d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                          clip-rule="evenodd"/>
                                </svg>
                            </span>
                    Đăng kí
                </button>
            </div>
            <div class='mt-2'>
                Đã tài khoản? <a href="${pageContext.request.contextPath}/Account/Login"
                                 class='text-indigo-600 hover:underline'>Đăng nhập</a>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://kit.fontawesome.com/618a331a9e.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/public/scripts/vietnamlocalselector.js"></script>
<script>
    let localpicker = new LocalPicker({
        province: "ls_province",
        district: "ls_district",
        ward: "ls_ward"
    });

    $('#DOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });

    $('#user-name').select();
</script>
<script src="${pageContext.request.contextPath}/public/scripts/Register.js"></script>

</body>

</html>
