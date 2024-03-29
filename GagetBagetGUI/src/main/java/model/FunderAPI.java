package model;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


@WebServlet("/FunderAPI")
public class FunderAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	FunderServlet funderObj = new FunderServlet();
	
	public FunderAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		String outputString = funderObj.insertFunder(request.getParameter("funderName"), 
				request.getParameter("funderEmail"),
				request.getParameter("funderTel"), 
				request.getParameter("funderGender"), 
				request.getParameter("funderDonation"),
				request.getParameter("funderDesc"));

		response.getWriter().write(outputString);
	}	

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map paras = getParasMap(request);

		String outputString = funderObj.updateFunder(
				paras.get("funderID").toString(),
				paras.get("funderName").toString(),
				paras.get("funderEmail").toString(), 
				paras.get("funderTel").toString(),
				paras.get("funderGender").toString(),
				paras.get("funderDonation").toString(),
				paras.get("funderDesc").toString()); 

		response.getWriter().write(outputString);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		String output = funderObj.deleteFunder(paras.get("funderID").toString());
		response.getWriter().write(output); 		
	}

	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {			
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			
			String[] params = queryString.split("&");
			for (String param : params) {
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
			
		} catch (Exception e) {
		  }
		
		return map;
	}
}
