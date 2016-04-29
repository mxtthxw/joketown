$(document).ready(function(){

	$(function(){

		setInterval(function(){
				var newColor = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)
				$(".joketown").css("color", newColor);
		}, 2000)

		setInterval(function(){
				var newColor = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)
				$(".banner").css("background-color", newColor);
		}, 1000)

	});

});