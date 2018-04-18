Feature: Collage appearance in the Collage Display Page
The collage must have a rectangular shape with all of the photos contained within the shape. The size of the collage must be between 40-70% of browser viewport width (no less than 800px) and height must be between 35-50% of browser viewport height (no less than 600px). The collage is centered in the collage display page.

Background:
	Given that I am on the Collage Display Page
	And that a collage for topic "dogs" has been generated

Scenario: (16.1) Collage has correct width, Collage has correct height, Collage has correct position
	Then the collage is between 40-70% of the browser viewport width being no less than 800px
	Then the collage is between 35-50% of the browser viewport height being no less than 600px
	Then collage is centered on the Collage Display Page


