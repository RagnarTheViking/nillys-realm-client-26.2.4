package _0U_9
{
   import _0mi._0C_N_;
   import _T_J_.GTween;
   import flash.display.DisplayObject;
   
   public class _0V_O_ extends _0C_N_
   {
       
      
      public function _0V_O_(param1:DisplayObject)
      {
         super(param1);
      }
      
      override public function start() : void
      {
         var _loc1_:GTween = new GTween(target,1,{"alpha":0});
         _loc1_.onComplete = this._0hz;
      }
      
      private function _0hz(param1:GTween) : void
      {
         var _loc2_:GTween = new GTween(target,1.4 / 2,{"alpha":1});
         _loc2_.onComplete = this._0R_A_;
      }
      
      private function _0R_A_(param1:GTween) : void
      {
         onComplete();
      }
   }
}
