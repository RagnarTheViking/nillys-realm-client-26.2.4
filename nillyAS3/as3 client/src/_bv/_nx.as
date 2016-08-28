package _bv
{
   import _P_S_.Mediator;
   import _3b.DialogSignal;
   
   public class _nx extends Mediator
   {
       
      
      [Inject]
      public var view:_bv.AnnounceDisplay;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _nx()
      {
         super();
      }
      
      override public function initialize() : void
      {
      }
      
      override public function destroy() : void
      {
      }
   }
}
