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
						<div class="col-md-10">
                                                
                                                   <div class="col-md-12">
                                                                                               
                                                    <h3 align="left">Videos</h3><br>
                                                     <table class="table bgfrom" style="width:100%">
                                    <tr><th>File Name</th><th>Subject</th><th align="right">Action</th></tr>
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int id=(Integer)session.getAttribute("userlogin");
                                    ResultSet rss=db.getStudentById(id);
                                    rss.next();
                                        
                                    int year=rss.getInt("year");
                                    
                                    int semester=rss.getInt("semester");
                                    
                                    String branch=rss.getString("branch");
//                                    out.println(branch);
                                    ResultSet rs=db.getVideoForStudent(year,semester,branch);
                                    while(rs.next()){
                                    %>
                                   
                                        <tr>
                                        <td align="left"><%=rs.getString("name")%></td>
                                        <td align="left"><%=rs.getString("subject")%></td>
                                        <td align="left">
                                             <video width="320" height="240" controls>
                                                <source src="uploads/files/<%=rs.getString("file")%>" type="video/mp4">
                                                <source src="uploads/files/<%=rs.getString("file")%>" type="video/ogg">
                                              Your browser does not support the video tag.
                                              </video> 
                                    </tr>
                                    <%
                                        
                                       }
                                    }catch(Exception e){
                                    System.out.println(e);
                                    }
                                    %>
                                    </table>
						</div>
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