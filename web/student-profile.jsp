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
	<%@ include file="includes/header-student.jsp" %>		
			
			<div id="section5" class="Material-contact-section section-dark">
				<div class="col-md-12  noPadding">
                                    
					<div class="row">
                                            
                                            <div class="col-md-1"></div>
						<div class="col-md-5">
                                                    <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Student details updated successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                   <div class="col-md-10">
                                                    <h3 align="left">My Profile</h3><br>
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    int id=(Integer)session.getAttribute("userlogin");
                                    ResultSet rs=db.getStudentById(id);
                                    while(rs.next()){
                                    %>
                                   
                                        
                                    <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="editmystudent"/>
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
                                                                            <label class="control-label">Enroll No.</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject"value="<%=rs.getString("enrollno")%>" type="text" name="enrollno" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                   
                                                                    <!-- Subject -->
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Address</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" value="<%=rs.getString("address")%>" type="text" name="address" required data-error="">
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
                                                                            
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Year</label>
                                                                           <select class="form-control myInputFooter" name="year" required >
                                                                                <option value="">Select year</option>
                                                                                <option value="1" <% if(rs.getString("year").equals("1")){ out.println("selected"); } %>>1</option>
                                                                                <option value="2" <% if(rs.getString("year").equals("2")){ out.println("selected"); } %>>2</option>
                                                                                <option value="3" <% if(rs.getString("year").equals("3")){ out.println("selected"); } %>>3</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Semester</label>
                                                                            <select class="form-control myInputFooter" name="semester" required >
                                                                                <option value="">Select Semester</option>
                                                                                <option value="1" <% if(rs.getString("semester").equals("1")){ out.println("selected"); } %>>1</option>
                                                                                <option value="2" <% if(rs.getString("semester").equals("2")){ out.println("selected"); } %>>2</option>
                                                                                <option value="3" <% if(rs.getString("semester").equals("3")){ out.println("selected"); } %>>3</option>
                                                                                <option value="4" <% if(rs.getString("semester").equals("4")){ out.println("selected"); } %>>4</option>
                                                                                <option value="5" <% if(rs.getString("semester").equals("5")){ out.println("selected"); } %>>5</option>
                                                                                <option value="6" <% if(rs.getString("semester").equals("6")){ out.println("selected"); } %>>6</option>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Select Class teacher</label>
                                                                           <select class="form-control myInputFooter" name="faculty_id" required >
                                                                                <option value="">Select faculty</option>
                                                                                <%
                                                                                ResultSet res=db.getFaculties();
                                                                                while(res.next()){
                                                                                %>
                                                                                <option value="<%=res.getInt("id")%>" <% if(res.getString("id").equals(rs.getString("faculty_id"))){ out.println("selected"); } %>><%=res.getString("name")%></option>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-default form-control myButton">Update</button>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                    <%
                                        j++;
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
						</div>
                                                </div>
                                                <div class="col-md-5">
                                                   <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("11"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Student password changed successfully!</div><br><br>");
                                                    }
                                                    if(status.equals("33"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Password not matched!</div><br><br>");
                                                    }
                                                    if(status.equals("22"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Current password not exist!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <div class="col-md-10">
                                                    <h3 align="left">Change Password</h3><br>
                                                    
                                                    <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="changestudpass"/>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Current Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="password" name="currpass" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="password" name="newpass" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Confirm Password</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="password" name="confpass" required data-error="">
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