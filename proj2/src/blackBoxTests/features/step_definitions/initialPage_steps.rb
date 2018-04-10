Given(/^that I am on the Initial Page$/) do
  visit "http://localhost:8080/proj2/homepage.jsp"
end

Then(/^the background of the initial page is solid light gray$/) do
  page.first("body").native.css_value('background-color') == '#D3D3D3'
end

Then(/^the input box appears centered in the middle of the initial page$/) do
   posInputBox = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('inputBox')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
 (posInputBox[0] == 0)
end

Then(/^the button is on the right of the input box$/) do
  posInputBox = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('inputBox')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 posBuildButton = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('submitButton')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
 ((posInputBox[0] < posBuildButton[0]) and (posInputBox[1] == posBuildButton[1]))
end

When(/^press the Build Collage button$/) do
  page.find_by_id("submitButton").click
end



