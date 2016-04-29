toggler = 1

$(document).ready(function(){

	$(function(){

		setInterval(function(){
			var newColor = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)
			$(".joketown").css("color", newColor);
		}, 2000)

		setInterval(function(){
			var newColor = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)
			$(".banner").css("background-color", newColor);
		}, 3000)

			$(".signup_button").click(
		function(){
	// function launchModal(){
			$(".modal1").fadeIn(500).css("display", "block");
			$(".wrapper").fadeIn(500).css("display", "block");
			$(".wrapper").on("click", function(){
				if(toggler == 2){
					closeModal();
				}
			});
			///////////
			// $(".modal").on("click", function(){
			// 	if(bob == 2){
			// 		closeModal();
			// 	}
			// });
			// bob = 2;
			///////////
			// removing the block above will make it so that clicking on the modal DOES NOT close it, but clicking on the background does
		}
	);

	function closeModal(){
		$(".modal1").fadeOut(500).css("display", "none");
		$(".wrapper").fadeOut(500).css("display", "none");
		toggler = 1;
	}

		// setInterval(function(){
		// 	$(".o").css("font-size", 110);
		// }, 400)

		// setInterval(function(){
		// 	$(".o").css("font-size", 100);
		// }, 400)

	});

});