<%@page import="beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 

// login
Boolean loged = false;
if (session.getAttribute("loged") != null) {
    // user is authenticated
    loged = true;
}

%>
          <div class="flex  py-3 flex-col bg-white shadow-xl scale-[0.8]">
            <div class="flex-1 overflow-y-auto py-6 px-4 sm:px-6">
              <div class="flex items-start justify-between">
                <h2 class="text-lg font-medium text-gray-900" id="slide-over-title">Shopping cart</h2>
                <div class="ml-3 flex h-7 items-center">
                  <button type="button" onclick="panierClick()" class="-m-2 p-2 text-gray-400 hover:text-gray-500">
                    <span class="sr-only">Close panel</span>
                    <!-- Heroicon name: outline/x-mark -->
                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>

              <div class="mt-8">
                <div class="flow-root p-1 h-[50vh] overflow-y-auto">
                  <ul role="list" class="-my-6 px-3 divide-y divide-gray-200">
                    
					<!-- Loop over products -->
					<!-- get Cart from session -->
					<% ShoppingCart cart = (ShoppingCart)session.getAttribute("panier"); %>
					<% if(cart != null){ %>
						<!-- getProduct -->
						<% ArrayList<Product> products = cart.getProducts(); %>
						<!-- loop over product -->
						<% for(Product product : products){ %>
							<!-- One Product -->
							<li class="flex py-6">
                      <div class="h-24 w-24 flex-shrink-0 overflow-hidden rounded-md border border-gray-200">
                        <img src="<%= product.getImage() %>" alt="Front of satchel with blue canvas body, black straps and handle, drawstring top, and front zipper pouch." class="h-full w-full object-cover object-center">
                      </div>

                      <div class="ml-4 flex flex-1 flex-col">
                        <div>
                          <div class="flex justify-between text-base font-medium text-gray-900">
                            <h3>
                              <a href="#"><%= product.getName() %></a>
                            </h3>
                            <p class="ml-4">$<%= product.getPrice() %></p>
                          </div>
                          <p class="mt-1 text-sm text-gray-500"><%= product.getRate() %></p>
                        </div>
                        <div class="flex flex-1 items-end justify-between text-sm">
                          <p class="text-gray-500"></p>

                          <div class="flex">
                            <button type="button" class="font-medium text-indigo-600 hover:text-indigo-500">Remove</button>
                          </div>
                        </div>
                      </div>
                    </li>
							
						<% } %>
					<% } %>
					                    

                    <!-- More products... -->
                  </ul>
                </div>
              </div>
            </div>

            <div class="border-t border-gray-200 py-6 px-4 sm:px-6">
              <div class="flex justify-between text-base font-medium text-gray-900">
                <p>Subtotal</p>
                <p>$<%= cart != null ? cart.getTotalPrice() : 0 %></p>
              </div>
              <p class="mt-0.5 text-sm text-gray-500">Shipping and taxes calculated at checkout.</p>
              <div class="mt-6">
                <a 
                <% if(loged){ %>
                href='./checkout.jsp'
                <% }else{ %>
                onclick='haveToLog()'
                <% } %>
                class="flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-6 py-3 text-base font-medium text-white shadow-sm hover:bg-indigo-700">Checkout</a>
              </div>
              <div class="mt-6 flex justify-center text-center text-sm text-gray-500">
                <p>
                  or
                  <a onclick="panierClick()" class="font-medium text-indigo-600 hover:text-indigo-500">
                    Continue Shopping
                    <span aria-hidden="true"> &rarr;</span>
                  </a>
                </p>
              </div>
            </div>
          </div>