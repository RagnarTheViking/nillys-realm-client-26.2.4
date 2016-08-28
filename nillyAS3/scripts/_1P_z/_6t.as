package _1P_z
{
   import _14k._1E_K_;
   
   public final class _6t
   {
      
      public static const _1us:String = "localhost";
      
      public static const _1hd:String = "private";
      
      public static const _0M_U_:String = "dev";
      
      public static const _04W_:String = "testing";
      
      public static const TESTING2:String = "testing2";
      
      public static const _0hO_:String = "prodtest";
      
      public static const _099:String = "production";
      
      private static const _09o:RegExp = /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/;
       
      
      public function _6t()
      {
         super();
      }
      
      public function _1hs(param1:String) : _1E_K_
      {
         return !!this._R_Y_(param1)?_1E_K_._1ml:this._1B_h(param1);
      }
      
      private function _R_Y_(param1:String) : Boolean
      {
         return param1.match(_09o) != null;
      }
      
      private function _1B_h(param1:String) : _1E_K_
      {
         switch(param1)
         {
            case _1us:
               return _1E_K_._1us;
            case _1hd:
               return _1E_K_._1hd;
            case _0M_U_:
               return _1E_K_._0M_U_;
            case _04W_:
               return _1E_K_._04W_;
            case TESTING2:
               return _1E_K_.TESTING2;
            case _0hO_:
               return _1E_K_._0hO_;
            case _099:
               return _1E_K_._099;
            default:
               return null;
         }
      }
   }
}
