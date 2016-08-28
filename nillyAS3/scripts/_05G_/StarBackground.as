package _05G_
{
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.util.TextureLibrary;
   import com.company.util._n5;
   import com.company.util.PointUtil;
   
   public class StarBackground extends Background
   {
       
      
      public var _0D_I_:Vector.<Star>;
      
      protected var graphicsData_:Vector.<IGraphicsData>;
      
      public function StarBackground()
      {
         var _loc1_:int = 0;
         this._0D_I_ = new Vector.<Star>();
         this.graphicsData_ = new Vector.<IGraphicsData>();
         super();
         while(_loc1_ < 100)
         {
            this._cE_();
            _loc1_++;
         }
      }
      
      override public function draw(param1:View, param2:int) : void
      {
         var _loc3_:Star = null;
         this.graphicsData_.length = 0;
         for each(_loc3_ in this._0D_I_)
         {
            _loc3_.draw(this.graphicsData_,param1,param2);
         }
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData_);
      }
      
      private function _cE_() : void
      {
         var _loc1_:Star = null;
         var _loc2_:_n5 = TextureLibrary._0R_8("stars");
         var _loc3_:Star = new Star(Math.random() * 1000 - 500,Math.random() * 1000 - 500,4 * (0.5 + 0.5 * Math.random()),_loc2_._0D_y[int(_loc2_._0D_y.length * Math.random())]);
         for each(_loc1_ in this._0D_I_)
         {
            if(PointUtil.getDistance(_loc3_.x_,_loc3_.y_,_loc1_.x_,_loc1_.y_) < 3)
            {
               return;
            }
         }
         this._0D_I_.push(_loc3_);
      }
   }
}

import flash.display.GraphicsEndFill;
import flash.display.GraphicsPathCommand;
import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsPath;
import flash.display.IGraphicsData;
import com.company.assembleegameclient.map.View;
import flash.geom.Matrix;

class Star
{
   
   protected static const sqCommands:Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO];
   
   protected static const END_FILL:GraphicsEndFill = new GraphicsEndFill();
    
   
   public var x_:Number;
   
   public var y_:Number;
   
   public var scale_:Number;
   
   public var bitmap_:BitmapData;
   
   private var w_:Number;
   
   private var h_:Number;
   
   protected var bitmapFill_:GraphicsBitmapFill;
   
   protected var path_:GraphicsPath;
   
   function Star(param1:Number, param2:Number, param3:Number, param4:BitmapData)
   {
      this.bitmapFill_ = new GraphicsBitmapFill(null,new Matrix(),false,false);
      this.path_ = new GraphicsPath(sqCommands,new Vector.<Number>());
      super();
      this.x_ = param1;
      this.y_ = param2;
      this.scale_ = param3;
      this.bitmap_ = param4;
      this.w_ = this.bitmap_.width * this.scale_;
      this.h_ = this.bitmap_.height * this.scale_;
   }
   
   public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
   {
      var _loc4_:Number = this.x_ * Math.cos(-param2.angleRad_) - this.y_ * Math.sin(-param2.angleRad_);
      var _loc5_:Number = this.x_ * Math.sin(-param2.angleRad_) + this.y_ * Math.cos(-param2.angleRad_);
      var _loc6_:Matrix = this.bitmapFill_.matrix;
      _loc6_.identity();
      _loc6_.translate(-this.bitmap_.width / 2,-this.bitmap_.height / 2);
      _loc6_.scale(this.scale_,this.scale_);
      _loc6_.translate(_loc4_,_loc5_);
      this.bitmapFill_.bitmapData = this.bitmap_;
      this.path_.data.length = 0;
      var _loc7_:Number = _loc4_ - this.w_ / 2;
      var _loc8_:Number = _loc5_ - this.h_ / 2;
      this.path_.data.push(_loc7_,_loc8_,_loc7_ + this.w_,_loc8_,_loc7_ + this.w_,_loc8_ + this.h_,_loc7_,_loc8_ + this.h_);
      param1.push(this.bitmapFill_);
      param1.push(this.path_);
      param1.push(END_FILL);
   }
}
