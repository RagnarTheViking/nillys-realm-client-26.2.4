package _05G_
{
   import flash.geom.Point;
   import flash.display.BitmapData;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import com.company.assembleegameclient.map.View;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import com.company.util.GraphicHelper;
   import flash.display.BitmapDataChannel;
   
   public class NexusBackground extends Background
   {
      
      public static const _1P_o:Point = new Point(0.01,0.01);
       
      
      private var _061:BitmapData;
      
      private var _1Q_a:Vector.<Island>;
      
      protected var graphicsData_:Vector.<IGraphicsData>;
      
      private var bitmapFill_:GraphicsBitmapFill;
      
      private var path_:GraphicsPath;
      
      public function NexusBackground()
      {
         this._1Q_a = new Vector.<Island>();
         this.graphicsData_ = new Vector.<IGraphicsData>();
         this.bitmapFill_ = new GraphicsBitmapFill(null,new Matrix(),true,false);
         this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         super();
         this._061 = new _1wr(1024,1024,false,0);
         this._061.perlinNoise(1024,1024,8,Math.random(),true,true,BitmapDataChannel.BLUE,false,null);
      }
      
      override public function draw(param1:View, param2:int) : void
      {
         this.graphicsData_.length = 0;
         var _loc3_:Matrix = this.bitmapFill_.matrix;
         _loc3_.identity();
         _loc3_.translate(param2 * _1P_o.x,param2 * _1P_o.y);
         _loc3_.rotate(-param1.angleRad_);
         this.bitmapFill_.bitmapData = this._061;
         this.graphicsData_.push(this.bitmapFill_);
         this.path_.data.length = 0;
         var _loc4_:Rectangle = param1.rect;
         this.path_.data.push(_loc4_.left,_loc4_.top,_loc4_.right,_loc4_.top,_loc4_.right,_loc4_.bottom,_loc4_.left,_loc4_.bottom);
         this.graphicsData_.push(this.path_);
         this.graphicsData_.push(GraphicHelper.END_FILL);
         this._0I_9(param1,param2);
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData_);
      }
      
      private function _0I_9(param1:View, param2:int) : void
      {
         var _loc3_:Island = null;
         var _loc4_:int = 0;
         while(_loc4_ < this._1Q_a.length)
         {
            _loc3_ = this._1Q_a[_loc4_];
            _loc3_.draw(param1,param2,this.graphicsData_);
            _loc4_++;
         }
      }
   }
}

import flash.geom.Point;
import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import com.company.assembleegameclient.map.View;
import flash.display.IGraphicsData;
import _05G_.NexusBackground;
import flash.geom.Matrix;
import com.company.util.GraphicHelper;
import com.company.util.TextureLibrary;

class Island
{
    
   
   public var center_:Point;
   
   public var startTime_:int;
   
   public var bitmapData_:BitmapData;
   
   private var bitmapFill_:GraphicsBitmapFill;
   
   private var path_:GraphicsPath;
   
   function Island(param1:Number, param2:Number, param3:int)
   {
      this.bitmapFill_ = new GraphicsBitmapFill(null,new Matrix(),true,false);
      this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
      super();
      this.center_ = new Point(param1,param2);
      this.startTime_ = param3;
      this.bitmapData_ = TextureLibrary.getImage("stars");
   }
   
   public function draw(param1:View, param2:int, param3:Vector.<IGraphicsData>) : void
   {
      var _loc4_:int = param2 - this.startTime_;
      var _loc5_:Number = this.center_.x + _loc4_ * NexusBackground._1P_o.x;
      var _loc6_:Number = this.center_.y + _loc4_ * NexusBackground._1P_o.y;
      var _loc7_:Matrix = this.bitmapFill_.matrix;
      _loc7_.identity();
      _loc7_.translate(_loc5_,_loc6_);
      _loc7_.rotate(-param1.angleRad_);
      this.bitmapFill_.bitmapData = this.bitmapData_;
      param3.push(this.bitmapFill_);
      this.path_.data.length = 0;
      var _loc8_:Point = _loc7_.transformPoint(new Point(_loc5_,_loc6_));
      var _loc9_:Point = _loc7_.transformPoint(new Point(_loc5_ + this.bitmapData_.width,_loc6_ + this.bitmapData_.height));
      this.path_.data.push(_loc8_.x,_loc8_.y,_loc9_.x,_loc8_.y,_loc9_.x,_loc9_.y,_loc8_.x,_loc9_.y);
      param3.push(this.path_);
      param3.push(GraphicHelper.END_FILL);
   }
}
