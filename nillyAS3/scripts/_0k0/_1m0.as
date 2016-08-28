package _0k0
{
   import _0eG_._R_n;
   import _0eG_.Description;
   import _0eG_._xn;
   
   public class _1m0 extends _R_n
   {
       
      
      private var _M_D_:Array;
      
      public function _1m0(param1:Array)
      {
         super();
         this._M_D_ = param1 || [];
      }
      
      override protected function matchesOrDescribesMismatch(param1:Object, param2:Description) : Boolean
      {
         var _loc3_:_xn = null;
         for each(_loc3_ in this._M_D_)
         {
            if(!_loc3_.matches(param1))
            {
               param2._1C_f(_loc3_).appendText(" ")._0F_R_(_loc3_,param1);
               return false;
            }
         }
         return true;
      }
      
      override public function describeTo(param1:Description) : void
      {
         param1._10g("("," and ",")",this._M_D_);
      }
   }
}
