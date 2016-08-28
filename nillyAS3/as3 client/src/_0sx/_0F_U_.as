package _0sx
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import _0cW_._1rz;
   import _0cW_.Screen3DHelper;
   import flash.display3D.Context3DTextureFormat;
   import flash.geom.Point;
   
   public class _0F_U_
   {
      
      private static var textures:Dictionary = new Dictionary();
      
      private static var _1b3:Dictionary = new Dictionary();
      
      private static var count:int = 0;
       
      
      [Inject]
      public var context3D:Screen3DHelper;
      
      public function _0F_U_()
      {
         super();
      }
      
      public static function _0L_h(param1:BitmapData) : BitmapData
      {
         var _loc2_:BitmapData = null;
         if(param1 in _1b3)
         {
            return _1b3[param1];
         }
         _loc2_ = _Y_N_(param1,"y");
         _1b3[param1] = _loc2_;
         return _loc2_;
      }
      
      private static function _Y_N_(param1:BitmapData, param2:String = "x") : BitmapData
      {
         var _loc3_:Matrix = null;
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         if(param2 == "x")
         {
            _loc3_ = new Matrix(-1,0,0,1,param1.width,0);
         }
         else
         {
            _loc3_ = new Matrix(1,0,0,-1,0,param1.height);
         }
         _loc4_.draw(param1,_loc3_,null,null,null,true);
         return _loc4_;
      }
      
      private static function _82(param1:int) : Number
      {
         param1--;
         param1 = param1 | param1 >> 1;
         param1 = param1 | param1 >> 2;
         param1 = param1 | param1 >> 4;
         param1 = param1 | param1 >> 8;
         param1 = param1 | param1 >> 16;
         return ++param1;
      }
      
      public static function _1S_l() : void
      {
         var _loc1_:_1rz = null;
         var _loc2_:BitmapData = null;
         for each(_loc1_ in textures)
         {
            _loc1_.dispose();
         }
         textures = new Dictionary();
         for each(_loc2_ in _1b3)
         {
            _loc2_.dispose();
         }
         _1b3 = new Dictionary();
         count = 0;
      }
      
      public static function _0P_2() : void
      {
         var _loc1_:_1rz = null;
         for each(_loc1_ in textures)
         {
            _loc1_.dispose();
         }
         textures = new Dictionary();
      }
      
      public function make(param1:BitmapData) : _1rz
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_1rz = null;
         var _loc5_:BitmapData = null;
         if(param1 == null)
         {
            return null;
         }
         if(param1 in textures)
         {
            return textures[param1];
         }
         _loc2_ = _82(param1.width);
         _loc3_ = _82(param1.height);
         _loc4_ = this.context3D.createTexture(_loc2_,_loc3_,Context3DTextureFormat.BGRA,false);
         _loc5_ = new BitmapData(_loc2_,_loc3_,true,0);
         _loc5_.copyPixels(param1,param1.rect,new Point(0,0));
         _loc4_.uploadFromBitmapData(_loc5_);
         if(count > 1000)
         {
            _0P_2();
            count = 0;
         }
         textures[param1] = _loc4_;
         count++;
         return _loc4_;
      }
   }
}
