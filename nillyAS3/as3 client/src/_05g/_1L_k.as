package _05g
{
   import _P_S_.Mediator;
   import _W_Q_._1R_U_;
   import _v4.Client;
   import _1T_4._0es;
   import _0jo._1xX_;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import _1T_4._ws;
   import _1T_4._0tI_;
   import _1T_4._0mO_;
   import _0E_T_._1zi;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _A_4._P_8;
   import flash.display.Sprite;
   
   public class _1L_k extends Mediator
   {
       
      
      [Inject]
      public var view:_1R_U_;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var _Z_v:_q6;
      
      [Inject]
      public var _0w6:_1K_2;
      
      [Inject]
      public var _xf:_ws;
      
      [Inject]
      public var _1H_y:_0tI_;
      
      [Inject]
      public var _0I_b:_0mO_;
      
      [Inject]
      public var _0ta:_1zi;
      
      public function _1L_k()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.selected.add(this._1Q_3);
         this.view.close.add(this._fH_);
         this.view.tooltip.add(this._0S_f);
         this.view.buy.add(this._5k);
         this._xf.add(this._x7);
         this._1H_y.add(this._Q_Q_);
         this.view.initialize(this._0U_H_);
      }
      
      private function _Q_Q_(param1:int) : void
      {
         this.view._1K_o(this._0U_H_.getCredits(),this._0U_H_.getFame());
      }
      
      override public function destroy() : void
      {
         this.view.selected.remove(this._1Q_3);
         this.view.close.remove(this._fH_);
         this.view.tooltip.remove(this._0S_f);
         this.view.buy.remove(this._5k);
         this._1H_y.remove(this._Q_Q_);
         this._xf.remove(this._x7);
      }
      
      private function _fH_() : void
      {
         this._kU_.dispatch(new CharacterSelectionAndNewsScreen());
      }
      
      private function _1Q_3(param1:int) : void
      {
         this._0ta._0B_M_(param1)._u5(true);
         this._kU_.dispatch(new _P_8());
      }
      
      private function _0S_f(param1:Sprite) : void
      {
         if(param1)
         {
            this._Z_v.dispatch(param1);
         }
         else
         {
            this._0w6.dispatch();
         }
      }
      
      private function _x7() : void
      {
         this.view.update(this._0U_H_);
      }
      
      private function _5k(param1:int) : void
      {
         this._0I_b.dispatch(param1);
      }
   }
}
