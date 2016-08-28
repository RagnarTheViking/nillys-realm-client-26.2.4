package _qR_
{
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import flash.geom.Matrix;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.Square;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.util.GraphicHelper;
   
   public class _0Y_n extends BasicObject
   {
       
      
      protected var bitmapFill_:GraphicsBitmapFill;
      
      protected var path_:GraphicsPath;
      
      protected var vS_:Vector.<Number>;
      
      protected var _1T_f:Matrix;
      
      public var size_:int;
      
      public var _2n:BitmapData;
      
      protected var _S_c:Number = 0;
      
      public var _0M_d:Number = 0;
      
      public function _0Y_n(param1:BitmapData, param2:Number)
      {
         this.bitmapFill_ = new GraphicsBitmapFill(null,null,false,false);
         this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,null);
         this.vS_ = new Vector.<Number>();
         this._1T_f = new Matrix();
         super();
         hasShadow = false;
         objectId_ = _03v();
         this._2n = param1;
         z_ = param2;
      }
      
      public function moveTo(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Square = null;
         _loc3_ = map_.getSquare(param1,param2);
         if(!_loc3_)
         {
            return false;
         }
         x_ = param1;
         y_ = param2;
         square_ = _loc3_;
         return true;
      }
      
      public function setSize(param1:int) : void
      {
         this.size_ = param1 / 100 * 5;
      }
      
      override public function drawShadow(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var texture:BitmapData = null;
         var w:int = 0;
         var h:int = 0;
         var graphicsData:Vector.<IGraphicsData> = param1;
         var camera:View = param2;
         var time:int = param3;
         try
         {
            texture = this._2n;
            w = texture.width;
            h = texture.height;
            if(!w || !h)
            {
               return;
            }
            this.vS_.length = 0;
            this.vS_.push(_P_c[3] - w / 2,_P_c[4] - h / 2,_P_c[3] + w / 2,_P_c[4] - h / 2,_P_c[3] + w / 2,_P_c[4] + h / 2,_P_c[3] - w / 2,_P_c[4] + h / 2);
            this.path_.data = this.vS_;
            this.bitmapFill_.bitmapData = texture;
            this._1T_f.identity();
            if(this._0M_d || this._S_c)
            {
               if(this._S_c)
               {
                  this._0M_d = this._0M_d + this._S_c;
               }
               this._1T_f.translate(-w / 2,-h / 2);
               this._1T_f.rotate(this._0M_d);
               this._1T_f.translate(w / 2,h / 2);
            }
            this._1T_f.translate(this.vS_[0],this.vS_[1]);
            this.bitmapFill_.matrix = this._1T_f;
            graphicsData.push(this.bitmapFill_);
            graphicsData.push(this.bitmapFill_);
            graphicsData.push(this.path_);
            graphicsData.push(GraphicHelper.END_FILL);
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
   }
}
