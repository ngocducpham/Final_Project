<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<form action="" method="post" id="frmRegister">
    <div class="card">
        <h4 class="card-header">
            Account Registration
        </h4>
        <div class="card-body">
            <h5>Account</h5>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <input type="text" class="form-control" id="txtUsername" name="username">
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <input type="password" class="form-control" id="txtPassword" name="rawpwd">
            </div>
            <div class="form-group">
                <label for="txtConfirm">Confirm</label>
                <input type="password" class="form-control" id="txtConfirm">
            </div>

            <h5 class="mt-4">Personal Information</h5>
            <div class="form-group">
                <label for="txtName">Name</label>
                <input type="text" class="form-control" id="txtName" name="name">
            </div>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <input type="text" class="form-control" id="txtEmail" name="email">
            </div>
            <div class="form-group">
                <label for="txtDOB">Date of Birth</label>
                <input type="text" class="form-control" id="txtDOB" name="dob">
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" class="btn btn-primary">
                <i class="fa fa-check" aria-hidden="true"></i>
                Register
            </button>
        </div>
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
<script>
    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });
    $('#txtUsername').select();
</script>
</body>
</html>