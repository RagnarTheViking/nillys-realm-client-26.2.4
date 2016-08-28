package _26
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _0sm._0H_i;
   import _0sb._1it;
   import _3b._jq;
   import _3b.DialogSignal;
   import _3b.DialogSignalNoDim;
   import _3b.CloseDialogsSignal;
   import _3b._15j;
   import _3b._1aM_;
   import _1xh._1T_5;
   import _1xh._1fn;
   
   public class _xW_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var register:_0H_i;
      
      public function _xW_()
      {
         super();
      }
      
      public function configure() : void
      {
         var _loc1_:_1it = null;
         this._T_X_.map(_jq).asSingleton();
         this._T_X_.map(DialogSignal).asSingleton();
         this._T_X_.map(DialogSignalNoDim).asSingleton();
         this._T_X_.map(CloseDialogsSignal).asSingleton();
         this._T_X_.map(_15j).asSingleton();
         this._T_X_.map(_1aM_).asSingleton();
         this.mediatorMap.map(_1T_5).toMediator(_1fn);
         _loc1_ = new _1it();
         _loc1_.name = "closeDialogs";
         _loc1_.description = "closes all open dialogs";
         this.register.dispatch(_loc1_,this._T_X_.getInstance(CloseDialogsSignal));
      }
   }
}
