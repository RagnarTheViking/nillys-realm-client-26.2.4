package _0S_w
{
   import flash.display.Shape;
   import ToolTips.ToolTip;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.map.GroundLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.GroundTile;
   import com.company.assembleegameclient.map.GroundAnimation;
   
   class _er extends _1oe
   {
      
      private static const _1uU_:Vector.<Number> = new <Number>[0,0,0,1,0,0,1,1,0,0,1,0];
      
      private static const _0zb:Number = 0.6;
       
      
      public var _2__4:XML;
      
      private var _1K_6:Shape;
      
      function _er(param1:XML)
      {
         super(int(param1.@type));
         this._2__4 = param1;
         var _loc2_:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
         var _loc3_:View = new View();
         _loc3_.configure(0.5,0.5,12,Math.PI / 4,new Rectangle(-100,-100,200,200));
         var _loc4_:BitmapData = GroundLibrary.getBitmapData(type_);
         var _loc5_:GroundTile = new GroundTile(_loc4_,_1uU_,0,0,GroundAnimation.NONE,0,0);
         _loc5_.draw(_loc2_,_loc3_,0);
         this._1K_6 = new Shape();
         this._1K_6.graphics.drawGraphicsData(_loc2_);
         this._1K_6.scaleX = this._1K_6.scaleY = _0zb;
         this._1K_6.x = WIDTH / 2;
         this._1K_6.y = HEIGHT / 2;
         addChild(this._1K_6);
      }
      
      override protected function getToolTip() : ToolTip
      {
         return new _B_d(this._2__4);
      }
   }
}
