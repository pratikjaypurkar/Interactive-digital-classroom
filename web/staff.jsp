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
			<%@ include file="includes/header.jsp" %>
			
			<div id="section2" class="col-md-12 noPadding text-center">
					<h1 class="mainText">Total Staff</h1>
					<table class="table bgfrom" style="width:80%" align="center">
                                    <tr><th>ID</th><th>Name</th><th>Email</th><th>Qualification</th><th>Mobile No.</th><th>Address</th></tr>
                                                    <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    ResultSet rs=db.getFaculties();
                                    while(rs.next()){
                                    %>
                                    <tr>
                                        
                                        <td align="left"><%=rs.getString("facultyid")%></td>
                                        <td align="left"><%=rs.getString("name")%></td>
                                        <td align="left"><%=rs.getString("email")%></td>
                                        <td align="left"><%=rs.getString("qualification")%></td>
                                        <td align="left"><%=rs.getString("mobile")%></td>
                                        <td align="left"><%=rs.getString("address")%></td>
                                        <td>
                                            
                                             <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <input type="hidden" name="table" value="faculty"/>
                                                
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        j++;
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
                                    </table>
					</div>
                                        
			</div>
			<div class="col-md-12 noPadding">
				<div class="filterBack"></div>
				<div class="abs text-center">
					<h2 class="absTitle">Interactive Digital Classroom</h2>
					<img src="img/shape.png">
					<p class="absText">One of the best digital classroom service</p>
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