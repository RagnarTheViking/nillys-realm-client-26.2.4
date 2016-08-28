package _1S_e
{
   import _P_S_.Mediator;
   import _0Z_1.PortalPanel;
   import _0jo._1E_1;
   
   public class _0O_h extends Mediator
   {
       
      
      [Inject]
      public var view:PortalPanel;
      
      [Inject]
      public var _S_J_:_1E_1;
      
      public function _0O_h()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._S_J_.add(this._1P_E_);
      }
      
      private function _1P_E_() : void
      {
         this._S_J_.dispatch();
      }
      
      override public function destroy() : void
      {
         this.view._S_J_.remove(this._1P_E_);
      }
   }
}
