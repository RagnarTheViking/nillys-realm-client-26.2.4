package Settings
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _12g._mJ_;
   
   public class _0O_K_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _0O_K_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_mJ_).asSingleton();
      }
   }
}
