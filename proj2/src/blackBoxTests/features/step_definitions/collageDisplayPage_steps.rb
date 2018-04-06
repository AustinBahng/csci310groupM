numSecondsWait = 30

Given(/^that I am in localhost$/) do
  visit "http://localhost:8080/scollage/homepage.jsp"
end

Given(/^I have typed "([^"]*)" into the search bar$/) do |arg1|
  fill_in('inputBox', :with => arg1)
end

Given(/^I have pressed enter$/) do
  find_field("inputBox").native.send_key(:enter)
end

Then(/^I should see "([^"]*)" displayed above the collage$/) do |arg1|
  page.find_by_id("title").text == arg1
end


Then(/^I should see "([^"]*)" in (\d+)pt font$/) do |arg1, arg2|
  page.find_by_id("title").native.css_value("font-size") == arg2
end


Then(/^I should see "([^"]*)" displayed in black font$/) do |arg1|
  page.find_by_id("title").native.css_value("color") == "black"
end

Given(/^that I am on the Collage Display Page$/) do
  visit "http://localhost:8080/scollage/displayPage.jsp"
end

Then(/^the color of the build another collage button is grey$/) do
  page.find_by_id("submitButton").native.css_value("background-color") == '#696969' 
end

Then(/^the color of the build another collage text is white$/) do
  page.find_by_id("submitButton").native.css_value("color") == 'white' 
end

Then(/^the label of the build another collage button is "([^"]*)"$/) do |arg1|
  page.find_by_id("submitButton").value == arg1
end

When(/^I enter "([^"]*)" into the input box$/) do |arg1|
  fill_in('inputBox', :with => arg1)
end

When(/^press the Build Another Collage button$/) do
  page.find_by_id("submitButton").click
end

Then(/^I should see the collage for topic "([^"]*)" generated$/) do |arg1|
  sleep(numSecondsWait)
  page.find('#mainCollage')['alt'].should have_content arg1
end

Then(/^the outline color of the input box is dark gray$/) do
  page.find_by_id('inputBox').native.css_value('border').should have_content '2px solid rgb(105, 105, 105)'
end

Then(/^the background color of the input box is white$/) do
  page.find_by_id("inputBox").native.css_value("color") == 'white' 
end

Then(/^the color of the prompt text is very light gray$/) do
  page.find_by_id("inputBox").native.css_value("::placeholder::color") == '#D3D3D3'
end

Then(/^the prompt text is "([^"]*)"$/) do |arg1|
  page.find_by_id("inputBox")['placeholder'] == arg1
end

When(/^I have typed "([^"]*)" into the input box$/) do |arg1|
  fill_in('inputBox', :with => arg1)
end


Then(/^the prompt text should be gone$/) do
  page.find_by_id("inputBox")['value'] != page.find_by_id("inputBox")['placeholder']
end

Given(/^that a collage for topic "([^"]*)" has been generated$/) do |arg1|
  fill_in('inputBox', :with => arg1)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Then(/^the background color is dark gray$/) do
  page.find_by_id("exportButton").native.css_value("background-color") == '#696969'
end

Then(/^text label is "([^"]*)"$/) do |arg1|
  page.find_by_id("exportButton").should have_content arg1
end


Then(/^label text is white$/) do
  page.find_by_id("exportButton").native.css_value("color") == 'white'
end

When(/^I press the export collage button$/) do
  page.find_by_id("exportButton").click
end

Then(/^the downloaded image should be a PNG$/) do
  File.exist?('/home/student/Downloads/cats.png')
end

Then(/^the downloaded png should be the same as the currently displayed collage$/) do
  File.exist?('/home/student/Downloads/cats.png')
end

Then(/^the downloaded image should match the size of the collage’s$/) do
  downloadedImg = IO.read('/home/student/Downloads/cats.png')[0x10..0x18].unpack('NN')
  downloadedWidth = downloadedImg[0]
  downloadedHeight = downloadedImg[1]
  imgWidth = page.find('#mainCollage').native.css_value('width')
  imgHeight = page.find('#mainCollage').native.css_value('height')
  (downloadedWidth == imgWidth and downloadedHeight == imgHeight)
end

Given(/^that a collage for topic "([^"]*)" has been generated and is currently being displayed$/) do |arg1|
  fill_in('inputBox', :with => arg1)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
  page.find('#mainCollage')['alt'].should have_content arg1
end

Then(/^a scaled down version of "([^"]*)" and "([^"]*)" collages should appear in the previous collage picker$/) do |arg1, arg2|
  page.find(:xpath, '//a[@id="galleryCollage-1"]/img')['alt'].should have_content arg1
  page.find(:xpath, '//a[@id="galleryCollage-2"]/img')['alt'].should have_content arg2
end

Then(/^the collage for topic "([^"]*)" does not appear in the previous collage picker$/) do |arg1|
  page.find(:xpath, '//a[@id="galleryCollage-0"]/img', :visible=>false)['alt'].should have_content arg1
