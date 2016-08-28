package _1A_E_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _ek._18o;
   
   public class _1ns implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0p9:_1yd;
      
      public function _1ns()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_18o).asSingleton();
      }
   }
}
