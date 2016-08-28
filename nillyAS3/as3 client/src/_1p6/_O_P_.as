package _1p6
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _0Q_Q_._v__;
   import _6w._0x0;
   import _06s._F_d;
   import _06s._O_V_;
   import _ia.FameView;
   import _ia._0__J_;
   
   public class _O_P_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _O_P_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_v__).asSingleton();
         this._T_X_.map(_0x0);
         this._1S_M_.map(_F_d).toCommand(_O_V_);
         this.mediatorMap.map(FameView).toMediator(_0__J_);
      }
   }
}
