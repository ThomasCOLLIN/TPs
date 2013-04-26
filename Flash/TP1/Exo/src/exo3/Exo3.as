package exo3
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Exo3 implements IExo
	{
		public function Exo3()
		{
		}
		
		public function getName():String
		{
			return "Exo 3 - Timer";
		}
		
		public function run():void
		{
			var i:int = 0;
			var t:Timer = new Timer(1000, 5);
			t.addEventListener(TimerEvent.TIMER, onTimerEvent);
			t.start();
			
			function onTimerEvent(e:TimerEvent):void
			{
				i++;
				trace(i + " second(s) elapsed");
			}
		}
	}
}