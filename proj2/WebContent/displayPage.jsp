<!DOCTYPE html>
<html>
	<%
		String collageTitle = (String) session.getAttribute("collageTitle");
		String collageImage = (String) session.getAttribute("collageImage");
		String isError = (String) session.getAttribute("collageValid");
		
		System.out.println("in jsp");
		System.out.println(collageTitle);
		System.out.println("in jsp");
		System.out.println(collageImage);
		System.out.println("in jsp");
		System.out.println(isError);
	%>
<head>
	<meta charset="UTF-8">
	<title>Build Another Collage</title>
	<link rel="stylesheet" type="text/css" href="displayPageStyle.css">
	<script src="displayScripts.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
	</head>
	<body onload="loadFirstContent('<%= collageTitle%>','<%= collageImage%>','<%= isError%>')" >
		
		<!-- header: contains the title and export button -->
		<div id="header">
			<h1 id="title">Collage for topic X</h1>
			
			<a id="saveButton" onclick="clickedSave()">Save to History</a>
			<!-- <a id="exportButtonTemp" download="test.jpeg" >Export</a> -->
			<a id="exportButton" onclick="prepareDownload()" download="test.jpeg" style="display: none;">Export</a>
			<form id="exportAsOptions">
				<input type="radio" name="exportAs" value="png" id="png" checked>PNG
				<input type="radio" name="exportAs" value="pdf" id="pdf">PDF<br />
			</form>
		</div>
		

		<!-- mainSpace: contains either the main collage being displayed or the error msg -->
		<div id="mainSpace">
			<img id="mainCollage" src="" style="display: none" alt = "">
			<div class="loader" id="loader" style="display: none"></div>
			<h2 id="insufficientImages" style="display: none">Insufficient number of images found</h2>
		</div>

		<!-- newInput: contains the inputBox and the buildAnotherCollageButton -->
		<div id="newInput">
			<form name="enterTopic" id="inputForm" method="POST" action="" enctype="multipart/form-data" onsubmit="event.preventDefault()">
				<input type="text" id="inputBox" name="topic" placeholder="Enter topic" onkeyup="editingStopped()"/>
				<input type="text" id="inputBoxShape" name="shape" placeholder="Enter collage Shape"/>
				<select name="filters" id = "filterSelector">
				    <option  value="0">No Filter</option>
				    <option  value="1">B&W Filter</option>
				    <option  value="2">Greyscale Filter</option>
				    <option  value="3">Sepia Filter</option>
				</select>
				<input type="checkbox" id="bordersCheckbox"  value="bordersOn"/> Image borders
				<input type="checkbox" id="rotationsCheckbox"  value="rotationOn"/> Image rotations
				<input type="text" id="inputBoxWidth" name="width" placeholder="Width (px)" value = "800"/>
				<input type="text" id="inputBoxHeight" name="height" placeholder="Height (px)" value = "600"/>
				<br>
				<input type="Submit" id="submitButton" name="build" value="Build Another Collage" onclick= "return makeCollageRequest();" onsubmit="return makeCollageRequest();" disabled />
			</form>
		</div>

		<!-- gallery: contains the previous collages that can be displayed -->
		<div id="galleryOuter">
			<div id="galleryInner">
			</div>
		</div>
	</body>
</html>