package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Registration {
	private Connection con;
	HttpSession se;
	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Event1","root","vaibhav" );
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	  public String Registration(String name, String phone, String email, String password) {
	        String status = "";
	        String query = "SELECT * FROM USER WHERE phone = ? OR email = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	        	
	            ps.setString(1, phone);
	            ps.setString(2, email);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                status = "existed";
	            } else {
	                query = "INSERT INTO user (name, phone, email, password, date) VALUES (?, ?, ?, ?, NOW())";
	                try (PreparedStatement insertPs = con.prepareStatement(query)) {
	                	se.setAttribute("phone", phone);
	                    insertPs.setString(1, name);
	                    insertPs.setString(2, phone);
	                    insertPs.setString(3, email);
	                    insertPs.setString(4, password);
	                    int rowsAffected = insertPs.executeUpdate();
	                    status = (rowsAffected > 0) ? "success" : "failure";
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String login(String email, String password) {
	        String status = "";
	        String query = "SELECT * FROM USER WHERE EMAIL = ? AND PASSWORD = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, email);
	            ps.setString(2, password);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                se.setAttribute("uname", rs.getString("name"));
	                se.setAttribute("email", rs.getString("email"));
	                se.setAttribute("id", rs.getString("Sno"));
	                se.setAttribute("phone", rs.getString("phone"));
	                
	                status = "success";
	            } else {
	                status = "failure";
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public Student getUserInfo() {
	        Student student = null;
	        String query = "SELECT * FROM USER WHERE SNO = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, (String) se.getAttribute("id"));
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                student = new Student();
	                student.setName(rs.getString("name"));
	                student.setPhone(rs.getString("phone"));
	                student.setEmail(rs.getString("email"));
	               
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return student;
	    }

	    public String update(String name, String email, String phone) {
	        String status = "";
	        String query = "UPDATE USER SET NAME = ?, EMAIL = ?, PHONE = ? WHERE SNO = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, name);
	            ps.setString(2, email);
	            ps.setString(3, phone);
	            ps.setString(4, (String) se.getAttribute("id"));
	            int rowsAffected = ps.executeUpdate();
	            status = (rowsAffected > 0) ? "success" : "failure";
	        } catch (SQLException e) {
	            e.printStackTrace();
	            status = "failure";
	        }
	        return status;
	    }

	    public ArrayList<Student> getUserinfo(String id) {
	        ArrayList<Student> students = new ArrayList<>();
	        String query = "SELECT * FROM user WHERE sno = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, id);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                Student student = new Student();
	                student.setId(rs.getString("sno"));
	                student.setName(rs.getString("name"));
	                student.setEmail(rs.getString("email"));
	                student.setPhone(rs.getString("phone"));
	                student.setDate(rs.getString("date"));
	                students.add(student);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return students;
	    }

	    public ArrayList<Student> getUserDetails() {
	        ArrayList<Student> students = new ArrayList<>();
	        String query = "SELECT *, DATE_FORMAT(date, '%b %d, %Y') AS date1 FROM user WHERE sno NOT IN (1)";
	        try (Statement st = con.createStatement(); ResultSet rs = st.executeQuery(query)) {
	            while (rs.next()) {
	                Student student = new Student();
	                student.setId(rs.getString("sno"));
	                student.setName(rs.getString("name"));
	                student.setEmail(rs.getString("email"));
	                student.setPhone(rs.getString("phone"));
	                student.setDate(rs.getString("date1"));
	                students.add(student);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return students;
	    }

	    public String delete(int id) {
	        String status = "";
	        String query = "DELETE FROM user WHERE sno = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setInt(1, id);
	            int rowsAffected = ps.executeUpdate();
	            status = (rowsAffected > 0) ? "success" : "failure";
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String forgot(String email, String newPassword) {
	        String status = "";
	        String query = "UPDATE user SET password = ? WHERE email = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, newPassword);
	            ps.setString(2, email);
	            int rowsAffected = ps.executeUpdate();
	            status = (rowsAffected > 0) ? "success" : "failure";
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String getPassword(String email, String oldPassword) {
	        String status = "";
	        String query = "SELECT * FROM user WHERE email = ? AND password = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, email);
	            ps.setString(2, oldPassword);
	            ResultSet rs = ps.executeQuery();
	            status = rs.next() ? "success" : "failed";
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String resetPassword(String email, String newPassword) {
	        String status = "";
	        String query = "UPDATE user SET password = ? WHERE email = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, newPassword);
	            ps.setString(2, email);
	            int rowsAffected = ps.executeUpdate();
	            status = (rowsAffected > 0) ? "success" : "failure";
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String Booknow(HttpServletRequest request) {
	        String status = "";
	        ResultSet rs = null;
	        try {
	            Statement st = con.createStatement();
	            rs = st.executeQuery("select event_id from bookevent where eventdate= '" + request.getParameter("edate") + "'");
	            boolean b = rs.next();
	            if (b == true) {
	                status = "existed";
	            } else {
	                String qry = "insert into bookevent select 0,event_image,event_name,'" + request.getParameter("pno") + "', '" + request.getParameter("email") + "','" + request.getParameter("address") + "',event_cost,'" + se.getAttribute("uname") + "'," + se.getAttribute("id") + " ,'pending',now(),'" + request.getParameter("edate") + "' from events where event_id=" + request.getParameter("event_id") + ";";
	                int a = st.executeUpdate(qry);
	                if (a > 0) {
	                    status = "success";
	                } else {
	                    status = "failure";
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }


	    public int deleteEvent(int eventId) {
	        int status = 0;
	        String query = "UPDATE bookevent SET status = 'cancelled' WHERE event_id = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setInt(1, eventId);
	            status = ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    public String contactInfo(String name, String email, String subject, String message) {
	        String status = "";
	        String query = "SELECT * FROM Contact WHERE name = ? OR email = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, name);
	            ps.setString(2, email);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                status = "existed";
	            } else {
	                query = "INSERT INTO Contact (name, email, subject, message) VALUES (?, ?, ?, ?)";
	                try (PreparedStatement insertPs = con.prepareStatement(query)) {
	                    insertPs.setString(1, name);
	                    insertPs.setString(2, email);
	                    insertPs.setString(3, subject);
	                    insertPs.setString(4, message);
	                    int rowsAffected = insertPs.executeUpdate();
	                    status = (rowsAffected > 0) ? "success" : "failure";
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            status = "error";
	        }
	        return status;
	    }

	    public ArrayList<Dproduct> getEventInfo(String eventCategory) {
	        ArrayList<Dproduct> products = new ArrayList<>();
	        String query = "SELECT * FROM events WHERE event_category = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, eventCategory);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                Dproduct product = new Dproduct();
	                product.setP_id(rs.getString("event_id"));
	                product.setP_image(rs.getString("event_image"));
	                product.setP_name(rs.getString("event_name"));
	                product.setP_cost(rs.getString("event_cost"));
	                product.setP_details(rs.getString("event_details"));
	                products.add(product);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return products;
	    }

	    public Dproduct getEventFormInfo(String eventId) {
	        Dproduct product = null;
	        String query = "SELECT event_name, event_cost FROM events WHERE event_id = ?";
	        try (PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, eventId);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                product = new Dproduct();
	                product.setP_name(rs.getString("event_name"));
	                product.setP_cost(rs.getString("event_cost"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return product;
	    }
	    public ArrayList<Dproduct> geteventstatus() {
	    	Statement st = null;
	    	ResultSet rs = null;
	        ArrayList<Dproduct> al = new ArrayList<Dproduct>();
	        try {
	            st = con.createStatement();
	            String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent where uid='" + se.getAttribute("id") + " ';";
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
	                d.setP_id(rs.getString("event_id"));
	                d.setP_image(rs.getString("event_image"));
	                d.setP_name(rs.getString("event_name"));
	                d.setP_cost(rs.getString("event_cost"));
	                d.setPhone(rs.getString("phone"));
	                d.setEmail(rs.getString("email"));
	                d.setDate(rs.getString("date1"));
	                d.setEventdate(rs.getString("date2"));
	                d.setStatus(rs.getString("status"));
	                al.add(d);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return al;

	    }
	    public String Feedback(String id,String Message,String rating) {
	    	int count=0;
	    	String status="";
	    	String id1 = (String) se.getAttribute("id");
	    	PreparedStatement ps = null;
	    	try {
				ps=con.prepareStatement("INSERT INTO FEEDBACK VALUES(?,?,?,now())");
				ps.setString(1,id1);
			    ps.setString(2, Message);
			    ps.setString(3, rating);
			    count=ps.executeUpdate();
			    if(count>0) {
			    	status="success";
			    }
			    else {
			    	status="failure";
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return status;
	    	
	    }
       public ArrayList<Feedback> DisplayFeedback(){
    	   Statement st = null;
    	   ResultSet rs = null;
    	   ArrayList<Feedback> al = new ArrayList<Feedback>();
    	   try {
			st= con.createStatement();
			String qry="select * from Feedback";
			rs=st.executeQuery(qry);
			while(rs.next()) {
				Feedback f = new Feedback();
				f.setId(rs.getString("id"));
				f.setMessage(rs.getString("Message"));
				f.setRating(rs.getString("rating"));
				f.setDate(rs.getString("Date"));
				al.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	   return al;
    	   
       }
       public ArrayList<Dproduct> geteventstatusAdmin() {
    	   ResultSet rs = null;
    	   Statement st= null;
           ArrayList<Dproduct> al = new ArrayList<Dproduct>();
           try {
               st = con.createStatement();
               String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent;";
               rs = st.executeQuery(qry);
               while (rs.next()) {
                   Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
                   d.setP_id(rs.getString("event_id"));
                   d.setP_image(rs.getString("event_image"));
                   d.setP_name(rs.getString("event_name"));
                   d.setP_cost(rs.getString("event_cost"));
                   d.setPhone(rs.getString("phone"));
                   d.setEmail(rs.getString("email"));
                   d.setDate(rs.getString("date1"));
                   d.setEventdate(rs.getString("date2"));
                   d.setStatus(rs.getString("status"));
                   al.add(d);
               }

           } catch (Exception e) {
               e.printStackTrace();
           }

           return al;

       }

   public int deleteevent(int event_id) {
           int status = 0;
           try {
               Statement st = null;
               st = con.createStatement();
               String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
               status = st.executeUpdate(qry);
           } catch (Exception e) {
               e.printStackTrace();
           }
           return status;
       }

       public int acceptevent(int event_id) {
           int status = 0;
           try {
               Statement st = null;
               st = con.createStatement();
               String qry = "update bookevent set status='booked' where event_id=' " + event_id + "' ";
               status = st.executeUpdate(qry);
           } catch (Exception e) {
               e.printStackTrace();
           }
           return status;
       }




	
}

