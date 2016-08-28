package _05g
{
   import _P_S_.Mediator;
   import _W_Q_._F_g;
   import _1T_4._0es;
   
   public class _0V_f extends Mediator
   {
       
      
      [Inject]
      public var view:_F_g;
      
      [Inject]
      public var _kU_:_0es;
      
      public function _0V_f()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.close.add(this._0D_T_);
         this.view.initialize();
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._0D_T_);
      }
      
      private function _0D_T_() : void
      {
         this._kU_.dispatch(new TitleView());
      }
   }
}
