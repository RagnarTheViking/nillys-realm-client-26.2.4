package _17B_
{
   import _P_S_.Mediator;
   import _3b.DialogSignalNoDim;
   import _3b.DialogSignal;
   import flash.events.MouseEvent;
   import _1__H_._0vs;
   import _1__H_._1O_8;
   
   public class _1F_9 extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_._1X_A_;
      
      [Inject]
      public var _Y_Q_:DialogSignalNoDim;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1F_9()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init();
         this.view._A_d.addEventListener(MouseEvent.CLICK,this._0my);
         this.view._M_a.addEventListener(MouseEvent.CLICK,this._ln);
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      protected function _ln(param1:MouseEvent) : void
      {
         this._06Z_.dispatch(new _0vs());
      }
      
      protected function _0my(param1:MouseEvent) : void
      {
         this._Y_Q_.dispatch(new _1O_8());
      }
   }
}
