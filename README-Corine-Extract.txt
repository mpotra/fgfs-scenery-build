Corine Extract

<lat><lon> -> <lat><lon>
e20n40 -> e30n50 = [20, 30, 50, 40]
e20n40 -> e30n50 = [20, 30, 40, 50]
e10n50 -> e20n60 = [10, 20, 50, 60]
e20n50 -> e30n60 = [20, 30, 50, 60]
QGis Create extend:
	- Horizontal spacing: 10
	- Vertical spacing: 10
	- Extend: <min lat>, <max lat>, <min lon>, <max lon>

2. Vector overlay -> Extract/ clip by extend
	1. Input layer = corine (set Invalid Feature -> Do not filter)
	2. Extend = Select extend layer
	3. Check "Clip feature"
	4. Create temporary vector
3. Open layer (double-click), and in Fields add field name "landcover", type Integer of length 5
4. Right-click layer, Open Attributes -> Edit, set `landcover` field =  format_number("Code_18"), and click "Update all"
3b. Or open layer (double-click) and in Fields, select "Field calculator" and follow step 4.
5. Export temporary file to ESRI Shapefile
	1. Set CRS 
	(rename fields, e.g. Code_18 -> landcover)

	
