package;


import flash.display.Sprite;
import objects.Entity;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		addChild(new Entity("redblock.png", 25, 25));
		addChild(new Entity("redblock.png", 240, 25));
		addChild(new Entity("redblock.png", 25, 240));
		addChild(new Entity("redblock.png", 240, 240));
		
	}
	
	
}