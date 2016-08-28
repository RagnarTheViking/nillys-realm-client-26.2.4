package _0Q_t
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _14k._1dB_;
   import _V_y.ISignalCommandMap;
   import _14k._1E_K_;
   import _0hJ_._Z___;
   import _sm._R_W_;
   import _sm._1hb;
   import _sm._U_H_;
   import _m2._W_O_;
   import _1L___._finally;
   
   public class _1X_6 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var data:_1dB_;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _1X_6()
      {
         super();
      }
      
      public function configure() : void
      {
         var _loc1_:_1E_K_ = this.data._1hs();
         switch(_loc1_)
         {
            case _1E_K_._1ml:
               this._1__d();
               return;
            case _1E_K_._1us:
            case _1E_K_._1hd:
               this._0X_M_();
               return;
            default:
               this._0lx();
               return;
         }
      }
      
      private function _0X_M_() : void
      {
         this._T_X_.map(_Z___)._015(_R_W_);
      }
      
      private function _1__d() : void
      {
         this._T_X_.map(_Z___)._1as(this._0G_1());
      }
      
      private function _0G_1() : _1hb
      {
         return new _1hb().setIP(this.data._1P_Z_());
      }
      
      private function _0lx() : void
      {
         this._T_X_.map(_Z___)._015(_U_H_);
         this._1S_M_.map(_W_O_).toCommand(_finally);
      }
   }
}
