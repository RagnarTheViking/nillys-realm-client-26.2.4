package com.company.assembleegameclient.ui
{
   import flash.display.Shape;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import flash.display.GraphicsPathWinding;
   
   public class _0fL_ extends Shape
   {
       
      
      private var _17i:Vector.<IGraphicsData>;
      
      private var _1t5:GraphicsSolidFill;
      
      private var _3H_:GraphicsPath;
      
      public function _0fL_(param1:int, param2:uint)
      {
         this._1t5 = new GraphicsSolidFill(16777215,1);
         this._3H_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>(),GraphicsPathWinding.NON_ZERO);
         this._17i = new <IGraphicsData>[this._1t5,this._3H_,GraphicHelper.END_FILL];
         super();
         this._0Z_i(param1,param2);
      }
      
      public function _0Z_i(param1:int, param2:uint) : void
      {
         graphics.clear();
         this._1t5.color = param2;
         GraphicHelper.clearGraphicsPath(this._3H_);
         GraphicHelper._0j(0,0,4,this._3H_);
         GraphicHelper._0j(param1,0,4,this._3H_);
         GraphicHelper.drawRect(0,-1,param1,2,this._3H_);
         graphics.drawGraphicsData(this._17i);
      }
   }
}
