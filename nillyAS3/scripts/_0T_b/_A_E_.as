package _0T_b
{
   import _P_S_.Mediator;
   import _4w._1B_z;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1T_4._34;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _0H_6.GameContext;
   import _C_._1O_I_;
   
   public class _A_E_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b._0cP_;
      
      [Inject]
      public var change:_1B_z;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _0F_n:_34;
      
      [Inject]
      public var account:Account;
      
      private var newPassword:String;
      
      public function _A_E_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.change.add(this._1C___);
         this._0F_n.add(this._B_H_);
      }
      
      override public function destroy() : void
      {
         this.view.change.remove(this._1C___);
         this._0F_n.remove(this._B_H_);
      }
      
      private function _1C___() : void
      {
         var _loc1_:IWebRequest = null;
         var _loc2_:Object = null;
         if(this._hf() && this._1kr() && this._0G_0())
         {
            this.view._0uq();
            this.view.disable();
            _loc1_ = GameContext.getInjector().getInstance(IWebRequest);
            _loc2_ = {};
            _loc2_.password = this.view.password_.text();
            this.newPassword = this.view._0J_I_.text();
            _loc2_.newPassword = this.view._0J_I_.text();
            _loc2_.guid = this.account.getUserId();
            _loc1_.sendRequest("/account/changePassword",_loc2_);
            _loc1_.complete.addOnce(this.onComplete);
         }
      }
      
      private function _hf() : Boolean
      {
         var _loc1_:* = this.view.password_.text().length >= 5;
         if(!_loc1_)
         {
            this.view.password_.setErrorText(_1O_I_._1qn);
         }
         return _loc1_;
      }
      
      private function _1kr() : Boolean
      {
         var _loc1_:* = this.view._0J_I_.text().length >= 10;
         if(!_loc1_)
         {
            this.view._0J_I_.setErrorText(_1O_I_._M_n);
         }
         return _loc1_;
      }
      
      private function _0G_0() : Boolean
      {
         var _loc1_:* = this.view._0J_I_.text() == this.view._T_r.text();
         if(!_loc1_)
         {
            this.view._T_r.setErrorText(_1O_I_._M_g);
         }
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(!param1)
         {
            this._B_H_(param2);
         }
         else
         {
            this.account._0cX_(this.account.getUserId(),this.newPassword);
            this.closeDialogs.dispatch();
         }
      }
      
      private function _B_H_(param1:String) : void
      {
         this.view._0J_I_.setErrorText(param1);
         this.view._0F_M_();
      }
   }
}
