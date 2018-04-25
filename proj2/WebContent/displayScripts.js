function pushToDB(){
    var size = document.getElementById('galleryInner').children.length;
    var arr = [];
    for(i = 0; i < size; i++){
        var wrapper = document.getElementById("galleryCollage-" + i);
        var collage = wrapper.children[0];
        var img = {title:collage.alt,imageBase64:collage.src.substring(22)};
        arr.push(img);
    }
    firebase.database().ref('users/' + userEmail.substring(0, userEmail.indexOf('@'))).set({
        imageObject: arr
      });
    console.log("SAVING");
};

function pullFromDB(){
	console.log("Pulling from DB");
	var ref = firebase.database().ref("users/" + userEmail.substring(0, userEmail.indexOf('@')));
	ref.on("value", function(snapshot) {
		snapshot.forEach(function(childSnapshot){
			var img = childSnapshot.val();
			var galleryMainDiv = document.getElementById('galleryInner');
			var numElementsInDiv = galleryMainDiv.children.length;
			if(numElementsInDiv <= 0){
				for(i = 0; i < img.length; i++){
					var galleryMainDiv = document.getElementById('galleryInner');
					var newCollageNum = galleryMainDiv.children.length;

					newCollageImg = document.createElement('img');
					newCollageImg.src = 'data:image/png;base64,' + img[i].imageBase64;
					newCollageImg.className = 'galleryImage';
					newCollageImg.alt = img[i].title

					newCollageLink = document.createElement('a');
					newCollageLink.id = ("galleryCollage-" + newCollageNum);
					newCollageLink.className = "galleryLink";
					newCollageLink.setAttribute("onclick","clickedGallery('" + newCollageNum + "')");
					newCollageLink.appendChild(newCollageImg);

					newCollageDelete = document.createElement('a');
					newCollageDelete.className = "deleteOption";
					newCollageDelete.innerHTML = "DELETE";
					newCollageDelete.setAttribute("onclick","deleteCollage('" + "galleryCollageDiv-" + newCollageNum + "')");
					
					tempDiv = document.createElement('div');
					tempDiv.id = ("galleryCollageDiv-" + newCollageNum);
					tempDiv.className = "galleryCollageDiv";
					tempDiv.appendChild(newCollageLink);
					tempDiv.appendChild(newCollageDelete);

					galleryMainDiv.appendChild(tempDiv);
				}		
			}
			
		});
	});
}

//User stopped writing on input box, disables button if there is no test 
function editingStopped(){
    if(document.getElementById('inputBox').value.trim().length > 0) { 
        document.getElementById('submitButton').disabled = false; 
    } else { 
        document.getElementById('submitButton').disabled = true;
    }
}

//Links the image being displayed to the download button
function prepareDownload(){
	var img = document.getElementById('mainCollage');
	
	var canvas = document.createElement('canvas');
	canvas.id = "myCanvas";
	canvas.height = img.height;
	canvas.width = img.width;
	context = canvas.getContext('2d');
	context.drawImage(img, 0, 0, 300, 300);
	var newImg = canvas.toDataURL('image.png');
	
	//Check radio button to see if we should export the image to PDF or PNG
	//var exportAs = document.getElementById('exportAsOptions').value;
	if (document.getElementById('pdf').checked) {
		console.log("preparing pdf file");
		var pdf = new jsPDF({
			orientation: 'landscape',
			unit: 'pt',
			format: [canvas.height, canvas.width]
		});
		pdf.addImage(newImg, 'PNG', 0, 0, canvas.width, canvas.height);
		pdf.save(img.alt + ".pdf");
	} else {
		var exportDiv = document.getElementById('exportButton');
		exportDiv.href = newImg;
		exportDiv.download = img.alt + ".png";
	}
}

//Hides header and main collage and displays error msg
function displayErrorMsg(topic){
	var mainCollage = document.getElementById('mainCollage');
	mainCollage.style.display = 'none';

	var exportButton = document.getElementById('exportButton');
	exportButton.style.display = 'none';

	var collageTitle = document.getElementById('title');
	collageTitle.innerHTML = ('Collage for topic ' + topic);

	var insufficientImagesMsg = document.getElementById('insufficientImages');
	insufficientImagesMsg.style.display = 'block';
	
	//Displaying all in gallery
	var galleryMainDiv = document.getElementById('galleryInner');
	var galleryImages = galleryMainDiv.children;

	//
	for(i=0; i<galleryImages.length;i++){
		galleryImages[i].style.display = 'inline-block';
	}
}

