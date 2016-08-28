package _0A_T_
{
   import _P_S_.Command;
   import _ge._pj;
   
   public class _085 extends Command
   {
       
      
      [Inject]
      public var model:_pj;
      
      [Inject]
      public var message:String;
      
      public function _085()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model.message = this.message;
      }
   }
}
