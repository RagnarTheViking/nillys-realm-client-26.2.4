package _1K_C_
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _M_6._0qT_;
   import _M_6._1hV_;
   import _0nP_._G_N_;
   import _0nP_._H_w;
   import _0nP_._1C_a;
   import _0nP_._0S_D_;
   import _0nP_._1ws;
   
   public class _1H_e implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0F_m:_1yd;
      
      public function _1H_e()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0qT_);
         this._T_X_.map(_1hV_).asSingleton();
         this._T_X_.map(_G_N_).asSingleton();
         this._1S_M_.map(_H_w).toCommand(_1C_a);
         this._1S_M_.map(_0S_D_).toCommand(_1ws);
         this._0F_m._T_y(_0S_D_);
      }
   }
}
