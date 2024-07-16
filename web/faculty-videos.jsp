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
	<%@ include file="includes/header-faculty.jsp" %>		
			
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
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Video deleted successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <h3 align="left">Videos</h3><br>
                                                     <table class="table bgfrom" style="width:100%">
                                    <tr><th>File Name</th><th>Year/Semester/Subject</th><th align="right">Action</th></tr>
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    int id=(Integer)session.getAttribute("facultylogin");
                                    ResultSet rs=db.getFacultyVideos(id);
                                    while(rs.next()){
                                    %>
                                   
                                        <tr>
                                            <td align="left"><a href="uploads/files/<%=rs.getString("file")%>"><%=rs.getString("name")%></a></td>
                                        <td align="left"><%=rs.getString("year")%> / <%=rs.getString("semester")%> / <%=rs.getString("subject")%></td>
                                        <td>
                                            
                                             <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <input type="hidden" name="table" value="faculty_files"/>
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
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>File added successfully!</div><br><br>");
                                                    }
                                                    
                                                   
                                                    
                             }
                    catch(Exception e){}
                    %>
                                </center>
                                                    <div class="col-md-10">
                                                    <h3 align="left">Add Video</h3><br>
                                                    <% if(request.getParameter("name")==null){ %>
                                                    <form class="row login_form bgfrom" action="includes/WebService.jsp" method="post" >
                                                                <input type="hidden" name="action" value="selectvfile"/>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">File Name</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="name" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Subject name</label>
                                                                            <input class="form-control myInputFooter" id="msg_subject" type="text" name="subject" required data-error="">
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
                                                                    
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-4 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-success">Select File</button>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                                            <% } if(request.getParameter("name")!=null){ %>
                                                             <div class="form-group label-floating">
                                                                            <label class="control-label">File Name</label>
                                                                            <input class="form-control" type="text" value="<%=request.getParameter("name")%>" readonly>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Subject name</label>
                                                                            <input class="form-control" type="text" value="<%=request.getParameter("subject")%>" readonly>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Year</label>
                                                                            <input class="form-control" type="text" value="<%=request.getParameter("year")%>" readonly>
                                                                    </div>
                                                                    
                                                                    <div class="form-group label-floating">
                                                                            <label class="control-label">Semester</label>
                                                                            <input class="form-control" type="text" value="<%=request.getParameter("semester")%>" readonly>
                                                                    </div>
                                                                    
                                                                    
                                                            <form class="row login_form" action="includes/uploadVideoFiles.jsp?name=<%=request.getParameter("name")%>&subject=<%=request.getParameter("subject")%>&year=<%=request.getParameter("year")%>&semester=<%=request.getParameter("semester")%>&mid=<%=session.getAttribute("facultylogin")%>" enctype="multipart/form-data" method="post" >
                                                                   <div class="form-group label-floating">
                                                                            <label class="control-label">Select File</label>
                                                                            <input class="form-control myInputFooter" id="" type="file" name="file">
                                                                    </div>
                                                                    
                                                                    <!-- Form Submit -->
                                                                    <div class="form-submit col-md-12 col-md-offset-4">
                                                                            <button type="submit" class="btn btn-success">Submit</button>
                                                                            <a href="faculty-files.jsp"><button type="button" class="btn btn-waring">Reset</button></a>
                                                                            <div class="clearfix"></div>
                                                                    </div>
                                                            </form>
                                                            <% } %>
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