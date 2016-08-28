package Market.ui
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import Packets.PacketManagerBase;
   
   public class MarketMediator extends Mediator
   {
       
      
      [Inject]
      public var view:Market.ui.MarketOverview;
      
      [Inject]
      public var doAction:Market.ui.MarketActionSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      private var packetManager:PacketManagerBase;
      
      public function MarketMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.packetManager = PacketManagerBase.instance;
         this.doAction.add(this.onAction);
         this.view.closeButton.clicked.add(this.closeDialog);
      }
      
      private function closeDialog() : void
      {
         this.closeDialogs.dispatch();
      }
      
      private function onAction(param1:String) : void
      {
         this.packetManager.playerText(param1);
      }
      
      override public function destroy() : void
      {
         this.doAction.remove(this.onAction);
      }
   }
}
