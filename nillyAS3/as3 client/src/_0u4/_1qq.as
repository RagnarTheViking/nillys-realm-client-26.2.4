package _0u4
{
   import _P_S_.Mediator;
   
   public class _1qq extends Mediator
   {
       
      
      [Inject]
      public var view:_0u4.KongregateAccountInfoView;
      
      [Inject]
      public var _1iN_:_0u4._0us;
      
      public function _1qq()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.register.add(this._02T_);
      }
      
      override public function destroy() : void
      {
         this.view.register.remove(this._02T_);
      }
      
      private function _02T_() : void
      {
         this._1iN_._1C_t();
      }
   }
}
