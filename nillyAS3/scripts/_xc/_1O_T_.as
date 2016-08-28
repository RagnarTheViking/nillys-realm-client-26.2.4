package _xc
{
   import _1V_8._1nD_;
   import _4u.Account;
   import _1V_8._jw;
   import _3b.DialogSignal;
   import _1__8._19A_;
   import _14k._1dB_;
   import _2l.ClientSettings;
   import _v4.Client;
   import _1O_R_.ErrorDialog;
   import flash.net.URLVariables;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.navigateToURL;
   import flash.external.ExternalInterface;
   import _14k._1E_K_;
   
   public class _1O_T_
   {
       
      
      private const _0bL_:String = "You cannot purchase gold on the testing server";
      
      private const _cR_:String = "You must be registered to buy gold";
      
      [Inject]
      public var _0nw:_1nD_;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1P_5:_jw;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var _pq:_1dB_;
      
      [Inject]
      public var _0K_A_:DialogSignal;
      
      [Inject]
      public var _0rv:ClientSettings;
      
      [Inject]
      public var _0U_H_:Client;
      
      public function _1O_T_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this._19m() && this.account.registered())
         {
            this._H_D_();
         }
         else
         {
            this._1M_N_();
         }
      }
      
      private function _1M_N_() : void
      {
         if(!this._19m())
         {
            this._0K_A_.dispatch(new ErrorDialog(this._0bL_));
         }
         else if(!this.account.registered())
         {
            this._0K_A_.dispatch(new ErrorDialog(this._cR_));
         }
      }
      
      private function _H_D_() : void
      {
         try
         {
            this._qF_();
            return;
         }
         catch(e:Error)
         {
            _31();
            return;
         }
      }
      
      private function _31() : void
      {
         var _loc1_:String = this._0rv.HttpServerAddress(true);
         var _loc2_:URLVariables = new URLVariables();
         var _loc3_:URLRequest = new URLRequest();
         _loc2_.naid = this.account._1e0();
         _loc2_.signedRequest = this.account._091();
         _loc3_.url = _loc1_ + "/credits/kabamadd";
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc2_;
         navigateToURL(_loc3_,"_blank");
         this._0G_2.debug("Opening window from standalone player");
      }
      
      private function _qF_() : void
      {
         this._0U_n();
         this._0G_2.debug("Attempting External Payments");
         ExternalInterface.call("rotmg.KabamPayment.displayPaymentWall");
      }
      
      private function _0U_n() : void
      {
         if(!this._0nw._fk)
         {
            ExternalInterface.call(this._1P_5._1A_x(),this.account._1e0(),this.account._091());
            this._0nw._fk = true;
         }
      }
      
      private function _19m() : Boolean
      {
         return this._pq._1hs() != _1E_K_._04W_ || this._0U_H_.isAdmin();
      }
   }
}
