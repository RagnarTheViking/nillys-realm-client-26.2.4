package _nH_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _1P_z._6t;
   import _14k._1dB_;
   import _1P_z._0J_E_;
   
   public class _10R_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _10R_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_6t).asSingleton();
         this._T_X_.map(_1dB_)._015(_0J_E_);
      }
   }
}
