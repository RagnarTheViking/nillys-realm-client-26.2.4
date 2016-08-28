package _1C_p
{
   public class _1E_X_
   {
      
      public static const _1D_R_:_1C_p._1E_X_ = new _1C_p._1E_X_(1);
      
      public static const _ea:_1C_p._1E_X_ = new _1C_p._1E_X_(2);
      
      public static const _d8:_1C_p._1E_X_ = new _1C_p._1E_X_(3);
      
      private static const _0Q_r:Object = {
         "1":_1D_R_,
         "2":_ea,
         "3":_d8
      };
       
      
      private var index:int;
      
      public function _1E_X_(param1:int)
      {
         super();
         this.index = param1;
      }
      
      public static function parse(param1:int) : _1C_p._1E_X_
      {
         return _0Q_r[param1];
      }
      
      public function _0qK_() : int
      {
         return this.index;
      }
   }
}
