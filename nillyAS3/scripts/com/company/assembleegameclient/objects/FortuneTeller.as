package com.company.assembleegameclient.objects
{
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import _ek._18o;
   
   public class FortuneTeller extends Character
   {
       
      
      public function FortuneTeller(param1:XML)
      {
         super(param1);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         if(_18o._1Q_W_)
         {
            super.draw(param1,param2,param3);
         }
      }
      
      override public function drawShadow(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         if(_18o._1Q_W_)
         {
            super.drawShadow(param1,param2,param3);
         }
      }
   }
}
