package _0l7
{
   import _3b.DialogSignal;
   import _P_N_.CaretakerQueryDialog;
   
   public class _5O_
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _5O_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:CaretakerQueryDialog = new CaretakerQueryDialog();
         this._06Z_.dispatch(_loc1_);
      }
   }
}
