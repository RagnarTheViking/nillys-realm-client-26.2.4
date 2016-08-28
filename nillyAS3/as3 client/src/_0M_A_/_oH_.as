package _0M_A_
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _0Q_j._mG_;
   import _0Q_j._1v8;
   import _0Q_j._Q_O_;
   import _0Q_j._0R_C_;
   import _E_X_._0I_Y_;
   import _E_X_._du;
   
   public class _oH_ implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _oH_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_mG_).asSingleton();
         this._T_X_.map(_1v8).asSingleton();
         this._T_X_.map(_Q_O_).asSingleton();
         this._T_X_.map(_0R_C_).asSingleton();
         this.mediatorMap.map(_0I_Y_).toMediator(_du);
      }
   }
}
