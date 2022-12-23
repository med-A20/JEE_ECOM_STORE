<%@page import="Models.ProductBusiness"%>
<%@page import="beans.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%  Product product = ProductBusiness.getProductById(Integer.parseInt(request.getParameter("id"))); %>
<article class="w-full grid grid-cols-12">
	<!-- Image -->
	<div class="col-span-6  flex flex-row justify-center items-center">
		<img src="<%= product.getImage() %>" alt="" class="object-contain" />
	</div>
	<!-- details -->
	<div class="col-span-6">
		<!-- Name -->
		<h3 class="capitalize font-bold text-slate-800 text-4xl"><%= product.getName() %></h3>
		
		<!-- price and rate -->
		<div class="flex flex-row justify-start items-center gap-[25px] my-4">
			<p class="capitalize font-bold text-slate-800 text-2xl">$<%= product.getPrice() %></p>
			<span class="text-2xl font-bold">|</span>
			<div class="flex items-center">
			    <svg aria-hidden="true" class="w-7 h-7 text-yellow-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Rating star</title><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
			    <p class="ml-2 text-2xl font-bold text-gray-900"><%= product.getRate() %></p>
			    <span class="w-1 h-1 mx-1.5 bg-gray-500 rounded-full"></span>
			    <a href="#" class="text-sm font-medium text-gray-900 underline hover:no-underline">73 reviews</a>
			</div>
		</div>
		
		<!-- Quantity -->
		<div class="my-3">
			<p class="text-2xl text-gray-600">
				Availability 
				<span class="font-bold italic"> - <%=  product.getQuantity() != 0 ? "In Stock" : "Nothing For Now" %></span>
			</p>
		</div>
		
		<!-- fiche technique -->
		<div>
			<!-- Os -->
			<div class="grid grid-cols-10">
				<p class="col-span-4 capitalize font-semibold text-gray-900">Operating System :</p>
				<p class="col-span-6 uppercase text-gray-600"><%= product.getFicheTech().getOs() %></p>
			</div>
			
			<!-- Display -->
			<div class="grid grid-cols-10 mt-3">
				<p class="col-span-4 capitalize font-semibold text-gray-900">display :</p>
				<p class="col-span-6 text-gray-600"><%= product.getFicheTech().getDisplay() %></p>
			</div>
			
			<!-- camera -->
			<div class="grid grid-cols-10 mt-3">
				<p class="col-span-4 capitalize font-semibold text-gray-900">caméra :</p>
				<p class="col-span-6 text-gray-600"><%= product.getFicheTech().getCam() %></p>
			</div>
			
			<!-- Battery -->
			<div class="grid grid-cols-10 mt-3">
				<p class="col-span-4 capitalize font-semibold text-gray-900">Battery :</p>
				<p class="col-span-6 text-gray-600"><%= product.getFicheTech().getBattery() %></p>
			</div>
			
			<!-- processor -->
			<div class="grid grid-cols-10 mt-3">
				<p class="col-span-4 capitalize font-semibold text-gray-900">processor :</p>
				<p class="col-span-6 text-gray-600"><%= product.getFicheTech().getProcessor() %></p>
			</div>
			
			<!-- memory -->
			<div class="grid grid-cols-10 mt-3">
				<p class="col-span-4 capitalize font-semibold text-gray-900">memory :</p>
				<p class="col-span-6 text-gray-600"><%= product.getFicheTech().getMemory() %></p>
			</div>
		</div>
		
		<div class="mt-3">
			<div class="flex flex-row items-center text-[20px] gap-[20px]">
				<img src="assets/ok.svg" width="25px"/>
				<div class="grid place-items-center my-3">
			  <h3 class="text-xl font-bold text-transparent bg-clip-text custome-text uppercase">
			    free shipping
			  </h3>
			</div>
			</div>
			
			
			<div class="flex flex-row items-center text-[20px] gap-[20px]">
				<img src="assets/ok.svg" width="25px"/>
				<div class="grid place-items-center my-3">
			  <h3 class="text-xl font-bold text-transparent bg-clip-text custome-text uppercase">
			    Emi Options Available
			  </h3>
			</div>
			
				<a href='addToCart?id=<%= request.getParameter("id") %>'
				class="px-4 text-white font-semibold py-1 bg-[#111] rounded-full">
					Shop Now
				</a>
			</div>
		</div>
	</div>
</article>