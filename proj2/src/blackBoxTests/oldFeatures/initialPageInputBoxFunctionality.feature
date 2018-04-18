Feature: UI of the input box on the initial page
The input box should have a dark gray outline with a white background. The input box is centered in the middle of the page. It should have light gray prompt text saying “Enter Topic” and the prompt text should disappear when the user begins to type. Pressing the enter key in the input box should also trigger a collage to be built. 

Background:
	Given that I am on the Initial Page

Scenario: (3.1) Pressing enter in the input box triggers correct process
        	When I enter "cats" into the input box
		And I have pressed enter
		Then I should see the collage for topic "cats" generated

Scenario: (3.2) Prompt text disappears when the user begins to type
		When I have typed "cats" into the input box
		Then the prompt text should be gone
