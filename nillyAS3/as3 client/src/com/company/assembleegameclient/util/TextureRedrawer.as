package com.company.assembleegameclient.util
{
   import flash.filters.GlowFilter;
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   import _0R_W_._0R_c;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import com.company.util.PointUtil;
   import flash.geom.ColorTransform;
   import com.company.util.TextureLibrary;
   import flash.display.Shader;
   import flash.filters.ShaderFilter;
   import flash.filters.BitmapFilterQuality;
   
   public class TextureRedrawer
   {
      
      public static const _1bA_:int = 12;
      
      public static const _13K_:int = 2 * _1bA_;
      
      private static const BORDER:int = 4;
      
      public static const OUTLINE_FILTER:GlowFilter = new GlowFilter(0,0.8,1.4,1.4,255,BitmapFilterQuality.LOW,false,false);
      
      private static var cache_:Dictionary = new Dictionary();
      
      private static var _1oR_:Dictionary = new Dictionary();
      
      private static var _17s:Dictionary = new Dictionary();
      
      public static var _0rJ_:BitmapData = null;
      
      private static var textureShaderEmbed_:Class = TextureRedrawer_textureShaderEmbed_;
      
      private static var textureShaderData_:ByteArray = new textureShaderEmbed_() as ByteArray;
      
      private static var colorTexture1:BitmapData = new _1wr(1,1,false);
      
      private static var colorTexture2:BitmapData = new _1wr(1,1,false);
       
      
      public function TextureRedrawer()
      {
         super();
      }
      
      public static function redraw(param1:BitmapData, param2:int, param3:Boolean, param4:uint, param5:Boolean = true, param6:Number = 5) : BitmapData
      {
         var _loc7_:String = getHash(param2,param3,param4,param6);
         if(param5 && _6n(param1,_loc7_))
         {
            return _17s[param1][_loc7_];
         }
         var _loc8_:BitmapData = resize(param1,null,param2,param3,0,0,param6);
         _loc8_ = _0R_c._1iY_(_loc8_,param4,1.4,param5);
         if(param5)
         {
            _1xV_(param1,_loc7_,_loc8_);
         }
         return _loc8_;
      }
      
      private static function getHash(param1:int, param2:Boolean, param3:uint, param4:Number) : String
      {
         return param1.toString() + "," + param3.toString() + "," + param2 + "," + param4;
      }
      
      private static function _1xV_(param1:BitmapData, param2:String, param3:BitmapData) : void
      {
         if(!(param1 in _17s))
         {
            _17s[param1] = {};
         }
         _17s[param1][param2] = param3;
      }
      
      private static function _6n(param1:BitmapData, param2:String) : Boolean
      {
         if(param1 in _17s)
         {
            if(param2 in _17s[param1])
            {
               return true;
            }
         }
         return false;
      }
      
      public static function resize(param1:BitmapData, param2:BitmapData, param3:int, param4:Boolean, param5:int, param6:int, param7:Number = 5) : BitmapData
      {
         if(param2 != null && (param5 != 0 || param6 != 0))
         {
            param1 = retexture(param1,param2,param5,param6);
            param3 = param3 / 5;
         }
         var _loc8_:int = param7 * (param3 / 100) * param1.width;
         var _loc9_:int = param7 * (param3 / 100) * param1.height;
         var _loc10_:Matrix = new Matrix();
         _loc10_.scale(_loc8_ / param1.width,_loc9_ / param1.height);
         _loc10_.translate(_1bA_,_1bA_);
         var _loc11_:BitmapData = new _1wr(_loc8_ + _13K_,_loc9_ + (!!param4?_1bA_:1) + _1bA_,true,0);
         _loc11_.draw(param1,_loc10_);
         return _loc11_;
      }
      
      public static function redrawSolidSquare(param1:uint, param2:int) : BitmapData
      {
         var _loc3_:Dictionary = cache_[param2];
         if(_loc3_ == null)
         {
            _loc3_ = new Dictionary();
            cache_[param2] = _loc3_;
         }
         var _loc4_:BitmapData = _loc3_[param1];
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         _loc4_ = new _1wr(param2 + 4 + 4,param2 + 4 + 4,true,0);
         _loc4_.fillRect(new Rectangle(4,4,param2,param2),4278190080 | param1);
         _loc4_.applyFilter(_loc4_,_loc4_.rect,PointUtil._17Q_,OUTLINE_FILTER);
         _loc3_[param1] = _loc4_;
         return _loc4_;
      }
      
      public static function clearCache() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:Dictionary = null;
         var _loc3_:Dictionary = null;
         for each(_loc2_ in cache_)
         {
            for each(_loc1_ in _loc2_)
            {
               _loc1_.dispose();
            }
         }
         cache_ = new Dictionary();
         for each(_loc3_ in _1oR_)
         {
            for each(_loc1_ in _loc3_)
            {
               _loc1_.dispose();
            }
         }
         _1oR_ = new Dictionary();
      }
      
      public static function _dl(param1:BitmapData, param2:Number) : BitmapData
      {
         if(param2 == 1)
         {
            return param1;
         }
         var _loc3_:Dictionary = _1oR_[param2];
         if(_loc3_ == null)
         {
            _loc3_ = new Dictionary();
            _1oR_[param2] = _loc3_;
         }
         var _loc4_:BitmapData = _loc3_[param1];
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         _loc4_ = param1.clone();
         _loc4_.colorTransform(_loc4_.rect,new ColorTransform(param2,param2,param2));
         _loc3_[param1] = _loc4_;
         return _loc4_;
      }
      
      private static function getTexture(param1:int, param2:BitmapData) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:* = param1 >> 24 & 255;
         var _loc5_:* = param1 & 16777215;
         switch(_loc4_)
         {
            case 0:
               _loc3_ = param2;
               break;
            case 1:
               param2.setPixel(0,0,_loc5_);
               _loc3_ = param2;
               break;
            case 4:
               _loc3_ = TextureLibrary.getBitmap("textile4x4",_loc5_);
               break;
            case 5:
               _loc3_ = TextureLibrary.getBitmap("textile5x5",_loc5_);
               break;
            case 9:
               _loc3_ = TextureLibrary.getBitmap("textile9x9",_loc5_);
               break;
            case 10:
               _loc3_ = TextureLibrary.getBitmap("textile10x10",_loc5_);
               break;
            case 255:
               _loc3_ = _0rJ_;
               break;
            default:
               _loc3_ = param2;
         }
         return _loc3_;
      }
      
      private static function retexture(param1:BitmapData, param2:BitmapData, param3:int, param4:int) : BitmapData
      {
         var _loc5_:Matrix = new Matrix();
         _loc5_.scale(5,5);
         var _loc6_:BitmapData = new _1wr(param1.width * 5,param1.height * 5,true,0);
         _loc6_.draw(param1,_loc5_);
         var _loc7_:BitmapData = getTexture(param3,colorTexture1);
         var _loc8_:BitmapData = getTexture(param4,colorTexture2);
         var _loc9_:Shader = new Shader(textureShaderData_);
         _loc9_.data.src.input = _loc6_;
         _loc9_.data.mask.input = param2;
         _loc9_.data.texture1.input = _loc7_;
         _loc9_.data.texture2.input = _loc8_;
         _loc9_.data.texture1Size.value = [param3 == 0?0:_loc7_.width];
         _loc9_.data.texture2Size.value = [param4 == 0?0:_loc8_.width];
         _loc6_.applyFilter(_loc6_,_loc6_.rect,PointUtil._17Q_,new ShaderFilter(_loc9_));
         return _loc6_;
      }
      
      private static function getDrawMatrix() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.scale(8,8);
         _loc1_.translate(BORDER,BORDER);
         return _loc1_;
      }
   }
}
