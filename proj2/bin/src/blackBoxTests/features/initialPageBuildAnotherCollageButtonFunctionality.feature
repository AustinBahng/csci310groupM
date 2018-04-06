Feature: Functionality of the build collage button on the initial page
The build collage button is dark gray with the label, “Build Collage” in white. The build collage button cannot be pressed unless the user has entered text into the input box and if text has been entered, the collage building process is triggered. The button is located to the right of the input box. 

Background:
	Given that I am on the Initial Page

Scenario: (4.2) Build collage button correctly acts when text is entered into input box
        When I enter "cats" into the input box
	And press the Build Collage button
	Then I should see the collage for topic "cats" generated

Scenario: (4.3) Button cannot be pressed unless input is entered
	When I see button cannot be clicked
	And I enter "cats" into the input box
	And I see the button can be clicked
