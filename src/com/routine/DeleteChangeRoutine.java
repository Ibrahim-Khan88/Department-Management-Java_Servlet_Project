package com.routine;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.GetConnection;

/**
 * Servlet implementation class DeleteChangeRoutine
 */
@WebServlet("/DeleteChangeRoutine")
public class DeleteChangeRoutine extends HttpServlet {
	
	static GetConnection con = new GetConnection();
	static Connection connection = con.getconnection();
    static Timer timer = null;
    static String thread_running_state = "false";

    static {
        try {
            timer = new Timer();
        } catch (Exception e) {
            System.out.println("Static Exception : " + e);
        }
    }
	
    
    public void init() throws ServletException
    {
          System.out.println("---------- init() is called ----------");
          try {
			DeleteChangeRoutine.checkThreadState();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    //deleteRoutine();
		PrintWriter out = response.getWriter();	
		try {
			DeleteChangeRoutine.checkThreadState();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	


    //To check the thread running status
    public static String checkThreadState() throws Exception {
        if (thread_running_state.equals("true")) {
            System.out.println("thread_running_state - True: means thread already starts. So no need to create new thread again");
        } else {
            System.out.println("thread_running_state - False: means Thread not running. So start thread.");
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, 20);
            calendar.set(Calendar.MINUTE, 38);
            calendar.set(Calendar.SECOND, 00);
            Date dttime = calendar.getTime();// 20:38:00 PM every day
            System.out.println("Thread Scheduled Time = " + dttime);
            timer.schedule(new DeleteChangeRoutine.runThreadDaily(), dttime);
        }
        return null;
    }

    public static class runThreadDaily extends TimerTask {

        @Override
        public void run() {
            System.out.println("========================================================");
            thread_running_state = "true";
            System.out.println("Thread Started");

            String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
            System.out.println("Thread Run TimeStamp =" + timeStamp);

            Thread t = Thread.currentThread();
            String name = t.getName();
            System.out.println("Current Running Thread Name = " + name);

            try {
            	deleteRoutine();
            } catch (Exception ex) {
                Logger.getLogger(DeleteChangeRoutine.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public static String myMethodLogic() {
        System.out.println("myMethodLogic Method Called");
        // Write your logic here
        return null;
    }

	
	
	public static void deleteRoutine() {
		
		System.out.println("deleteRoutine is called");
		Statement st,st1,st2;
		ResultSet rs,rs1,rs2;
		String query;
		int routineDay, changeRoutineDay, larger, currentday, delete;
		
		
		// getting current time
		java.util.Date alldate = new java.util.Date();
		
		query = "select * from changeroutine ";
		currentday =   giveDayValue(alldate.toString().substring(0, 3));
		System.out.println(currentday);
		
		try {
			st = connection.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				
				query = "select * from routine where Id='" + rs.getString("Id") + "'";
				st1 = connection.createStatement();
				rs1 = st1.executeQuery(query);
				
				if(rs1.next()) {
					
					routineDay = giveDayValue(rs1.getString("day"));
					changeRoutineDay = giveDayValue(rs.getString("day"));
					larger = Math.max(changeRoutineDay, routineDay);
					
					if (currentday >= larger) {
						query = "DELETE FROM changeroutine where Id='" + rs.getString("Id") + "'";
						st2 = connection.createStatement();
						delete = st2.executeUpdate(query);
						if (delete == 1)
							System.out.print("deleted");
						else System.out.print("fail to delete");
					}
					
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
	}
	
	public static int giveDayValue(String day) {
		

		if(day.equals("Sun")) return 1;
		else if(day.equals("Mon")) return 2;
		else if(day.equals("Tue")) return 3;
		else if(day.equals("Wed")) return 4;
		else return 5;

		
	}
	

}
