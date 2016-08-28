package _0da
{
   import _1cV_._g9;
   
   public class _I_N_ extends _g9
   {
      
      private static const _gj:String = "[{NAME}] [0x33FF33:{/x {MEAN}ms (min {MIN}ms, max {MAX}ms)]";
      
      private static const COUNT:int = 10;
       
      
      private var _1P_g:Vector.<int>;
      
      private var index:int;
      
      private var count:int;
      
      public var _A_z:int;
      
      public var mean:int;
      
      public var max:int;
      
      public var min:int;
      
      public function _I_N_(param1:String)
      {
         super(param1);
         this._1P_g = new Vector.<int>(COUNT,true);
         this.index = 0;
         this._A_z = 0;
         this.count = 0;
         this.min = int.MAX_VALUE;
         this.max = -1;
      }
      
      public function _1dU_(param1:int) : void
      {
         if(this.count < COUNT)
         {
            this._A_z = this._A_z + param1;
            this.count++;
            this._1P_g[this.index] = param1;
         }
         else
         {
            this._A_z = this._A_z - this._1P_g[this.index];
            this._A_z = this._A_z + param1;
            this._1P_g[this.index] = param1;
         }
         if(++this.index == COUNT)
         {
            this.index = 0;
         }
         this.mean = this._A_z / this.count;
         if(param1 > this.max)
         {
            this.max = param1;
         }
         if(param1 < this.min)
         {
            this.min = param1;
         }
         data = _gj.replace("{NAME}",name).replace("{MEAN}",this.mean).replace("{MIN}",this.min).replace("{MAX}",this.max);
      }
   }
}
