package com.company.assembleegameclient.objects
{
   import _C_._1O_I_;
   import ToolTips.ToolTip;
   import ToolTips._0bd;
   import flash.display.BitmapData;
   
   public class ClosedVaultChest extends SellableObject
   {
       
      
      public function ClosedVaultChest(param1:XML)
      {
         super(param1);
      }
      
      override public function soldObjectName() : String
      {
         return _1O_I_._1gt;
      }
      
      override public function soldObjectInternalName() : String
      {
         return "Vault Chest";
      }
      
      override public function getTooltip() : ToolTip
      {
         return new _0bd(3552822,10197915,this.soldObjectName(),_1O_I_._0ip,200);
      }
      
      override public function getIcon() : BitmapData
      {
         return ObjectLibrary.getRedrawnTextureFromType(ObjectLibrary._07h["Vault Chest"],80,true);
      }
   }
}
