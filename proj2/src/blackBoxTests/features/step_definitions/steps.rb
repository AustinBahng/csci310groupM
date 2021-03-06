numSecondsWait = 20

Given("that I am on the Main web page") do
  visit "http://localhost:8080/proj2/displayPage.jsp"
end

Then("there is a topic input box") do
  page.should have_selector('input[id="inputBox"')
end

Then("there is a collage shape input box") do
  page.should have_selector('input[id="inputBoxShape"')
end

Then("there is a collage filter option") do
  page.should have_selector('select[id="filterSelector"')
end

Then("there is a collage no filter option") do
  page.should have_selector('option[value="0"')
end

Then("there is a collage sepia filter option") do
  page.should have_selector('option[value="3"')
end

Then("there is a collage bw filter option") do
  page.should have_selector('option[value="1"')
end

Then("there is a collage greyscale filter option") do
  page.should have_selector('option[value="2"')
end

Then("there is a collage height option") do
  page.should have_selector('input[id="inputBoxHeight"')
end

Then("there is a collage width option") do
  page.should have_selector('input[id="inputBoxWidth"')
end

Then("there is a save to history buttion") do
  page.should have_selector('a[id="saveButton"')
end

Then("there is a build collage button") do
  page.should have_selector('input[id="submitButton"')
end

Then("there is a collage rotations checkbox") do
  page.should have_selector('input[id="rotationsCheckbox"')
end

Then("there is a collage borders checkbox") do
  page.should have_selector('input[id="bordersCheckbox"')
end

Given("that a collage for topic {string} and shape {string} has been generated") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Then("there there is an export button") do
  page.should have_selector('a[id="exportButton"')
end

Then("the downloaded image should be a png") do
  File.exist?('/Users/rblay/Downloads/cats.png')
end

Then("the downloaded image should be a pdf") do
  File.exist?('/Users/rblay/Downloads/cats.pdf')
end

When("I select png as the option") do
  choose('png')
end

When("I select pdf as the option") do
  choose('pdf')
end

When("I select no filter") do
  #select('noFilter', :from => 'filters')
  page.find('#filterSelector').find(:xpath, 'option[1]').select_option
end

When("I select the sepia filter") do
  page.find('#filterSelector').find(:xpath, 'option[4]').select_option
end

When("build a collage for topic {string} with shape {string}") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

When("I select the bw filter") do
  page.find('#filterSelector').find(:xpath, 'option[2]').select_option
end

When("I select the greyscale filter") do
  page.find('#filterSelector').find(:xpath, 'option[3]').select_option
end

When("I select the rotations checkbox") do
  check('rotationsCheckbox')
end

When("I select the borders checkbox") do
  check('bordersCheckbox')
end

When("I set height to {string}") do |string|
  fill_in('inputBoxHeight', :with => string)
end

When("I set width to {string}") do |string|
  fill_in('inputBoxWidth', :with => string)
end

Then(/^I should see the collage for topic "([^"]*)" generated$/) do |arg1|
  sleep(numSecondsWait)
  page.find('#mainCollage')['alt'].should have_content arg1
end

Given("that I am on the Login") do
  visit "http://localhost:8080/proj2/login.jsp"
end

Then("there should be a login button") do
  page.should have_selector('input[id="loginButton"')
end

When("I click the login button") do
  page.find_by_id("loginButton").click
end

Then("I am redirected to the google sign in page") do
  URI.parse(current_url).should have_content "accounts.google.com"
end


Given("that a collage for topic {string} with shape {string} has been generated") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Given("that a collage for topic {string} with shape {string} has been generated and is currently being displayed") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
  page.find('#mainCollage')['alt'].should have_content string
end

When("a collage for topic {string} with shape {string} is generated") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
  sleep(numSecondsWait)
end

Given("that I am on the Collage Display Page Test Version") do
  visit "http://localhost:8080/proj2/displayPageTestVersion.jsp"
end

When("I try to create a collage for topic {string} and shape {string}") do |string, string2|
  fill_in('inputBox', :with => string)
  fill_in('inputBoxShape', :with => string2)
  find_field("inputBox").native.send_key(:enter)
end

Then("a busy symbol appears") do
  expect(page).to have_selector('#loader', visible: true)
end

Then("I should not see a busy symbol") do
  expect(page).to have_selector('#loader', visible: false)
end

