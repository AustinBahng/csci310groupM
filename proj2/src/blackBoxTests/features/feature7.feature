Feature: There should be a collage history gallery to display the previously saved collages

Background:
	Given that I am on the Collage Display Page
	And that a collage for topic "dogs" with shape "t" has been generated
	And that a collage for topic "cats" with shape "t" has been generated
	And that a collage for topic "birds" with shape "t" has been generated and is currently being displayed

Scenario: Previous collage picker correctly displays previously created collages in the session. And the current collage in the main collage space correctly shows in the previous collage picker.
	Then a scaled down version of "dogs" and "cats" collages should appear in the previous collage picker
	Then the collage for topic "birds" does not appear in the previous collage picker


Scenario: If there is not enough space for all of the collages, user is able to see all of the collages with a scroll bar
	When a collage for topic "lions" with shape "t" is generated
	And a collage for topic "giraffes" with shape "t" is generated
	And a collage for topic "lizards" with shape "t" is generated
	And a collage for topic "elephants" with shape "t" is generated
    And a collage for topic "pigs" with shape "t" is generated
    And a collage for topic "snakes" with shape "t" is generated
	And a collage for topic "cows" with shape "t" is generated
	And a collage for topic "chicken" with shape "t" is generated
