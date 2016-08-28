package com.company.assembleegameclient.objects
{
   import _0jo._1aV_;
   import ToolTips.ToolTip;
   import ToolTips._0bd;
   import _C_._1O_I_;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.TextPanel;
   import _0H_6.GameContext;
   
   public class ClosedGiftChest extends GameObject implements _1kF_
   {
       
      
      private var _1K_4:_1aV_;
      
      public function ClosedGiftChest(param1:XML)
      {
         super(param1);
         _1kM_ = true;
         this._1K_4 = GameContext.getInjector().getInstance(_1aV_);
      }
      
      public function getTooltip() : ToolTip
      {
         return new _0bd(3552822,10197915,_1O_I_._0py,_1O_I_._185,200);
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         this._1K_4.dispatch(_1O_I_._185);
         return new TextPanel(param1);
      }
   }
}
