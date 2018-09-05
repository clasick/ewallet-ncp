<jsp:include page="_header.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
        function validateEmail(email) {
            var re =
                /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }

        function validatePhoneNo(phoneNo) {

            var re = /^\d{10}$/;

            return re.test(String(phoneNo));
        }

        function validateUserName(userName) {

            var re = /^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/

            return re.test(String(userName));
        }


        function validateForm() {

            var flag1 = 0,
                flag2 = 0,
                flag3 = 0,
                flag4 = 0;

            var email = document.forms["myForm"]["email"].value;
            var phoneno = document.forms["myForm"]['phone_no'].value;
            var userName = document.forms["myForm"]['username'].value;
            var password1 = document.forms["myForm"]['password1'].value;
            var password2 = document.forms["myForm"]['password2'].value;


            if (!validateEmail(email)) {
                document.getElementById("error-email").innerHTML =
                    '<ul class="errorlist"><li>Please provide a valid email address.</li></ul>';
                flag1 = 1;
            } else {
                document.getElementById("error-email").innerHTML =
                    '';
                flag1 = 0;

            }

            if (!validatePhoneNo(phoneno)) {
                document.getElementById("error-phoneno").innerHTML =
                    '<ul class="errorlist"><li>Please provide a valid phone number.</li></ul>';
                flag2 = 1;
            } else {
                document.getElementById("error-phoneno").innerHTML =
                    '';
                flag2 = 0;

            }

            if (!validateUserName(userName)) {
                document.getElementById("error-username").innerHTML =
                    '<ul class="errorlist"><li>Please provide a valid username.</li></ul>';
                flag3 = 1;
            } else {
                document.getElementById("error-username").innerHTML =
                    '';
                flag3 = 0;

            }

            if (password1 != password2) {
                document.getElementById("error-password1").innerHTML =
                    '<ul class="errorlist"><li>Your passwords do not match.</li></ul>';
                flag4 = 1;
            } else {
                document.getElementById("error-password1").innerHTML =
                    '';
                flag4 = 0;

            }

            if (flag1 || flag2 || flag3 || flag4) {
                return false;
            }


        }
    </script>


</head>

<body class="fix-header fix-sidebar">
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <div id="main-wrapper">



        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/dashboard">
                            <span>
                                <img src="static/images/logo-text.png" alt="homepage" class="dark-logo" style="margin-top:50px;margin-left:180px;">
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="card">
                    <div class="basic-form">
                        <form name="myForm" action="${pageContext.request.contextPath}/sign-up" method="POST">

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-username" class="form-group has-errors text-danger small">

                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" autocomplete="off" class="form-control" maxlength="10" autofocus required id="id_username"
                                    />
                                </div>
                            </div>

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-firstname" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">First Name</label>
                               <jsp:include page="_header.jsp"></jsp:include>
                                <div class="col-sm-10">
                                    <input type="text" name="firstname" autocomplete="off" class="form-control" maxlength="10" required id="id_firstname" />
                                </div>
                            </div>

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-lastname" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Last Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="lastname" autocomplete="off" class="form-control" maxlength="10" required id="id_lastname" />
                                </div>
                            </div>

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-email" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" autocomplete="off" class="form-control" maxlength="30" required id="id_email" />
                                </div>
                            </div>

                            <div id="error-phoneno" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Phone Number</label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone_no" autocomplete="off" class="form-control" maxlength="10" required id="id_phone_no" />
                                </div>
                            </div>

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-password1" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password1" autocomplete="off" class="form-control" maxlength="10" required id="id_password1"
                                    />
                                </div>
                            </div>

                            <div class="form-group has-errors text-danger small">

                            </div>
                            <div id="error-password2" class="form-group has-errors text-danger small">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-10 control-label">Password Confirmation</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password2" autocomplete="off" class="form-control" maxlength="10" required id="id_password2"
                                    />
                                </div>
                            </div>

                            <button type="submit" onclick="return validateForm()" class="btn btn-primary" style="width:100%">Sign me up!</button>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>

        </div>
    </div>
     <jsp:include page="_footer.jsp"></jsp:include>

    </div>