package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _0S_u._0Y_t;
   import _f7.Signal;
   import flash.filters.DropShadowFilter;
   import _1xa._1eo;
   
   public class _I_5 extends Sprite
   {
       
      
      private var _R_d:SimpleText;
      
      private var _U_F_:_0Y_t;
      
      public var textChanged:Signal;
      
      public function _I_5()
      {
         super();
         this._Y_K_();
         this.textChanged = this._R_d.textChanged;
         this._R_d.x = 0;
         this._R_d.y = 0;
         var _loc1_:SimpleText = this._dc();
         this._U_F_ = new _0Y_t(_loc1_);
         this._U_F_.x = 0;
         this._U_F_.y = 20;
         addChild(this._U_F_);
         addChild(this._R_d);
      }
      
      private function _dc() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(16).setColor(16777103);
         _loc1_.setBold(true);
         _loc1_.setMultiLine(true);
         _loc1_.mouseEnabled = true;
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         return _loc1_;
      }
      
      private function _Y_K_() : void
      {
         this._R_d = new SimpleText().setSize(16).setColor(16777215);
         this._R_d.setMultiLine(true);
         this._R_d.mouseEnabled = true;
         this._R_d.filters = [new DropShadowFilter(0,0,0)];
      }
      
      public function _zZ_(param1:_1eo) : void
      {
         this._R_d.setStringBuilder(param1);
      }
      
      public function setTime(param1:Number) : void
      {
         this._U_F_.update(param1);
      }
   }
}
