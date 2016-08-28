package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.NameChangerPanel;
   
   public class NameChanger extends GameObject implements _1kF_
   {
       
      
      public var _0eM_:int = 0;
      
      public function NameChanger(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function _P_F_(param1:int) : void
      {
         this._0eM_ = param1;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new NameChangerPanel(param1,this._0eM_);
      }
   }
}
