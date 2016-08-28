package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.Event;
   import flash.display.Bitmap;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.events.MouseEvent;
   
   public class _1A_O_ extends Sprite
   {
      
      public static const _qv:String = "lofiInterfaceBig";
      
      public static const _1qM_:int = 22;
       
      
      private var _14C_:com.company.assembleegameclient.ui.BoostPanel;
      
      private var player:Player;
      
      public function _1A_O_(param1:Player)
      {
         var _loc2_:Bitmap = null;
         super();
         this.player = param1;
         var _loc3_:BitmapData = TextureLibrary.getBitmap(_qv,_1qM_);
         var _loc4_:BitmapData = TextureRedrawer.redraw(_loc3_,20,true,0);
         _loc2_ = new Bitmap(_loc4_);
         _loc2_.x = -7;
         _loc2_.y = -10;
         addChild(_loc2_);
         addEventListener(MouseEvent.MOUSE_OVER,this._1lH_);
         addEventListener(MouseEvent.MOUSE_OUT,this._0os);
      }
      
      private function _1lH_(param1:Event) : void
      {
         addChild(this._14C_ = new com.company.assembleegameclient.ui.BoostPanel(this.player));
         this._14C_._0lF_.add(this._1b0);
         this._1b0();
      }
      
      private function _1b0() : void
      {
         this._14C_.x = -this._14C_.width;
         this._14C_.y = -this._14C_.height;
      }
      
      private function _0os(param1:Event) : void
      {
         if(this._14C_)
         {
            removeChild(this._14C_);
         }
      }
   }
}
