package com.company.assembleegameclient.util
{
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import com.company.rotmg.graphics.StarGraphic;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   
   public class Star
   {
      
      public static const ClassFameLevels:Vector.<int> = new <int>[20,150,400,800,2000];
      
      private static const LightBlue:ColorTransform = new ColorTransform(138 / 255,152 / 255,222 / 255);
      
      private static const DarkBlue:ColorTransform = new ColorTransform(49 / 255,77 / 255,219 / 255);
      
      private static const Red:ColorTransform = new ColorTransform(193 / 255,39 / 255,45 / 255);
      
      private static const Orange:ColorTransform = new ColorTransform(247 / 255,147 / 255,30 / 255);
      
      private static const Yellow:ColorTransform = new ColorTransform(255 / 255,255 / 255,0 / 255);
      
      private static const Green:ColorTransform = new ColorTransform(0,1,0);
      
      public static const Colors:Vector.<ColorTransform> = new <ColorTransform>[LightBlue,DarkBlue,Red,Orange,Yellow];
       
      
      public function Star()
      {
         super();
      }
      
      public static function _0xr() : int
      {
         return ObjectLibrary._1bS_.length * ClassFameLevels.length;
      }
      
      public static function numStars(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < ClassFameLevels.length && param1 >= ClassFameLevels[_loc2_])
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public static function nextStarFame(param1:int, param2:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = Math.max(param1,param2);
         while(_loc4_ < ClassFameLevels.length)
         {
            if(ClassFameLevels[_loc4_] > _loc3_)
            {
               return ClassFameLevels[_loc4_];
            }
            _loc4_++;
         }
         return -1;
      }
      
      public static function getLargeRankIcon(param1:int, param2:Boolean = false) : Sprite
      {
         var _loc3_:Sprite = getRankIcon(param1,param2);
         _loc3_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         _loc3_.scaleX = 1.4;
         _loc3_.scaleY = 1.4;
         return _loc3_;
      }
      
      public static function getRankIcon(param1:int, param2:Boolean = false) : Sprite
      {
         var _loc3_:Sprite = new StarGraphic();
         if(param2)
         {
            _loc3_.transform.colorTransform = Green;
            return _loc3_;
         }
         if(param1 < ObjectLibrary._1bS_.length)
         {
            _loc3_.transform.colorTransform = LightBlue;
         }
         else if(param1 < ObjectLibrary._1bS_.length * 2)
         {
            _loc3_.transform.colorTransform = DarkBlue;
         }
         else if(param1 < ObjectLibrary._1bS_.length * 3)
         {
            _loc3_.transform.colorTransform = Red;
         }
         else if(param1 < ObjectLibrary._1bS_.length * 4)
         {
            _loc3_.transform.colorTransform = Orange;
         }
         else if(param1 < ObjectLibrary._1bS_.length * 5)
         {
            _loc3_.transform.colorTransform = Yellow;
         }
         return _loc3_;
      }
      
      public static function getPlayerRankIcon(param1:int, param2:Boolean) : Sprite
      {
         var _loc3_:Sprite = null;
         var _loc4_:Sprite = null;
         _loc3_ = getRankIcon(param1,param2);
         _loc4_ = new Sprite();
         _loc4_.graphics.beginFill(0,0.4);
         var _loc5_:int = _loc3_.width / 2 + 2;
         var _loc6_:int = _loc3_.height / 2 + 2;
         _loc4_.graphics.drawCircle(_loc5_,_loc6_,_loc5_);
         _loc3_.x = 2;
         _loc3_.y = 1;
         _loc4_.addChild(_loc3_);
         _loc4_.filters = [new DropShadowFilter(0,0,0,0.5,6,6,1)];
         return _loc4_;
      }
      
      public static function _0a__() : BitmapData
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiObj3",224);
         return TextureRedrawer.redraw(_loc1_,40,true,0);
      }
   }
}
