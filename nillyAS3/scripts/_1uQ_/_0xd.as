package _1uQ_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _S_U_._6c;
   import _S_U_._1o3;
   
   public class _0xd implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _0xd()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1yd).asSingleton();
         this._1S_M_.map(_6c).toCommand(_1o3);
      }
   }
}
