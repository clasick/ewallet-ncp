<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
       <jsp:include page="_header2.jsp"></jsp:include>
       
       
        <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <h4 class="card-title">Enter Details</h4>
                            <form action="${pageContext.request.contextPath}/credit-card" method="POST">


                                <div class="form-group has-errors text-danger small">

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-10 control-label">Owner</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="owner" autocomplete="off" class="form-control" maxlength="100" id="owner" required />
                                    </div>
                                </div>

                                <div id="error-name" class="form-group has-errors text-danger small">
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-10 control-label">Card Number</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="number" autocomplete="off" class="form-control" maxlength="16" id="cardNumber" required />
                                    </div>
                                </div>
                                <div id="error-card" class="form-group has-errors text-danger small">
                                </div>
                        
                        <div class="form-group">
                            <label class="col-sm-10 control-label">CVV</label>
                            <div class="col-sm-10">
                                <input type="password" name="input_cvv" autocomplete="off" class="form-control" maxlength="3" id="cvv" required />
                            </div>
                        </div>
                        <div id="error-cvv" class="form-group has-errors text-danger small">
                            

                       </div>

                            <!-- <div class="form-group">
                                
                                <div class="col-sm-10">
                                    <input type="number" name="exp_date" autocomplete="off" class="form-control" maxlength="6" id="id_exp_date" required />
                                </div>
                            </div> -->
                            <div class="form-group" id="id_exp_date">
                                    <label class="col-sm-10 control-label">Expiry Date</label>
                                    <div class="col-sm-10">
                                    <select name="expiry_month">
                                        <option value="01">January</option>
                                        <option value="02">February </option>
                                        <option value="03">March</option>
                                        <option value="04">April</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">August</option>
                                        <option value="09">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                    <select name="expiry_year">
                                        <option value="16"> 2016</option>
                                        <option value="17"> 2017</option>
                                        <option value="18"> 2018</option>
                                        <option value="19"> 2019</option>
                                        <option value="20"> 2020</option>
                                        <option value="21"> 2021</option>
                                    </select>
                                    </div>
                                </div>
                                
                         <button type="submit" onclick="return validate1()" class="btn btn-success" style="width:100%; margin-top: 30px;">Link Card</button>
							

                            </form>
                        </div>



                        </div>
                    </div>
                </div>
       
         <script type="text/javascript">

        function validate1() {
            var cno = document.getElementById("cardNumber");
            console.log("CNO " + cno.value);
            var cvv1 = document.getElementById("cvv");
            console.log("cvv1:  " + cvv1.value);

            var flag1 = 0,
                flag2 = 0,
                flag3 = 0;

            // var cardno = 
            var cno1 = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11}|62[0-9]{14})$/
            var name = document.getElementById("owner");
            var nameval = /^[a-zA-Z]*.[a-zA-Z]*$/;
            if (!name.value.match(nameval)) {
                document.getElementById("error-name").innerHTML =
                    '<ul class="errorlist"><li>Enter valid name.</li></ul>';
                    flag1= 1;

            } else {
                document.getElementById("error-name").innerHTML =
                    '';
                    flag1=0;
            }


            if (!cno.value.match(cno1)) {
                document.getElementById("error-card").innerHTML =
                    '<ul class="errorlist"><li>Enter valid card number.</li></ul>';
                    flag2=1;

            } else {
                document.getElementById("error-card").innerHTML =
                    '';
                    flag2=0;
            }
            console.log(cvv1.value.length != 3);
            if (cvv1.value.length != 3) {
                document.getElementById("error-cvv").innerHTML =
                    '<ul class="errorlist"><li>Enter valid CVV number.</li></ul>';
                    flag3=1;

            } else {
                document.getElementById("error-cvv").innerHTML =
                    '';
                    flag3=0;
            }

  var inputText = document.getElementById("id_exp_date");
  

            if(!flag1 && !flag2 && !flag3) {
            		return true;
            }
            else {
            	return false;
            }




        }



    </script>
    
       <jsp:include page="_footer2.jsp"></jsp:include>
    