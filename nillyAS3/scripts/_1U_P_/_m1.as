package _1U_P_
{
   import _P_S_.Mediator;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import _ge._v1;
   import flash.display.Sprite;
   
   public class _m1 extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_.ArenaLeaderboardListItem;
      
      [Inject]
      public var _Z_v:_q6;
      
      [Inject]
      public var _0w6:_1K_2;
      
      [Inject]
      public var _R_U_:_v1;
      
      public function _m1()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._Z_v.add(this._0O_t);
         this.view.hideTooltip.add(this._C_l);
         this.view.setColor();
      }
      
      override public function destroy() : void
      {
         this.view._Z_v.remove(this._0O_t);
         this.view.hideTooltip.remove(this._C_l);
      }
      
      private function _0O_t(param1:Sprite) : void
      {
         this._Z_v.dispatch(param1);
      }
      
      private function _C_l() : void
      {
         this._0w6.dispatch();
      }
   }
}
