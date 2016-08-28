package _R_o
{
   import _P_S_.Mediator;
   import _0sm._1br;
   import _0sm._tp;
   import _0sm._1P_X_;
   import _0sm._qE_;
   
   public class _0fB_ extends Mediator
   {
       
      
      [Inject]
      public var view:_R_o._U_V_;
      
      [Inject]
      public var _1B_v:_1br;
      
      [Inject]
      public var show:_tp;
      
      [Inject]
      public var hide:_1P_X_;
      
      [Inject]
      public var remove:_qE_;
      
      public function _0fB_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.remove.add(this._1su);
         this._1B_v.add(this._9k);
         this.show.add(this._08);
         this.hide.add(this._0bN_);
         this.view.visible = false;
      }
      
      override public function destroy() : void
      {
         this.remove.remove(this._1su);
         this._1B_v.remove(this._9k);
         this.show.remove(this._08);
         this.hide.remove(this._0bN_);
      }
      
      private function _1su() : void
      {
         this.view.parent.removeChild(this.view);
      }
      
      private function _9k() : void
      {
         this.view.visible = !this.view.visible;
      }
      
      private function _08() : void
      {
         this.view.visible = true;
      }
      
      private function _0bN_() : void
      {
         this.view.visible = false;
      }
   }
}
