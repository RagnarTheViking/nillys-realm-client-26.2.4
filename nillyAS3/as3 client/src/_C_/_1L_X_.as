package _C_
{
   import flash.text.TextField;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class _1L_X_
   {
      
      private static const _1I_x:Number = 200;
      
      private static const _D_I_:Number = 2;
       
      
      protected var name:String;
      
      private var textColor:uint = 0;
      
      private var _0dv:Number;
      
      private var _1gX_:Number;
      
      public function _1L_X_()
      {
         super();
      }
      
      public function setName(param1:String) : void
      {
         this.name = param1;
         this._Z_1();
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function _V_x(param1:Number) : Number
      {
         return this._0dv * param1;
      }
      
      public function _0uA_(param1:Number) : Number
      {
         return this._1gX_ * param1;
      }
      
      private function _Z_1() : void
      {
         var _loc1_:TextField = this._1qp();
         var _loc2_:BitmapData = new _1wr(_loc1_.width,_loc1_.height);
         _loc2_.draw(_loc1_);
         var _loc3_:uint = 16777215;
         var _loc4_:Rectangle = _loc2_.getColorBoundsRect(_loc3_,this.textColor,true);
         this._0dv = this._4d(_loc4_.height);
         this._1gX_ = this._4d(_loc1_.height - _loc4_.bottom - _D_I_);
      }
      
      private function _1qp() : TextField
      {
         var _loc1_:TextField = new TextField();
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.text = "x";
         _loc1_.textColor = this.textColor;
         _loc1_.setTextFormat(new TextFormat(this.name,_1I_x));
         return _loc1_;
      }
      
      private function _4d(param1:Number) : Number
      {
         return param1 / _1I_x;
      }
   }
}
