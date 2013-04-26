package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Cube extends Sprite
	{
		public function Cube()
		{
			var cube:Sprite = new Sprite();
			cube.graphics.beginFill(0xFF0000);
			cube.graphics.drawRect(0, 0, 100, 100);
			cube.x = 50;
			cube.y = 50;
			cube.z = 40;
			
			var cube2:Sprite = new Sprite();
			cube2.graphics.beginFill(0x0000FF);
			cube2.graphics.drawRect(0, 0, 100, 100);
			cube2.x = 50;
			cube2.y = 50;
			cube2.z = 1000;
			
			cube2.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

				function onKeyDown(e:KeyboardEvent):void {
					if (e.keyCode == Keyboard.DOWN)
						cube2.z -= 10;
					if (e.keyCode == Keyboard.UP)
						cube2.z += 10;
				}

			addChild(cube);
			addChild(cube2)
		}
		
	}
}