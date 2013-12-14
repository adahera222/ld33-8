package objects;
import haxe.ds.IntMap.IntMap;

/**
 * ...
 * @author armornick
 */
class Input
{
	static private var _keymap:IntMap<Bool>;
	
	
	/// Only for use in Main callbacks
	static public function registerKeyState(key, state)
	{
		_keymap.set(key, state);
	}
	
	// is key pressed?
	static public function KeyDown (keycode)
	{
		return _keymap.get(keycode);
	}
	
	// is key not pressed?
	static public function KeyUp (keycode)
	{
		return (!_keymap.get(keycode));
	}
	
	
}