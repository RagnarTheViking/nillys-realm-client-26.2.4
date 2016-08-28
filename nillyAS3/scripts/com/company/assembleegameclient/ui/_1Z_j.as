package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _ll.SFX;
   import flash.filters.DropShadowFilter;
   
   public class _1Z_j extends Sprite
   {
       
      
      public var text_:SimpleText;
      
      public var _1I_w:uint = 16777215;
      
      public function _1Z_j(param1:int, param2:Boolean, param3:String)
      {
         super();
         this.text_ = this.makeText().setSize(param1).setColor(16777215);
         this.text_.setBold(param2);
         this.text_.setStringBuilder(new _dU_().setParams(param3));
         addChild(this.text_);
         this.text_.filters = [new DropShadowFilter(0,0,0)];
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.CLICK,this._0cy);
      }
      
      public function _2__5() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      protected function makeText() : SimpleText
      {
         return new SimpleText();
      }
      
      public function setAutoSize(param1:String) : void
      {
         this.text_.setAutoSize(param1);
      }
      
      public function _1zL_(param1:String) : void
      {
         this.text_.setStringBuilder(new _dU_().setParams(param1));
         this._1xQ_(11776947);
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function setColor(param1:uint) : void
      {
         this.text_.setColor(param1);
      }
      
      public function _1xQ_(param1:uint) : void
      {
         this._1I_w = param1;
         this.setColor(this._1I_w);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.setColor(16768133);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.setColor(this._1I_w);
      }
      
      private function _0cy(param1:MouseEvent) : void
      {
         SFX.play("button_click");
      }
   }
}
