package _0ne
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _1kz.ICommandCenter;
   import _F_0._0E_r;
   import _F_0._kL_;
   import _F_0._1O_0;
   import _F_0._kp;
   import _7h._1Y_D_;
   import _7h._1a8;
   
   public class _1L_F_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var commandCenter:ICommandCenter;
      
      public function _1L_F_()
      {
         super();
      }
      
      public function configure() : void
      {
         this.mediatorMap.map(_0E_r).toMediator(_kL_);
         this.mediatorMap.map(_1O_0).toMediator(_kp);
         this._T_X_.map(_1Y_D_).asSingleton();
         this._T_X_.map(_1a8).asSingleton();
      }
   }
}
