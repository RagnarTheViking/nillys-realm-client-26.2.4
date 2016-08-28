package _1S_e
{
   import _P_S_.Mediator;
   import _ge._pj;
   
   public class _0od extends Mediator
   {
       
      
      [Inject]
      public var view:_1S_e.TextPanel;
      
      [Inject]
      public var data:_pj;
      
      public function _0od()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this.data.message);
      }
   }
}
