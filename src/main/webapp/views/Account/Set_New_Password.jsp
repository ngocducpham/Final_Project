<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Thay Đổi Mật Khẩu</title>
</head>

<body style='background-image: url("${pageContext.request.contextPath}/public/imgs/top-5-bg.jpg");'>
<div class='max-w-sm mx-auto'>
    <div class='flex flex-col mt-10'>
        <div class='w-14 h-14 mx-auto'>
            <img src="${pageContext.request.contextPath}/public/imgs/icon.svg" alt="">
        </div>
        <div class='mt-5 text-center text-xl font-medium text-gray-700'>
            Thay Đổi Mật Khẩu
        </div>
    </div>
    <div class='mt-5'>
        <form action="#" method='POST'>
            <div class='shadow-lg rounded-lg p-8 bg-white flex flex-col'>
                <div>
                    <label for='new_password' class='font-medium text-gray-600'>Mât Khẩu Mới</label>
                    <input id="new_password" name="new_password" type="password" autocomplete="email" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                </div>
                <div class='mt-5'>
                    <div class='flex justify-between'>
                        <label for='re-password' class='font-medium text-gray-600'>Nhập Lại Mật khẩu</label>
                    </div>
                    <input id="re-password" name="password" type="password" autocomplete="current-password" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300'>
                </div>
                <div class='mt-8'>
                    <button type="submit"
                            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none">
                        Đổi Mật Khẩu
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script>
    if ($('#new_password').val() !== $('#re-password').val()) {
        alert('Mật Khẩu Không Khớp !');
        return;
    }
</script>
</body>

</html>