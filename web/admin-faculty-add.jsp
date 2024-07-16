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
			<%@ include file="includes/header-admin.jsp" %>
			
			
			<div id="section5" class="Material-contact-section section-dark">
				<div class="col-md-12  noPadding">
					
					<div class="row">
                                                <div class="col-md-4"><br></div>
						
						<!-- contact form -->
						<div class="col-md-4">
                                                        <div class="col-md-12 noPadding">
                                                            <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>New faculty registered successfully!</div><br><br>");
                                                    }
                                                    if(status.equals("3"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Password does not match!</div><br><br>");
                                                    }
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                                <h2 class="mainText text-center">Faculty Registration</h2>
                                                                <center><img  src="img/shapegreen.png"></center>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="addfaculty"/>
                                                                    <!-- Name -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="name">Name</label>
                                                                            <input class="form-control myInputFooter" id="name" type="text" name="name" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Email</label>
                                                                            <input class="form-control myInputFooter" id="email" type="email" name="email" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">ID</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number" maxlength = "9" name="id" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Mobile No.</label>
                                                                            <input class="form-control myInputFooter" id="email" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number" maxlength = "10" pattern="[0-9]{10}" name="mobile" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Address</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="address" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Qualification</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="qualification" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Subject</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="subject" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                   
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Branch</label>
                                                                            <select class="myInputFooter form-control" name="branch" required >
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
                                                                            <label class="control-label">Gender</label>
                                                                            <label><input class="form-control " id="msg_subject" type="radio" name="gender">Male</label>
                                                                            <label><input class="form-control " id="msg_subject" type="radio" name="gender">Female</label>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="password" name="password" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Confirm Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="password" name="confpassword" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-default form-control myButton">Submit</button>
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