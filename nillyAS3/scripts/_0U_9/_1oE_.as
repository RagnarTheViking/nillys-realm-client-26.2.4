package _0U_9
{
   import _0mi._0C_N_;
   import _T_J_.GTween;
   import flash.display.DisplayObject;
   
   public class _1oE_ extends _0C_N_
   {
       
      
      public function _1oE_(param1:DisplayObject)
      {
         super(param1);
      }
      
      override public function start() : void
      {
         var _loc1_:GTween = new GTween(target,1,{"alpha":1});
         _loc1_.onComplete = this._0hz;
      }
      
      private function _0hz(param1:GTween) : void
      {
         new GTween(target,1,{"alpha":0});
      }
   }
}
