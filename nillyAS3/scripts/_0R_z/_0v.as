package _0R_z
{
   import _3b.DialogSignal;
   import _1dw.SteamAccountDetailDialog;
   
   public class _0v
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _0v()
      {
         super();
      }
      
      public function execute() : void
      {
         this._06Z_.dispatch(new SteamAccountDetailDialog());
      }
   }
}
