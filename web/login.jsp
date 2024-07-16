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
									<label class="control-label" for="name">Email ID</label>
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
                                
                                                    <!--<div class="col-md-12" style="background-color: #999494; height: 7px;"><hr></div>-->
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
                                                            <!--<img src="img/digital.webp" style=" padding-top: 20px; width:100%; height: 550px;">--> 
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