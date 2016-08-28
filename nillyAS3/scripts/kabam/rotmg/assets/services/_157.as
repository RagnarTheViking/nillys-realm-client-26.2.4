package kabam.rotmg.assets.services
{
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import _0R_W_._0R_c;
   import com.company.util.BitmapUtil;
   import flash.display.Bitmap;
   
   public class _157
   {
       
      
      public function _157()
      {
         super();
      }
      
      public static function makeCoin() : BitmapData
      {
         var _loc1_:BitmapData = TextureRedrawer.resize(TextureLibrary.getBitmap("lofiObj3",225),null,40,true,0,0);
         return _B_V_(_loc1_);
      }
      
      public static function _0bt() : BitmapData
      {
         var _loc1_:BitmapData = TextureRedrawer.resize(TextureLibrary.getBitmap("lofiCharBig",32),null,20,true,0,0);
         return _B_V_(_loc1_);
      }
      
      public static function _0rl() : BitmapData
      {
         var _loc1_:BitmapData = TextureRedrawer.resize(TextureLibrary.getBitmap("lofiObj3",224),null,40,true,0,0);
         return _B_V_(_loc1_);
      }
      
      public static function _Y_2() : BitmapData
      {
         var _loc1_:BitmapData = TextureRedrawer.resize(TextureLibrary.getBitmap("lofiObj3",226),null,40,true,0,0);
         return _B_V_(_loc1_);
      }
      
      private static function _B_V_(param1:BitmapData) : BitmapData
      {
         param1 = _0R_c._1iY_(param1,4294967295);
         return BitmapUtil._0P_V_(param1,10,10,param1.width - 20,param1.height - 20);
      }
      
      public function _1Y_K_(param1:int) : Bitmap
      {
         var _loc2_:BitmapData = TextureLibrary.getBitmap("lofiInterfaceBig",param1);
         _loc2_ = TextureRedrawer.redraw(_loc2_,320 / _loc2_.width,true,0);
         return new Bitmap(_loc2_);
      }
   }
}
