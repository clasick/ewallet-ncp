<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
       <jsp:include page="_header2.jsp"></jsp:include>
<div class="container-fluid">

    <div class="row">
        <div class="col-lg-4">
            <div class="card">
                <!-- <div class="col-lg-2"> -->
                <div class="recent-comment">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img alt="..." src="static/images/twitter-avatar.png" class="media-object">
                            </a>
                        </div>
                        <!-- <div class="media-body">
                            <h4 class="media-heading">User</h4>
                                <p>Koushik M </p>
                            <h5 class="media-heading">Full Name</h5>
                                <p>Koushik Mani </p>
                            <h5 class="media-heading">Email</h5>
                                <p>koushik241998@gmail.com</p>
                            <h5 class="media-heading">Phone Number</h5>
                                <p>9487252289</p>    
                        </div> -->
                        <div class="container">
                                <table class="table table-hover">
                                        <thead>
                                          <tr>
                                            <th>Firstname</th>
                                            <td>${firstname}</td>
                                          </tr>
                                          <tr>
                                                <th>Lastname</th>
                                                <td>${lastname}</td>
                                              </tr>
                                              <tr>
                                                    <th>Email</th>
                                                    <td>${email}</td>
                                                  </tr>
                                                  <tr>
                                                        <th>Phone number</th>
                                                        <td>${phoneno}</td>
                                                      </tr> 
                                                       <tr>
                                                        <th>Balance</th>
                                                        <td>${balance}</td>
                                                      </tr> 
                                        </thead>
                                       
                                       
                                      </table>
                                
                        </div>
                  
                <!-- </div> -->
                <!-- <a href="/edit-profile"></a> -->

                
                        </div>
                    </div>

            </div>
            
        </div>
        
    </div>

    <button type="button" class="btn btn-warning" onclick="alert('Will be redirected to an edit page.')"><i class="fa fa-pencil-square-o"></i> Update Details</button> 
        </div>
    </div>
    
         <jsp:include page="_footer2.jsp"></jsp:include>
         
         
         
         
         
  