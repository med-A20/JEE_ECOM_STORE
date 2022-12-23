<%@page import="beans.User"%>
<%@page import="beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.ShoppingCart"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css" />
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
  </head>
  <body>
  <%
  // get user info
  User user = (User) session.getAttribute("user");
//Create a new SecureRandom object
  SecureRandom secureRandom = new SecureRandom();
//Generate a random integer between 5 and 10 (inclusive)
  int min = 500;
  int max = 999999;
  int randomInt = secureRandom.nextInt((max - min) + 1) + min;
  
  // get date
    // Create a SimpleDateFormat object with the desired date format
    SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");

    // Get the current date
    Date date = new Date();

    // Format the date using the SimpleDateFormat object
    String formattedDate = dateFormat.format(date);
    
    String desc="";
  %>
    <div class="pb-14 px-4 md:px-6 2xl:px-20 2xl:container 2xl:mx-auto scale-[0.9]">
      <!--- more free and premium Tailwind CSS components at https://tailwinduikit.com/ --->

      <div class="flex justify-start item-start space-y-2 flex-col">
        <h1
          class="text-3xl lg:text-4xl font-semibold leading-7 lg:leading-9 text-gray-800"
        >
          Order #<%= randomInt%>
        </h1>
        <p class="text-base font-medium leading-6 text-gray-600">
          <%= formattedDate%>
        </p>
      </div>
      <div
        class="mt-10 flex flex-col xl:flex-row jusitfy-center items-stretch w-full xl:space-x-8 space-y-4 md:space-y-6 xl:space-y-0"
      >
        <div
          class="flex flex-col justify-start items-start w-full space-y-4 md:space-y-6 xl:space-y-8"
        >
          <div
            class="flex flex-col justify-start items-start bg-gray-50 px-4 py-4 md:py-6 md:p-6 xl:p-8 w-full"
          >
            <p
              class="text-lg md:text-xl font-semibold leading-6 xl:leading-5 text-gray-800"
            >
              Customer's Cart
            </p>
            
            <!-- Start Product -->
            <!-- get Cart from session -->
					<% ShoppingCart cart = (ShoppingCart)session.getAttribute("panier"); %>
					<% if(cart != null){ %>
						<!-- getProduct -->
						<% ArrayList<Product> products = cart.getProducts(); %>
						<!-- loop over product -->
						<% for(Product product : products){ %>
							<!-- One Product -->
							<% desc = product.getName()+"-"+product.getPrice() +  ";" + desc ; %>
							<div
              class="mt-4 md:mt-6 flex flex-col md:flex-row justify-start items-start md:items-center md:space-x-6 xl:space-x-8 w-full"
            >
              <div class="pb-4 md:pb-8 w-full md:w-40">
                <img
                  class="w-full hidden md:block"
                  src="<%= product.getImage() %>"
                  alt="dress"
                />
                <img
                  class="w-full md:hidden"
                  src="<%= product.getImage() %>"
                  alt="dress"
                />
              </div>
              <div
                class="border-b border-gray-200 md:flex-row flex-col flex justify-between items-start w-full pb-8 space-y-4 md:space-y-0"
              >
                <div
                  class="w-full flex flex-col justify-start items-start space-y-8"
                >
                  <h3
                    class="text-xl xl:text-2xl font-semibold leading-6 text-gray-800"
                  >
                    <%= product.getName() %>
                  </h3>
                  <div
                    class="flex justify-start items-start flex-col space-y-2"
                  >
                    <p class="text-sm leading-none text-gray-800">
                      <span class="text-gray-800">OS: </span> <%= product.getFicheTech().getOs() %>
                    </p>
                    <p class="text-sm leading-none text-gray-800">
                      <span class="text-gray-800">Storage: </span> <%= product.getFicheTech().getMemory() %>
                    </p>
                    <p class="text-sm leading-none text-gray-800">
                      <span class="text-gray-800">Battery: </span> <%= product.getFicheTech().getBattery() %>
                    </p>
                  </div>
                </div>
                <div class="flex justify-between space-x-8 items-start w-full">
                  <p class="text-base xl:text-lg leading-6">
                    $<%= product.getPrice()%>
                    <span class="text-red-300 line-through"> <span>$</span><%= product.getPrice() + Float.parseFloat("25f") %></span>
                  </p>
                  <p class="text-base xl:text-lg leading-6 text-gray-800">01</p>
                  <p
                    class="text-base xl:text-lg font-semibold leading-6 text-gray-800"
                  >
                   $<%= product.getPrice()%>
                  </p>
                </div>
              </div>
            </div>
						<% } %>
					<%} %>
            
            
               
            <!-- End Product -->
     
          <div
            class="flex justify-center flex-col md:flex-row flex-col items-stretch w-full space-y-4 md:space-y-0 md:space-x-6 xl:space-x-8"
          >
            <div
              class="flex flex-col px-4 py-6 md:p-6 xl:p-8 w-full bg-gray-50 space-y-6"
            >
              <h3 class="text-xl font-semibold leading-5 text-gray-800">
                Summary
              </h3>
              <div
                class="flex justify-center items-center w-full space-y-4 flex-col border-gray-200 border-b pb-4"
              >
                <div class="flex justify-between w-full">
                  <p class="text-base leading-4 text-gray-800">Subtotal</p>
                  <p class="text-base leading-4 text-gray-600">$<%= cart.getTotalPrice() %></p>
                </div>
                <div class="flex justify-between items-center w-full">
                  <p class="text-base leading-4 text-gray-800">
                    Discount
                    <span
                      class="bg-gray-200 p-1 text-xs font-medium leading-3 text-gray-800"
                      >STUDENT</span
                    >
                  </p>
                  <p class="text-base leading-4 text-gray-600"><span>-$</span><%= (cart.getTotalPrice() * 2)/100 %> (2%)</p>
                </div>
                <div class="flex justify-between items-center w-full">
                  <p class="text-base leading-4 text-gray-800">Shipping</p>
                  <p class="text-base leading-4 text-gray-600">$8.00</p>
                </div>
              </div>
              <div class="flex justify-between items-center w-full">
                <p class="text-base font-semibold leading-4 text-gray-800">
                  Total
                </p>
                <p class="text-base font-semibold leading-4 text-gray-600">
                  <%= cart.getTotalPrice() - (cart.getTotalPrice() * 2)/100%>
                </p>
              </div>
            </div>
            <div
              class="flex flex-col justify-center px-4 py-6 md:p-6 xl:p-8 w-full bg-gray-50 space-y-6"
            >
              <h3 class="text-xl font-semibold leading-5 text-gray-800">
                Shipping
              </h3>
              <div class="flex justify-between items-start w-full">
                <div class="flex justify-center items-center space-x-4">
                  <div class="w-8 h-8">
                    <img
                      class="w-full h-full"
                      alt="logo"
                      src="https://i.ibb.co/L8KSdNQ/image-3.png"
                    />
                  </div>
                  <div class="flex flex-col justify-start items-center">
                    <p class="text-lg leading-6 font-semibold text-gray-800">
                      DPD Delivery<br /><span class="font-normal"
                        >Delivery with 24 Hours</span
                      >
                    </p>
                  </div>
                </div>
                <p class="text-lg font-semibold leading-6 text-gray-800">
                  $8.00
                </p>
              </div>
              <div class="w-full flex justify-center items-center">
                <a
                href='PlaceOrder?orderId=<%=randomInt %>&total=<%= cart.getTotalPrice() %>&email=<%= user.getEmail() %>&desc=<%= desc%>'
                  class="text-center hover:bg-black focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 py-5 w-96 md:w-full bg-gray-800 text-base font-medium leading-4 text-white"
                >
                  Place Order
                </a>
              </div>
            </div>
          </div>
        </div>
        <div
          class="bg-gray-50 w-full xl:w-96 flex justify-between items-center md:items-start px-4 py-6 md:p-6 xl:p-8 flex-col"
        >
          <h3 class="text-xl font-semibold leading-5 text-gray-800">
            Customer
          </h3>
          <div
            class="flex flex-col md:flex-row xl:flex-col justify-start items-stretch h-full w-full md:space-x-6 lg:space-x-8 xl:space-x-0"
          >
            <div class="flex flex-col justify-start items-start flex-shrink-0">
              <div
                class="flex justify-center w-full md:justify-start items-center space-x-4 py-8 border-b border-gray-200"
              >
                <img
                  src="https://i.ibb.co/5TSg7f6/Rectangle-18.png"
                  alt="avatar"
                />
                <div class="flex justify-start items-start flex-col space-y-2">
                  <p
                    class="text-base font-semibold leading-4 text-left text-gray-800"
                  >
                    <%= user.getLastName() %>
                    <%= user.getFirstName() %>
                  </p>
                  <p class="text-sm leading-5 text-gray-600">
                    10 Previous Orders
                  </p>
                </div>
              </div>

              <div
                class="flex justify-center text-gray-800 md:justify-start items-center space-x-4 py-4 border-b border-gray-200 w-full"
              >
                <svg
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M19 5H5C3.89543 5 3 5.89543 3 7V17C3 18.1046 3.89543 19 5 19H19C20.1046 19 21 18.1046 21 17V7C21 5.89543 20.1046 5 19 5Z"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    d="M3 7L12 13L21 7"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
                <p class="cursor-pointer text-sm leading-5">
                  <%= user.getEmail() %>
                </p>
              </div>
            </div>
            <div
              class="flex justify-between xl:h-full items-stretch w-full flex-col mt-6 md:mt-0"
            >
              <div
                class="flex justify-center md:justify-start xl:flex-col flex-col md:space-x-6 lg:space-x-8 xl:space-x-0 space-y-4 xl:space-y-12 md:space-y-0 md:flex-row items-center md:items-start"
              >
                <div
                  class="flex justify-center md:justify-start items-center md:items-start flex-col space-y-4 xl:mt-8"
                >
                  <p
                    class="text-base font-semibold leading-4 text-center md:text-left text-gray-800"
                  >
                    Shipping Address
                  </p>
                  <p
                    class="w-48 lg:w-full xl:w-48 text-center md:text-left text-sm leading-5 text-gray-600"
                  >
                    180 North King Street, Northhampton MA 1060
                  </p>
                </div>
                <div
                  class="flex justify-center md:justify-start items-center md:items-start flex-col space-y-4"
                >
                  <p
                    class="text-base font-semibold leading-4 text-center md:text-left text-gray-800"
                  >
                    Billing Address
                  </p>
                  <p
                    class="w-48 lg:w-full xl:w-48 text-center md:text-left text-sm leading-5 text-gray-600"
                  >
                    180 North King Street, Northhampton MA 1060
                  </p>
                </div>
              </div>
              <div
                class="flex w-full justify-center items-center md:justify-start md:items-start"
              >
                <button
                  class="mt-6 md:mt-0 py-5 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 border border-gray-800 font-medium w-96 2xl:w-full text-base font-medium leading-4 text-gray-800"
                >
                  Edit Details
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
