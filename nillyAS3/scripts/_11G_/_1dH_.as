package _11G_
{
   import _4u.Account;
   import _3b.DialogSignal;
   import flash.display.Sprite;
   import Frames.NewChooseNameFrame;
   import _05g.ChooseNameRegisterDialog;
   
   public class _1dH_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1dH_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:Sprite = null;
         if(this.account.registered())
         {
            _loc1_ = new NewChooseNameFrame();
         }
         else
         {
            _loc1_ = new ChooseNameRegisterDialog();
         }
         this._06Z_.dispatch(_loc1_);
      }
   }
}
