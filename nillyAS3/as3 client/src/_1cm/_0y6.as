package _1cm
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import _1U_P_._eO_;
   import flash.display.BitmapData;
   
   public class _0y6 extends Sprite
   {
       
      
      private const _0O_S_:_1cm._1O_V_ = _oy();
      
      private const _0kY_:_1cm._0I_g = _A_c();
      
      private const icon:Bitmap = _1wS_();
      
      public function _0y6()
      {
         super();
      }
      
      private function _oy() : _1cm._1O_V_
      {
         var _loc1_:_1cm._1O_V_ = null;
         _loc1_ = new _1cm._1O_V_(_eO_._08t);
         _loc1_.x = 60;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _A_c() : _1cm._0I_g
      {
         var _loc1_:_1cm._0I_g = null;
         _loc1_ = new _1cm._0I_g();
         _loc1_.y = 60;
         return _loc1_;
      }
      
      private function _1wS_() : Bitmap
      {
         var _loc1_:Bitmap = null;
         _loc1_ = new Bitmap(this._0b4());
         _loc1_.x = 0;
         _loc1_.y = 0;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0b4() : BitmapData
      {
         return new BitmapData(42,42,true,4278255360);
      }
      
      public function _070(param1:String) : void
      {
         this._0kY_._0D_S_(param1);
         removeChild(this._0O_S_);
         addChild(this._0kY_);
      }
      
      public function _14E_() : void
      {
         removeChild(this._0kY_);
         addChild(this._0O_S_);
      }
      
      public function _W_Z_(param1:BitmapData) : void
      {
         this.icon.bitmapData = param1;
      }
   }
}
