package exo1
{
	public class Exo1 implements IExo
	{
		public function Exo1()
		{
		}
		
		public function getName():String
		{
			return "Exo 1 - Hello World";
		}
		
		public function run():void
		{
			trace("Hello World !");
			
			var string:String = "";
			for (var i:int = 0; i < 43; i++) 
			{
				string += i + " ";
			}
			
			trace(string);
			
		}
	}
}