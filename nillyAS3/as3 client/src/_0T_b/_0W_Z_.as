package _0T_b
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _3b.DialogSignal;
   import _m2._0U_b;
   import _1T_4._34;
   import _0jo._hO_;
   import _0O_c._H_0;
   import _0pN_._1nd;
   
   public class _0W_Z_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b._mb;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var register:_0U_b;
      
      [Inject]
      public var _00m:_34;
      
      [Inject]
      public var _1R_c:_hO_;
      
      public function _0W_Z_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.register.add(this._02T_);
         this.view.signIn.add(this._1ut);
         this.view.cancel.add(this.onCancel);
         this._00m.add(this._1Q_Z_);
         this._1R_c.dispatch(false);
      }
      
      override public function destroy() : void
      {
         this.view.register.remove(this._02T_);
         this.view.signIn.remove(this._1ut);
         this.view.cancel.remove(this.onCancel);
         this._00m.remove(this._1Q_Z_);
         this._1R_c.dispatch(true);
      }
      
      private function _02T_(param1:_H_0) : void
      {
         this.view.disable();
         this.register.dispatch(param1);
      }
      
      private function onCancel() : void
      {
         this._0dR_.dispatch();
      }
      
      private function _1ut() : void
      {
         this._06Z_.dispatch(new WebLoginDialog());
      }
      
      private function _1Q_Z_(param1:_1nd) : void
      {
         this.view._1p(param1.error);
         this.view._0F_M_();
      }
   }
}
