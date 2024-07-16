<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
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
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Faculty details updated successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                                <h2 class="mainText text-center">Faculty Details</h2>
                                                                <center><img  src="img/shapegreen.png"></center>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <%
                                  
                                Database db=new Database();
                                try{
                                    int i=1;
                                    int id=Integer.parseInt(request.getParameter("facid"));
                                    ResultSet rs=db.getFacultyById(id);
                                    while(rs.next()){
                                    %>
                                                            <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="editfaculty"/>
                                                                <input type="hidden" name="facid" value="<%=id%>"/>
                                                                    <!-- Name -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="name">Name</label>
                                                                            <input class="form-control myInputFooter" id="name" value="<%=rs.getString("name")%>" type="text" name="name" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Email</label>
                                                                            <input class="form-control myInputFooter" id="email" value="<%=rs.getString("email")%>" type="email" name="email" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">ID</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject"value="<%=rs.getString("facultyid")%>" type="text" name="id" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- email -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label" for="email">Mobile No.</label>
                                                                            <input class="form-control myInputFooter" id="email" type="text" value="<%=rs.getString("mobile")%>" name="mobile" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Address</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" value="<%=rs.getString("address")%>" type="text" name="address" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Qualification</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" value="<%=rs.getString("qualification")%>" name="qualification" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Subject</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" value="<%=rs.getString("subject")%>" type="text" name="subject" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                   
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Branch</label>
                                                                            <select class="myInputFooter form-control" name="branch" required >
                                                                                <option value="">Select Branch</option>
                                                                                <option value="CO" <% if(rs.getString("branch").equals("CO")){ out.println("selected"); } %>>CO</option>
                                                                                <option value="ET" <% if(rs.getString("branch").equals("ET")){ out.println("selected"); } %>>ET</option>
                                                                                <option value="ME" <% if(rs.getString("branch").equals("ME")){ out.println("selected"); } %>>ME</option>
                                                                                <option value="CE" <% if(rs.getString("branch").equals("CE")){ out.println("selected"); } %>>CE</option>
                                                                                <option value="CH" <% if(rs.getString("branch").equals("CH")){ out.println("selected"); } %>>CH</option>
                                                                                <option value="EE" <% if(rs.getString("branch").equals("EE")){ out.println("selected"); } %>>EE</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Gender</label>
                                                                             <label><input type="radio" class="form-control" <% if(rs.getString("gender").equals("Male")){ out.println("checked"); } %> name="gender" value="Male"> Male</label>
                                                                             <label><input type="radio" class="form-control" <% if(rs.getString("gender").equals("Female")){ out.println("checked"); } %> name="gender" value="Female"> Female</label>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-default form-control myButton">Update</button>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                                             <%
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
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