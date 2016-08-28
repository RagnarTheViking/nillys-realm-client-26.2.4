package _1__H_
{
   import _P_S_.Mediator;
   import _0l7._15g;
   import _1F_z._1Z_D_;
   
   public class _0f4 extends Mediator
   {
       
      
      [Inject]
      public var view:_1__H_._0jK_;
      
      [Inject]
      public var _ak:_15g;
      
      public function _0f4()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._gO_.add(this._1n9);
         this.view.init();
      }
      
      private function _1n9(param1:_1Z_D_) : void
      {
         this._ak.dispatch(param1);
      }
      
      override public function destroy() : void
      {
      }
   }
}
