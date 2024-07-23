let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.getElementsByClassName("slide");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    slides[slideIndex-1].style.display = "block";  
    setTimeout(showSlides, 9000); // Change image every 2 seconds
}

document.getElementById("sign").addEventListener("click", function() {
    document.querySelector(".overlay").style.display = "flex";
});

document.querySelector(".popup .close-btn").addEventListener("click", function() {
    document.querySelector(".overlay").style.display = "none";
});



document.getElementById("log").addEventListener("click", function() {
    document.querySelector(".overlay1").style.display = "flex";
});

document.querySelector(".popup1 .close-btn1").addEventListener("click", function() {
    document.querySelector(".overlay1").style.display = "none";
});

function checkpassword(){
	var Password=document.getElementById("pwd").value;
	var cPassword=document.getElementById("repwd").value;
    var messageElement = document.getElementById("password-message");
	
	if(Password != cPassword){
		alert("Password Not Match...");
	}
	else{
		alert("Success");
		return true;
	}
}	




