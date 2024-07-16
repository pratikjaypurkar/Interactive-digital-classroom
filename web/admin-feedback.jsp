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
                                            
                                            <div class="col-md-1"></div>
						<div class="col-md-6">
                                                
                                                   <div class="col-md-12">
                                                                                                    <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Feedback deleted successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <h3 align="left">News</h3><br>
                                                     <table class="table bgfrom" style="width:100%">
                                                         <tr><th>Name</th><th>Date</th><th>Description</th><th align="right">Action</th></tr>
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    ResultSet rs=db.getFeedbacks();
                                    while(rs.next()){
                                    %>
                                   
                                        <tr>
                                        <td align="left"><%=rs.getString("name")%></td>
                                        <td align="left"><%=rs.getString("date")%></td>
                                        <td align="left"><%=rs.getString("description")%></td>
                                        <td>
                                            
                                             <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <input type="hidden" name="table" value="feedback"/>
                                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
                                    </table>
						</div>
                                                </div>
                                                <div class="col-md-4">
                                                   <center>
                                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Feedback added successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <div class="col-md-10">
                                                    <h3 align="left">Add New News</h3><br>
                                                    
                                                    <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="addfeedback"/>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Name</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="name" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                <div class="form-group label-floating">
                                                                            <label class="control-label">Date</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="date" name="date" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Description</label>
                                                                            <textarea class="form-control myInputFooter" name="description" required data-error=""></textarea>
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