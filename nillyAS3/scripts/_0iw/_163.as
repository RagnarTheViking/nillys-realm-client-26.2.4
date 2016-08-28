package _0iw
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _xr._0P_R_;
   import _xr._1kd;
   
   public class _163 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0p9:_1yd;
      
      public function _163()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0P_R_).asSingleton();
         this._T_X_.map(_1kd).asSingleton();
         this._0p9._1rF_(_1kd);
      }
   }
}
