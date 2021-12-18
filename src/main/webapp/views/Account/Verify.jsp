<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Xác Minh</title>
</head>

<body style='background-image: url("${pageContext.request.contextPath}/public/imgs/top-5-bg.jpg");'>
<div class='max-w-lg mx-auto'>
    <div class='flex flex-col mt-5'>
        <div class='w-14 h-14 mx-auto'>
            <img src="${pageContext.request.contextPath}/public/imgs/icon.svg" alt="">
        </div>
        <div class='mt-5 text-center text-xl font-medium text-gray-700'>
            Nhập mã <span style="color: red">6 số</span> chúng tôi đã gửi đến <span style="color: red">email</span> của bạn để kích hoạt tài khoản
        </div>
    </div>
    <div>
        <form action="#" method='POST'>
            <div class='shadow-lg rounded-lg p-8 bg-white flex flex-col'>
                <div class='mt-5'>
                    <div class="text-center">
                        <h3 class='font-medium text-gray-600'>Mã Xác Minh</h3>
                    </div>
                    <input id="code" name="code" type="password" autocomplete="current-password" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300'>
                </div>
                <button type="submit"
                        class="mt-5 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none">
                    Xác Minh
                </button>
            </div>
        </form>
    </div>
</div>
</body>

</html>
