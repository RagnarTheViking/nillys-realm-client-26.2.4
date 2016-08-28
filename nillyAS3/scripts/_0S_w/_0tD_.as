package _0S_w
{
   import _1ar._R_F_;
   import _1ar._1V_3;
   import _1ar._0X_A_;
   import com.company.util.Keys;
   
   public class _0tD_ extends _R_F_
   {
      
      public static const _3L_:int = 0;
      
      public static const _0M_J_:int = 1;
      
      public static const _2k:int = 2;
      
      public static const _1E_x:int = 3;
      
      public static const _M_f:int = 4;
       
      
      public function _0tD_()
      {
         super();
         _176("(D)raw",Keys.D,this.select,_0M_J_);
         _176("(E)rase",Keys.E,this.select,_2k);
         _176("S(A)mple",Keys.A,this.select,_1E_x);
         _176("Ed(I)t",Keys.I,this.select,_M_f);
         _176("(U)ndo",Keys.U,this._0B_1,_3L_);
         _176("(R)edo",Keys.R,this._sx,_3L_);
         _176("(C)lear",Keys.C,this._10G_,_3L_);
         _1q6();
         _176("(L)oad",Keys.L,this._1X_m,_3L_);
         _176("(S)ave",Keys.S,this._F_S_,_3L_);
         _176("(T)est",Keys.T,this._1lU_,_3L_);
      }
      
      private function select(param1:_1V_3) : void
      {
         setSelected(param1);
      }
      
      private function _0B_1(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.UNDO_COMMAND_EVENT));
      }
      
      private function _sx(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.REDO_COMMAND_EVENT));
      }
      
      private function _10G_(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.CLEAR_COMMAND_EVENT));
      }
      
      private function _1X_m(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.LOAD_COMMAND_EVENT));
      }
      
      private function _F_S_(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.SAVE_COMMAND_EVENT));
      }
      
      private function _1lU_(param1:_1V_3) : void
      {
         dispatchEvent(new _0X_A_(_0X_A_.TEST_COMMAND_EVENT));
      }
   }
}
