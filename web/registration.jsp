<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Interactive Digital Classroom</title>
	<link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap&subset=latin-ext" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

  </head>
  <body>
			<%@ include file="includes/header.jsp" %>
			
			
			<div id="section5" class="Material-contact-section section-dark">
				<div class="col-md-12  noPadding text-center">
					
					<div class="row">
                                                <div class="col-md-1"></div>
						<div class="col-md-4">
                                                    <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                    if(status.equals("10"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Username/Password Invalid!</div><br><br>");
                                                    }
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <div class="col-md-12 noPadding text-center">
                                                            <h2 class="mainText">Student Login</h2>
                                                            <img src="img/shapegreen.png">
                                                    </div>
                                                    <div class="col-md-12">
                                                         <form class="bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="loginuser"/>
                                                                <input type="hidden" name="usertype" value="student"/>
								<div class="form-group label-floating">
									<label class="control-label" for="name">Username</label>
									<input class="form-control myInputFooter" id="name" type="text" name="uname" required data-error="Please enter username">
									<div class="help-block with-errors"></div>
								</div>
								<!-- email -->
								<div class="form-group label-floating">
									<label class="control-label" for="email">Password</label>
									<input class="form-control myInputFooter" id="email" type="password" name="pass" required data-error="Please enter password">
									<div class="help-block with-errors"></div>
								</div>
								<!-- Form Submit -->
								<div class="form-submit col-md-4 col-md-offset-4">
									<button type="submit" class="btn btn-default form-control myButton">Login</button>
									<div id="msgSubmit" class="h3 text-center hidden"></div>
									<div class="clearfix"></div>
								</div>
							</form>
                                                    </div>
                                                    <div class="col-md-12" style="background-color: #999494; height: 7px;"><hr></div>
                                                    <div class="col-md-12">
                                                        <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                    if(status.equals("11"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Username/Password Invalid!</div><br><br>");
                                                    }
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                        <div class="col-md-12 noPadding text-center">
                                                                <h2 class="mainText">Faculty Login</h2>
                                                                <img src="img/shapegreen.png">
                                                        </div>
                                                        <div class="col-md-12">
                                                            <form class="bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="loginuser"/>
                                                                <input type="hidden" name="usertype" value="faculty"/>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="name">Username</label>
                                                                            <input class="form-control myInputFooter" id="name" type="text" name="uname" required data-error="Please enter username">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Password</label>
                                                                            <input class="form-control myInputFooter" id="email" type="password" name="pass" required data-error="Please enter password">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-default form-control myButton">Login</button>
                                                                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                                        </div>
                                                    </div>
						</div>
						<!-- contact form -->
						<div class="col-md-6">
                                                        <div class="col-md-12 noPadding text-center">
                                                            <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>New student registered successfully!</div><br><br>");
                                                    }
                                                    if(status.equals("3"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Password does not match!</div><br><br>");
                                                    }
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                                <h2 class="mainText">Student Registration</h2>
                                                                <img src="img/shapegreen.png">
                                                        </div>
                                                        <div class="col-md-12">
                                                            <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="addstudent"/>
                                                                    <!-- Name -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="name">Student Name</label>
                                                                            <input class="form-control myInputFooter" id="name" type="text" name="name" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Email</label>
                                                                            <input class="form-control myInputFooter" id="email" maxlength="35" type="email" name="email" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Enroll No</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number" maxlength = "9" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Mobile No.</label>
                                                                            <input class="form-control myInputFooter" id="email" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number" maxlength = "10" pattern="[0-9]{1}[0-9]{9}" title="Enter 10 digit mobile number" name="mobile" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Address</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="address" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                   
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Branch</label>
                                                                            <select class="form-control myInputFooter" name="branch" required >
                                                                                <option value="">Select Branch</option>
                                                                                <option value="CO">CO</option>
                                                                                <option value="ET">ET</option>
                                                                                <option value="ME">ME</option>
                                                                                <option value="CE">CE</option>
                                                                                <option value="CH">CH</option>
                                                                                <option value="EE">EE</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Year</label>
                                                                           <select class="form-control myInputFooter" name="year" required >
                                                                                <option value="">Select year</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Semester</label>
                                                                            <select class="form-control myInputFooter" name="semester" required >
                                                                                <option value="">Select Semester</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6">6</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Gender</label>
                                                                            <label><input class="form-control " id="msg_subject" type="radio" name="gender">Male</label>
                                                                            <label><input class="form-control " id="msg_subject" type="radio" name="gender">Female</label>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" type="password" name="password" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Confirm Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" type="password" name="confirmpassword" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-default form-control myButton">Submit</button>
                                                                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                                        </div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="includes/footer.jsp" %>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/ajax-mail.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>