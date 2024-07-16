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
						<div class="col-md-10">
                                                
                                                   <div class="col-md-12">
                                                          
                                                    <h3 align="left">Faculty Attendance</h3><br>
                                                    <form class="row login_form bgfrom" action="" method="get" >
                                                        <div class="col-md-3"> 
                                                             <div class="form-group label-floating">
                                                                            <label class="control-label" for="name">Select date</label>
                                                                            <input class="form-control myInputFooter" type="date" name="date" required data-error="">
                                                                            <div class="help-block with-errors"></div>
                                                                    </div>
                                                        </div>
                                                        <div class="col-md-3"><br>
                                                            <button type="submit" class="btn btn-danger btn-sm">Search</button>
                                                        </div>
                                                    </form>
                                                     <table class="table bgfrom" style="width:100%">
                                    <tr><th>Faculty Name</th><th>Attendance</th><th align="right">Action</th></tr>
                                                    <%
                                  
                                Database db=new Database();
                                if(request.getParameter("date")!=null){
                                try{
                                    int j=0;
                                    String date=request.getParameter("date");
                                    
                                    ResultSet rs=db.getFacultysAttendance(date);
                                    while(rs.next()){
                                        ResultSet strud=db.getFacultyById(rs.getInt("faculty_id"));
                                        if(strud.next()){
                                    %>
                                   
                                        <tr>
                                            <td align="left"><%=strud.getString("name")%></td>
                                            <td align="left">Present</td>
                                        <td>
                                            
                                             <form class="row login_form" action="includes/WebService.jsp" onchange="return this.submit();" method="post" >
                                                 <input type="hidden" value="changefacstatus" name="action" />
                                                 <input type="hidden" value="<%=rs.getInt("id")%>" name="id" />
                                                 <input type="hidden" value="<%=rs.getString("date")%>" name="date" />
                                                 <select name="verify" required class="form-control">
                                                     <option value="Disapproved" <% if(rs.getString("verify").equals("Disapproved")){ out.println("selected"); } %>>Disapproved</option>
                                                     <option value="Approved" <% if(rs.getString("verify").equals("Approved")){ out.println("selected"); } %>>Approved</option>
                                                 </select>

                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                        
                                       }
                                    }catch(Exception e){

                                    }

}
                                    %>
                                    </table>
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
    <script>
        function changestatus(this,id){
            alert($(this).val());
        }
    </script>
  </body>
</html>