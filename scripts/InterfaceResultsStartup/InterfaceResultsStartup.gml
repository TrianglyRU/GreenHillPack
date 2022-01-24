function InterfaceResultsStartup()
{	
	/* Value Table Reference
	----------------------------
	Value[0]  -  Timer
	Value[1]  -  State
	Value[2]  - 'CHARACTER HAS' X OFFSET
	Value[3]  - 'PASSED' X OFFSET
	Value[4]  -  OVAL X OFFSET
	Value[5]  - 'SCORE' X OFFSET
	Value[6]  - 'TIME BONUS' X OFFSET
	Value[7]  - 'RINGS BONUS' X OFFSET
	Value[8]  - 'ACT' X
	Value[9]  -  Ring Bonus
	Value[10] -  Time Bonus
	----------------------------
	*/
	
	var WidthOffset = Game.Width / 320;
	
	// Initialise variables
	ResultsValue[0]  =  0;
	ResultsValue[1]  =  0;
	ResultsValue[2]  = (-240 - (Game.Character == CharKnuckles) * 22) * WidthOffset;
	ResultsValue[3]  = -208 * WidthOffset;
	ResultsValue[4]  =  150 * WidthOffset;
	ResultsValue[5]  =  240 * WidthOffset;
	ResultsValue[6]  =  240 * WidthOffset;
	ResultsValue[7]  =  240	* WidthOffset;
	ResultsValue[8]  =  150 * WidthOffset;
	ResultsValue[9]  =  0;
	ResultsValue[10] =  0;
}