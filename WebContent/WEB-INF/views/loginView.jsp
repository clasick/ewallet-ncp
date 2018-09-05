<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
     <jsp:include page="_header.jsp"></jsp:include>
    
     <div class = "container-fluid">
        <div class = "row">
                <div class = "col-md-4"></div>
            <div class = "col-md-4">
        <div class="navbar-header">
                <a class="navbar-brand" href="/dashboard">
                    
                    <span><img src="static/images/logo-text.png" alt="homepage" class="dark-logo" style="margin-top:50px;margin-left:220px;"></span>
                </a>
            </div>
            </div>
            </div>
            </div>

    <div class = "row">
            <div class = "col-md-4"></div>
        <div class = "col-md-4">
  <div class="card">
     <div class="basic-form" >
           <p style="color: red;">${errorString}</p>
            <form name="myForm" action="${pageContext.request.contextPath}/login" method="POST">
                    <input type='hidden' name='csrfmiddlewaretoken' value='lYcEe3DC0O3YDnJGLdPPHuueGF4nmEzvDctC9Dsu8w6Sxm4rbv8dBHecQlhQDpC0' />
     
                    <input type='hidden' name='csrfmiddlewaretoken' value='lYcEe3DC0O3YDnJGLdPPHuueGF4nmEzvDctC9Dsu8w6Sxm4rbv8dBHecQlhQDpC0' />
                    
                    
                    <div class="form-group has-errors text-danger small">
                        
                    </div>
                    <div class="form-group has-errors text-danger small">
                    </div>
                    
                    <div class="form-group has-errors text-danger small">
                        
                    </div>
                    <div class="form-group has-errors text-danger small">
                    </div>
                      
                    <div class="col-sm-10" >  


                        <div id= "error-username" class="form-group has-errors text-danger small"></div>                   
                            <label class="col-sm-10 control-label">Username</label>
                    </br>
                            <input type="text" name="username" autocomplete="off" class="form-control" maxlength="30" autofocus="" required="" id="id_username">
                        </br>
                        <div id= "error-password" class="form-group has-errors text-danger small"></div>

                            <label class="col-sm-10 control-label">Password</label>
                        </br>

                            <input type="password" name="password" autocomplete="off" class="form-control" maxlength="18" autofocus="" required="" id="id_password">
                        </br>

                    </div>  
                </br>
                    <button type="submit" class="btn btn-primary" style="width:100%">Login</button> 
                </form>
            </br>
            <a href="${pageContext.request.contextPath}/sign-up">
                <button class="btn btn-secondary" style="width:100%">Signup</button>
            </a>

                
            
      </div>
    </div>
      </div>
      <div class = "col-md-4"></div>

    </div>
    </div>


    

            <!-- End Container fluid  -->
            <!-- footer -->
            <!-- End footer -->
        <!-- End Page wrapper  -->
    </div>
    
   
     <jsp:include page="_footer.jsp"></jsp:include>
     
     
     
     