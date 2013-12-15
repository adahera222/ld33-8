package objects;

/**
 * Game Over Screen
 * Screen shown when the game is lost.
 * @author armornick
 */
class GameOverScreen extends Screen
{

	public function new(id) 
	{
		super(id);
		this.background = ResourceManager.getBitmap("gameover.png");
	}
	
}