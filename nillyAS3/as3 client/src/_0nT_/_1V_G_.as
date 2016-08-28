package _0nT_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _04m._1__O_;
   import _04m._kN_;
   import _0C_u._tx;
   import _0hx._Q_p;
   import _0hx._ms;
   import _0C_u._tD_;
   import _0C_u._1fx;
   import _0C_u._0a0;
   import _0C_u._0L_t;
   
   public class _1V_G_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _1V_G_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1__O_).asSingleton();
         this._T_X_.map(_kN_).asSingleton();
         this._T_X_.map(_tx).asSingleton();
         this.mediatorMap.map(_Q_p).toMediator(_ms);
         this._1S_M_.map(_tD_).toCommand(_1fx);
         this._1S_M_.map(_0a0).toCommand(_0L_t);
      }
   }
}
