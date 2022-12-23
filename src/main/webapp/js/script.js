

 
 // like functionalty
 
   function like() {
    // Get the element with the ID "myDiv"
    var element = document.getElementById("liked");
     
    // Toggle the "selected" class on the element
    element.classList.toggle("licked");
  }
  
  // Add the "toggleClass" function as an event listener for the "click" event
  //document.getElementById("liked").addEventListener("click", like);

 // end like
 
 //======== start login
 	function showLogin(){
	// Get the element with the ID "myDiv"
    document.getElementById("login").classList.toggle("show2")
    }
 // ============ end login
 
 // panier
 
  const panierClick = ()=>{
  	document.getElementById("panier").classList.toggle("show");
}
   
 // end panier



