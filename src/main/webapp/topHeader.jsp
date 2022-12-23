<%@page import="beans.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<% 

// login
Boolean loged = false;
if (session.getAttribute("loged") != null) {
    // user is authenticated
    loged = true;
}else{
	loged = false;
}


%>

<section class="w-full grid grid-cols-12 gap-x-4 items-center">
  <div class="col-span-2 flex flex-row justify-center items-center">
    <img src="assets/logo.webp" width="130px"/>
  </div>
  <!-- search -->
  <div class="col-span-7 flex flex-row justify-start items-center">
    <form action="" method="POST" class="w-10/12">
      <div class="rounded-full flex flex-row justify-start items-center bg-gray-100">
        <!-- icon search -->
        <img src="assets/search.svg" width="30px" alt="searchIcon" class="ml-2" />
        <input 
        type="text" 
        class="bg-transparent ml-1 p-2 outline-none"
        placeholder="Search" />
      </div>
    </form>
    <div class="ml-1 bg-gray-100 p-1  flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="assets/parametre.svg" width="23px" class="">
    </div>
  </div>
  
  <!-- user Info -->
  <div class="col-span-3 flex flex-row justify-end items-center">
    <!-- icons -->
    <!-- panier -->
    <div 
    onclick="panierClick()"
    class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full relative">
	    <img alt="" src="assets/panier.svg" class="w-[30px]" 
    id="cartClicked" />
    <% if(session.getAttribute("panier") != null){ %>
    <% ShoppingCart panier = (ShoppingCart)session.getAttribute("panier"); %>
    	<span
    	class="absolute flex flex-col justify-center items-center text-center w-5 h-5 top-[0] right-[-5px] bg-green-400 rounded-full"
    	>
    	<p class="italic font-bold text-white"><%= panier.getProducts().size() != 0  ? panier.getProducts().size() : "" %></p></span>
    <%} %>
    </div>
    
    
    
    <!-- like -->
    <div 
    id="liked"
    onclick="like()"
    class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="assets/like.svg" class="w-[30px]" />
    </div>
    
    <!-- user avatar -->
    
    <div
    <% if (loged){  %>
    data-bs-toggle="popover" data-bs-title="Popover title"
    data-bs-content="And here's some amazing content. It's very engaging. Right?"
    <% } %>
    onclick="<%= !loged ? "showLogin()" : "toggleModal()" %>"
    class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full <%= loged ? "bg-gradient-to-r from-[#fc00ff] to-[#00dbde]" : "" %>">
	    <img alt="" src="assets/avatar.svg" class="w-[30px]" />
    </div>
    
    
  </div>
</section>
