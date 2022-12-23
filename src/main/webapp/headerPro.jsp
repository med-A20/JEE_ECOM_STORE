<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<section class="w-full grid grid-cols-12 gap-x-4 items-center">
  <div class="col-span-2 flex flex-row justify-center items-center">
    <img src="../view/assets/logo.webp" width="100px"/>
  </div>
  
  <!-- search -->
  <div class="col-span-7 flex flex-row justify-start items-center">
    <form action="" method="POST" class="w-10/12">
      <div class="rounded-full flex flex-row justify-start items-center bg-gray-100">
        <!-- icon search -->
        <img src="../view/assets/search.svg" width="30px" alt="searchIcon" class="ml-2" />
        <input 
        type="text" 
        class="bg-transparent ml-1 p-2 outline-none"
        placeholder="Search" />
      </div>
    </form>
    <div class="ml-1 bg-gray-100 p-1  flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="../view/assets/parametre.svg" width="23px" class="">
    </div>
  </div>
  
  <!-- user Info -->
  <div class="col-span-3 flex flex-row justify-end items-center">
    <!-- icons -->
    <!-- panier -->
    <div 
    onclick="panierClick()"
    class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="../view/assets/panier.svg" class="w-[30px]" 
    id="cartClicked" />
    </div>
    
    <div id="panier" style=""class="hide" >This div will be shown when the button is clicked</div>
    
    <!-- like -->
    <div 
    id="liked"
    onclick="like()"
    class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="../view/assets/like.svg" class="w-[30px]" />
    </div>
    
    <!-- user avatar -->
    <div class="ml-1 bg-gray-100 p-3 w-[40px] flex flex-row justify-center items-center rounded-full">
	    <img alt="" src="../view/assets/avatar.svg" class="w-[30px]" />
    </div>
    
    
  </div>
</section>
