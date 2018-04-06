Feature: UI of the input box on the initial page
The input box should have a dark gray outline with a white background. The input box is centered in the middle of the page. It should have light gray prompt text saying “Enter Topic” and the prompt text should disappear when the user begins to type. Pressing the enter key in the input box should also trigger a collage to be built. 

Background:
	Given that I am on the Initial Page

Scenario: (2.1) Correct outline color of input box, Correct background of input box, Correct prompt text of input box, Correct prompt text inside input box
        Then the outline color of the input box is dark gray
	Then the background color of the input box is white
	Then the color of the prompt text is very light gray
	Then the prompt text is "Enter Topic"
	Then the input box appears centered in the middle of the initial page
