package com.company.assembleegameclient.objects
{
   import ToolTips.ToolTip;
   import flash.display.BitmapData;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.SellableObjectPanel;
   
   public class SellableObject extends GameObject implements _1kF_
   {
       
      
      public var price_:int = 0;
      
      public var currency_:int = -1;
      
      public var _sO_:int = 0;
      
      public var _0Q_V_:int = -1;
      
      public function SellableObject(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function setPrice(param1:int) : void
      {
         this.price_ = param1;
      }
      
      public function _11s(param1:int) : void
      {
         this.currency_ = param1;
      }
      
      public function setRankReq(param1:int) : void
      {
         this._sO_ = param1;
      }
      
      public function soldObjectName() : String
      {
         return null;
      }
      
      public function soldObjectInternalName() : String
      {
         return null;
      }
      
      public function getTooltip() : ToolTip
      {
         return null;
      }
      
      public function getIcon() : BitmapData
      {
         return null;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new SellableObjectPanel(param1,this);
      }
   }
}
