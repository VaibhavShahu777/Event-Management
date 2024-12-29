package com.MVC.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.MVC.Model.Enquiry;
import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name="register",urlPatterns= {"/register"})

public class register extends HttpServlet{
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		Enquiry enq=new Enquiry(session);
		
		Registration reg = new Registration(session);
		try {
			if(req.getParameter("register")!=null) {
				String name=req.getParameter("name");
				String phone=req.getParameter("phone");
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				String confirm=req.getParameter("confirm");
				
				if(password.equals(confirm)) {
					String status = reg.Registration(name, phone, email, password);
					if(status.equals("existed")) {
						req.setAttribute("status", "Existed Record");
						RequestDispatcher rd1=req.getRequestDispatcher("loginreg.jsp");
						rd1.forward(req, resp);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd=req.getRequestDispatcher("loginreg.jsp");
						rd.forward(req, resp);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Registration Failed");
						RequestDispatcher rd = req.getRequestDispatcher("loginreg.jsp");
						rd.forward(req, resp);
					}
				}
				
				
			}
			//Login
			else if(req.getParameter("login")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status =reg.login(email, password);
				if(status.equals("success")) {
					req.setAttribute("status", "");
					RequestDispatcher rd =req.getRequestDispatcher("Home1.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("loginreg.jsp");
					rd.forward(req, resp);
				}
				
		
			}
			else if(req.getParameter("logout")!=null) {
				session.invalidate();
				resp.sendRedirect("Home.jsp");
			}
			//Update
			else if(session.getAttribute("uname")!=null && req.getParameter("submit")!=null ) {
				String name=req.getParameter("name");
				String email=req.getParameter("email");
				String phone=req.getParameter("phone");
				String status=reg.update(name, email, phone);
				if(status.equals("success")) {
					session.setAttribute("uname", name);
					session.setAttribute("phone", phone);
					session.setAttribute("email", email);
					req.setAttribute("status", "Profile Updated Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("EditForm.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")){
					req.setAttribute("status", "Failed to Update Profile");
					RequestDispatcher rd = req.getRequestDispatcher("EditForm.jsp");
					rd.forward(req, resp);
				}
			}
			//Forgot
	           else if (req.getParameter("forgotPass") != null) {
	               String mail = req.getParameter("email");
	               String pw = req.getParameter("pw");
	               String cp = req.getParameter("cpw");
	               if (pw.equals(cp)) {
	                   String status = reg.forgot(mail, pw);
	                   if (status.equals("success")) {
	                       req.setAttribute("status", "Password Reset Successfully");
	                       RequestDispatcher rd = req.getRequestDispatcher("loginreg.jsp");
	                       rd.forward(req, resp);
	                   } else if (status.equals("failure")) {
	                       req.setAttribute("status", "Password Reset Failed");
	                       RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
	                       rd.forward(req, resp);
	                   }
	               } else {
	                   req.setAttribute("status", "Password mismatch");
	                   RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
	                   rd.forward(req, resp);
	               }
//	               else {
//						req.setAttribute("status", "Failed to Update");
//						RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
//						rd.forward(req, resp);
//					}
	           }
			//Reset
	           else if(req.getParameter("reset")!=null) {
	        	   String email = req.getParameter("email");
	        	   String opw=req.getParameter("opw");
	        	   String npw=req.getParameter("npw");
	        	   if(opw.equals(npw)) {
	        		   String s = reg.getPassword(email, npw);
	        		   if(s.equals("success")&&(opw.equals(npw))) {
	        			   req.setAttribute("status", "New Password is same as Old Password");
	        			   RequestDispatcher rd = req.getRequestDispatcher("changePass.jsp");
	        			   rd.forward(req, resp);
	        		   }
	        		   
	        	   }
	        	   else {
	        		   String status=reg.resetPassword(email, npw);
	        		   if(status.equals("success")) {
	        			   req.setAttribute("status", "Password changed successfully");
	        			   RequestDispatcher rd = req.getRequestDispatcher("loginreg.jsp");
	        			   rd.forward(req, resp);
	        			   
	        		   }
	        	   }
	   			
	   		}
	           else if (req.getParameter("addevent") != null) {
					String img = req.getParameter("image");
					String name = req.getParameter("name");
					String cost = req.getParameter("cost");
					String details = req.getParameter("details");
					String category = req.getParameter("category");
					String status = enq.addEvent(img, name, cost, details, category);
					if (status.equals("Submitted")) {
						req.setAttribute("status", "New Event Added");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					} else if (status.equals("Already Added")) {
						req.setAttribute("status", "Already Added");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					} else if (status.equals("Failed")) {
						req.setAttribute("status", "Failed To Add Event");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					}
				}

				else if (req.getParameter("delevent") != null) {
					String name = req.getParameter("ename");
					String status = enq.delEvent(name);
					if (status.equals("success")) {
						req.setAttribute("status", "Event Deleted");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					} else if (status.equals("not available")) {
						req.setAttribute("status", "Event Category doesn't exist");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					} else if (status.equals("failed")) {
						req.setAttribute("status", "Failed to Delete Event");
						RequestDispatcher rd = req.getRequestDispatcher("addDelEvent.jsp");
						rd.forward(req, resp);
					}
				}
				else if(req.getParameter("feedbacksubmit")!=null) {
					String rating=req.getParameter("rating");
					String message=req.getParameter("message");
					String status=reg.Feedback(session.getId(), message, rating);
					if(status.equals("success")) {
						req.setAttribute("status", "Thank you for your Feedback");
						RequestDispatcher rd = req.getRequestDispatcher("Feedback.jsp");
						rd.forward(req, resp);
					}
					 else if (status.equals("failure")) {
							req.setAttribute("status", "Failed to Give Feedback");
							RequestDispatcher rd = req.getRequestDispatcher("Feedback.jsp");
							rd.forward(req, resp);
						}
					
				}
				


	          
			
		}
		catch(Exception e) {
			e.printStackTrace();
			}
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

}
