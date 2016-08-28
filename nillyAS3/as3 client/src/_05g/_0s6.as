package _05g
{
   import flash.display.Sprite;
   import _ju._0j1;
   
   public class _0s6 extends Sprite
   {
      
      private static const _xZ_:Array = [1,0,0,1];
      
      private static const _W_Y_:Array = [0,1,1,0];
      
      private static const _1hO_:int = 4;
       
      
      private const _19h:Array = [_xZ_,_W_Y_];
      
      public function _0s6()
      {
         var _loc1_:_0j1 = null;
         var _loc2_:int = 0;
         super();
         while(_loc2_ < 2)
         {
            _loc1_ = new _0j1(this._19h[_loc2_],_loc2_);
            _loc1_.x = _loc2_ * (_0j1._0M_b + _1hO_);
            addChild(_loc1_);
            _loc2_++;
         }
      }
   }
}
