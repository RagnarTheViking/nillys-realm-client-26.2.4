package _0C_j
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.BitmapUtil;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import flash.geom.Rectangle;
   
   public class _1D_U_ extends Sprite
   {
      
      public static const _U_1:String = "redLootBag";
      
      public static const _1qM_:int = 0;
       
      
      public function _1D_U_()
      {
         super();
      }
      
      protected static function makeIcon() : DisplayObject
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:BitmapData = TextureLibrary.getBitmap(_U_1,_1qM_);
         _loc2_ = TextureRedrawer.redraw(_loc2_,40,true,0);
         _loc2_ = BitmapUtil._0P_V_(_loc2_,10,10,_loc2_.width - 20,_loc2_.height - 20);
         _loc1_ = new Bitmap(_loc2_);
         _loc1_.x = 3;
         _loc1_.y = 3;
         return _loc1_;
      }
      
      protected function positionText(param1:DisplayObject, param2:SimpleText) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Rectangle = param1.getBounds(this);
         _loc3_ = _loc4_.top + _loc4_.height / 2;
         param2.x = _loc4_.right;
         param2.y = _loc3_ - param2.height / 2;
      }
   }
}
