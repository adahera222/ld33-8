package objects;

import flash.geom.Point;
import flash.geom.Rectangle;
import Std.random;

/**
 * ...
 * @author armornick
 */
class Coin extends Entity
{
	static var bounds = new Rectangle(50, 50, 640 - 82, 480 - 82);
	

	public function new() 
	{
		var x, y;
		
		do {
			x = random(640);
			y = random(480);
		} while ( !bounds.containsPoint(new Point(x, y)) );
		
		super("coin.png", x, y);
	}
	
}