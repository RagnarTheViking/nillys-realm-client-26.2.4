package _4Y_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0f.IMediatorMap;
   import _0Z_d._ee;
   import _0Z_d._1sk;
   import _0Z_d._0D_M_;
   import _0Z_d._0wS_;
   import _0W_0._T_e;
   import _0mJ_._0A_P_;
   import _0mJ_._ue;
   
   public class _0L_w implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _0L_w()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_ee).asSingleton();
         this._T_X_.map(_1sk).asSingleton();
         this._T_X_.map(_0D_M_).asSingleton();
         this._1S_M_.map(_0wS_).toCommand(_T_e);
         this.mediatorMap.map(_0A_P_).toMediator(_ue);
      }
   }
}
