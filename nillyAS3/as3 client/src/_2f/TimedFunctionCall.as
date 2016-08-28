package _2f
{
   public class TimedFunctionCall extends TimedTask
   {
       
      
      public var callback:Function;
      
      public var parameters:Array;
      
      public function TimedFunctionCall(param1:int, param2:Function, ... rest)
      {
         super(param1);
         this.callback = param2;
         this.parameters = rest;
      }
      
      override protected function run() : void
      {
         this.callback.apply(this.parameters);
      }
      
      override protected function onDestroyed() : void
      {
         this.callback = null;
         this.parameters = null;
      }
   }
}
