package com.company.assembleegameclient.map
{
   import flash.display.Shape;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.GraphicsGradientFill;
   import flash.display.GradientType;
   import com.company.util.GraphicHelper;
   
   public class DarknessOverlay extends Shape
   {
       
      
      private var graphicsData:Vector.<IGraphicsData>;
      
      public function DarknessOverlay(param1:GameSpriteBase = null)
      {
         super();
         var _loc2_:* = WebMain.stage_;
         var _loc3_:* = Parameters.data_.mscale;
         var _loc4_:* = _loc2_.stageWidth / _loc3_;
         var _loc5_:* = _loc2_.stageHeight / _loc3_;
         var _loc6_:* = 200;
         if(param1 != null && param1.hudView != null)
         {
            _loc6_ = _loc4_ * (1 - param1.hudView.x / 800);
         }
         var _loc7_:* = _loc4_ - _loc6_;
         var _loc8_:* = 350;
         var _loc9_:* = 350;
         var _loc10_:* = new GraphicsGradientFill(GradientType.RADIAL,[0,0],[0.3,0.9],[0,255],GraphicHelper.getGradientMatrix(_loc8_,_loc9_,0,(_loc7_ - _loc8_) / 2,(_loc5_ - _loc8_) / 2 + _loc5_ * 5 / 24));
         var _loc11_:* = GraphicHelper.getRectGPath(0,0,_loc4_,_loc5_ * 29 / 24);
         this.graphicsData = new <IGraphicsData>[_loc10_,_loc11_,GraphicHelper.END_FILL];
         graphics.drawGraphicsData(this.graphicsData);
         visible = false;
      }
   }
}
