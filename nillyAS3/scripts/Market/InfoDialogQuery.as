package Market
{
   import flash.display.Sprite;
   import _17B_._1O_B_;
   import _17B_._1tT_;
   import flash.display.Bitmap;
   import _P_N_.CaretakerQueryDialog;
   import flash.display.BitmapData;
   
   public class InfoDialogQuery extends Sprite
   {
       
      
      private const _0O_S_:_1O_B_ = this._oy();
      
      private var _0kY_:_1tT_;
      
      private const icon:Bitmap = this._05V_();
      
      public function InfoDialogQuery()
      {
         this._0kY_ = this._A_c();
         super();
      }
      
      private function _oy() : _1O_B_
      {
         var _loc1_:_1O_B_ = null;
         _loc1_ = new _1O_B_(CaretakerQueryDialog._08t);
         _loc1_.x = 60;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _A_c() : _1tT_
      {
         var _loc1_:_1tT_ = null;
         _loc1_ = new _1tT_();
         _loc1_.y = 60;
         return _loc1_;
      }
      
      private function _05V_() : Bitmap
      {
         var _loc1_:Bitmap = null;
         _loc1_ = new Bitmap(this._0b4());
         _loc1_.x = 4;
         _loc1_.y = 6;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0b4() : BitmapData
      {
         return new _1wr(42,42,true,4278255360);
      }
      
      public function _070(param1:String) : void
      {
         this._0kY_ = this._A_c();
         this._0kY_._0D_S_(param1);
         removeChild(this._0O_S_);
         addChild(this._0kY_);
      }
      
      public function _14E_() : void
      {
         removeChild(this._0kY_);
         addChild(this._0O_S_);
      }
      
      public function _0K_L_(param1:BitmapData) : void
      {
         this.icon.bitmapData = param1;
         this.icon.scaleX = 0.5;
         this.icon.scaleY = 0.5;
      }
   }
}
