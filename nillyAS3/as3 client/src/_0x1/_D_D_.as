package _0x1
{
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.geom.Matrix;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsBitmapFill;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.util.GraphicHelper;
   import flash.display.BitmapData;
   
   public class _D_D_ extends BasicObject
   {
       
      
      public var _C_7:Number = 0;
      
      public var _se:Number;
      
      public var _1qA_:Number;
      
      public var _1Q_1:Number;
      
      protected var vS_:Vector.<Number>;
      
      protected var _1T_f:Matrix;
      
      protected var path_:GraphicsPath;
      
      protected var bitmapFill_:GraphicsBitmapFill;
      
      public function _D_D_(param1:BitmapData)
      {
         this.vS_ = new Vector.<Number>(8);
         this._1T_f = new Matrix();
         this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,null);
         this.bitmapFill_ = new GraphicsBitmapFill(null,null,false,false);
         super();
         this.bitmapFill_.bitmapData = param1;
         objectId_ = _03v();
      }
      
      public function initialize(param1:Number, param2:Number, param3:Number, param4:Number, param5:int) : void
      {
         this._C_7 = param1;
         this._se = param2;
         this._1qA_ = param3;
         this._1Q_1 = param4;
         z_ = param5;
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:Number = this.bitmapFill_.bitmapData.width / 2;
         var _loc5_:Number = this.bitmapFill_.bitmapData.height / 2;
         this.vS_[6] = this.vS_[0] = _P_c[3] - _loc4_;
         this.vS_[3] = this.vS_[1] = _P_c[4] - _loc5_;
         this.vS_[4] = this.vS_[2] = _P_c[3] + _loc4_;
         this.vS_[7] = this.vS_[5] = _P_c[4] + _loc5_;
         this.path_.data = this.vS_;
         this._1T_f.identity();
         this._1T_f.translate(this.vS_[0],this.vS_[1]);
         this.bitmapFill_.matrix = this._1T_f;
         param1.push(this.bitmapFill_);
         param1.push(this.path_);
         param1.push(GraphicHelper.END_FILL);
      }
      
      override public function removeFromMap() : void
      {
         map_ = null;
         square_ = null;
      }
   }
}
