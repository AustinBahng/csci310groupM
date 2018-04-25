Feature: There should be a collage history gallery to display the previously saved collages

Background:
	Given that I am on the Main web page
	And that a collage for topic "dogs" with shape "t" has been generated

Scenario: Save, and see it is on gallery
	When I clicked the save button
	Then the collage for topic "dogs" appear in the previous collage picker
	And I delete the built Collage


Scenario: Save, delete and see not in gallery
	When I clicked the save button
	And I delete the built Collage
	Then the collage for topic "dogs" should not appear in the previous collage picker
