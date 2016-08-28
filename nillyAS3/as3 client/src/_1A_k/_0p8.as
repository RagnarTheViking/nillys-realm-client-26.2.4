package _1A_k
{
   import _P_S_.Mediator;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import ToolTips.ToolTip;
   
   public class _0p8 extends Mediator
   {
       
      
      [Inject]
      public var view:_1A_k._J_D_;
      
      [Inject]
      public var _Z_v:_q6;
      
      [Inject]
      public var _0w6:_1K_2;
      
      public function _0p8()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._Z_v.add(this._07F_);
         this._0w6.add(this._0pJ_);
      }
      
      override public function destroy() : void
      {
         this._Z_v.remove(this._07F_);
         this._0w6.remove(this._0pJ_);
      }
      
      private function _07F_(param1:ToolTip) : void
      {
         this.view.show(param1);
      }
      
      private function _0pJ_() : void
      {
         this.view.hide();
      }
   }
}
