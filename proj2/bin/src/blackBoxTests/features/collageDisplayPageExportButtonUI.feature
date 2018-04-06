Feature: UI of export collage button on collage display page
The export collage button should be dark gray with the label text as “Export Collage” in white. Pressing the button downloads a PNG of the currently displayed collage. The downloaded collage should match the displayed collage’s size.
 
Background:
        	Given that I am on the Collage Display Page
        	And that a collage for topic "cats" has been generated
 
Scenario: (12.1) Correct background color, label and text of the export collage button
        	Then the background color is dark gray
		Then text label is "Export"
		Then label text is white
