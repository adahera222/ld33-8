package objects;

/**
 * ...
 * @author Adem
 */
class Player extends Entity
{
	// VARIABLES
	
	private var _step: Int = 5;
	
	public var onHitEnemy:Void -> Void;
	
	// PROPERTIES
	
	public var gotCoin (default, null): Bool;
	
	// CONSTRUCTORS
	public function new(step) 
	{
		this._step = step;
		
		super('redblock.png', 50, 200);
	}
	
	// HANDLERS
	
	public function GoLeft()
	{
		this.x -= this._step;
	}
	
	public function GoRight()
	{
		this.x += this._step;
	}
	
	public function GoUp()
	{
		this.y -= this._step;
	}
	
	public function GoDown()
	{
		this.y += this._step;
	}
	
	public function onHit( other )
	{
		if (Std.is(other, Enemy)) onHitEnemy();
		else if (Std.is(other, Coin)) this.gotCoin = true;
	}
	
	// PUBLIC METHODS
	
	public function setStartPosition(safeZone)
	{
		switch (safeZone) 
		{
			case 1:
				this.moveTo(615, 25);
			case 2:
				this.moveTo(25, 455);
			case 3:
				this.moveTo(615, 455);
			default:
				this.moveTo(25, 25);
		}
	}
	
	
	// PRIVATE METHODS
	
}