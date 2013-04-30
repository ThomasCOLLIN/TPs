package
{
	import aze.motion.eaze;
	
	import flash.display.Sprite;
	
	public class Flocon extends Sprite
	{
		private var _xOrigin:Number = 0;
		
		public function Flocon()
		{
			super();
			_xOrigin = Math.random() * 500 - 50;
			
			graphics.beginFill(Math.random() *  0xFFFFFF);
			graphics.drawCircle(_xOrigin, -10, Math.random() * 3 + 2);
			x = _xOrigin;
			y = -10;
		}
		
		public function move():void
		{
			eaze(this).delay(Math.random() * 5)
				.to(Math.random() * 1.5 + 1.5, {x:_xOrigin + 50, y:710})
				.delay(1)
				.onComplete(resetPosition);

		}
		
		private function resetPosition():void
		{
			x = _xOrigin;
			y = -10;
			move();
		}
	}
}