package;


import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import objects.Entity;
import objects.Input;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		// register callback functions
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		addChild(new Entity("redblock.png", 25, 25));
		addChild(new Entity("redblock.png", 240, 25));
		addChild(new Entity("redblock.png", 25, 240));
		addChild(new Entity("redblock.png", 240, 240));
		
	}
	
	static function onKeyDown (event:KeyboardEvent)
	{
		Input.registerKeyState(event.keyCode, true);
		Input.registerKeyState(Keyboard.CONTROL, event.ctrlKey);
		Input.registerKeyState(Keyboard.ALTERNATE, event.altKey);
		Input.registerKeyState(Keyboard.SHIFT, event.shiftKey);
	}
	
	static function onKeyUp (event:KeyboardEvent)
	{
		Input.registerKeyState(event.keyCode, false);
		Input.registerKeyState(Keyboard.CONTROL, event.ctrlKey);
		Input.registerKeyState(Keyboard.ALTERNATE, event.altKey);
		Input.registerKeyState(Keyboard.SHIFT, event.shiftKey);
	}
	
	
}