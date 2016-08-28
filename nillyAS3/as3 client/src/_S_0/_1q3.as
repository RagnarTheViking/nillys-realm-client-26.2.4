package _S_0
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _2l.ClientSettings;
   import _156._W_y;
   import _130._R_5;
   import _130._149;
   import _130._01K_;
   
   public class _1q3 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var setup:ClientSettings;
      
      public function _1q3()
      {
         super();
      }
      
      public function configure() : void
      {
         this.mediatorMap.map(WebMain).toMediator(_W_y);
         this._1rJ_();
      }
      
      private function _1rJ_() : void
      {
         if(this.setup._Q_n())
         {
            this._1S_M_.map(_R_5).toCommand(_149);
         }
         else
         {
            this._1S_M_.map(_R_5).toCommand(_01K_);
         }
      }
   }
}
