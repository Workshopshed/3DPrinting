module Hexagon(AF, height)
{ 
  //Hexagon with across flats size
  boxWidth = AF/1.75;
  for (r = [-90, -30, 30]) rotate([0,0,r]) cube([boxWidth, AF, height], true);

}

module HexCell(AF,height,wall)
{
	difference()
	{
		Hexagon(AF,height);
		translate([0,0,-1]){
		Hexagon(AF-2*wall,height+4);
		}
	}
}

module HexMesh(length,width,AF,height,wall)
{
	union(){
		xStep = AF-wall;
		yStep = AF-wall-wall;
		for (x = [1:xStep:length]){
			for (y = [1:yStep:width]){
				translate([x+(((y/yStep) % 2)*((AF/2))),y,0]) {
					HexCell(AF,height,wall);
				}
			}
		}
	}
}

HexMesh(50,30,3,1,0.2);