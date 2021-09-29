package com.maskalenchyk.education_helper.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

/**
 * Filter used to maintain character encoding UTF-8
 */
@WebFilter(filterName = "CharsetFilter", urlPatterns = {"/*"},
        initParams = {@WebInitParam(name = "defaultEncoding", value = "UTF8")})
public class CharsetFilter implements Filter {

    private String defaultEncoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.defaultEncoding = filterConfig.getInitParameter("defaultEncoding");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(defaultEncoding);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        defaultEncoding = null;
    }
}
