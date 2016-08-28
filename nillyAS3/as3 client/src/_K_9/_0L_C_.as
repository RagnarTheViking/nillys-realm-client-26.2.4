package _K_9
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _jQ_._0S_E_;
   import flash.net.Socket;
   import _0wP_._ou;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   
   public class _0L_C_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      private var _A_b:_0S_E_;
      
      public function _0L_C_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._A_b = new _0S_E_().setInjector(this._T_X_);
         this._T_X_.map(Socket);
         this._T_X_.map(_ou)._1as(this._A_b);
         this._T_X_.map(MessageProvider)._1as(this._A_b);
         this._T_X_.map(SocketServer).asSingleton();
      }
   }
}
