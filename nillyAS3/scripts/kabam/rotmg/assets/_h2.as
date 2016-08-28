package kabam.rotmg.assets
{
   import _1__8.IConfig;
   import _wi.Injector;
   import kabam.rotmg.assets.services._0pW_;
   import kabam.rotmg.assets.services._157;
   
   public class _h2 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _h2()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0pW_).asSingleton();
         this._T_X_.map(_157).asSingleton();
      }
   }
}
