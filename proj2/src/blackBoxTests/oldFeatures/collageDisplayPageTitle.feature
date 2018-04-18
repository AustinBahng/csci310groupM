Feature: The title of the collage on the Collage Display Page
When a user types in a topic of a collage to be generated, if it is a valid search, the title for the collage should appear to be black and in 24pt font reading “Collage for Topic X”, X being the topic that the user just typed in.
 
Background:
        	Given that I am on the Collage Display Page
		And that a collage for topic "dogs" has been generated
 
Scenario: (6.1) Correct title of collage, Correct font-size of the title of collage, Correct font color of title of collage
        	Then I should see "Collage for Topic Dog" displayed above the collage
		Then I should see "Collage for Topic Dog" in 24pt font
        	Then I should see "Collage for Topic Dog" displayed in black font
