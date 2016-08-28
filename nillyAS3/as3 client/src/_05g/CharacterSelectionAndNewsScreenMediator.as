package _05g
{
   import _P_S_.Mediator;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _v4.Client;
   import _0E_T_._1zi;
   import _1T_4._1yM_;
   import _1T_4._0es;
   import _0jo._1xX_;
   import _K_r._1V_z;
   import _K_r._0J_h;
   import _1T_4._0V_s;
   import _0pn._co;
   import _0pn._W_k;
   import _0pn._gF_;
   import _Z_U_._117;
   import _3b.CloseDialogsSignal;
   import _3b.DialogSignal;
   import _P_N_.FancyDialog;
   import _1O_R_.Dialog;
   import flash.events.Event;
   import _0H_w._1P_e;
   import com.company.util._cP_;
   import com.company.assembleegameclient.parameters.Parameters;
   import _W_Q_._1R_U_;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0E_T_._0ih;
   import _ge._1R_J_;
   
   public class CharacterSelectionAndNewsScreenMediator extends Mediator
   {
       
      
      [Inject]
      public var view:CharacterSelectionAndNewsScreen;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var chooseName:_1V_z;
      
      [Inject]
      public var _X_l:_0J_h;
      
      [Inject]
      public var _00p:_0V_s;
      
      [Inject]
      public var _0A_M_:_co;
      
      [Inject]
      public var _1gS_:_W_k;
      
      [Inject]
      public var _0B_G_:_gF_;
      
      [Inject]
      public var _5T_:_117;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var dialogs:DialogSignal;
      
      public function CharacterSelectionAndNewsScreenMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var dialog:FancyDialog = null;
         this._tG_();
         this.view.initialize(this._0U_H_);
         this.view.close.add(this._fH_);
         this.view.newCharacter.add(this._06t);
         this.view._0hs.add(this._06t);
         this.view.chooseName.add(this._mB_);
         this.view._1M_n.add(this._1__V_);
         this._00p.dispatch("/currentCharScreen");
         this._X_l.add(this._0Y_D_);
         this._1gS_.add(this._0g7);
         this._0B_G_.add(this._00H_);
         this._0A_M_.dispatch();
         if(this._0U_H_.isBanned())
         {
            dialog = new FancyDialog("Banned","This account has been banned for the following reasons:\n\n<font color=\'#ff0000\'>" + this._0U_H_.getBanReasons() + "</font>\n\nDate when the ban will be lifted:\n" + this._0U_H_.getBanLiftTime(),"Ok",null,"/banned");
            dialog.addEventListener(Dialog.LEFT_BUTTON,function(param1:Event):void
            {
               closeDialogs.dispatch();
            });
            this.dialogs.dispatch(dialog);
         }
      }
      
      private function _00H_() : void
      {
         this.view._1U_w();
      }
      
      private function _0g7() : void
      {
         this.view._053();
      }
      
      override public function destroy() : void
      {
         this._X_l.remove(this._0Y_D_);
         this._1gS_.remove(this._0g7);
         this.view.close.remove(this._fH_);
         this.view.newCharacter.remove(this._06t);
         this.view.chooseName.remove(this._mB_);
         this.view._0hs.remove(this._06t);
         this.view._1M_n.remove(this._1__V_);
      }
      
      private function _0Y_D_(param1:String) : void
      {
         this.view.setName(param1);
      }
      
      private function _tG_() : void
      {
         var _loc1_:_1P_e = null;
         var _loc2_:String = _cP_._A_a();
         if(Parameters.data_.lastDailyAnalytics != _loc2_)
         {
            _loc1_ = new _1P_e();
            _loc1_.category = "joinDate";
            _loc1_._19E_ = Parameters.data_.joinDate;
            this._S_s.dispatch(_loc1_);
            Parameters.data_.lastDailyAnalytics = _loc2_;
            Parameters.save();
         }
      }
      
      private function _06t() : void
      {
         this._kU_.dispatch(new _1R_U_());
      }
      
      private function _fH_() : void
      {
         this._kU_.dispatch(new TitleView());
      }
      
      private function _mB_() : void
      {
         this.chooseName.dispatch();
      }
      
      private function _1__V_() : void
      {
         var _loc1_:SavedCharacter = this._0U_H_.getCharacterByIndex(0);
         this._0U_H_._1U_H_ = _loc1_.charId();
         var _loc2_:_0ih = this._0ta._0B_M_(_loc1_.objectType());
         _loc2_._u5(true);
         _loc2_._E_G_._nV_(_loc1_.skinType())._u5(true);
         var _loc3_:_1P_e = new _1P_e();
         _loc3_.category = "character";
         _loc3_._19E_ = "select";
         _loc3_.label = _loc1_._0rS_();
         _loc3_.value = _loc1_.level();
         this._S_s.dispatch(_loc3_);
         var _loc4_:_1R_J_ = new _1R_J_();
         _loc4_._1F_H_ = false;
         _loc4_.charId = _loc1_.charId();
         _loc4_._vt = true;
         this._1M_n.dispatch(_loc4_);
      }
   }
}
