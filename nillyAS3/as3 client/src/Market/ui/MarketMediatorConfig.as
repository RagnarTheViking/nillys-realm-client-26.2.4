package Market.ui
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import Market.MarketItemsResultSignal;
   import Market.MarketResultSignal;
   
   public class MarketMediatorConfig implements IConfig
   {
       
      
      [Inject]
      public var injector:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function MarketMediatorConfig()
      {
         super();
      }
      
      public function configure() : void
      {
         this.injector.map(MarketItemsResultSignal).asSingleton();
         this.injector.map(MarketResultSignal).asSingleton();
         this.injector.map(MarketActionSignal).asSingleton();
         this.mediatorMap.map(MarketOverview).toMediator(MarketMediator);
      }
   }
}