//Displays header and main collage and hides error msg
function displayMainCollageAndHeader(){
	var mainCollage = document.getElementById('mainCollage');
	mainCollage.style.display = 'block';

	var exportButton = document.getElementById('exportButton');
	exportButton.style.display = 'block';

	var insufficientImagesMsg = document.getElementById('insufficientImages');
	insufficientImagesMsg.style.display = 'none';
}

//Logic for when gallery item is pressed.
function clickedGallery(divNum){
	//Display main space and header in case error was prev displayed
	displayMainCollageAndHeader();

	//Get clicked collageID
	var clickedImgId = ("galleryCollage-" + divNum);
	var galleryMainDiv = document.getElementById('galleryInner');
	var galleryImages = galleryMainDiv.children;

	//Going through all the collages in the gallery, displaying all but the one clicked
	//	for(i=0; i<galleryImages.length;i++){
	//		if(galleryImages[i].id == clickedImgId){
	//			galleryImages[i].style.display = 'none';
	//		} else{
	//			galleryImages[i].style.display = 'inline-block';
	//		}
	//	}

	//Sending clicked collage to the main space
	var clickedImgContainer = document.getElementById(clickedImgId);
	var clickedImg = clickedImgContainer.children[0];
	var mainCollageImg = document.getElementById('mainCollage');
	mainCollageImg.src = clickedImg.src;
	mainCollage.alt = clickedImg.alt;

	//Setting title according to collage
	var collageTitle = document.getElementById('title');
	var imgTopic = clickedImg.alt;
	collageTitle.innerHTML = ('Collage for topic ' + imgTopic);
}

//Functionality for when a new collage is added
function addedNewCollage(imgObject){	
	var galleryMainDiv = document.getElementById('galleryInner');
	var newCollageNum = galleryMainDiv.children.length;

	newCollageImg = document.createElement('img');
	newCollageImg.src = 'data:image/png;base64,' + imgObject.imageBase64;
	newCollageImg.className = 'galleryImage';
	newCollageImg.alt = imgObject.title;

	newCollageLink = document.createElement('a');
	newCollageLink.id = ("galleryCollage-" + newCollageNum);
	newCollageLink.className = "galleryLink";
	newCollageLink.setAttribute("onclick","clickedGallery('" + newCollageNum + "')");
	
	newCollageLink.appendChild(newCollageImg);
	galleryMainDiv.appendChild(newCollageLink);

	//After collage is added to the gallery, 
	//'clicking it' to display on main collage and hide form gallery
	clickedGallery(newCollageNum);
	return false;
}

function loadFirstContent(title,imgData,isError){
    console.log(title);
    console.log(imgData);
    console.log(isError);
    pullFromDB();
    if(isError == 'true'){
    	newImg = {
       			title: title,
       			imageBase64: imgData
       	};
       	//addedNewCollage(newImg);   		
    } else {
    	//displayErrorMsg(title);
    }
}

function makeCollageRequest(){
	hideCurrentCollage();
	displayLoader();
	console.log("MAKE REQUEST");
	event.preventDefault();
	var querry = document.getElementById("inputBox").value;
	var shape = document.getElementById("inputBoxShape").value;
	var filterDropDown = document.getElementById("filterSelector");
	var filterNum = filterDropDown.options[filterDropDown.selectedIndex].value;

	var rotationsValue = 0;		
	 if(rotationsCheckbox.checked){		
	 	rotationsValue = 1;		
	 }		
	 			
	var bordersCheckbox = document.getElementById("bordersCheckbox");		
	var bordersValue = 0;		
	if(bordersCheckbox.checked){		
		bordersValue = 1;		
	}		
	 			
	var collageWidth = document.getElementById("inputBoxWidth").value;		
	var collageHeight = document.getElementById("inputBoxHeight").value;		
				
	var url = "BuildAnotherImageServer?topic=" + querry + "&shape=" + 		
	shape + "&filterNum="+filterNum + "&rotationsValue=" + rotationsValue + 		
	"&bordersValue=" + bordersValue + "&collageWidth=" + collageWidth + "&collageHeight=" + collageHeight;
	
	console.log(url);
	var req = new XMLHttpRequest();
	req.open("GET", url, true);
	req.send();
	req.onreadystatechange = function () {
		if(req.readyState == 4 && req.status == 200) {
			console.log(req.responseText);
			var imgDataJson = JSON.parse(req.responseText);
			var imgTitle = imgDataJson.collageTitle;
			var imgData = imgDataJson.collageImage;
			var imgValid = imgDataJson.collageValid;
			
			if(imgValid == 'true'){
				var imgObject = {
						title: imgTitle,
						imageBase64: imgData
				};
				//addedNewCollage(imgObject);
				hideLoader();
				displayCollageInMainDiv(imgObject);
			} else {
				hideLoader();
				displayErrorMsg(imgTitle);
			}			
		}
	}
	
	return false;
}

