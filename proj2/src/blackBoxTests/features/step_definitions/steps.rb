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
  check('rotation')
end

When("I select the borders checkbox") do
  check('borders')
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