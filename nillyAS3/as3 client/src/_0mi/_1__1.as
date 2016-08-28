package _0mi
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _0U_9._0Z_u;
   import _0U_9._0V_O_;
   import _0U_9._1oE_;
   
   public class _1__1 extends Sprite
   {
       
      
      public const _1R_q:Signal = new Signal();
      
      public var _tV_:_0mi._0C_N_;
      
      public var _tW_:_0mi._0C_N_;
      
      public function _1__1()
      {
         super();
         addChild(_0Z_u._1L_c());
         this._tV_ = new _0V_O_(this);
         this._tW_ = new _1oE_(this);
         alpha = 0;
      }
      
      public function play() : void
      {
         this._tV_._B_(this._0V_G_);
         this._tV_.start();
      }
      
      private function _0V_G_() : void
      {
         this._1R_q.dispatch();
         this._tW_.start();
      }
   }
}
