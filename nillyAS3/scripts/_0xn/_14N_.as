package _0xn
{
   import flash.utils.Dictionary;
   import _1F_z._1r__;
   
   public class _14N_
   {
      
      private static const _1Y_g:Dictionary = _F_L_();
      
      private static const _1P_d:Dictionary = _0U_f();
       
      
      public function _14N_()
      {
         super();
      }
      
      private static function _0U_f() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[_1r__._1uO_] = {
            "gold":100,
            "fame":0
         };
         _loc1_[_1r__._b0] = {
            "gold":240,
            "fame":0
         };
         _loc1_[_1r__._06T_] = {
            "gold":600,
            "fame":0
         };
         _loc1_[_1r__._1Z_n] = {
            "gold":1800,
            "fame":0
         };
         return _loc1_;
      }
      
      private static function _F_L_() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[_1r__._1uO_] = {
            "gold":5,
            "fame":0
         };
         _loc1_[_1r__._b0] = {
            "gold":12,
            "fame":0
         };
         _loc1_[_1r__._06T_] = {
            "gold":30,
            "fame":0
         };
         _loc1_[_1r__._1Z_n] = {
            "gold":60,
            "fame":0
         };
         _loc1_[_1r__._99] = {
            "gold":150,
            "fame":0
         };
         return _loc1_;
      }
      
      public static function _F_v(param1:_1r__) : int
      {
         return !!_1P_d[param1]?int(_1P_d[param1].gold):0;
      }
      
      public static function _0Q_c(param1:_1r__) : int
      {
         return !!_1P_d[param1]?int(_1P_d[param1].fame):0;
      }
      
      public static function _do_(param1:_1r__) : int
      {
         return _1Y_g[param1].gold;
      }
      
      public static function _0D_q(param1:_1r__) : int
      {
         return _1Y_g[param1].fame;
      }
   }
}