When("I clicked the save button") do
  page.find_by_id("saveButton").click
end

Then("the collage for topic {string} appear in the previous collage picker") do |string|
  expect(page).to have_selector('#galleryCollageDiv-0',)
end

When("I delete the built Collage") do
  page.find_by_id("deleteCollage-0").click
end

Then("the collage for topic {string} should not appear in the previous collage picker") do |string|
  expect(page).not_to have_selector('#collageGalleryDiv-0')
end

Then("the image has no filter") do
  pixelAnalysisValue = page.driver.evaluate_script <<-EOS
  function(){
    var img = document.getElementById('mainCollage')

    var canvas = document.createElement( 'canvas' );
    canvas.height = img.height;
    canvas.width = img.width;
    var context = canvas.getContext('2d')
    context.drawImage(img,0,0)
    var imgValue = context.getImageData( 0, 0, img.width, img.height );
    var imgData = imgValue.data;

    var validImage = 0;
    for(i = 0; i<imgData.length; i += 4){
      var r = imgData[i];
      var g = imgData[i+1];
      var b = imgData[i+2];

      if(r >= 0 && r <= 255){
        validImage = 1;
        break;
      }

      if(g >= 0 && g <= 255){
        validImage = 1;
        break;
      }

      if(b >= 0 && b <= 255){
        validImage = 1;
        break;
      }
    }

    return validImage;
  }();
 EOS

 pixelAnalysisValue == 1
end

Then("the image has a sepia filter") do
  pixelAnalysisValue = page.driver.evaluate_script <<-EOS
  function(){
    var img = document.getElementById('mainCollage')

    var canvas = document.createElement( 'canvas' );
    canvas.height = img.height;
    canvas.width = img.width;
    var context = canvas.getContext('2d')
    context.drawImage(img,0,0)
    var imgValue = context.getImageData( 0, 0, img.width, img.height );
    var imgData = imgValue.data;

    var validImage = 0;
    for(i = 0; i<imgData.length; i += 4){
      var r = imgData[i];
      var g = imgData[i+1];
      var b = imgData[i+2];

      if(r >= 0 && r <= 255){
        validImage = 1;
        break;
      }

      if(g >= 0 && g <= 255){
        validImage = 1;
        break;
      }

      if(b >= 0 && b <= 255){
        validImage = 1;
        break;
      }
    }

    return validImage;
  }();
 EOS

 pixelAnalysisValue == 1
end

Then("the image has a BW filter") do
  pixelAnalysisValue = page.driver.evaluate_script <<-EOS
  function(){
    var img = document.getElementById('mainCollage')

    var canvas = document.createElement( 'canvas' );
    canvas.height = img.height;
    canvas.width = img.width;
    var context = canvas.getContext('2d')
    context.drawImage(img,0,0)
    var imgValue = context.getImageData( 0, 0, img.width, img.height);
    var imgData = imgValue.data;

    var validImage = 1;
    for(i = 0; i<imgData.length; i += 4){
      var r = imgData[i];
      var g = imgData[i+1];
      var b = imgData[i+2];

      if(r > 0 && r < 255){
        validImage = 0;
        break;
      }

      if(g > 0 && g < 255){
        validImage = 0;
        break;
      }

      if(b > 0 && b < 255){
        validImage = 0;
        break;
      }
    }

    return validImage;
  }();
 EOS

 pixelAnalysisValue == 1
end

Then("the image has a Greyscale filter") do
  pixelAnalysisValue = page.driver.evaluate_script <<-EOS
  function(){
    var img = document.getElementById('mainCollage')

    var canvas = document.createElement( 'canvas' );
    canvas.height = img.height;
    canvas.width = img.width;
    var context = canvas.getContext('2d')
    context.drawImage(img,0,0)
    var imgValue = context.getImageData( 0, 0, img.width, img.height );
    var imgData = imgValue.data;

    var validImage = 0;
    for(i = 0; i<imgData.length; i += 4){
      var r = imgData[i];
      var g = imgData[i+1];
      var b = imgData[i+2];

      if(r >= 0 && r <= 255){
        validImage = 1;
        break;
      }

      if(g >= 0 && g <= 255){
        validImage = 1;
        break;
      }

      if(b >= 0 && b <= 255){
        validImage = 1;
        break;
      }
    }

    return validImage;
  }();
 EOS

 pixelAnalysisValue == 1
end