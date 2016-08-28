package com.company.assembleegameclient.screens.charrects
{
   import _v4.Client;
   import flash.display.Bitmap;
   import kabam.rotmg.assets.services._157;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.display.Shape;
   
   public class BuyCharacterRect extends CharacterRect
   {
      
      public static const BUY_CHARACTER_RECT_CLASS_NAME_TEXT:String = "BuyCharacterRect.classNameText";
       
      
      private var model:Client;
      
      public function BuyCharacterRect(param1:Client)
      {
         super();
         this.model = param1;
         super.color = 2039583;
         super.overColor = 4342338;
         className = new _dU_().setParams(BUY_CHARACTER_RECT_CLASS_NAME_TEXT,{"nth":param1.getMaxNumChars() + 1});
         super.init();
         this.makeIcon();
         this.makePriceText();
         this.makeCoin();
      }
      
      private function makeCoin() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = this.model.getCharSlotCurrency() == 0?_157.makeCoin():_157._0rl();
         _loc1_ = new Bitmap(_loc2_);
         _loc1_.x = WIDTH - 43;
         _loc1_.y = (HEIGHT - _loc1_.height) * 0.5 - 1;
         selectContainer.addChild(_loc1_);
      }
      
      private function makePriceText() : void
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(18).setColor(16777215).setAutoSize(TextFieldAutoSize.RIGHT);
         _loc1_.setStringBuilder(new SText(this.model.getNextCharSlotPrice().toString()));
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         _loc1_.x = WIDTH - 43;
         _loc1_.y = 19;
         selectContainer.addChild(_loc1_);
      }
      
      private function makeTagline() : void
      {
         var _loc1_:int = 100 - this.model.getNextCharSlotPrice() / 10;
         var _loc2_:String = String(_loc1_);
         if(_loc1_ != 0)
         {
            makeTaglineText(new _dU_().setParams(_1O_I_._1fE_,{"percentage":_loc2_}));
         }
      }
      
      private function makeIcon() : void
      {
         var _loc1_:Shape = null;
         _loc1_ = this.buildIcon();
         _loc1_.x = CharacterRectConstants.ICON_POS_X + 5;
         _loc1_.y = (HEIGHT - _loc1_.height) * 0.5;
         addChild(_loc1_);
      }
      
      private function buildIcon() : Shape
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(3880246);
         _loc1_.graphics.lineStyle(1,4603457);
         _loc1_.graphics.drawCircle(19,19,19);
         _loc1_.graphics.lineStyle();
         _loc1_.graphics.endFill();
         _loc1_.graphics.beginFill(2039583);
         _loc1_.graphics.drawRect(11,17,16,4);
         _loc1_.graphics.endFill();
         _loc1_.graphics.beginFill(2039583);
         _loc1_.graphics.drawRect(17,11,4,16);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
   }
}
