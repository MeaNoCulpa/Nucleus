package utility;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletUtility {
	  static String Error = "Données non valides";
	  static String SucessMessage = "Succès";
	  
	  public static void forward(String page, HttpServletRequest request, HttpServletResponse response)
	      throws IOException, ServletException {
	    RequestDispatcher rd = request.getRequestDispatcher(page);
	    //System.out.println(page);
	    rd.forward(request, response);
	  }
	  
	  public static void redirect(String page, HttpServletRequest request, HttpServletResponse response)
	      throws IOException, ServletException {
	    response.sendRedirect(page);
	  }
	  
	  public static void handleException(Exception e, HttpServletRequest request, HttpServletResponse response)
	      throws IOException, ServletException {
	    request.setAttribute("exception", e);
	    ServletUtility.forward("Error Message", request, response);
	    e.printStackTrace();
	  }
	  
	  public static String getErrorMessage(String property, HttpServletRequest request) {
	    String val = (String) request.getAttribute(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  
	  public static String getMessage(String property, HttpServletRequest request) {
	    String val = (String) request.getAttribute(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  
	  public static void setErrorMessage(String msg, HttpServletRequest request) {
	    request.setAttribute(Error, msg);
	  }
	  
	  public static String getErrorMessage(HttpServletRequest request) {
	    String val = (String) request.getAttribute(Error);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  public static void setSuccessMessage(String msg, HttpServletRequest request) {
	    request.setAttribute(SucessMessage, msg);
	  }
	  
	  public static String getSuccessMessage(HttpServletRequest request) {
	    String val = (String) request.getAttribute(SucessMessage);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  
	  public static String getParameter(String property, HttpServletRequest request) {
	    String val = (String) request.getParameter(property);
	    if (val == null) {
	      return "";
	    } else {
	      return val;
	    }
	  }
	  
	  public static <E> void setList(List<E> list, HttpServletRequest request) {
	    request.setAttribute("list", list);
	  }
	  
	  
	@SuppressWarnings("unchecked")
	public static <E> List<E> getList(HttpServletRequest request) {
	    return (List<E>) request.getAttribute("list");
	  }
	
	  public static String getStringData(Object val) {
		    
		    if (val != null) {
		      return val.toString();
		    } else {
		      return "";
		    }
		  }
}
