package
{
	import exo1.Exo1;
	
	import exo2.Exo2;
	
	import exo3.Exo3;
	
	import flash.display.Sprite;
	
	public class TP1 extends Sprite
	{
		public function TP1()
		{
			var exos:Array = new Array(new Exo1, new Exo2, new Exo3);

			for each (var exo:IExo in exos) 
			{
				trace("");
				trace("________________________________________");
				trace("________________________________________");
				trace(exo.getName());
				trace("______________");
				
				exo.run();
			}
		}
	}
}