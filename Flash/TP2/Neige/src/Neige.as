package
{
	import aze.motion.eaze;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.fscommand;
	
	public class Neige extends Sprite
	{
		public function Neige()
		{
			stage.stageWidth = 400;
			stage.stageHeight = 700;
			stage.color = 0;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			fscommand("allowscale", "false");
			
			for (var i:int = 0; i < 1500; i++) 
			{
				var flocon:Flocon = new Flocon();
				addChild(flocon);
				
				flocon.move();
			}			
		}
	}
}