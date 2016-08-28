package _05g
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _v4.Client;
   import _1T_4._0es;
   import _1T_4._1U_z;
   import _K_r._09p;
   import _m2._0S_X_;
   import _3b.DialogSignal;
   import _2l.ClientSettings;
   import _0E_n._jE_;
   import _1__8._19A_;
   import _3b.CloseDialogsSignal;
   import _P_N_.FancyDialog;
   import _1O_R_.Dialog;
   import flash.events.Event;
   import flash.net.URLVariables;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import _0h3._4i;
   import _S_b.ClientDetails;
   import flash.system.Capabilities;
   import _W_Q_._S_2;
   import _0hx._Q_p;
   import _0S_w._rn;
   
   public class TitleViewMediator extends Mediator
   {
      
      private static var _A_r:Boolean = false;
       
      
      [Inject]
      public var view:_05g.TitleView;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:Client;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _mM_:_09p;
      
      [Inject]
      public var _F_m:_0S_X_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function TitleViewMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var dialog:FancyDialog = null;
         this.view._T_7.add(this._0lW_);
         this.view.initialize(this.getClientDetails());
         this.view._T_A_.add(this._xY_);
         this.view._Z_b.add(this._1nn);
         this.view._cy.add(this._08o);
         this.view._1or.add(this._03j);
         this.view._1I_I_.add(this._O_H_);
         if(this.client.isBanned())
         {
            dialog = new FancyDialog("Banned","This account has been banned for the following reasons:\n\n<font color=\'#ff0000\'>" + this.client.getBanReasons() + "</font>\n\nDate when the ban will be lifted:\n" + this.client.getBanLiftTime(),"Ok",null,"/banned");
            dialog.addEventListener(Dialog.LEFT_BUTTON,function(param1:Event):void
            {
               closeDialogs.dispatch();
            });
            this._06Z_.dispatch(dialog);
         }
      }
      
      private function _O_H_() : void
      {
         var _loc3_:Boolean = false;
         var _loc1_:URLVariables = new URLVariables();
         var _loc2_:URLRequest = new URLRequest();
         _loc2_.url = "http://nillysrealm.com/";
         navigateToURL(_loc2_,"_blank");
      }
      
      private function _0lW_() : void
      {
         this.view._0H_U_ && this.view._0H_U_.add(this._07J_);
         this.view._xN_ && this.view._xN_.add(this._true_);
      }
      
      private function _19z() : void
      {
         this._kU_.dispatch(new _4i());
      }
      
      private function getClientDetails() : ClientDetails
      {
         var _loc1_:ClientDetails = new ClientDetails();
         _loc1_.isDesktop = Capabilities.playerType == "Desktop";
         _loc1_.isAdmin = this.client.isAdmin();
         _loc1_.rank = this.client.getRank();
         _loc1_.name = this.setup.Name();
         return _loc1_;
      }
      
      override public function destroy() : void
      {
         this.view._T_A_.remove(this._xY_);
         this.view._Z_b.remove(this._1nn);
         this.view._cy.remove(this._08o);
         this.view._1or.remove(this._03j);
         this.view._1I_I_.remove(this._O_H_);
         this.view._T_7.remove(this._0lW_);
         this.view._0H_U_ && this.view._0H_U_.remove(this._07J_);
         this.view._xN_ && this.view._xN_.remove(this._true_);
      }
      
      private function _xY_() : void
      {
         this._mM_.dispatch();
      }
      
      private function _1nn() : void
      {
         this._kU_.dispatch(new _S_2());
      }
      
      private function _08o() : void
      {
         this._F_m.dispatch(false);
      }
      
      private function _03j() : void
      {
         this._kU_.dispatch(new _Q_p());
      }
      
      private function _07J_() : void
      {
         this._kU_.dispatch(new _rn());
      }
      
      private function _true_() : void
      {
         dispatch(new Event("APP_CLOSE_EVENT"));
      }
   }
}
