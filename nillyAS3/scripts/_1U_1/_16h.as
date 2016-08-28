package _1U_1
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0oY_._1O_a;
   import _zx._L_s;
   import _zx._j1;
   import _7i._0P_E_;
   import _0A_B_._0V_A_;
   
   public class _16h implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _16h()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1O_a).asSingleton();
         this._T_X_.map(_L_s)._015(_j1);
         this._1S_M_.map(_0P_E_).toCommand(_0V_A_);
      }
   }
}
