<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
       <jsp:include page="_header2.jsp"></jsp:include>
       
       
        <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <h4 class="card-title">Enter Details</h4>
                            <form action="${pageContext.request.contextPath}/aadhar-card" method="POST">


                                <div class="form-group has-errors text-danger small">

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-10 control-label">Full Name as Per Aadhar</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="owner" autocomplete="off" class="form-control" maxlength="100" id="owner" required />
                                    </div>
                                </div>

                                <div id="error-name" class="form-group has-errors text-danger small">
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-10 control-label">Aadhar Number</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="number" autocomplete="off" class="form-control" maxlength="15" id="cardNumber" required />
                                    </div>
                                </div>
                                <div id="error-card" class="form-group has-errors text-danger small">
                                </div>
                        
                        <div class="form-group">
                            <label class="col-sm-10 control-label">PAN</label>
                            <div class="col-sm-10">
                                <input type="password" name="input_pan" autocomplete="off" class="form-control" maxlength="10" id="pan" required />
                            </div>
                        </div>
                        <div id="error-pan" class="form-group has-errors text-danger small">
                            

                       </div>

                            <!-- <div class="form-group">
                                
                                <div class="col-sm-10">
                                    <input type="number" name="exp_date" autocomplete="off" class="form-control" maxlength="6" id="id_exp_date" required />
                                </div>
                            </div> -->
 
                         <button type="submit" onclick="return validate1()" class="btn btn-success" style="width:100%; margin-top: 30px;">Link Aadhar</button>
							

                            </form>
                        </div>



                        </div>
                    </div>
                </div>
       
         <script type="text/javascript">

        function validate1() {
            var cno = document.getElementById("cardNumber");
            var pno = document.getElementById("pan");
            console.log("CNO " + cno.value);
            
            var flag1 = 0,
                flag2 = 0,
                flag3 = 0;

            // var cardno = 
            var cno1 = /^\d{4}\s\d{4}\s\d{4}$/
            var pan = /^[A-Za-z]{5}\d{4}[A-Za-z]{1}$/
            var name = document.getElementById("owner");
            var nameval = /^[a-zA-Z]+$/;
            
        
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
            	console.log("CARD NUMBER DOES NOT MATCH");
                document.getElementById("error-card").innerHTML =
                    '<ul class="errorlist"><li>Enter valid card number.</li></ul>';
                    flag2=1;

            } else {
                document.getElementById("error-card").innerHTML =
                    '';
                    flag2=0;
            }
            
            if (!pno.value.match(pan)) {
                document.getElementById("error-pan").innerHTML =
                    '<ul class="errorlist"><li>Enter valid pan number.</li></ul>';
                    flag3=1;

            } else {
                document.getElementById("error-pan").innerHTML =
                    '';
                    flag3=0;
            }
           

            if(!flag1 && !flag2 && !flag3) {
            		return true;
            }
            else {
            	return false;
            }




        }



    </script>
    
       <jsp:include page="_footer2.jsp"></jsp:include>
    