package _0M_u
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0db._1A_c;
   import _0db._68;
   import _0T_i._1lL_;
   import _0B_f._69;
   
   public class _oe implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _oe()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1A_c)._015(_68);
         this.context.configure(_1lL_);
         this.context.configure(_69);
      }
   }
}
