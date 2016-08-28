package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.objects.Player;
   import ToolTips.EquipmentToolTip;
   
   public class _pJ_
   {
       
      
      public function _pJ_()
      {
         super();
      }
      
      public function make(param1:int, param2:Player, param3:int, param4:String, param5:uint) : Sprite
      {
         return new EquipmentToolTip(param1,param2,param3,param4);
      }
   }
}
