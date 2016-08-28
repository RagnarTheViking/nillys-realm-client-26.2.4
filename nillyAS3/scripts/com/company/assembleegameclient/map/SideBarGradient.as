package com.company.assembleegameclient.map
{
   import flash.display.Shape;
   import flash.display.GraphicsGradientFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import flash.display.GradientType;
   import com.company.util.GraphicHelper;
   
   public class SideBarGradient extends Shape
   {
       
      
      private const _7n:GraphicsGradientFill = new GraphicsGradientFill(GradientType.LINEAR,[0,0],[0,1],[0,255],GraphicHelper.getGradientMatrix(10,600));
      
      private const _16z:GraphicsPath = GraphicHelper.getRectGPath(0,0,10,600);
      
      private var _0o3:Vector.<IGraphicsData>;
      
      public function SideBarGradient()
      {
         super();
         this._0o3 = new <IGraphicsData>[this._7n,this._16z,GraphicHelper.END_FILL];
         graphics.drawGraphicsData(this._0o3);
         visible = false;
      }
   }
}
