package objects;

/**
 * Player object
 * @author Adem
 */
class Player extends Entity
{
	// VARIABLES	
	private var _step: Int = 5;
	
	public var onHitEnemy:Void -> Void;
	
	// PROPERTIES
	
	public var gotCoin: Bool;
	
	// CONSTRUCTORS
	public function new(step) 
	{
		this._step = step;
		
		super('redblock.png', 50, 200);
	}
	
	// HANDLERS
	
	public function GoLeft()
	{
		var x = this.x - this._step;
		this.x = x > 0 ? x : 0;
	}
	
	public function GoRight()
	{
		var x = this.x + this._step;
		this.x = x < (640 - this.width) ? x : (640 - this.width);
	}
	
	public function GoUp()
	{
		var y = this.y - this._step;
		this.y = y > 0 ? y : 0;
	}
	
	public function GoDown()
	{
		var y = this.y + this._step;
		this.y = y < (480 - this.height) ? y : (480 - this.height);
	}
	
	public function onHit( other )
	{
		if (Std.is(other, Enemy)) onHitEnemy();
		else if (Std.is(other, Coin)) this.gotCoin = true;
	}
	
	// PUBLIC METHODS
	
	public function setStartPosition(safeZone)
	{
		var firstX = 25 - (this.width / 2);
		var secondX = 615 - (this.width / 2);
		var firstY = 25 - (this.height / 2);
		var secondY = 455 - (this.height / 2);
		
		switch (safeZone) 
		{
			default:
				this.moveTo(firstX , firstY);
			case 1:
				this.moveTo(secondX, firstY);
			case 2:
				this.moveTo(firstX, secondY);
			case 3:
				this.moveTo(secondX, secondY);
		}
	}
	
	// PRIVATE METHODS
}