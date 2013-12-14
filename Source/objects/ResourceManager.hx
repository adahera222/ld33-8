package objects;
import flash.display.Bitmap;
import flash.display.BitmapData;
import haxe.ds.StringMap.StringMap;
import openfl.Assets;

/**
 * ...
 * @author armornick
 */
class ResourceManager
{
	static private var _bitmap_map:StringMap <BitmapData>;
	
	static public function getBitmap (fname)
	{
		// get bitmap data if not exists
		if (!_bitmap_map.exists(fname))
		{
			_bitmap_map.set(fname, Assets.getBitmapData("assets/gfx/" + fname) );
		}
		// create a new bitmap with the data
		var bmpData = _bitmap_map.get(fname);
		return new Bitmap(bmpData);
	}
	
	
}