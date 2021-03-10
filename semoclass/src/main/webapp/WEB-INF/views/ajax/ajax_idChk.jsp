<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="javax.xml.ws.RequestWrapper"%>
<%@page import="com.sun.org.glassfish.gmbal.ParameterNames"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.*" %>
<%@ page import="org.json.*" %>


<%

	int res = (Integer)request.getAttribute("res");	

	System.out.println(res);

	JSONArray jsonArray = new JSONArray();
	
	out.println(res);

%>