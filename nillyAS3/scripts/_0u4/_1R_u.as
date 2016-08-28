package _0u4
{
   import _P_S_.Mediator;
   import _0J_8.RegisterWebAccountDialog;
   import _m2._D_h;
   import _0O_c._H_0;
   
   public class _1R_u extends Mediator
   {
       
      
      [Inject]
      public var view:RegisterWebAccountDialog;
      
      [Inject]
      public var register:_D_h;
      
      public function _1R_u()
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
      
      private function _02T_(param1:_H_0) : void
      {
         this.register.dispatch(param1);
      }
   }
}
