package objects;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;

/**
 * Main Screen class
 * Superclass for other game screens
 * @author armornick
 */
class Screen extends Sprite
{

	// VARIABLES
	
	private var _id:String;
	private var _onFinish:Void -> Void;
	private var _bg:Bitmap;
	
	// PROPERTIES
	
	public var id (get, set):String;
	public var background(get, set):Bitmap;
	public var onFinish (get, set): Void -> Void ;
	
	// CONSTRUCTORS
	
	public function new(id, ?_onFinish) 
	{
		super();
		this.id = id;
		this._onFinish = _onFinish;
	}
	
	// HANDLERS
	
	public function onKeyDown (event:KeyboardEvent)
	{
		
	}
	
	public function onKeyUp (event:KeyboardEvent)
	{
		
	}
	
	public function onUpdate(event:Event)
	{
		
	}
	
	// PUBLIC METHODS
	
	public function get_id () { return _id; }
	public function set_id (id) { this._id = id; return _id; }
	
	public function get_background() { return _bg; }
	public function set_background(bg)
	{
		if (_bg != null) removeChild(_bg);
		_bg = bg;
		addChild(_bg);
		setChildIndex(_bg, 0); // move to back
		return _bg; 
	}
	
	public function get_onFinish () { return _onFinish; }
	public function set_onFinish (cb) { this._onFinish = cb; return _onFinish; }
	
	// PRIVATE METHODS
	
}