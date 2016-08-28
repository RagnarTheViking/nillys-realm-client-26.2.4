package _17B_
{
   import _P_S_.Mediator;
   import _1oP_.PetPanel;
   import _1F_z._0P_4;
   import _0l7._1O_Z_;
   import _1T_4._q6;
   import _0l7._1Y_f;
   import _0l7._O_B_;
   import _0l7._15g;
   import _3b.DialogSignal;
   import _wi.Injector;
   import flash.events.MouseEvent;
   import _1F_z._1Z_D_;
   import _1oP_._09m;
   import _0xn._bf;
   import ToolTips.ToolTip;
   
   public class _1sh extends Mediator
   {
       
      
      [Inject]
      public var view:PetPanel;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var _aD_:_1O_Z_;
      
      [Inject]
      public var showToolTip:_q6;
      
      [Inject]
      public var _1mC_:_1Y_f;
      
      [Inject]
      public var _141:_O_B_;
      
      [Inject]
      public var _ak:_15g;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _1sh()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.setState(this._Y_D_());
         this.view._1am.add(this._1V_0);
         this.view._1P_x.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.view._tJ_.addEventListener(MouseEvent.CLICK,this._V_m);
         this.view._17O_.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._ak.add(this._1qm);
      }
      
      override public function destroy() : void
      {
         this.view._tJ_.removeEventListener(MouseEvent.CLICK,this._V_m);
      }
      
      private function _V_m(param1:MouseEvent) : void
      {
         this._T_X_.map(_1Z_D_)._1as(this.view.petVO);
         this._06Z_.dispatch(this._T_X_.getInstance(_09m));
      }
      
      private function _1qm() : void
      {
         var _loc1_:_1Z_D_ = this._06I_._0T_T_();
         this.view._0Z_P_(!_loc1_);
      }
      
      private function _Y_D_() : uint
      {
         if(this._0jY_())
         {
            return _bf._V_9;
         }
         return _bf._10X_;
      }
      
      protected function onButtonClick(param1:MouseEvent) : void
      {
         if(this._0jY_())
         {
            this._1mC_.dispatch(this.view.petVO._0__5());
         }
         else
         {
            this._141.dispatch(this.view.petVO._0__5());
         }
      }
      
      private function _1V_0(param1:ToolTip) : void
      {
         this.showToolTip.dispatch(param1);
      }
      
      private function _0jY_() : Boolean
      {
         return !!this._06I_._0T_T_()?this._06I_._0T_T_()._0__5() == this.view.petVO._0__5():false;
      }
   }
}
