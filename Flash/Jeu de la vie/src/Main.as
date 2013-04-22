package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.ReturnKeyLabel;
	import flash.text.TextField;
	import flash.text.engine.TextElement;
	import flash.utils.Timer;
	
	public class Main extends Sprite
	{
		private var bitmap:Bitmap;
		private var datas:BitmapData;

		public function Main()
		{
			datas = new BitmapData(200, 200, false, 0);
			initData(datas);

			bitmap = new Bitmap(datas);
			
			addChild(bitmap);
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, refresh);
			timer.start();
		}
		
		private function initData(datas:BitmapData):void
		{
			for (var i:int = 0; i < datas.width; i++) 
			{
				for (var j:int = 0; j < datas.height; j++) 
				{
					if (Math.random() < 0.3)
						datas.setPixel(i, j, 0xFFFFFF);
				}
			}
		}
		
		private function refresh(e:TimerEvent):void
		{
			var newdata:BitmapData = new BitmapData(200, 200, false, 0)

			for (var i:int = 0; i < datas.width; i++) 
			{
				for (var j:int = 0; j < datas.height; j++) 
				{
					if (datas.getPixel(i, j) == 0)
						newdata.setPixel(i, j, 0xFFFFFF);
					else
						newdata.setPixel(i, j , 0);
				}
			}
			
			bitmap.bitmapData = newdata;
			datas = newdata;
		}
	}
}