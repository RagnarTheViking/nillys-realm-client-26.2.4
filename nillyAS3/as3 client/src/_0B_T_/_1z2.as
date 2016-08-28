package _0B_T_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _Z_U_._117;
   import _0pn._W_k;
   import _06._1P_b;
   import _06._1aR_;
   import _06.BeginnersPackageOfferDialog;
   import _06._1g6;
   import _06._8n;
   import _06._08n;
   import _0b6._I_A_;
   import _K_H_._022;
   import _0b6._r0;
   import _K_H_.BuyBeginnersPackageCommand;
   import _0b6._1u9;
   import _K_H_._1T_9;
   
   public class _1z2 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _1z2()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_117).asSingleton();
         this._T_X_.map(_W_k).asSingleton();
         this.mediatorMap.map(_1P_b).toMediator(_1aR_);
         this.mediatorMap.map(BeginnersPackageOfferDialog).toMediator(_1g6);
         this.mediatorMap.map(_8n).toMediator(_08n);
         this._1S_M_.map(_I_A_).toCommand(_022);
         this._1S_M_.map(_r0).toCommand(BuyBeginnersPackageCommand);
         this._1S_M_.map(_1u9).toCommand(_1T_9);
      }
   }
}
