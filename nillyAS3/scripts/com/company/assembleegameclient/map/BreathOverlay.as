package com.company.assembleegameclient.map
{
   import flash.display.Shape;
   import flash.display.GraphicsGradientFill;
   import flash.display.GraphicsPath;
   import flash.display.GradientType;
   import com.company.util.GraphicHelper;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class BreathOverlay extends Shape
   {
      
      private static var s:Number = 600 / Math.sin(Math.PI / 4);
      
      private static var fill_:GraphicsGradientFill = new GraphicsGradientFill(GradientType.RADIAL,[16777215,16777215,16777215],[0,0,0.92],[0,155,255],GraphicHelper.getGradientMatrix(s,s,0,(600 - s) / 2,(600 - s) / 2));
      
      private static var path_:GraphicsPath = GraphicHelper.getRectGPath(0,0,600,600);
       
      
      private var graphicsData:Vector.<IGraphicsData>;
      
      public function BreathOverlay(param1:GameSpriteBase = null)
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
         var _loc8_:* = _loc7_ / Math.sin(Math.PI / 4);
         var _loc9_:* = _loc5_ / Math.sin(Math.PI / 4);
         fill_ = new GraphicsGradientFill(GradientType.RADIAL,[16777215,16777215,16777215],[0,0,0.92],[0,155,255],GraphicHelper.getGradientMatrix(_loc8_,_loc9_,0,(_loc7_ - _loc8_) / 2,(_loc5_ - _loc9_) / 2));
         path_ = GraphicHelper.getRectGPath(0,0,_loc4_,_loc5_);
         this.graphicsData = new <IGraphicsData>[fill_,path_,GraphicHelper.END_FILL];
         graphics.drawGraphicsData(this.graphicsData);
         visible = false;
      }
   }
}
