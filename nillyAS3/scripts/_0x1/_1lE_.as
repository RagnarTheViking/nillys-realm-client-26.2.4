package _0x1
{
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.display.BitmapData;
   import _0cH_.Animations;
   import flash.geom.Vector3D;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import flash.geom.Matrix;
   import com.company.assembleegameclient.map.Square;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.GraphicHelper;
   
   public class _1lE_ extends BasicObject
   {
       
      
      public var texture_:BitmapData = null;
      
      public var _1s8:Animations = null;
      
      public var size_:int;
      
      public var _0hM_:Number;
      
      public var moveVec_:Vector3D;
      
      protected var bitmapFill_:GraphicsBitmapFill;
      
      protected var path_:GraphicsPath;
      
      protected var vS_:Vector.<Number>;
      
      protected var _0oD_:Vector.<Number>;
      
      protected var _1T_f:Matrix;
      
      public function _1lE_(param1:_m8)
      {
         this.bitmapFill_ = new GraphicsBitmapFill(null,null,false,false);
         this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,null);
         this.vS_ = new Vector.<Number>();
         this._0oD_ = new Vector.<Number>();
         this._1T_f = new Matrix();
         super();
         objectId_ = _03v();
         this.size_ = param1.size_;
         z_ = param1.z_;
         this._0hM_ = param1.duration_;
         this.texture_ = param1._1B_5.getTexture(objectId_);
         if(param1._null_ != null)
         {
            this._1s8 = new Animations(param1._null_);
         }
         this.moveVec_ = new Vector3D();
         var _loc2_:Number = Math.PI * 2 * Math.random();
         this.moveVec_.x = Math.cos(_loc2_) * 0.1 * 5;
         this.moveVec_.y = Math.sin(_loc2_) * 0.1 * 5;
      }
      
      public function moveTo(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Square = map_.getSquare(param1,param2);
         if(_loc3_ == null)
         {
            return false;
         }
         x_ = param1;
         y_ = param2;
         square_ = _loc3_;
         return true;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = param2 / 1000;
         this._0hM_ = this._0hM_ - _loc3_;
         if(this._0hM_ <= 0)
         {
            return false;
         }
         x_ = x_ + this.moveVec_.x * _loc3_;
         y_ = y_ + this.moveVec_.y * _loc3_;
         return true;
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = this.texture_;
         if(this._1s8 != null)
         {
            _loc4_ = this._1s8.getTexture(param3);
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_;
            }
         }
         _loc5_ = TextureRedrawer.redraw(_loc5_,this.size_,true,0);
         var _loc6_:int = _loc5_.width;
         var _loc7_:int = _loc5_.height;
         this.vS_.length = 0;
         this.vS_.push(_P_c[3] - _loc6_ / 2,_P_c[4] - _loc7_,_P_c[3] + _loc6_ / 2,_P_c[4] - _loc7_,_P_c[3] + _loc6_ / 2,_P_c[4],_P_c[3] - _loc6_ / 2,_P_c[4]);
         this.path_.data = this.vS_;
         this.bitmapFill_.bitmapData = _loc5_;
         this._1T_f.identity();
         this._1T_f.translate(this.vS_[0],this.vS_[1]);
         this.bitmapFill_.matrix = this._1T_f;
         param1.push(this.bitmapFill_);
         param1.push(this.path_);
         param1.push(GraphicHelper.END_FILL);
      }
   }
}
