<%@page import="beans.FichTech"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connecteToDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="Models.ProductBusiness"%>
<%@page import="beans.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/eb0f12567c.js" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
<style type="text/css">
			.licked{
	background-color: #ec407a !important;
}

.hide{
	display : none;
}
.show{
	display : block;
}
.hide2{
	top : -200px;
	display : none;
}
.show2{
	top : 85px;
	display : block;
}

*::-webkit-scrollbar-track
{
	box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #F5F5F5;
}

*::-webkit-scrollbar
{
	width: 3px;
	background-color: #92FE9D;
}
*::-webkit-scrollbar-thumb
{
	background-color : #C779D0;
}
.custome-text{
	background-image : linear-gradient(135deg, #fc00ff, #00dbde);
}
</style>
</head>
<body>


	<!-- Container -->
      <div class="max-w-[1200px] h-[100vh] mx-auto">
      	<!-- bar top -->
    	<div
    	class="pt-3 backdrop-blur-xl bg-transparent"
    	w3-include-html="./topHeader.jsp"></div>
    	
    	 <!-- login form -->
        <div w3-include-html="./login.jsp" id="login" class="bg-white p-4 rounded-xl shadow-xl absolute z-[500] right-[12px] hide2"></div>
        
        <!-- shoping cart -->
    	<div w3-include-html="shoppingCart.jsp" id="panier" class="hide absolute z-[5001] -top-[30px] right-[15px]"></div>
    	
    	<!-- logOut -->
    	<div w3-include-html="./logOut.jsp" id='modal' class="hidden"></div>
    	
    	<!-- retreive product by Id -->
    	<%int id =  Integer.parseInt(request.getParameter("id")); %>
		<!-- main -->
    	<main class="w-full grid grid-cols-12 gap-x-4 mt-[25px] h-[80vh] ">
    		<!-- Category -->
    		<section class="col-span-2 h-[80vh] flex flex-col justify-center items-center" w3-include-html="./category.jsp"></section>
    		
    		<!-- main section -->
    		<section class="col-span-10 h-[90vh] pb-[30px] overflow-y-auto">
	    		<!-- products -->
	    		<jsp:include page="./details.jsp">
	    			<jsp:param value='<%= request.getParameter("id") %>' name="id"/>
	    		</jsp:include>
    		</section>
    		<script type="text/javascript">rate(33);</script>
    	</main>
      </div>
     <script src="js/script.js"></script>
    <script type="text/javascript">
    
    //======== start login
 	function showLogin(){
	// Get the element with the ID "myDiv"
    document.getElementById("login").classList.toggle("show2")
    }
 // ============ end login
    //logOut
    function toggleModal() {
      document.getElementById('modal').classList.toggle('hidden')
    } 

    //have to log
    function haveToLog(){
    	alert("You have To Login or Register")
    }
    
    function includeHTML() {
    	  var z, i, elmnt, file, xhttp;
    	  /* Loop through a collection of all HTML elements: */
    	  z = document.getElementsByTagName("*");
    	  for (i = 0; i < z.length; i++) {
    	    elmnt = z[i];
    	    /*search for elements with a certain atrribute:*/
    	    file = elmnt.getAttribute("w3-include-html");
    	    if (file) {
    	      /* Make an HTTP request using the attribute value as the file name: */
    	      xhttp = new XMLHttpRequest();
    	      xhttp.onreadystatechange = function () {
    	        if (this.readyState == 4) {
    	          if (this.status == 200) {
    	            elmnt.innerHTML = this.responseText;
    	          }
    	          if (this.status == 404) {
    	            elmnt.innerHTML = "Page not found.";
    	          }
    	          /* Remove the attribute, and call this function once more: */
    	          elmnt.removeAttribute("w3-include-html");
    	          includeHTML();
    	        }
    	      };
    	      xhttp.open("GET", file, true);
    	      xhttp.send();
    	      /* Exit the function: */
    	      return;
    	    }
    	  }
    	}
    includeHTML();

    </script>
</body>
</html>