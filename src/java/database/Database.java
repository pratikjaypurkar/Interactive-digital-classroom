package database;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/arvi22_digital","root","root");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    //ip:username,password
    //return boolean
    public int checkFacultyLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from faculty where email=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int checkCitizenLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from citizen where email=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    
    public int checkStudentLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from student where email=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
     public int checkAdminLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int checkEmailExistCitizen(String uname,String mobno)
    {
        try {
            pst=con.prepareStatement("select * from citizen where email='"+uname+"' and mobileno='"+mobno+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return 0;
    }
    
    public ResultSet checkEmailExistCitizen(String uname)
    {
        try {
            pst=con.prepareStatement("select * from citizen where email='"+uname+"' and status=1");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return null;
    }
    
    public ResultSet checkEmailExistPoliceStation1(String uname)
    {
        try {
            pst=con.prepareStatement("select * from police_station where email='"+uname+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public int checkEmailExistPoliceStation(String uname)
    {
        try {
            pst=con.prepareStatement("select * from police_station where email='"+uname+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return 0;
    }
    public int addAssignmentRecord(int facultyid,String title,String date,String branch,String year,String semester,String[] questions)
    {
     
        try {
             String startDate=date; // Input String
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // New Pattern
            java.util.Date ddate = sdf1.parse(startDate); 
            java.sql.Date sqlStartDate = new java.sql.Date(ddate.getTime());
            
            pst=con.prepareStatement("insert into assignments (faculty_id,title,date,branch,year,semester) values(?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, facultyid);
            pst.setString(2, title);
            pst.setDate(3, sqlStartDate);
            pst.setString(4, branch);
            pst.setString(5, year);
            pst.setString(6, semester);
            
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                for (int i = 0; i < questions.length; i++) {
                    if(!questions[i].equals("")){
                        this.update_delete("insert into assignment_questions (assignment_id,question) values("+key+",'"+questions[i]+"')");
                    }
                }
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int addExamRecord(int facultyid,String title,String date,String hours,String min,String branch,String year,String semester,int negative)
    {
     
        try {
             String startDate=date; // Input String
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // New Pattern
            java.util.Date ddate = sdf1.parse(startDate); 
            java.sql.Date sqlStartDate = new java.sql.Date(ddate.getTime());
            
            pst=con.prepareStatement("insert into exams (faculty_id,title,date,hours,minutes,branch,year,semester,negative) values(?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, facultyid);
            pst.setString(2, title);
            pst.setDate(3, sqlStartDate);
            pst.setString(4, hours);
            pst.setString(5, min);
            pst.setString(6, branch);
            pst.setString(7, year);
            pst.setString(8, semester);
            pst.setInt(9, negative);
            
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    public Boolean addFeedback(String title,String date,String descr)
    {
        try {
            pst=con.prepareStatement("insert into feedback (name,date,description) values(?,?,?)");
            pst.setString(1, title);
            pst.setString(2, date);
            pst.setString(3, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public Boolean addNews(String title,String descr)
    {
        try {
            pst=con.prepareStatement("insert into notifications (title,description) values(?,?)");
            pst.setString(1, title);
            pst.setString(2, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getNews()
    {
        try {
            pst=con.prepareStatement("select * from notifications order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFeedbacks()
    {
        try {
            pst=con.prepareStatement("select * from feedback order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getNewsById(int id)
    {
        try {
            pst=con.prepareStatement("select * from notifications where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyFiles(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculty_files where faculty_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudAttendance(int studid,String date)
    {
        try {
            pst=con.prepareStatement("select * from stud_attendance where student_id="+studid+" and date='"+date+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentsAttendance(int fid,String date)
    {
        try {
            pst=con.prepareStatement("select * from stud_attendance where student_id=(select id from student where faculty_id="+fid+") and date='"+date+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyAttendance(int facid,String date)
    {
        try {
            pst=con.prepareStatement("select * from fac_attendance where faculty_id="+facid+" and date='"+date+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultysAttendance(String date)
    {
        try {
            pst=con.prepareStatement("select * from fac_attendance where date='"+date+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyVideos(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculty_videos where faculty_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFileForStudent(String year,String sem,String branch)
    {
        try {
            pst=con.prepareStatement("select * from faculty_files where year='"+year+"' and semester='"+sem+"' and branch='"+branch+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getVideoForStudent(int year,int sem,String branch)
    {
        try {
            pst=con.prepareStatement("select * from faculty_videos where year="+year+" and semester="+sem+" and branch='"+branch+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public Boolean editNews(int id, String title,String descr)
    {
        try {
            pst=con.prepareStatement("update notifications set title=?,description=? where id=?");
            pst.setString(1, title);
            pst.setString(2, descr);
            pst.setInt(4, id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    
    public int addCertificate(int citizen_id,int police_station_id,String certificate,String purpose,String passid,String passdate)
    {
         
            
        try {
            long millis=System.currentTimeMillis();  
            java.sql.Date dateq=new java.sql.Date(millis); 
            
            pst=con.prepareStatement("insert into certificate (citizen_id,certificate,date,police_station_id,purpose,passport_id,password_date,status) values(?,?,?,?,?,?,?,0)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, citizen_id);
            pst.setString(2, certificate);
            pst.setDate(3, dateq);
            pst.setInt(4,police_station_id);
            pst.setString(5, purpose);
            pst.setString(6, passid);
            pst.setString(7, passdate);
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public ResultSet getAssignments(int faculty_id)
    {
        try {
            pst=con.prepareStatement("select * from assignments where faculty_id="+faculty_id+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getContacts()
    {
        try {
            pst=con.prepareStatement("select * from contact order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getExamById(int id)
    {
        try {
            pst=con.prepareStatement("select * from exams where id="+id+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getExamQuestionsById(int eid)
    {
        try {
            pst=con.prepareStatement("select * from exam_questions where exam_id="+eid+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentAssignments(int studid)
    {
        
        try {
            ResultSet rss=this.getStudentById(studid);
            rss.next();
            String branch=rss.getString("branch");
            int year=rss.getInt("year");
            int sem=rss.getInt("semester");

            pst=con.prepareStatement("select * from assignments where branch='"+branch+"' and year="+year+" and semester="+sem+" and date >= CURDATE() order by date asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentExams(int studid)
    {
        
        try {
            ResultSet rss=this.getStudentById(studid);
            rss.next();
            String branch=rss.getString("branch");
            int year=rss.getInt("year");
            int sem=rss.getInt("semester");

            pst=con.prepareStatement("select * from exams where branch='"+branch+"' and year="+year+" and semester="+sem+" and date >= CURDATE() order by date asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudents()
    {
        
        try {
            pst=con.prepareStatement("select * from student order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFaculties()
    {
        
        try {
            pst=con.prepareStatement("select * from faculty order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentAssignmentsQuestions(int assid)
    {
        try {
            pst=con.prepareStatement("select * from assignment_questions where assignment_id="+assid+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getAssignmentById(int assid)
    {
        try {
            pst=con.prepareStatement("select * from assignments where id="+assid+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getAssignmentQuestionsById(int assid)
    {
        try {
            pst=con.prepareStatement("select * from assignment_questions where assignment_id="+assid+" order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getAssignmentQuestionById(int quesid)
    {
        try {
            pst=con.prepareStatement("select * from assignment_questions where id="+quesid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getAssignmentQuestionById(int assignid,int studid)
    {
        try {
            pst=con.prepareStatement("select * from assignment_students where assignment_id="+assignid+" and student_id="+studid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentQuestionAnsById(int assiquesid,int assignid,int studid)
    {
        try {
            pst=con.prepareStatement("select * from assignment_students where assignment_question_id="+assiquesid+" and assignment_id="+assignid+" and student_id="+studid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getAssignmentStudents(int assid)
    {
        try {
            pst=con.prepareStatement("select distinct(student_id) as studid from assignment_students where assignment_id="+assid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public int addPermission(int citizen_id,String date,int police_station_id,String permission,String edate2,String address,String type,String rname)
    {
        try {
            String startDate=date; // Input String
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // New Pattern
            java.util.Date ddate = sdf1.parse(startDate); 
            java.sql.Date sqlStartDate = new java.sql.Date(ddate.getTime());
            
            java.util.Date ddate2 = sdf1.parse(edate2); 
            java.sql.Date sqlStartDate2 = new java.sql.Date(ddate2.getTime());
            
            pst=con.prepareStatement("insert into permission (citizen_id,permission,date,date2,address,type,rname,police_station_id,status) values(?,?,?,?,?,?,?,?,0)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, citizen_id);
            pst.setString(2, permission);
            pst.setDate(3, sqlStartDate);
            pst.setDate(4, sqlStartDate2);
            pst.setString(5, address);
            pst.setString(6, type);
            pst.setString(7, rname);
            pst.setInt(8,police_station_id);
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    public ResultSet getPermissions()
    {
        try {
            pst=con.prepareStatement("select * from permission order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
     public ResultSet getPermissionByPoliceStationId(int id)
    {
        try {
            pst=con.prepareStatement("select * from permission where police_station_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet getPermissionId(int id)
    {
        try {
            pst=con.prepareStatement("select * from permission where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet getPermissionByCitizenId(int id)
    {
        try {
            pst=con.prepareStatement("select * from permission where citizen_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getCitizenById(int id)
    {
        try {
            pst=con.prepareStatement("select * from citizen where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
     public ResultSet getFacultyById(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculty where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet selectAll(String query)
    {
        try {
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getCertificateListByCitizenId(int id)
    {
        try {
            pst=con.prepareStatement("select * from certificate where citizen_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentById(int id)
    {
        try {
            pst=con.prepareStatement("select * from student where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getCertificateListByPoliceStationId(int id)
    {
        try {
            pst=con.prepareStatement("select * from certificate where police_station_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public int addComplaints(int citizen_id,int police_station_id,String complaint,String subject)
    {
        try {
            long millis=System.currentTimeMillis();  
            java.sql.Date dateq=new java.sql.Date(millis); 
            
            pst=con.prepareStatement("insert into complaints (citizen_id,complaint,date,police_station_id,status,subject) values(?,?,?,?,0,?)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, citizen_id);
            pst.setString(2, complaint);
            pst.setDate(3, dateq);
            pst.setInt(4,police_station_id);
            pst.setString(5, subject);
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    public ResultSet getComplaints()
    {
        try {
            pst=con.prepareStatement("select * from complaints order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getComplaintsListByCitizenId(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where citizen_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getComplaintsById(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getComplaintsListByPoliceStationId(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where police_station_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public boolean udpateMissing(int id,String fullname,String description,String fromdate){
       
         try {
             String startDate=fromdate; // Input String
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // New Pattern
            java.util.Date ddate = sdf1.parse(startDate); 
            java.sql.Date sqlStartDate = new java.sql.Date(ddate.getTime());
            
            pst=con.prepareStatement("update missing set fullname=?,description=?,fromdate=? where id=?");
            pst.setString(1, fullname);
            pst.setString(2, description);
            pst.setDate(3, sqlStartDate);
            pst.setInt(11, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
    public ResultSet getMissingsById(int id)
    {
        try {
            pst=con.prepareStatement("select * from missing where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getMissingsByPolicestationId(int id)
    {
        try {
            pst=con.prepareStatement("select * from missing where police_station_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
   public ResultSet getMissings()
    {
        try {
            pst=con.prepareStatement("select * from missing order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    
    
    public boolean delete(String tab,int id){
        try {
            pst=con.prepareStatement("delete from "+tab+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
     
    public int addCitizen(String nationality,String fullname,String address,String mobno,String email,String gender,String password){
         try {
            pst=con.prepareStatement("insert into citizen (fullname,address,mobileno,nationality,email,gender,password,status) values(?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, fullname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, nationality);
            pst.setString(5, email);
            pst.setString(6, gender);
            pst.setString(7, password);
            pst.setInt(8, 0);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
     }
     
     public int editCitizen1(String fullname,String address,String mobno,String gender,int id){
         try {
            pst=con.prepareStatement("update citizen set fullname=?,address=?,mobileno=?,gender=? where id=?");
            pst.setString(1, fullname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, gender);
            pst.setInt(5, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return 1;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
     }
     public ResultSet getCitizens()
    {
        try {
            pst=con.prepareStatement("select * from citizen order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
    public int addPoliceStation(String station_name,String address,String mobno,String email,String incharge_name,String idcardno,String designation,String password){
         try {
            pst=con.prepareStatement("insert into police_station (station_name,address,mobile,email,incharge_name,idcardno,designation,password) values(?,?,?,?,?,?,?,?)");
            pst.setString(1, station_name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, incharge_name);
            pst.setString(6, idcardno);
            pst.setString(7, designation);
            pst.setString(8, password);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return 1;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
     }
    
    public int editPoliceStation(int id,String station_name,String address,String mobno,String email,String incharge_name,String idcardno,String designation){
         try {
            pst=con.prepareStatement("update police_station set station_name=?,address=?,mobile=?,email=?,incharge_name=?,idcardno=?,designation=? where id=?");
            pst.setString(1, station_name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, incharge_name);
            pst.setString(6, idcardno);
            pst.setString(7, designation);
            pst.setInt(8, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return 1;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
     }

     public ResultSet getPoliceStation()
    {
        try {
            pst=con.prepareStatement("select * from police_station order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
     public int update_delete(String sql){
        try {
            pst=con.prepareStatement(sql);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 2;
        }
    }
     
    
    public boolean updateStatus(int id,int status,String tab){
        try {
            pst=con.prepareStatement("update "+tab+" set status="+status+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
public Boolean document_request_files(String document_request_id,String document,String file)
    {
        try {
            pst=con.prepareStatement("insert into document_request_files (document_request_id,document,file) values(?,?,?)");
            pst.setInt(1, Integer.parseInt(document_request_id));
            pst.setString(2, document);
            pst.setString(3, file);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }

public Boolean document_clearance_files(String leavreqid,String type,String file)
    {
        try {
            if(type.equals("aadhaar")){
                pst=con.prepareStatement("update leaving_request set aadhar_card=? where id=?");
                pst.setString(1, file);
                pst.setInt(2, Integer.parseInt(leavreqid));
                
            }else{
                pst=con.prepareStatement("update leaving_request set id_Card=? where id=?");
                
                pst.setString(1, file);
                pst.setInt(2, Integer.parseInt(leavreqid));
            }
            
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }

public Boolean document_leaving_files(String document_request_id,String file)
    {
        try {
            pst=con.prepareStatement("insert into leaving_marksheets (leaving_request_id,marksheet) values(?,?)");
            pst.setInt(1, Integer.parseInt(document_request_id));
            pst.setString(2, file);
            int n=pst.executeUpdate();
            if(n==1)
            {
                PreparedStatement pst1=con.prepareStatement("update leaving_request set status=1 where id=?");
                pst1.setInt(1, Integer.parseInt(document_request_id));
                pst1.executeUpdate();
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
}