function displayCollageInMainDiv(imgObject){
	//Display main space and header in case error was prev displayed
	displayMainCollageAndHeader();

	var mainCollageImg = document.getElementById('mainCollage');
	mainCollageImg.src = 'data:image/png;base64,' + imgObject.imageBase64;
	mainCollage.alt = imgObject.title;
	var collageTitle = document.getElementById('title');
	var imgTopic = mainCollage.alt
	collageTitle.innerHTML = ('Collage for topic ' + imgTopic);

	return false;
}

function clickedSave(){
	console.log("CLICKED SAVE");
	
	var mainCollageImg = document.getElementById('mainCollage');
	var galleryMainDiv = document.getElementById('galleryInner');
	var newCollageNum = galleryMainDiv.children.length;

	newCollageImg = document.createElement('img');
	newCollageImg.src = mainCollageImg.src
	newCollageImg.className = 'galleryImage';
	newCollageImg.alt = mainCollage.alt

	newCollageLink = document.createElement('a');
	newCollageLink.id = ("galleryCollage-" + newCollageNum);
	newCollageLink.className = "galleryLink";
	newCollageLink.setAttribute("onclick","clickedGallery('" + newCollageNum + "')");
	newCollageLink.appendChild(newCollageImg);
	
	newCollageDelete = document.createElement('a');
	newCollageDelete.className = "deleteOption";
	newCollageDelete.innerHTML = "DELETE";
	newCollageDelete.id = "deleteCollage-" + newCollageNum;
	newCollageDelete.setAttribute("onclick","deleteCollage('" + "galleryCollageDiv-" + newCollageNum + "')");
	
	tempDiv = document.createElement('div');
	tempDiv.id = ("galleryCollageDiv-" + newCollageNum);
	tempDiv.className = "galleryCollageDiv";
	tempDiv.appendChild(newCollageLink);
	tempDiv.appendChild(newCollageDelete);

	console.log("APPENDING");
	galleryMainDiv.appendChild(tempDiv);
	//galleryMainDiv.appendChild(newCollageLink);

	//After collage is added to the gallery, 
	//'clicking it' to display on main collage and hide form gallery
	renameCollagesInGallery();
	pushToDB();
	return false;
}

function displayLoader(){
	var loader = document.getElementById('loader');
	loader.style.display = 'block';
}

function hideLoader(){
	var loader = document.getElementById('loader');
	loader.style.display = 'none';
}

function deleteCollage(divToDeleteId){
	console.log("DELETING");
	console.log(document.getElementById('galleryInner').children.length);
	var divToDelete = document.getElementById(divToDeleteId);
	divToDelete.parentNode.removeChild(divToDelete);
	console.log(document.getElementById('galleryInner').children.length);
	renameCollagesInGallery();
	pushToDB();
}

function hideCurrentCollage(){
	var mainCollage = document.getElementById('mainCollage');
	mainCollage.style.display = 'none';

	var exportButton = document.getElementById('exportButton');
	exportButton.style.display = 'none';

	var insufficientImagesMsg = document.getElementById('insufficientImages');
	insufficientImagesMsg.style.display = 'none';
}

function renameCollagesInGallery(){
	var galleryMainDiv = document.getElementById('galleryInner');
	var numCollages = galleryMainDiv.children.length;
	
	for(i = 0; i < numCollages; i++){
		var tempDiv = galleryMainDiv.children[i];
		tempDiv.id = ("galleryCollageDiv-" + i);
		
		var tempLinkImg = tempDiv.children[0];
		tempLinkImg.id = ("galleryCollage-" + i);
		tempLinkImg.setAttribute("onclick","clickedGallery('" + i + "')");
		
		var tempLinkDelete = tempDiv.children[1];
		tempLinkDelete.setAttribute("onclick","deleteCollage('" + "galleryCollageDiv-" + i + "')"); 
		newCollageDelete.id = "deleteCollage-" + i;
		
	}	
}