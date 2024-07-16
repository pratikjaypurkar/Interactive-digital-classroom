
<%--<%@page import="database.sendSMS"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db=new Database();
//    sendSMS sms=new sendSMS();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "addnews":
            String title=request.getParameter("title");
            String description=request.getParameter("description");
            boolean res=db.addNews(title,description);
            if(res){
                    response.sendRedirect("../faculty-notifications.jsp?status=1");
            }
            break;
         case "editnews":
            String nid=request.getParameter("id");
            String utitle=request.getParameter("title");
            String udescription=request.getParameter("description");
            int resuserpro=db.update_delete("update notifications set title='"+utitle+"', description='"+udescription+"' where id="+nid);
            if(resuserpro>0){
                response.sendRedirect("../faculty-notifications.jsp?status=2");
            }else{
                response.sendRedirect("../faculty-notifications.jsp?status=0");
            }
            break;
        case "addfeedback":
            String fbname=request.getParameter("name");
            String fbdate=request.getParameter("date");
            String fdescription=request.getParameter("description");
            
            boolean fres=db.addFeedback(fbname,fbdate,fdescription);
            out.println(fres);
            if(fres){
                    response.sendRedirect("../admin-feedback.jsp?status=1");
            }
            break;
        case "addfaculty":
            String mname=request.getParameter("name");
            String id=request.getParameter("id");
            String address=request.getParameter("address");
            String qualification=request.getParameter("qualification");
            String email=request.getParameter("email");
            String branch=request.getParameter("branch");
            String mobile=request.getParameter("mobile");
            String gender=request.getParameter("gender");
            String subject=request.getParameter("subject");
            String password=request.getParameter("password");
            String confpassword=request.getParameter("confpassword");
            if(password.equals(confpassword)){
                int res2=db.update_delete("insert into faculty (name,qualification,facultyid,address,email,branch,mobile,gender,password,subject) value('"+mname+"','"+qualification+"','"+id+"','"+address+"','"+email+"','"+branch+"','"+mobile+"','"+gender+"','"+password+"','"+subject+"')");
                if(res2>0){
                    response.sendRedirect("../admin-faculty-add.jsp?status=1");
                }
            }else{
                response.sendRedirect("../admin-faculty-add.jsp?status=3");
            }
            
            break;
        case "editfaculty":
            int mid=Integer.parseInt(request.getParameter("facid"));
            String fname=request.getParameter("name");
            String fid=request.getParameter("id");
            String faddress=request.getParameter("address");
            String fqualification=request.getParameter("qualification");
            String fbranch=request.getParameter("branch");
            String fmobile=request.getParameter("mobile");
            String fsubject=request.getParameter("subject");
            String fgender=request.getParameter("gender");
            int emin=db.update_delete("update faculty set name='"+fname+"', qualification='"+fqualification+"', facultyid='"+fid+"',address='"+faddress+"',branch='"+fbranch+"',mobile='"+fmobile+"',gender='"+fgender+"',subject='"+fsubject+"' where id="+mid);
            if(emin>0){
                response.sendRedirect("../admin-faculty-edit.jsp?facid="+mid+"&status=1");
            }else{
                response.sendRedirect("../admin-faculty-edit.jsp?facid="+mid+"status=0");
            }
            break;
        case "editmyfaculty":
            int emid=Integer.parseInt(request.getParameter("facid"));
            String efname=request.getParameter("name");
            String efid=request.getParameter("id");
            String efaddress=request.getParameter("address");
            String efqualification=request.getParameter("qualification");
            String efbranch=request.getParameter("branch");
            String efmobile=request.getParameter("mobile");
            String efsubject=request.getParameter("subject");
            String efgender=request.getParameter("gender");
            int eemin=db.update_delete("update faculty set name='"+efname+"',qualification='"+efqualification+"', facultyid='"+efid+"',address='"+efaddress+"',branch='"+efbranch+"',mobile='"+efmobile+"',gender='"+efgender+"',subject='"+efsubject+"' where id="+emid);
            if(eemin>0){
                response.sendRedirect("../faculty-profile.jsp?status=1");
            }else{
                response.sendRedirect("../faculty-profile.jsp?status=0");
            }
            break;
        case "loginuser":
            String uusername=request.getParameter("uname");
            String upassword=request.getParameter("pass");
            String usertype=request.getParameter("usertype"); 
            if(usertype.equals("faculty")){
                int resuser=db.checkFacultyLogin(uusername,upassword);
                if(resuser>0){
                    session.setAttribute("facultylogin",resuser);
                    response.sendRedirect("../faculty-profile.jsp");
                }else{
                    response.sendRedirect("../login.jsp?status=11");
                }
            }else if(usertype.equals("student")){
                int resuser=db.checkStudentLogin(uusername, upassword);
                if(resuser>0){
                    session.setAttribute("userlogin",resuser);
                    response.sendRedirect("../student-profile.jsp");
                }else{
                    response.sendRedirect("../login.jsp?status=10");
                }
            }else if(usertype.equals("admin")){
                int resuser=db.checkAdminLogin(uusername, upassword);
                if(resuser>0){
                    session.setAttribute("adminlogin",resuser);
                    response.sendRedirect("../admin-profile.jsp");
                }else{
                    response.sendRedirect("../admin.jsp?status=0");
                }
            }else{
                response.sendRedirect("../login.jsp?status=0");
            }
            break;
        case "changefacultypass":
            int userid=(Integer)session.getAttribute("facultylogin");
            String currpass=request.getParameter("currpass"); 
            String newpass=request.getParameter("newpass");
            String confpass=request.getParameter("confpass");
            if(newpass.equals(confpass)){
                int userpro=db.update_delete("update faculty set password='"+newpass+"' where password='"+currpass+"' and id="+userid);
                if(userpro>0){
                    response.sendRedirect("../faculty-profile.jsp?status=11");
                }else{
                    response.sendRedirect("../faculty-profile.jsp?status=22");
                }
            }else{
                response.sendRedirect("../faculty-profile.jsp?status=33");
            }
            break;
        case "addstudent":
            String sname=request.getParameter("name");
            String enrollno=request.getParameter("enrollno");
            String saddress=request.getParameter("address");
            String semail=request.getParameter("email");
            String sbranch=request.getParameter("branch");
            String sgender=request.getParameter("gender");
            String year=request.getParameter("year");
            String semester=request.getParameter("semester");
            String spassword=request.getParameter("password");
            String sconfpassword=request.getParameter("confirmpassword");
            if(spassword.equals(sconfpassword)){
                int res2=db.update_delete("insert into student (name,enrollno,address,email,branch,gender,year,semester,password) value('"+sname+"','"+enrollno+"','"+saddress+"','"+semail+"','"+sbranch+"','"+sgender+"','"+year+"','"+semester+"','"+spassword+"')");
                if(res2>0){
                    response.sendRedirect("../registration.jsp?status=1");
                }
            }else{
                response.sendRedirect("../registration.jsp?status=3");
            }
            
            break;
        case "editmystudent":
            int sid=(Integer)session.getAttribute("userlogin");
            String sfname=request.getParameter("name");
            String senrollno=request.getParameter("enrollno");
            String sfaddress=request.getParameter("address");
            String sfbranch=request.getParameter("branch");
            String syear=request.getParameter("year");
            String ssemester=request.getParameter("semester");
            int faculty_id=Integer.parseInt(request.getParameter("faculty_id"));
            String sfgender=request.getParameter("gender");
            int semin=db.update_delete("update student set name='"+sfname+"',faculty_id="+faculty_id+", enrollno='"+senrollno+"',address='"+sfaddress+"',branch='"+sfbranch+"',year='"+syear+"',semester='"+ssemester+"',gender='"+sfgender+"' where id="+sid);
            if(semin>0){
                response.sendRedirect("../student-profile.jsp?status=1");
            }else{
                response.sendRedirect("../student-profile.jsp?status=0");
            }
            break;
        case "changestudpass":
            int czuserid=(Integer)session.getAttribute("userlogin");
            String czcurrpass=request.getParameter("currpass"); 
            String cznewpass=request.getParameter("newpass");
            String czconfpass=request.getParameter("confpass");
            if(cznewpass.equals(czconfpass)){
                int userpro=db.update_delete("update student set password='"+cznewpass+"' where password='"+czcurrpass+"' and id="+czuserid);
                if(userpro>0){
                    response.sendRedirect("../student-profile.jsp?status=11");
                }else{
                    response.sendRedirect("../student-profile.jsp?status=22");
                }
            }else{
                response.sendRedirect("../student-profile.jsp?status=33");
            }
            break;
        case "delete":
            String table=request.getParameter("table");
            String did=request.getParameter("id");
            boolean dreds=db.delete(table,Integer.parseInt(did));
            if(dreds){
                if(table.equals("student")){
                    response.sendRedirect("../admin-students.jsp?status=2");
                }else if(table.equals("faculty")){
                    response.sendRedirect("../admin-faculties.jsp?status=2");
                }else if(table.equals("notifications")){
                    response.sendRedirect("../faculty-notifications.jsp?status=0");
                }else if(table.equals("feedback")){
                    response.sendRedirect("../admin-feedback.jsp?status=0");
                }else if(table.equals("faculty_files")){
                    response.sendRedirect("../faculty-files.jsp?status=0");
                }else if(table.equals("contact")){
                    response.sendRedirect("../admin-profile.jsp?status=0");
                }
            }else{
                response.sendRedirect("../?status=0");
            }
            break;
        case "addcontact":
            String name=request.getParameter("name");
            String cemail=request.getParameter("email");
            String sub=request.getParameter("subject");
            String mssg=request.getParameter("message");
                int res2=db.update_delete("insert into contact (name,email,subject,msg) value('"+name+"','"+cemail+"','"+sub+"','"+mssg+"')");
                if(res2>0){
                    response.sendRedirect("../contact.jsp?status=1");
                }
            break;
         case "addattence":
            String date=request.getParameter("date");
            int urid=(Integer)session.getAttribute("userlogin");
                int res3=db.update_delete("insert into stud_attendance (student_id,date) value("+urid+",'"+date+"')");
                
            break;
         case "addfacattence":
            String fdate=request.getParameter("date");
            int furid=(Integer)session.getAttribute("facultylogin");
                int fres3=db.update_delete("insert into fac_attendance (faculty_id,date) value("+furid+",'"+fdate+"')");
                
            break;
         case "submitassignment":
            String assid=request.getParameter("assid");
            String student_id=request.getParameter("student_id");
            String[] questionid=request.getParameterValues("questionid");
            String[] answers=request.getParameterValues("answer");
            
            for (int i = 0; i < questionid.length; i++) {
                db.update_delete("insert into assignment_students (assignment_id,assignment_question_id,student_id,answer,status) values("+assid+",'"+questionid[i]+"',"+student_id+",'"+answers[i]+"',0)"); 
            }
            response.sendRedirect("../student-assignment-details.jsp?assid="+assid+"&status=1");
                
            break;
         case "resendotp":
            String mobileno=request.getParameter("mobile");
            String noo=db.getRandomNumberString();
                    String msg="Your One Time Password (OTP) is "+noo+" for new citizen account.";
                    session.setAttribute("otpsession",noo);
                    System.out.println(noo);
