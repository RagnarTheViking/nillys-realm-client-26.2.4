package _Y_8
{
   import flash.display.Sprite;
   import _05L_._05T_;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.display.Bitmap;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class _bV_ extends Sprite
   {
      
      public static const _U_1:String = "lofiInterfaceBig";
      
      public static const _0ap:int = 21;
       
      
      public function _bV_()
      {
         super();
         this._1qp();
         this._oy();
      }
      
      public function setup(param1:_05T_) : void
      {
         x = 0;
         y = param1.chat.height - param1._A_x;
      }
      
      private function _1qp() : SimpleText
      {
         var _loc1_:SimpleText = null;
         var _loc2_:_dU_ = new _dU_().setParams(_1O_I_._F_N_);
         _loc1_ = new SimpleText();
         _loc1_.setStringBuilder(_loc2_);
         _loc1_.x = 29;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _oy() : Bitmap
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = TextureLibrary.getBitmap(_U_1,_0ap);
         _loc2_ = TextureRedrawer.redraw(_loc2_,20,true,0,false);
         _loc1_ = new Bitmap(_loc2_);
         _loc1_.x = -5;
         _loc1_.y = -10;
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
