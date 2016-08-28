package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.FileReference;
   import _1I_X_._0K_z;
   import flash.display.BitmapData;
   
   public class _1S_k extends Sprite
   {
       
      
      private var bitmap_:Bitmap;
      
      private var _0V___:com.company.assembleegameclient.ui.Button;
      
      private var _0H_V_:com.company.assembleegameclient.ui.Button;
      
      public function _1S_k(param1:BitmapData)
      {
         super();
         this.bitmap_ = new Bitmap(param1);
         addChild(this.bitmap_);
         this._0V___ = new com.company.assembleegameclient.ui.Button(16,"Save");
         addChild(this._0V___);
         this._0H_V_ = new com.company.assembleegameclient.ui.Button(16,"Close");
         addChild(this._0H_V_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this._0V___.addEventListener(MouseEvent.CLICK,this._F_S_);
         this._0H_V_.addEventListener(MouseEvent.CLICK,this._fH_);
         stage;
         this.bitmap_.x = 600 / 2 - this.bitmap_.width / 2;
         stage;
         this.bitmap_.y = 600 / 2 - this.bitmap_.height / 2;
         this._0H_V_.x = this.bitmap_.x + this.bitmap_.width - this._0H_V_.width;
         this._0H_V_.y = this.bitmap_.y + this.bitmap_.height + 10;
         this._0V___.x = this._0H_V_.x - this._0V___.width - 10;
         this._0V___.y = this.bitmap_.y + this.bitmap_.height + 10;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._0V___.removeEventListener(MouseEvent.CLICK,this._F_S_);
         this._0H_V_.removeEventListener(MouseEvent.CLICK,this._fH_);
      }
      
      private function _F_S_(param1:Event) : void
      {
         new FileReference().save(_0K_z.encode(this.bitmap_.bitmapData),"map.png");
      }
      
      private function _fH_(param1:Event) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}
