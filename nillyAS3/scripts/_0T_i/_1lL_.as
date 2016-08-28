package _0T_i
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _00X_._0b9;
   import _1dI_.ConfirmDeleteCharacterDialog;
   import _1dI_._0km;
   import _1__0._1zx;
   import _1__0._1R_G_;
   
   public class _1lL_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _1lL_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0b9);
         this.mediatorMap.map(ConfirmDeleteCharacterDialog).toMediator(_0km);
         this._1S_M_.map(_1zx).toCommand(_1R_G_);
      }
   }
}
