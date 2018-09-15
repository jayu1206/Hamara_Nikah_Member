
package com.softNice.nikah.filter;

import java.io.IOException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.net.ssl.TrustManager;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.security.cert.CertificateException;
import javax.security.cert.X509Certificate;
import javax.ws.rs.core.MultivaluedMap;

/**
 * Servlet Filter implementation class SecurityFilter
 */
public class SecurityFilter implements Filter {

	private Logger log = Logger.getLogger(SecurityFilter.class.getName());
    /**
     * Default constructor. 
     */
    public SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		try{
			
						
			HttpServletResponse  httpResponse = (HttpServletResponse)response;
			HttpServletRequest  httpRequest = (HttpServletRequest)request;
			
			// X-Powered-by can be set in Jboss , if cant set then set value as Blank
			httpResponse.setHeader("X-Powered-By","");
			httpResponse.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );

			String path = httpRequest.getServletPath();
			String FullPath=httpRequest.getRequestURI();
			
			if(path != null && !(path.endsWith(".js") || path.endsWith(".css") || path.endsWith(".png")|| path.endsWith(".jpg")|| path.endsWith(".jpeg")|| path.endsWith(".gif")) )
			{
			//	System.out.println("servlet path " +httpRequest.getServletPath());
			//	System.out.println("requset uri " +httpRequest.getRequestURI());
				httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
				httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
				//httpResponse.setHeader("Expires", "0"); // Proxies.
				httpResponse.setHeader("X-Content-Type-Options", "");
				httpRequest.setCharacterEncoding("UTF-8");
				
			}
		if(FullPath != null && FullPath.contains("/rest") &&  !FullPath.contains("/validateVersion") && !FullPath.contains("/pushDetails")
				&& !FullPath.contains("/memberDashboard.jsp") && !FullPath.contains("/pushContractedDetails")){
			
			
			return;
				
			/*System.out.println(httpRequest.getSession().getAttribute("sessionIDRest"));
				if(httpRequest.getSession().getAttribute("sessionIDRest")==null){
					httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
					
					return;
				}*/
				/*else
				{
					String sessionid = httpRequest.getSession().getId();
					// be careful overwriting: JSESSIONID may have been set with other flags
					//httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + "; Secure; HttpOnly");
					Calendar c = Calendar.getInstance();
					c.add(Calendar.MINUTE, 3);
					String o = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss zzz").format( c.getTime() );
				//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + ";Expires=" + o + ";Secure; HttpOnly");
					
				//	for our server
				//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + ";Expires=" + o + ";");
				}*/
				
			}/*else if(FullPath.contains("/pushDetails") || FullPath.contains("/pushResults") || FullPath.contains("/pushContractedDetails")){
			
			}
		// for our server
		
	/*else if (FullPath.contains("/validateVersion"))
		{
			String sessionid = httpRequest.getSession().getId();
			Calendar c = Calendar.getInstance();
			c.add(Calendar.MINUTE, 15);
			String o = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss zzz").format( c.getTime() );
		//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + ";Expires=" + o + ";Secure; HttpOnly");
		//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + ";Expires=" + o + ";");
			
		}
		else{
		
				httpRequest = (HttpServletRequest)request;
				String sessionid = httpRequest.getSession().getId();
				// be careful overwriting: JSESSIONID may have been set with other flags
			//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + "; Secure; HttpOnly");
			//	httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + "; ");
				
			
		}*/
			
			/*if(path != null && path.contains("/rest")){
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MINUTE, 15);
				String o = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss zzz").format( c.getTime() );
				httpResponse.setHeader("Set-Cookie", "Expires=" + o + ";");
			}*/
			
			

			// It can be done JBoss or web.xml. In this project we have done in web.xml
			
			 /* httpRequest = (HttpServletRequest)request;
			String sessionid = httpRequest.getSession().getId();
			// be careful overwriting: JSESSIONID may have been set with other flags
			httpResponse.setHeader("Set-Cookie", "JSESSIONID=" + sessionid + "; Secure; HttpOnly");
			
			*/
			
			/* SSLContext sc = SSLContext.getInstance("TLS");
		     sc.init(null, trustAllCerts, new SecureRandom());
		     HttpsURLConnection
		     .setDefaultSSLSocketFactory(sc.getSocketFactory());*/
			
			
		}
		catch(Exception e)
		{
			log.log(Level.SEVERE,e.getMessage());
			e.printStackTrace();
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
