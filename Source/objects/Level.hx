package objects;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.ui.Keyboard;
import Std.random;

/**
 * ...
 * @author armornick
 */
class Level extends Sprite
{
	// VARIABLES
	
	private var _id:String;
	private var _onFinish:Void -> Void;
	private var _player:Player;
	private var _entities:List<Entity>;
	private var _bg:Bitmap;
	private var _safeZone:Int;
	
	// PROPERTIES
	
	public var id (get, set):String;
	public var player(get, set):Player;
	public var background(get, set):Bitmap;
	
	// CONSTRUCTORS
	public function new( id, numberOfEnemies, ?_onFinish ) 
	{
		super();
		this._safeZone = random(4);
		
		this.id = id;
		this._onFinish = _onFinish;
		_entities = new List();
			if (numberOfEnemies > 0) {
			for (i in 0...numberOfEnemies) 
			{
				var newEnemy = new Enemy(this._safeZone);
				_entities.add(newEnemy);
				addChild(newEnemy);
			}
		}
		
	}
	
	// HANDLERS
	
	public function onKeyDown (event:KeyboardEvent)
	{	
		if (player == null) return;
		
		switch (event.keyCode) 
		{
			case Keyboard.RIGHT:
				player.GoRight();
			case Keyboard.LEFT:
				player.GoLeft();
			case Keyboard.UP:
				player.GoUp();
			case Keyboard.DOWN:
				player.GoDown();
		}
	}
	
	public function onKeyUp (event:KeyboardEvent)
	{
		
	}
	
	public function onUpdate(event:Event)
	{
		if (_entities.isEmpty() || _player == null) return;
		
		trace(id);
		trace(_entities);
		
		for (entity in this._entities) 
		{
			if (_player != null && _player.hitTestObject(entity))
			{
				_player.onHit(entity);
			}
		}
		if (_player != null && _player.gotCoin) {
			_player.gotCoin = false;
			// end level
			if (_onFinish != null)	_onFinish();
		}
	}
	
	// PUBLIC METHODS
	
	public function get_id () { return _id; }
	public function set_id (id) { this._id = id; return _id; }
	
	public function get_player () { return _player;  }
	public function set_player (player) 
	{ 
		// failsafe: remove player if already exists
		if (_player != null) removeChild(_player);
		// set and return new player
		_player = player;
		addChild(_player);
		return _player; 
	}
	
	public function get_background() { return _bg; }
	public function set_background(bg)
	{
		if (_bg != null) removeChild(_bg);
		_bg = bg;
		addChild(_bg);
		setChildIndex(_bg, 0); // move to back
		return _bg; 
	}
	
	// PRIVATE METHODS
}