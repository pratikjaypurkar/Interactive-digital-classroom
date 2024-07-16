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
			<div id="section5" class="">
                            <div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row">
                                             
						<!-- Section Titile -->
						<div class="col-md-12 text-center ">
                                                    <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Your contact form submitted successfully!</div><br><br>");
                                                    }
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
							<h2 class="mainText">Contact</h2>
							<img src="img/shapegreen.png">
						</div>
					</div>
					<div class="row">
						<!-- Section Titile -->
                                                <div class="col-md-6 contact-widget-section2" style="color: white; font-size: 18px;">
							
							<div class="find-widget">
							Company:  <a href="https://hackteachz.blogspot.com">RockStar Group By HackTeachz</a>
							</div>
							<div class="find-widget">
							Address: <a href="#">443 Arvi ,wardha</a>
							</div>
							<div class="find-widget">
							Phone:  <a href="#">+91 9056484525</a>
							</div>
						</div>
						<!-- contact form -->
						<div class="col-md-6">
							<form class="row login_form bgfromfd" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="addcontact"/>
								<!-- Name -->
								<div class="form-group label-floating">
									<label class="control-label" for="name">Name</label>
									<input class="form-control myInputFooter" id="name" type="text" name="name" required data-error="Please enter your name">
									<div class="help-block with-errors"></div>
								</div>
								<!-- email -->
								<div class="form-group label-floating">
									<label class="control-label" for="email">Email</label>
									<input class="form-control myInputFooter" id="email" type="email" name="email" required data-error="Please enter your Email">
									<div class="help-block with-errors"></div>
								</div>
								<!-- Subject -->
								<div class="form-group label-floating">
									<label class="control-label">Subject</label>
									<input class="form-control myInputFooter" id="msg_subject" type="text" name="subject" required data-error="Please enter your message subject">
									<div class="help-block with-errors"></div>
								</div>
								<!-- Message -->
								<div class="form-group label-floating">
									<label for="message" class="control-label">Message</label>
									<textarea class="form-control myInputFooter" rows="3" id="message" name="message" required data-error="Write your message"></textarea>
									<div class="help-block with-errors"></div>
								</div>
								<!-- Form Submit -->
								<div class="form-submit">
									<button type="submit" class="btn btn-default form-control myButton">Submit</button>
									<div id="msgSubmit" class="h3 text-center hidden"></div>
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
                            <div class="col-md-2"></div>
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