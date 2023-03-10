<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<div class="bg-white shadow-md scale-[0.85] hover:scale-102 hover:shadow-xl duration-500 m-2">
    <a href="<%= request.getContextPath()%>/product_details.jsp?id=<%= request.getParameter("id")%>">
      <img src="<%= request.getParameter("image") %>" alt="Product image" class="h-80 w-72 object-contain" />
    </a>
    <div class="px-4 py-3 w-72">
      <span class="text-gray-400 mr-3 uppercase text-xs"></span>
      <p class="text-lg font-bold text-black truncate block capitalize"><%= request.getParameter("name") %></p>
      <div class="flex items-center">
        <p class="text-lg font-semibold text-black cursor-auto my-3">$<%= request.getParameter("price") %></p>
        <del>
          <p class="text-sm text-gray-600 cursor-auto ml-2"><span>$</span><%= Float.parseFloat(request.getParameter("price")) + Float.parseFloat("1300f") %></p>
        </del>
        <div class="ml-auto">
          <a href='addToCart?id=<%= request.getParameter("id") %>'>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5z" />
              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
            </svg>
          </a>
        </div>
      </div>
    </div>
  </div>