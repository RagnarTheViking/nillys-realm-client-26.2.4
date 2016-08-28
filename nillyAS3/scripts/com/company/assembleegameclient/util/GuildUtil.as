package com.company.assembleegameclient.util
{
   import _C_._1O_I_;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   
   public class GuildUtil
   {
      
      public static const _1se:int = 0;
      
      public static const _A_0:int = 10;
      
      public static const _0k3:int = 20;
      
      public static const _0iC_:int = 30;
      
      public static const _0__u:int = 40;
      
      public static const _0sP_:int = 50;
       
      
      public function GuildUtil()
      {
         super();
      }
      
      public static function _oB_(param1:int) : String
      {
         switch(param1)
         {
            case _1se:
               return _0dH_(_1O_I_._0Z_j);
            case _A_0:
               return _0dH_(_1O_I_._T_x);
            case _0k3:
               return _0dH_(_1O_I_._K_T_);
            case _0iC_:
               return _0dH_(_1O_I_._0uD_);
            case _0__u:
               return _0dH_(_1O_I_._0a9);
            default:
               return _0dH_(_1O_I_._0yx);
         }
      }
      
      private static function _0dH_(param1:String) : String
      {
         return "{" + param1 + "}";
      }
      
      public static function getRosterSize(param1:String) : int
      {
         switch(param1)
         {
            case "Guild Hall 1":
               return 50;
            case "Guild Hall 2":
               return 60;
            case "Guild Hall 3":
               return 75;
            default:
               return 50;
         }
      }
      
      public static function _0mx(param1:int, param2:int) : BitmapData
      {
         var _loc3_:BitmapData = null;
         switch(param1)
         {
            case _1se:
               _loc3_ = TextureLibrary.getBitmap("lofiInterfaceBig",20);
               break;
            case _A_0:
               _loc3_ = TextureLibrary.getBitmap("lofiInterfaceBig",19);
               break;
            case _0k3:
               _loc3_ = TextureLibrary.getBitmap("lofiInterfaceBig",18);
               break;
            case _0iC_:
               _loc3_ = TextureLibrary.getBitmap("lofiInterfaceBig",17);
               break;
            case _0__u:
               _loc3_ = TextureLibrary.getBitmap("lofiInterfaceBig",16);
         }
         return TextureRedrawer.redraw(_loc3_,param2,true,0,true);
      }
      
      public static function _0ge(param1:int) : BitmapData
      {
         var _loc2_:BitmapData = TextureLibrary.getBitmap("lofiObj3",226);
         return TextureRedrawer.redraw(_loc2_,param1,true,0,true);
      }
      
      public static function _X_c(param1:int, param2:int, param3:int) : Boolean
      {
         if(param2 == param3)
         {
            return false;
         }
         if(param1 == _0__u && param2 < _0__u && param3 < _0__u)
         {
            return true;
         }
         if(param1 == _0iC_ && param2 < _0iC_ && param3 <= _0iC_)
         {
            return true;
         }
         if(param1 == _0k3 && param2 < _0k3 && param3 < _0k3)
         {
            return true;
         }
         return false;
      }
      
      public static function _1L_Q_(param1:int) : int
      {
         switch(param1)
         {
            case _1se:
               return _A_0;
            case _A_0:
               return _0k3;
            case _0k3:
               return _0iC_;
            default:
               return _0__u;
         }
      }
      
      public static function _O_0(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = _1L_Q_(param2);
         return _X_c(param1,param2,_loc3_);
      }
      
      public static function _1ff(param1:int) : int
      {
         switch(param1)
         {
            case _0k3:
               return _A_0;
            case _0iC_:
               return _0k3;
            case _0__u:
               return _0iC_;
            default:
               return _1se;
         }
      }
      
      public static function _0V_B_(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = _1ff(param2);
         return _X_c(param1,param2,_loc3_);
      }
      
      public static function _14__(param1:int, param2:int) : Boolean
      {
         return param1 >= _0k3 && param2 < param1;
      }
   }
}
