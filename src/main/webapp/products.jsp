<%@page import="Models.ProductBusiness"%>
<%@page import="beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<section>
	<!-- sub header -->
	<div class="w-full flex flex-row justify-between items-center mb-3">
		<p class="text-4xl font-bold capitalize linear-wipe p-1"> Explore Popular Categories</p>
		
		<div class="px-3 py-1 mr-2 rounded-full bg-gray-100 flex flex-row items-center text-xl">
			<p class="font-semibold">See All</p>
			<img src="assets/arrow.svg" alt="test" width="20px"/>
		</div>
	</div>
	
	<!-- Products -->
	<% ArrayList<String> cats = ProductBusiness.getCategorie(); %>
	
	<div class="w-full my-5">
		<% for(String cat : cats){ %>
			<div class="grid place-items-center my-3">
			  <h3 class="text-2xl font-extrabold text-transparent bg-clip-text custome-text uppercase">
			    <%= cat %>
			  </h3>
			</div>
			
			<% ArrayList<Product> products = ProductBusiness.getProductByCat(cat); %>
			<div 
			id=<%= cat %>
			class="w-[90%] mx-auto flex flex-row flex-wrap justify-center items-center gap-2">
			<% if(products.size() != 0){ %>
			<% for(Product product : products){ %>
				<jsp:include page="product.jsp">
					<jsp:param value="<%= product.getId() %>" name="id"/>
					<jsp:param value="<%= cat %>" name="cat"/>
					<jsp:param value="<%= product.getName() %>" name="name"/>
					<jsp:param value="<%= product.getPrice() %>" name="price"/>
					<jsp:param value="<%= product.getRate() %>" name="rate"/>
					<jsp:param value="<%= product.getImage() %>" name="image"/>
				</jsp:include>
			<% } %>
			<% }else{ %>
				<div>
					<p> Empty For Now </p>
				</div>
			<% }%>
			</div>
		<% } %>
	</div>
</section>