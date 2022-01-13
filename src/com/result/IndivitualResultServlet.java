package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.mysql.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class IndivitualResult
 */
@WebServlet("/IndivitualResult")
public class IndivitualResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ResultSet tables = null;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		String query2, query, point_session, result_session, course_name_session, course_result_session;
		int total_course, i, total_semester = 0;
		float total_point = 0, total_credit = 0;
		boolean is = false, is1;
		float avarage_point = 0;
		double number;

		String student_session = (String) session.getAttribute("student_session");
		String studentid = (String) session.getAttribute("studentid");
		String semester_array[] = { "_1_1", "_1_2", "_2_1", "_2_2", "_3_1", "_3_2", "_4_1", "_4_2" };

		String result[] = { student_session + "_1_1_result", student_session + "_1_2_result",
				student_session + "_2_1_result", student_session + "_2_2_result", student_session + "_3_1_result",
				student_session + "_3_2_result", student_session + "_4_1_result", student_session + "_4_2_result" };

		for (int j = 0; j < 8; j++) {

			try {

				DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
				tables = dbm.getTables(null, null, result[j], null);

				if (tables.next()) {

					is1 = false;
					// finding out the courses name
					Statement st = connection.createStatement();
					query = "select * from " + result[j];
					ResultSet rs = st.executeQuery(query);
					rs.next();
					rs.next();
					total_course = rs.getInt(1) * -1;
					String[] courses_name = new String[total_course];
					String[] courses_result = new String[total_course];
					float[] courses_credit = new float[total_course];

					// finding out the courses credit
					Statement st1 = connection.createStatement();
					ResultSet rs1 = st1.executeQuery(query);
					rs1.next();

					// finding out the courses result
					query = "select * from " + result[j] + " where studentid = '" + studentid + "'";
					Statement st2 = connection.createStatement();
					ResultSet rs2 = st2.executeQuery(query);

					if (rs2.next()) {
						is = true;
						is1 = true;
					}

					// student records is found
					if (is1) {
						for (i = 2; i <= total_course + 1; i++) {

							courses_credit[i - 2] = rs1.getFloat(i);
							total_credit += rs1.getFloat(i);
							courses_result[i - 2] = rs2.getString(i);
							courses_name[i - 2] = rs.getString(i);

							total_point += (rs1.getFloat(i) * grade_to_point(rs2.getString(i)));

							// System.out.println(" courses_name_1_1 " + courses_name_1_1[i - 2] + " ");
							// System.out.println(" courses_credit_1_1 " + courses_credit_1_1[i - 2] + " ");
							// System.out.println(" courses_result_1_1 " + courses_result_1_1[i - 2] + "
							// \n\n");
						}
						
						

						// System.out.println("total_credit = " + total_credit + " total_point= " +
						// total_point);

						point_session = "point" + semester_array[j];
						course_name_session = "courses_name" + semester_array[j];
						course_result_session = "courses_result" + semester_array[j];
						
						number = (int)(Math.round((total_point / total_credit) * 1000))/1000.0;

						total_semester++;
						avarage_point += number;

						session.setAttribute(point_session, number);
						session.setAttribute((result[j] + studentid), true);
						session.setAttribute(course_name_session, courses_name);
						session.setAttribute(course_result_session, courses_result);
					}

				}
			}

			catch (Exception e) {
				out.println("exception " + e.getMessage() + "  exception");
			}

		}



		if (is) {
			;
			
			number = (int)(Math.round((avarage_point /= total_semester) * 1000))/1000.0;
			session.setAttribute("avarage_point", number);
			
			
			out.print("<script> forward('Result/StudentInformationShow.jsp'); </script>");
		} else {
			out.print("<script> forward('http://localhost:8080/Project2/Common.jsp'); </script>");
		}

	}

	public float grade_to_point(String s) {

		if (s.equals("A+"))
			return 4;
		else if (s.equals("A"))
			return (float) 3.75;
		else if (s.equals("A-"))
			return (float) 3.50;
		else if (s.equals("B+"))
			return (float) 3.25;
		else if (s.equals("B"))
			return (float) 3.00;
		else if (s.equals("B-"))
			return (float) 2.75;
		else if (s.equals("C+"))
			return (float) 2.50;
		else if (s.equals("C"))
			return (float) 2.25;
		else if (s.equals("D"))
			return (float) 2.00;
		else
			return (float) 0.00;

	}

}
