Feature: Functionality of build another collage button on collage display page
The button should be dark gray and say “Build Another Collage” in white test. If a topic is entered in the input box, when the button is pressed, the build collage process should be triggered.
 
Background:
        	Given that I am on the Collage Display Page
  
Scenario: (9.1) Pressing button will trigger correct process
        	When I enter "cats" into the input box
		And press the Build Another Collage button
		Then I should see the collage for topic "cats" generated

