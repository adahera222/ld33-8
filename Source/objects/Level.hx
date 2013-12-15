package objects;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.ui.Keyboard;
import Std.random;

/**
 * Level Screen
 * Main playable screen of the game.
 * @author armornick
 */
class Level extends Screen
{
	// VARIABLES
	
	private var _player:Player;
	private var _entities:List<Entity>;
	private var _safeZone:Int;
	
	// PROPERTIES
	
	public var player(get, set):Player;
	
	// CONSTRUCTORS
	public function new( id, numberOfEnemies, ?_onFinish ) 
	{
		super(id, _onFinish);
		this.background = ResourceManager.getBitmap("background1.jpg");
		this.background.width = 640;
		this.background.height = 480;
		
		this._safeZone = random(4);
		
		_entities = new List();
		if (numberOfEnemies > 0) {
			for (i in 0...numberOfEnemies) 
			{
				var newEnemy = new Enemy(this._safeZone);
				addEntity(newEnemy);
			}
		}
		addEntity(new Coin());
		
		
	}
	
	// HANDLERS
	
	override public function onKeyDown (event:KeyboardEvent)
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
	
	override public function onUpdate(event:Event)
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
	
	public function get_player () { return _player;  }
	public function set_player (player) 
	{ 
		// failsafe: remove player if already exists
		if (_player != null) removeChild(_player);
		// set and return new player
		_player = player;
		addChild(_player);
		_player.setStartPosition(this._safeZone);
		return _player; 
	}
	
	// PRIVATE METHODS
	
	private function addEntity (e:Entity)
	{
		_entities.add(e);
		addChild(e);
	}
}