//                    sms.sendSms(mobileno, msg);
                    out.println(1);
                    break;
         case "verifycitizen":
            String otp=request.getParameter("otp");
            String idd=request.getParameter("id");
            String seotp=(String)session.getAttribute("otpsession");
            if(otp.equals(seotp)){
                int uphos=db.update_delete("update citizen set status=1 where id="+idd);
                if(uphos>0){
                    response.sendRedirect("../index.jsp?status=11");
                }
            }else{
                response.sendRedirect("../citizen-otp-verify.jsp?status=0&id="+idd);
            }
            break;
        case "changestudstatus":
            String verify=request.getParameter("verify");
            String stdate=request.getParameter("date");
            String iidd=request.getParameter("id");
            int uphos=db.update_delete("update stud_attendance set verify='"+verify+"' where id="+iidd);
                if(uphos>0){
                    response.sendRedirect("../faculty-students.jsp?date="+stdate);
                }
            break;
        case "changefacstatus":
            String fverify=request.getParameter("verify");
            String fstdate=request.getParameter("date");
            String fiidd=request.getParameter("id");
            int fuphos=db.update_delete("update fac_attendance set verify='"+fverify+"' where id="+fiidd);
                if(fuphos>0){
                    response.sendRedirect("../admin-faculty-attendance.jsp?date="+fstdate);
                }
            break;
        case "addassignment":
            int crpsid=(Integer)session.getAttribute("facultylogin");
            String atitle=request.getParameter("title"); 
            String adate=request.getParameter("date");
            String abranch=request.getParameter("branch");
            String ayear=request.getParameter("year");
            String asemester=request.getParameter("semester");
            String[] aquestion=request.getParameterValues("question");
            
            int userreqres=db.addAssignmentRecord(crpsid, atitle, adate, abranch,ayear,asemester,aquestion);
            if(userreqres>0){
                response.sendRedirect("../faculty-assignments.jsp?status=1");
            }else{
                response.sendRedirect("../faculty-assignments.jsp?status=11");
            }
            break;
        case "addexam":
            int facid=(Integer)session.getAttribute("facultylogin");
            String etitle=request.getParameter("title"); 
            String edate=request.getParameter("date");
            String hours=request.getParameter("hours");
            String minutes=request.getParameter("minutes");
            String ebranch=request.getParameter("branch");
            String negative=request.getParameter("negative");
            String eyear=request.getParameter("year");
            String esemester=request.getParameter("semester");
            int neg=0;
            if(negative!=null){
                if(negative.equals("on")){
                    neg=1;
                }
            }
            int examreqres=db.addExamRecord(facid, etitle, edate,hours,minutes, ebranch,eyear,esemester,neg);
            if(examreqres>0){
                response.sendRedirect("../faculty-exams.jsp?status=1");
            }else{
                response.sendRedirect("../faculty-exams.jsp?status=11");
            }
            break;
        case "changestatus":
            String assiquesid=request.getParameter("id");
            String asid=request.getParameter("assid");
            String status=request.getParameter("status");
            int compin=db.update_delete("update assignment_students set status="+status+" where id="+assiquesid);
            if(compin>0){
                response.sendRedirect("../faculty-assignment-students.jsp?assid="+asid);
            }else{
                response.sendRedirect("../faculty-assignment-students.jsp?assid="+asid);
            }
            break;
        case "selectfile":
            String fsname=request.getParameter("name");
            String fssubject=request.getParameter("subject");
            String fyear=request.getParameter("year");
            String fsemester=request.getParameter("semester");
            
            response.sendRedirect("../faculty-files.jsp?name="+fsname+"&subject="+fssubject+"&year="+fyear+"&semester="+fsemester);
            
            break;
        case "selectvfile":
            String vsname=request.getParameter("name");
            String vssubject=request.getParameter("subject");
            String vyear=request.getParameter("year");
            String vsemester=request.getParameter("semester");
            
            response.sendRedirect("../faculty-videos.jsp?name="+vsname+"&subject="+vssubject+"&year="+vyear+"&semester="+vsemester);
            
            break;
        case "addpermission":
            int perpocid=(Integer)session.getAttribute("userlogin");
            int perpolice=Integer.parseInt(request.getParameter("police"));
            String permission=request.getParameter("permission");
            String permdate=request.getParameter("date"); 
            String edate2=request.getParameter("date2"); 
            String eaddress=request.getParameter("address"); 
            String etype=request.getParameter("type"); 
            String rname=request.getParameter("rname"); 
            
            int addper=db.addPermission(perpocid, permdate, perpolice, permission,edate2,eaddress,etype,rname);
            if(addper>0){
                response.sendRedirect("../citizen-permissions.jsp?status=1");
            }
            break;
           case "inprocessperm":
            String permid=request.getParameter("id");
            String mobileno2=request.getParameter("mobileno");
            int eppmin=db.update_delete("update permission set status=1 where id="+permid);
            if(eppmin>0){
                
//                sms.sendSms(mobileno2, "Your permission request is in process...");
                response.sendRedirect("../police-permissions.jsp?status=2");
            }else{
                response.sendRedirect("../police-permissions.jsp?status=0");
            }
            break;
          case "permappro":
            String permaid=request.getParameter("id");
            String mobileno22=request.getParameter("mobileno");
            int eppamin=db.update_delete("update permission set status=2 where id="+permaid);
            if(eppamin>0){
//                sms.sendSms(mobileno22, "Your permission request has been approved...");
                response.sendRedirect("../police-permissions.jsp?status=2");
            }else{
                response.sendRedirect("../police-permissions.jsp?status=0");
            }
            break;
          
          case "inprocesscomp":
            String comppro=request.getParameter("id");
            String mobileno1=request.getParameter("mobileno");
            int compapro=db.update_delete("update complaints set status=1 where id="+comppro);
            if(compapro>0){
//                sms.sendSms(mobileno1, "Your complaint request is in process...");
                response.sendRedirect("../police-complaints.jsp?status=2");
            }else{
                response.sendRedirect("../police-complaints.jsp?status=0");
            }
            break;
          case "inprocesscerti":
            String certpro=request.getParameter("id");
            String mobileno3=request.getParameter("mobileno");
            int certup=db.update_delete("update certificate set status=1 where id="+certpro);
            if(certup>0){
//                sms.sendSms(mobileno3, "Your certificate request is in process...");
                response.sendRedirect("../police-certificate.jsp?status=2");
            }else{
                response.sendRedirect("../police-certificate.jsp?status=0");
            }
            break;
         case "certappro":
            String certpro1=request.getParameter("id");
            String mobileno33=request.getParameter("mobileno");
            int certup1=db.update_delete("update certificate set status=2 where id="+certpro1);
            if(certup1>0){
//                sms.sendSms(mobileno33, "Your certificate request has been approved. Please collect your certificate from requested police station.");
                response.sendRedirect("../police-certificate.jsp?status=2");
            }else{
                response.sendRedirect("../police-certificate.jsp?status=0");
            }
            break;
         case "forgetuser":
            String fusername=request.getParameter("uname");
            String fusertype=request.getParameter("usertype"); 
            if(fusertype.equals("citizen")){
                try{
                    ResultSet resuser=db.checkEmailExistCitizen(fusername);
                    if(resuser.next()){
                        String mno=resuser.getString("mobileno");
                        String num=db.getRandomNumberString();
                        session.setAttribute("otp",num);
                        System.out.println(num);
//                        sms.sendSms(mno, "Your one time password(OTP) is "+num+" for reseting your password.");
                        response.sendRedirect("../forget-password-otpverify.jsp?fusertype="+fusertype+"&id="+resuser.getInt("id"));
                    }else{
                        response.sendRedirect("../forget-password.jsp?status=0");
                    }
                }catch(Exception e){
                    response.sendRedirect("../forget-password.jsp?status=0");
                    System.out.println(e);
                }
            }else if(fusertype.equals("police")){
               try{
                ResultSet resuser=db.checkEmailExistPoliceStation1(fusername);
                if(resuser.next()){
                    String mno=resuser.getString("mobile");
                    String num=db.getRandomNumberString();
                    session.setAttribute("otp",num);
                    System.out.println(num);
//                    sms.sendSms(mno, "Your one time password(OTP) is "+num+" for reseting your password.");
                    response.sendRedirect("../forget-password-otpverify.jsp?fusertype="+fusertype+"&id="+resuser.getInt("id"));
                }else{
                    response.sendRedirect("../forget-password.jsp?status=0");
                }
               }catch(Exception e){
                   response.sendRedirect("../forget-password.jsp?status=0");
                   System.out.println(e);
               }
            }else{
                response.sendRedirect("../forget-password.jsp?status=0");
            }
            break;
        case "forgetuserotp":
            String idid=request.getParameter("id");
            String resotp=request.getParameter("otp");
            String fousertype=request.getParameter("usertype"); 
            String otpsess=(String)session.getAttribute("otp");
            String pass=request.getParameter("password"); 
            String confpass1=request.getParameter("confpassword"); 
            if(resotp.equals(otpsess)){
                if(pass.equals(confpass1)){
                    if(fousertype.equals("citizen")){
                        int upd=db.update_delete("update citizen set password='"+pass+"' where id="+idid);
                        if(upd>0){
                            response.sendRedirect("../index.jsp?status=22");
                        }
                    }else if(fousertype.equals("police")){
                        int upd=db.update_delete("update police_station set password='"+pass+"' where id="+idid);
                        if(upd>0){
                            response.sendRedirect("../index.jsp?status=22");
                        }
                    }
                }else{
                    response.sendRedirect("../forget-password-otpverify.jsp?status=0&id="+idid+"&fusertype="+fousertype);
                }
            }else{
                response.sendRedirect("../forget-password-otpverify.jsp?status=2&id="+idid+"&fusertype="+fousertype);
            }
            
           
            break;
    }
    %>

 