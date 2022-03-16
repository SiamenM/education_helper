package com.maskalenchyk.education_helper.filter;

import com.maskalenchyk.education_helper.application.ApplicationConstants;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Filter used to initialize default locale
 */

@WebFilter(urlPatterns = {"/*"}, initParams = {
        @WebInitParam(name = "defaultLocale", value = "ru"),
        @WebInitParam(name = "supportedLocales", value = "en,ru")
})
public class LocaleFilter implements Filter {

    private String defaultLocale;
    private List<String> supportedLocales;

    @Override

    public void init(FilterConfig filterConfig) throws ServletException {
        this.defaultLocale = filterConfig.getInitParameter("defaultLocale");
        this.supportedLocales = Arrays.asList(filterConfig.getInitParameter("supportedLocales").split(","));
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession();
        String locale = (String) session.getAttribute(ApplicationConstants.LOCALE_PARAMETER);
        if (locale == null) {
            locale = request.getLocale().getLanguage();
            if (supportedLocales.contains(locale)) {
                session.setAttribute(ApplicationConstants.LOCALE_PARAMETER, locale);
            } else {
                session.setAttribute(ApplicationConstants.LOCALE_PARAMETER, defaultLocale);
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        this.defaultLocale = null;
        this.supportedLocales = null;
    }
}
