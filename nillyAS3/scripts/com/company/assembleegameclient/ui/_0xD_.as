package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import _ll.Music;
   import _ll._1C_c;
   import flash.filters.GlowFilter;
   
   public class _0xD_ extends Sprite
   {
       
      
      private var bitmap_:Bitmap;
      
      public function _0xD_()
      {
         this.bitmap_ = new Bitmap();
         super();
         addChild(this.bitmap_);
         this.bitmap_.scaleX = 2;
         this.bitmap_.scaleY = 2;
         this._06K_();
         addEventListener(MouseEvent.CLICK,this._1P_q);
         filters = [new GlowFilter(0,1,4,4,2,1)];
      }
      
      private function _06K_() : void
      {
         this.bitmap_.bitmapData = Parameters.data_.playMusic || Parameters.data_.playSFX?TextureLibrary.getBitmap("lofiInterfaceBig",3):TextureLibrary.getBitmap("lofiInterfaceBig",4);
      }
      
      private function _1P_q(param1:MouseEvent) : void
      {
         var _loc2_:* = !(Parameters.data_.playMusic || Parameters.data_.playSFX);
         Music.Play(_loc2_);
         _1C_c._U_d(_loc2_);
         Parameters.data_.playPewPew = _loc2_;
         Parameters.save();
         this._06K_();
      }
   }
}
