package com.company.assembleegameclient.objects
{
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class _1D_v
   {
       
      
      public function _1D_v()
      {
         super();
      }
      
      public function _0H_9(param1:String, param2:int) : BitmapData
      {
         return TextureLibrary.getBitmap(param1,param2);
      }
      
      public function getTexture(param1:int, param2:int) : BitmapData
      {
         var _loc3_:Number = NaN;
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = ObjectLibrary.getBitmapData(param1);
         if(_loc5_)
         {
            _loc3_ = (param2 - TextureRedrawer._13K_) / _loc5_.width;
            _loc4_ = ObjectLibrary.getRedrawnTextureFromType(param1,100,true,false,_loc3_);
            return _loc4_;
         }
         return new _1wr(param2,param2);
      }
   }
}
