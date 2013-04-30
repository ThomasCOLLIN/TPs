package
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.sampler.NewObjectSample;
	
	import org.osmf.layout.ScaleMode;
	
	public class Loader extends Sprite
	{
		private var loader:flash.display.Loader = new flash.display.Loader();
		private var loadBar:Sprite = new Sprite();

		public function Loader()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			var url:URLRequest = new URLRequest("http://upload.wikimedia.org/wikipedia/commons/e/e3/Helix_nebula_nasa_693952main_pia15817-full.jpg");

			loadBar.graphics.beginFill(0xFF0000);
			loadBar.graphics.drawRect(0, 0, 1, 15);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, whileImageLoading);
			loader.load(url);

			addChild(loadBar);
			addChild(loader);
		}
		
		private function onImageLoaded(e:Event):void
		{
			var loaderInfo:LoaderInfo = e.target as LoaderInfo;
			trace ("loaded" + loaderInfo.contentType + " " + loaderInfo.content.width + "x" + loaderInfo.content.height);
			
			loaderInfo.content.width = stage.stageWidth;
			loaderInfo.content.height= stage.stageHeight;

			stage.addEventListener(Event.RESIZE, onStageResized)
		}
		
		private function whileImageLoading(e:ProgressEvent):void
		{
			trace("progressing...")
			
			loadBar.width = (e.bytesLoaded * 500) / e.bytesTotal;
		}
		
		private function onStageResized(e:Event):void
		{
			loader.contentLoaderInfo.content.width = stage.stageWidth;
			loader.contentLoaderInfo.content.height= stage.stageHeight;
		}
	}
}