package _Y_8
{
   import _P_S_.Mediator;
   import _05L_._05T_;
   import _m2._0S_X_;
   import _S_b._O_e;
   import _K_r._yK_;
   import flash.events.MouseEvent;
   
   public class _0N_l extends Mediator
   {
       
      
      [Inject]
      public var view:_Y_8._bV_;
      
      [Inject]
      public var model:_05T_;
      
      [Inject]
      public var _0yK_:_0S_X_;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _a__:_yK_;
      
      public function _0N_l()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.setup(this.model);
         this._a__.add(this._09Z_);
      }
      
      private function _09Z_() : void
      {
         if(this._1tf._14O_ && this._1tf._14O_.evalIsNotInCombatMapArea())
         {
            this.view.addEventListener(MouseEvent.CLICK,this._1k9);
         }
         else
         {
            this.view.mouseEnabled = false;
            this.view.mouseChildren = false;
         }
      }
      
      override public function destroy() : void
      {
         this.view.removeEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this._0yK_.dispatch();
      }
   }
}