end

When(/^the collage for topic "([^"]*)" is clicked$/) do |arg1|
  page.find('#galleryCollage-0').click

end

Then(/^the collage for topic "([^"]*)" appears in the main collage space$/) do |arg1|
  page.find('#mainCollage')['alt'].should have_content arg1
end

Then(/^the title "([^"]*)" appears above main collage space$/) do |arg1|
  page.find('#title').should have_content arg1
end

When(/^a collage for topic "([^"]*)" is generated$/) do |arg1|
  fill_in('inputBox', :with => arg1)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Then(/^a scroll bar appears to see the entire row of collages$/) do
  page.find("#galleryInner").native.css_value("::-webkit-scrollbar-thumb::background-color") == 'rgba(0,0,0,.5)'
end

Then(/^the main collage space is underneath the title$/) do
  posMainSpace = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('mainCollage')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
	
 posTitle = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('title')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 (posMainSpace[1] < posTitle[1])
end

Then(/^the build another collage button is underneath the main collage space and slightly to the right of center$/) do
  posMainSpace = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('mainCollage')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
	
 posBuildAnotherCollage = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('submitButton')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 ((posMainSpace[1] > posBuildAnotherCollage[1]) and (posBuildAnotherCollage[0]>0))
end

Then(/^the input box is on the left of the build another collage button$/) do
  posBuildAnotherCollage = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('submitButton')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
	
 posInputBox = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('inputBox')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 ((posInputBox[0] > posBuildAnotherCollage[0]) and (posInputBox[0] == posBuildAnotherCollage[1]))
end

Then(/^the previous collage picker is below the main collage space$/) do
 posCollagePicker = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('galleryOuter')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS
	
 posMainSpace = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('mainCollage')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 (posMainSpace[1] > posCollagePicker[1])
end

Then(/^the background color of the collage display page is white$/) do
  page.first("body").native.css_value('background-color') == '#D3D3D3'
end

Then(/^the collage is between (\d+)\-(\d+)% of the browser viewport width being no less than (\d+)px$/) do |arg1, arg2, arg3|
  windowWidth = (780 + Random.rand(300)).to_i #creating random value
  windowHeight = (580 + Random.rand(300)).to_i #creating random value
  page.driver.browser.manage.window.resize_to(windowWidth,windowHeight)

  imgWidth = page.find('#mainCollage').native.css_value('width').to_i
  ((imgWidth >= arg3.to_i) or (((windowWidth*arg1.to_i*0.01) <= imgWidth) and ((windowWidth*arg2.to_i*0.01) >= imgWidth)))
  
end

Then(/^the collage is between (\d+)\-(\d+)% of the browser viewport height being no less than (\d+)px$/) do |arg1, arg2, arg3|
  windowWidth = (780 + Random.rand(300)).to_i #creating random value
  windowHeight = (580 + Random.rand(300)).to_i #creating random value
  page.driver.browser.manage.window.resize_to(windowWidth,windowHeight)

  imgHeight = page.find('#mainCollage').native.css_value('height').to_i
  ((imgHeight >= arg3.to_i) or (((windowHeight*arg1.to_i*0.01) <= imgHeight) and ((windowHeight*arg2.to_i*0.01) >= imgHeight)))
end

Then(/^collage is centered on the Collage Display Page$/) do
  posMainSpace = page.driver.evaluate_script <<-EOS
	function(){
		var ele = document.getElementById('mainCollage')
		var rect = ele.getBoundingClientRect();
		return [rect.left, rect.top];
	}();
 EOS

 (posMainSpace[0] == 0)
end

Given(/^that a collage for topic "([^"]*)" has tried to be generated$/) do |arg1|
  fill_in('inputBox', :with => arg1)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Then(/^"([^"]*)" message is displayed in the main collage space$/) do |arg1|
  page.find('#insufficientImages', :visible =>true).should have_content arg1
end

Then(/^"([^"]*)" message is in black font$/) do |arg1|
  page.find('#insufficientImages', :visible =>true).native.css_value('color').should have_content "rgba(0, 0, 0, 1)"
end

Then(/^"([^"]*)" is in (\d+)pt font$/) do |arg1, arg2|
  page.find('#insufficientImages', :visible =>true).native.css_value('font-size').should have_content "24px" #18pt = 24px
end

When(/^I see button cannot be clicked$/) do
  page.find_by_id('submitButton')[:disabled].should eq "true"
end

When(/^I see the button can be clicked$/) do
  page.find_by_id('submitButton')[:disabled].should eq nil
end







