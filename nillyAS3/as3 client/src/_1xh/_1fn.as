package _1xh
{
   import _P_S_.Mediator;
   import _3b.DialogSignalNoDim;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _3b._jq;
   import _3b._15j;
   import _3b._1aM_;
   import flash.display.Sprite;
   
   public class _1fn extends Mediator
   {
       
      
      [Inject]
      public var view:_1xh._1T_5;
      
      [Inject]
      public var _tQ_:DialogSignalNoDim;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _1X_w:_jq;
      
      [Inject]
      public var _bx:_15j;
      
      [Inject]
      public var _1S_t:_1aM_;
      
      public function _1fn()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._1X_w.add(this._1v1);
         this._06Z_.add(this._tR_);
         this._tQ_.add(this._I_h);
         this._0dR_.add(this._A_1);
         this._bx.add(this._1y3);
         this._1S_t.add(this._K_D_);
      }
      
      private function _1y3(param1:Sprite) : void
      {
         this.view.push(param1);
      }
      
      private function _K_D_() : void
      {
         this.view.pop();
      }
      
      override public function destroy() : void
      {
         this._1X_w.remove(this._1v1);
         this._06Z_.remove(this._tR_);
         this._tQ_.remove(this._I_h);
         this._0dR_.remove(this._A_1);
         this._bx.remove(this._1y3);
         this._1S_t.remove(this._K_D_);
      }
      
      private function _1v1(param1:int = 1381653) : void
      {
         this.view._jO_(param1);
      }
      
      private function _tR_(param1:Sprite) : void
      {
         this.view.show(param1,true);
      }
      
      private function _I_h(param1:Sprite) : void
      {
         this.view.show(param1,false);
      }
      
      private function _A_1() : void
      {
         this.view.stage.focus = null;
         this.view._J_O_();
      }
   }
}
