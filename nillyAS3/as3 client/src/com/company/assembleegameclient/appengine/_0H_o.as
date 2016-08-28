package com.company.assembleegameclient.appengine
{
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class _0H_o
   {
      
      private static const FAME:String = "fame";
       
      
      private var _1q7:String;
      
      public var _00M_:String;
      
      public var _mp:String;
      
      public var _nT_:String;
      
      public var _66:int;
      
      public function _0H_o(param1:String, param2:String, param3:String, param4:String, param5:int)
      {
         super();
         this._1q7 = param1;
         this._00M_ = param2;
         this._mp = param3;
         this._nT_ = param4;
         this._66 = param5;
      }
      
      private static function _1jf() : BitmapData
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiInterface2",4);
         return TextureRedrawer.redraw(_loc1_,80,true,0);
      }
      
      private static function _cd() : BitmapData
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiObj3",224);
         return TextureRedrawer.redraw(_loc1_,80,true,0);
      }
      
      public function getIcon() : BitmapData
      {
         return this._1q7 == FAME?_cd():_1jf();
      }
      
      public function _0xH_() : Boolean
      {
         return this._1q7 == FAME;
      }
   }
}
