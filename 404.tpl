<!DOCTYPE html>
<html>

<head>
	<meta charset='UTF-8'>

	<title>Cool404error-sample3</title>

	<link rel='stylesheet' href='css/style.css'>

	<style>
		html { background: black; }
		html, body { overflow: hidden; }
		#poster {
			width: 890px;
			margin: 30px auto;
	  		font-family: "ELENA", "Century Gothic",  Impact, Sans-Serif;
 		}
 		#poster h1 {
 			color: white;
 			background: url(images/pic.jpg) 20px -150px no-repeat;
			font-size: 180px;
			line-height: 0.7;
			text-align: center;
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			letter-spacing: -8px;
			-webkit-transition: all 2.5s;
			padding-bottom: 200px;
		}
 		.step-one #poster h1 {
 			padding-top: 250px;
 		}
		#poster h1 span {
			-webkit-transition: all 2.5s;
			-moz-transition: all 2.5s;
			-o-transition: all 2.5s;
		}
		#poster h1 span.char1 { margin-left: -1450px; }
		#poster h1 span.char2 { margin-left: 200px; }
		#poster h1 span.char3 { margin-left: 200px; }
		#poster h1 span.char5 { margin-left: 1450px; }
		#poster h1 span.char6 { margin-left: 200px; }
		#poster h1 span.char7 { margin-left: 200px; }
		#poster h1 span.char8 { margin-left: 200px; }
		#poster h1 span.char9 { margin-left: 200px; }
		.step-one #poster h1 span { margin: 0; }

 		#poster p { text-align: center; font-size: 30px; letter-spacing: 20px; }
 		#poster p span { position: relative; -webkit-transition: all 2.5s ease; color: white; }
 		.step-two #poster p span { top: 0 !important; left: 0 !important; }
	</style>

	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'></script>
	<script src="js/jquery.lettering.js"></script>
	<script>
		// DOM Ready
		$(function() {
			$("#poster h1, #poster p").lettering();
			$("#poster p span").each(function() {  $(this).css({ top: -(Math.floor(Math.random()*1001)+1500), left: Math.floor(Math.random()*1001)-500,  }); });
			setTimeout(function() {$('html').addClass("step-one");}, 1000);
			setTimeout(function() {$('html').addClass("step-two");}, 3000);
		});
	</script>
</head>

<body>

	<div id="poster">

		<h1>404 ERROR</h1>

		<p>File Not Found</p>

	</div>

</body>

</html>
