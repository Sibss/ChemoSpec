

// plotSpectraJS Bryan Hanson, DePauw University, February 2015

// Brush related functions

var activateBrush = function() {
  // Creates the brush, appends it, and defines its behavior

  var brushed, brush;

  // This helper function must remain inside the activateBrush function

  brushed = function() { // Handles the response to brushing
    var extent, minX, maxX, x0, y0, xL, xU, spanX;

    extent = brush.empty() ? [ brush.x().domain()[0], brush.x().domain()[1] ] : brush.extent() // reports in pixels
    minX = extent[0]
    maxX = extent[1]
    x0 = lPad + specWidth + gap // dim of map region
    y0 = tPad + specHeight + gap
    x1 = x0 + mapWidth
    xL = ((minX-x0)/(x1-x0)) // as a frac of map region
    xU =  ((maxX-x0)/(x1-x0))
    spanX = Dx[1] - Dx[0]
    // update global xD
    xD = [((spanX*xL) + Dx[0]), ((spanX*xU) + Dx[0])]
    brushExtent = [xL, xU]
    clearSpectra();
    updateOffset()
    }   // end of brushed

  // IMPORTANT: xD is a global variable
  brush = d3.svg.brush() // This is a 1D brush
    .x(d3.scale.identity().domain([(lPad + specWidth + gap),
        (lPad + specWidth + gap + mapWidth)]))
    .on("brushend", brushed)

  svg.append("svg") // Appends the svg to include the brush
  	.attr("class", "brush")
    .call(brush)
    .selectAll("rect")
    .attr("y", (tPad + specHeight - mapHeight))
    .attr("height", mapHeight); // This is what fixes the brush in y

} // end of activateBrush

// Guide related functions.
// Note that these need to respond to brushing, which changes xD and yD

var activateGuides = function() {

    // Controls the guides (cursor) in the spec area
    // IMPORTANT: xD, yD, mX, mY, are global variables
    // Code is copied from exCon, but horiz. cursor removed here

    var getMouseXY = function() {
    // Get the mouse coordinates & report in terms of [0...1]
    	var mouse = d3.mouse(document.getElementById("SPECTRUM"));
    	mX = mouse[0]; // in pixels
    	mY = mouse[1];
    	if (mX < 0) {mX = 0}; // truncate low
    	if (mY < 0) {mY = 0};
    	if (mX > specWidth) {mX = specWidth}; // truncate high
    	if (mY > specHeight) {mY = specHeight};
    	mX = mX/specWidth // as fraction
    	mY = 1 - (mY/specHeight)
    	followMouse(mX, mY);
    } // end of getMouseXY

    var followMouse = function(mX, mY) { // This draws the guides, nothing else

      var xPos = (mX * specWidth) + lPad // mX now in pixels
    	var vertU = {x: xPos, y: tPad } // x, y at the top of window
        // x, y at the bottom of window:
    	var vertL = {x: xPos, y: tPad + specHeight }
    	var vEnds = [vertU, vertL];

    	d3.selectAll(".cursorGuide") // remove previous lines
    	    .remove();

    	var line = d3.svg.line()
    	    .x(function(d) { return d.x;})
    	    .y(function(d) { return d.y;})

    	svg.append("path")
        	    .attr("class", "line")
              .attr("class", "cursorGuide")
        	    .attr("d", line(vEnds))

      if (mX <= 0.01 || mX >= 0.99) {
        d3.selectAll(".cursorGuide")
      	    .remove();
        document.getElementById("CURSOR_TB").value = ""
      }
    } // end of followMouse

    getMouseXY(xD, yD); // This starts it all off
    setupCursorReporting()

} // end of activateGuides

// This function reports the cursor coordinates in native unit
// to a form/text box

var setupCursorReporting = function() {
  var xNat
  xNat = xD[0] + ((mX) * (xD[1] - xD[0]))

  if ((Unit[1] = "wavenumber") || (Unit[1] = "Wavenumber")) {
    document.getElementById("CURSOR_TB").value = xNat.toFixed(1)
  }

  if (Unit[1] = "ppm") {
    document.getElementById("CURSOR_TB").value = xNat.toFixed(3)
  }

} // End of setupCursorReporting
