<%@page import="Models.ProductBusiness"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<article class="w-full flex flex-col justify-start items-center">
	<h3 class="text-4xl font-bold capitalize linear-wipe p-1">categories</h3>
	
	<div class="flex flex-col justify-center items-center">
	<% ArrayList<String> cats = ProductBusiness.getCategorie(); %>
	<% for(String cat:cats){ %>
		<a 
		href="<%= cat %>" class="p-1 font-meduim"><%= cat %></a>
	<% } %>
	</div>
</article>