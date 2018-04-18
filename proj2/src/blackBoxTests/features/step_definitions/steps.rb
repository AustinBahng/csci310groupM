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
  page.should have_selector('option[value="0"')
end

Then("there is a collage height option") do
  page.should have_selector('select[id="filterSelector"')
end

Then("there is a collage width option") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("there is a save to history buttion") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("there is a build collage button") do
  pending # Write code here that turns the phrase above into concrete actions
end