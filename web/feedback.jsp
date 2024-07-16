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
			
			<div id="section2" class="col-md-12 noPadding">
                                <div class="col-md-12 text-center">
                                    <h1 class="mainText">News</h1>
                                    <img src="img/shapegreen.png">
                                </div>
                             <%
                                  
                                Database db=new Database();
                                 
                                try{
                                    int j=0;
                                    ResultSet rs=db.getFeedbacks();
                                    while(rs.next()){
                                    %>
                                <div class="col-md-12">
                                    <div class="col-md-2" ></div>
                                    <div class="col-md-8 bgfromfd">
                                        
                                        <small>Date :<%=rs.getString("date")%></small><h4><%=rs.getString("name")%></h4>
                                        <p class="myTextMain"><%=rs.getString("description")%></p>
                                        
                                        
                                    </div>
                                    
                                </div>
                                        
                                 <%
                                        
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
                                
                        </div>
                                    <div>
                                        <br>
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