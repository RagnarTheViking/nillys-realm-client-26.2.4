package _1S_e
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.DialogSignal;
   import com.company.assembleegameclient.objects.SellableObject;
   import _0J_8.NeedRegistrationDialog;
   import com.company.assembleegameclient.util.Currency;
   
   public class SellableObjectPanelMediator extends Mediator
   {
      
      public static const TEXT:String = "SellableObjectPanelMediator.text";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:_1S_e.SellableObjectPanel;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function SellableObjectPanelMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._kz.add(this._1qf);
      }
      
      override public function destroy() : void
      {
         this.view._kz.remove(this._1qf);
      }
      
      private function _1qf(param1:SellableObject) : void
      {
         if(this.account.registered())
         {
            this.view.gs_.gsc_.buy(param1.objectId_);
         }
         else
         {
            this._06Z_.dispatch(this._1cL_(param1));
         }
      }
      
      private function _1cL_(param1:SellableObject) : NeedRegistrationDialog
      {
         return new NeedRegistrationDialog(TEXT,{"type":Currency.CurrencyName(param1.currency_)});
      }
   }
}
