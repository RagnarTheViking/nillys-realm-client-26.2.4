package _05g
{
   import _W_Q_.TextButton;
   import _0qE_._1vk;
   import _C_._1O_I_;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   
   public class _0D_3
   {
      
      public static const _V_I_:uint = 36;
      
      public static const _02v:uint = 22;
      
      private static const LEFT:String = TextFieldAutoSize.LEFT;
      
      private static const CENTER:String = TextFieldAutoSize.CENTER;
      
      private static const RIGHT:String = TextFieldAutoSize.RIGHT;
      
      private static var _1F_x:TextButton;
      
      private static var _oM_:TextButton;
      
      private static var _0S_a:TextButton;
      
      private static var _0jx:TextButton;
      
      private static var _1pV_:TextButton;
      
      private static var _1A_d:TextButton;
      
      private static var _qd:TextButton;
      
      private static var _13C_:TextButton;
      
      private static var _1oq:TextButton;
      
      private static var _112:TextButton;
      
      private static var _T_q:TextButton;
       
      
      public function _0D_3()
      {
         super();
      }
      
      public static function _1__U_() : TextButton
      {
         return _1F_x = _1F_x || _1lo(_1vk._0eS_,_V_I_,CENTER,true);
      }
      
      public static function _jm() : TextButton
      {
         return _T_q = _T_q || _1lo(_1O_I_._S_Z_,_02v,LEFT);
      }
      
      public static function _0R_N_() : TextButton
      {
         return _112 = _112 || _1lo(_1O_I_._J_G_,_02v,RIGHT);
      }
      
      public static function _7Q_() : TextButton
      {
         return _1oq = _1oq || _1lo(_1O_I_._1W_T_,_V_I_,CENTER);
      }
      
      public static function _1N_Y_() : TextButton
      {
         return _0S_a = _0S_a || _1lo(_1vk._1T_c,_02v,LEFT);
      }
      
      public static function _04O_() : TextButton
      {
         return _0jx = _0jx || _1lo(_1vk._1vQ_,_02v,LEFT);
      }
      
      public static function _1B_I_() : TextButton
      {
         return _oM_ = _oM_ || _1lo(_1vk._ch,_02v,RIGHT);
      }
      
      public static function _0u7() : TextButton
      {
         return _1pV_ = _1pV_ || _1lo(_1vk._hW_,_02v,RIGHT);
      }
      
      public static function _0__D_() : TextButton
      {
         return _1A_d = _1A_d || _1lo("forums",_02v,RIGHT);
      }
      
      public static function _0hK_() : TextButton
      {
         return _qd = _qd || _1lo(_1vk._D_L_,_02v,RIGHT);
      }
      
      public static function _0R_1() : TextButton
      {
         return _13C_ = _13C_ || _1lo(_1vk._1L_R_,_02v,LEFT);
      }
      
      private static function _1lo(param1:String, param2:int, param3:String, param4:Boolean = false) : TextButton
      {
         var _loc5_:TextButton = new TextButton(param1,param2,param4);
         _loc5_.setAutoSize(param3);
         _loc5_.setVerticalAlign(SimpleText.MIDDLE);
         return _loc5_;
      }
   }
}
