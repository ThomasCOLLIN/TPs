package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class PhotoShopLike extends Sprite
	{
		private var _size:int = 20;
		
		
		public function PhotoShopLike()
		{
			initCanvas();
			initSizeTools();
		}
	
		private function initCanvas():void
		{
			var canvas:Sprite = new Sprite();
			
			canvas.graphics.beginFill(0xEEEEEE);
			canvas.graphics.drawRect(0, 0, 300, 400);
			
			addChild(canvas);
			
		}
	
		private function initSizeTools():void
		{
			var y:Array = [30, 80, 150];
			
			for (var i:int = 0; i < 3; i++) 
			{
				var sizeTool:Sprite = new Sprite();
				
				sizeTool.graphics.beginFill(0);
				sizeTool.graphics.drawCircle(0, 0, 10 * (i + 1));
				
				sizeTool.x = 50;
				sizeTool.y = y[i];
				sizeTool.addEventListener(MouseEvent.CLICK, onSizeToolClick);
				
				addChild(sizeTool);
			}	
		}
		
		private function onSizeToolClick(e:MouseEvent):void
		{
			var tool:Sprite = e.target as Sprite;
			_size = tool.width;
			trace("click " + _size);
		}
	}
}