Feature: Functionality of export collage button on collage display page
The export collage button should be dark gray with the label text as “Export Collage” in white. Pressing the button downloads a PNG of the currently displayed collage. The downloaded collage should match the displayed collage’s size.
 
Background:
        	Given that I am on the Collage Display Page
        	And that a collage for topic "cats" has been generated
 
Scenario: (13.1) Pressing button correctly downloads currently displayed collage with same size
        	When I press the export collage button
        	Then the downloaded image should be a PNG
        	Then the downloaded png should be the same as the currently displayed collage
		Then the downloaded image should match the size of the collage’s
		
