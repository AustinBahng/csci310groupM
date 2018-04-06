Feature: Functionality of input box on collage display page
The input box should have a dark gray outline with a white background and have “Enter Topic” as the prompt text inside in light gray. Pressing the enter button in the input box should act as the “build another collage” button and trigger the build collage process. The prompt text should also disappear when the user begins to type.
 
Background:
        	Given that I am on the Collage Display Page

Scenario: (11.1) Pressing enter in the input box triggers correct process
        	When I enter "cats" into the input box
		And I have pressed enter
		Then I should see the collage for topic "cats" generated

Scenario: (11.2) Prompt text disappears when the user begins to type
		When I have typed "cats" into the input box
		Then the prompt text should be gone
