package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CommonFilter
 */
@WebFilter(urlPatterns = "/*")
public class CommonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CommonFilter() {
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
		
		//	뷰에서 전달받은 값에 한글이 있을 경우
		// 1_1. request 파라미터를 이용해서 요청의 필터 작업 수행
		request.setCharacterEncoding("UTF-8");
		
		// 뷰로 전달 할 때
		// 1_2. response 파라미터를 이용해서 응답의 필터 작업 수행
		response.setContentType("text/htmlcharset=UTF-8");
		
		// 아래 요고 냅두면 자동으로 필터가 적용됨 :)
		chain.doFilter(request, response);
		
		// 필터를 작성했으니까 LoginServlet 만들러 가자
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
