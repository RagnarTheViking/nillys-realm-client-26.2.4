package _0R_W_
{
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.display.Shape;
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.PointUtil;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.GradientType;
   import flash.filters.BitmapFilterQuality;
   
   public class _0R_c
   {
      
      private static const _B_F_:uint = 2631720;
      
      private static const GLOW_FILTER:GlowFilter = new GlowFilter(0,0.3,12,12,2,BitmapFilterQuality.LOW,false,false);
      
      private static const _1gj:GlowFilter = new GlowFilter(0,0.5,16,16,3,BitmapFilterQuality.LOW,false,false);
      
      private static var tempMatrix_:Matrix = new Matrix();
      
      private static var _0nW_:Shape = _0bj();
      
      private static var _0v5:Dictionary = new Dictionary();
       
      
      public function _0R_c()
      {
         super();
      }
      
      public static function _1iY_(param1:BitmapData, param2:uint, param3:Number = 1.4, param4:Boolean = false) : BitmapData
      {
         var _loc8_:uint = 0;
         var _loc5_:String = getHash(param2,param3);
         if(param4 && _6n(param1,_loc5_))
         {
            return _0v5[param1][_loc5_];
         }
         var _loc6_:BitmapData = param1.clone();
         tempMatrix_.identity();
         tempMatrix_.scale(param1.width / 256,param1.height / 256);
         _loc6_.draw(_0nW_,tempMatrix_,null,BlendMode.SUBTRACT);
         var _loc7_:Bitmap = new Bitmap(param1);
         _loc6_.draw(_loc7_,null,null,BlendMode.ALPHA);
         TextureRedrawer.OUTLINE_FILTER.blurX = param3;
         TextureRedrawer.OUTLINE_FILTER.blurY = param3;
         TextureRedrawer.OUTLINE_FILTER.color = _loc8_;
         _loc6_.applyFilter(_loc6_,_loc6_.rect,PointUtil._17Q_,TextureRedrawer.OUTLINE_FILTER);
         if(param2 != 4294967295)
         {
            if(Parameters.hwAccel() && param2 != 0)
            {
               _1gj.color = param2;
               _loc6_.applyFilter(_loc6_,_loc6_.rect,PointUtil._17Q_,_1gj);
            }
            else
            {
               GLOW_FILTER.color = param2;
               _loc6_.applyFilter(_loc6_,_loc6_.rect,PointUtil._17Q_,GLOW_FILTER);
            }
         }
         if(param4)
         {
            _1xV_(param1,param2,param3,_loc6_);
         }
         return _loc6_;
      }
      
      private static function _1xV_(param1:BitmapData, param2:uint, param3:Number, param4:BitmapData) : void
      {
         var _loc5_:Object = null;
         var _loc6_:String = getHash(param2,param3);
         if(param1 in _0v5)
         {
            _0v5[param1][_loc6_] = param4;
         }
         else
         {
            _loc5_ = {};
            _loc5_[_loc6_] = param4;
            _0v5[param1] = _loc5_;
         }
      }
      
      private static function _6n(param1:BitmapData, param2:String) : Boolean
      {
         var _loc3_:Object = null;
         if(param1 in _0v5)
         {
            _loc3_ = _0v5[param1];
            if(param2 in _loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      private static function getHash(param1:uint, param2:Number) : String
      {
         return int(param2 * 10).toString() + param1;
      }
      
      private static function _0bj() : Shape
      {
         var _loc1_:Shape = new Shape();
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(256,256,Math.PI / 2,0,0);
         _loc1_.graphics.beginGradientFill(GradientType.LINEAR,[0,_B_F_],[1,1],[127,255],_loc2_);
         _loc1_.graphics.drawRect(0,0,256,256);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
   }
}
