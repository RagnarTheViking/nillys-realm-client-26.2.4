package _5B_
{
   import _f7.Signal;
   import flash.utils.Dictionary;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   
   public class _1I_N_ extends Signal
   {
       
      
      private var _0I_3:String;
      
      private var _1X_0:Dictionary;
      
      public function _1I_N_(param1:String, ... rest)
      {
         this._0I_3 = param1;
         this._1X_0 = new Dictionary(true);
         super(rest);
      }
      
      public function map(param1:IEventDispatcher, param2:*) : void
      {
         this._1X_0[param1] = param2;
         param1.addEventListener(this._0I_3,this._0o4,false,0,true);
      }
      
      private function _0o4(param1:Event) : void
      {
         dispatch(this._1X_0[param1.target]);
      }
   }
}
