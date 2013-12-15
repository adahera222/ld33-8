package objects;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.geom.Point;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * Entity
 * Superclass of game objects
 * @author armornick
 */
class Entity extends Sprite
{

	// image of our sprite
	private var _img:Bitmap;
	public var image(get, set):Bitmap;
	
	// height and with (get only)
	/*
	public var height(get, never):Float;
	public var width(get, never):Float;
	*/
	
	// CONSTRUCTOR
	public function new(fname, x, y) 
	{
		super();
		// do we need resource manager to get bitmaps?
		this.image = ResourceManager.getBitmap(fname);
		this.x = x;
		this.y = y;
	}
	
	// image : getter and setter
	public function get_image() {	return _img; }
	public function set_image(img)
	{
		// remove current image from display list
		if (_img != null) this.removeChild(_img);
		// replace our image
		this._img = img;
		// add image to display list
		this.addChild(_img);
		// return image (must for setter)
		return _img;
	}
	
	// Get Bounding Box
	public function rect():Rectangle
	{
		// create result variable
		var r = new Rectangle();
		// build the rectangle
		r.x = this.x;
		r.y = this.y;
		r.width = _img.width;
		r.height = _img.height;
		// return result
		return r;
	}
	
	// set entity location
	public function moveTo (x:Float, y:Float)
	{
		this.x = x;
		this.y = y;
	}
	
	// move entity in direction
	public function moveBy (x:Float, y:Float)
	{
		this.x += x;
		this.y += y;
	}
	
	public function changeImage(fname:String) 
	{
		var tempImg =  ResourceManager.getBitmap(fname);
		set_image(tempImg);
	}
	
	
	
}