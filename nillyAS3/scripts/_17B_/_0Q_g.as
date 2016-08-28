package _17B_
{
   import _P_S_.Mediator;
   import _3b.DialogSignal;
   import _1F_z._0P_4;
   import _4u.Account;
   import flash.events.MouseEvent;
   import _1F_z._A_H_;
   import _P_N_.CaretakerQueryDialog;
   import _1__H_.YardUpgraderView;
   
   public class _0Q_g extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_._0Q_e;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var account:Account;
      
      public function _0Q_g()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this._12n());
         this._Z_7();
      }
      
      private function _Z_7() : void
      {
         if(this.view._0J___)
         {
            this.view._0J___.addEventListener(MouseEvent.CLICK,this._0my);
            this.view._0R_w.addEventListener(MouseEvent.CLICK,this._ln);
         }
         else
         {
            this.view._0R_w.addEventListener(MouseEvent.CLICK,this._ln);
         }
      }
      
      private function _12n() : Boolean
      {
         var _loc1_:int = 0;
         if(!this.account.registered())
         {
            return false;
         }
         _loc1_ = this._06I_._0x3();
         return _loc1_ < _A_H_._1C_Y_;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      protected function _ln(param1:MouseEvent) : void
      {
         this._06Z_.dispatch(new CaretakerQueryDialog());
      }
      
      protected function _0my(param1:MouseEvent) : void
      {
         this._06Z_.dispatch(new YardUpgraderView());
      }
   }
}
