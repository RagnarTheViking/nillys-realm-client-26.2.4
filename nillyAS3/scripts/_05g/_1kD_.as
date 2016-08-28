package _05g
{
   import _P_S_.Mediator;
   import com.company.assembleegameclient.screens.charrects.CurrentCharacterRect;
   import _1T_4._1yM_;
   import _0jo._1xX_;
   import _0db._1A_c;
   import _0E_T_._1zi;
   import _3b.DialogSignal;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import flash.display.Sprite;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0E_T_._0ih;
   import _0H_w._1P_e;
   import _ge._1R_J_;
   import _1dI_.ConfirmDeleteCharacterDialog;
   
   public class _1kD_ extends Mediator
   {
       
      
      [Inject]
      public var view:CurrentCharacterRect;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var model:_1A_c;
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _Z_v:_q6;
      
      [Inject]
      public var _0w6:_1K_2;
      
      public function _1kD_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.selected.add(this._1Q_3);
         this.view.deleteCharacter.add(this._fj);
         this.view.showToolTip.add(this._0O_t);
         this.view.hideTooltip.add(this._C_l);
      }
      
      private function _0O_t(param1:Sprite) : void
      {
         this._Z_v.dispatch(param1);
      }
      
      private function _C_l() : void
      {
         this._0w6.dispatch();
      }
      
      override public function destroy() : void
      {
         this.view.hideTooltip.remove(this._C_l);
         this.view.showToolTip.remove(this._0O_t);
         this.view.selected.remove(this._1Q_3);
         this.view.deleteCharacter.remove(this._fj);
      }
      
      private function _1Q_3(param1:SavedCharacter) : void
      {
         var _loc2_:_0ih = this._0ta._0B_M_(param1.objectType());
         _loc2_._u5(true);
         _loc2_._E_G_._nV_(param1.skinType())._u5(true);
         this._1X_s(param1);
         this._kr(param1);
      }
      
      private function _1X_s(param1:SavedCharacter) : void
      {
         var _loc2_:_1P_e = new _1P_e();
         _loc2_.category = "character";
         _loc2_._19E_ = "select";
         _loc2_.label = param1._0rS_();
         _loc2_.value = param1.level();
         this._S_s.dispatch(_loc2_);
      }
      
      private function _kr(param1:SavedCharacter) : void
      {
         var _loc2_:_1R_J_ = new _1R_J_();
         _loc2_._1F_H_ = false;
         _loc2_.charId = param1.charId();
         _loc2_._vt = true;
         this._1M_n.dispatch(_loc2_);
      }
      
      private function _fj(param1:SavedCharacter) : void
      {
         this.model.select(param1);
         this._06Z_.dispatch(new ConfirmDeleteCharacterDialog());
      }
   }
}
