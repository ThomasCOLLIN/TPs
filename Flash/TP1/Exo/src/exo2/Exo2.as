package exo2
{
	public class Exo2 implements IExo
	{
		public function Exo2()
		{
		}
		
		public function getName():String
		{
			return "Exo 2 - Fibbonaci";
		}
		
		public function run():void
		{
			trace("fibbo(0)=" + fibbo(0));
			trace("fibbo(1)=" + fibbo(1));
			trace("fibbo(5)=" + fibbo(5));
			trace("fibbo(10)=" + fibbo(10));			
		}
		
		private function fibbo(n:int):int
		{
			if (n <= 1)
				return 1;
			else
				return fibbo(n-1) + (n-2);
		}
	}
}