package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _0S_u._0Y_t;
   import _1gF_.SimpleText;
   import flash.filters.DropShadowFilter;
   
   public class _0ed extends Sprite
   {
       
      
      private var _U_F_:_0Y_t;
      
      private var textField:SimpleText;
      
      public function _0ed()
      {
         super();
         this.textField = this._dc();
         this.textField.x = 5;
         this._U_F_ = new _0Y_t(this.textField);
         addChild(this._U_F_);
         this._U_F_.update(100000);
         graphics.lineStyle(2,16777215);
         graphics.beginFill(3552822);
         graphics.drawRoundRect(0,0,150,25,10);
         filters = [new DropShadowFilter(0,0,0,1,16,16,1)];
      }
      
      public function update(param1:Number) : void
      {
         this._U_F_.update(param1);
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
   }
}
