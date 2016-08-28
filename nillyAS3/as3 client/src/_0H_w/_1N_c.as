package _0H_w
{
   import _0pN_._049;
   import _3b.DialogSignal;
   import _05g.NotEnoughGoldDialog;
   import _1O_R_.ErrorDialog;
   
   public class _1N_c extends _049
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public var _1__a:_0H_w.PurchaseCharacterClassTask;
      
      public function _1N_c()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         if(this._1__a.error == "Not enough Gold.")
         {
            this._06Z_.dispatch(new NotEnoughGoldDialog());
         }
         else
         {
            this._06Z_.dispatch(new ErrorDialog(this._1__a.error));
         }
      }
   }
}
