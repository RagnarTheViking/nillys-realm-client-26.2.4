package com.company.assembleegameclient.game
{
   import flash.display.Sprite;
   import flash.ui.Mouse;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.ui.MouseCursor;
   import com.company.util.TextureLibrary;
   import com.company.util._n5;
   import flash.display.BitmapData;
   import flash.ui.MouseCursorData;
   import flash.geom.Point;
   
   public class Cursor extends Sprite
   {
       
      
      public function Cursor()
      {
         super();
      }
      
      public static function setMouseIcon(param1:Boolean = false) : void
      {
         if(!Mouse.supportsNativeCursor || !Parameters.data_.proCursor || param1)
         {
            Mouse.cursor = MouseCursor.ARROW;
            return;
         }
         var _loc2_:_n5 = TextureLibrary._0R_8("proCursor");
         var _loc3_:Vector.<BitmapData> = new Vector.<BitmapData>();
         _loc3_[0] = _loc2_._0D_y[0];
         var _loc4_:MouseCursorData = new MouseCursorData();
         _loc4_.data = _loc3_;
         _loc4_.hotSpot = new Point(16,16);
         Mouse.registerCursor("mcd",_loc4_);
         Mouse.cursor = "mcd";
      }
   }
}
