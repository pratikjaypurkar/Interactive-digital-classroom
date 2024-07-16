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
				<div class="col-md-12  noPadding text-center">
                                    
					<div class="row">
                                            
                                            <div class="col-md-1"></div>
						<div class="col-md-9">
                                                   
                                                    <h3 align="left">Student Details</h3>
                                                    <table class="table bgfrom" style="width:100%">
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    int id=Integer.parseInt(request.getParameter("studid"));
                                    ResultSet rs=db.getStudentById(id);
                                    while(rs.next()){
                                    %>
                                    <tr><th>Name</th><td align="left"><%=rs.getString("name")%></td></tr>
                                    <tr><th>Enroll No</th><td align="left"><%=rs.getString("enrollno")%></td></tr>
                                    <tr><th>Address</th><td align="left"><%=rs.getString("address")%></td></tr>
                                    <tr><th>Email</th><td align="left"><%=rs.getString("email")%></td></tr>
                                    <tr><th>Branch</th><td align="left"><%=rs.getString("branch")%></td></tr>
                                    <tr><th>Gender</th><td align="left"><%=rs.getString("gender")%></td></tr>
                                    <tr><th>Year</th><td align="left"><%=rs.getString("year")%></td></tr>
                                    <tr><th>Semester</th><td align="left"><%=rs.getString("semester")%></td></tr>
                                    
                                        
                                    
                                    <%
                                        j++;
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
                                    </table>
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