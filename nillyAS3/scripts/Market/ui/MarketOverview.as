package Market.ui
{
   import _0J_8._167;
   import flash.display.Sprite;
   import _W_Q_.TextButton;
   import _17B_.XImageButton;
   import flash.text.TextFieldAutoSize;
   import flashx.textLayout.formats.VerticalAlign;
   import _1gF_.SimpleText;
   import _1xa.SText;
   
   public class MarketOverview extends _167
   {
       
      
      private var currentScreen:Sprite;
      
      private var myOffersButton:TextButton;
      
      private var createOfferButton:TextButton;
      
      public var closeButton:XImageButton;
      
      public function MarketOverview()
      {
         super();
         var _loc1_:SimpleText = new SimpleText().setSize(46).setBold(true).setStringBuilder(new SText("Market")).setAutoSize(TextFieldAutoSize.CENTER).setTextWidth(600).setColor(16777215).setPosition(0,20);
         addChild(_loc1_);
         this.closeButton = new XImageButton(0.8);
         this.closeButton.x = 566;
         this.closeButton.y = 5;
         addChild(this.closeButton);
         this.myOffersButton = this.createButton("My offers",10,this.myOffers,true);
         this.createOfferButton = this.createButton("Create offer",110,this.createOffer);
         this.myOffers();
      }
      
      private function createOffer() : void
      {
         var screen:MarketCreateOfferScreen = new MarketCreateOfferScreen();
         screen.removed.add(function():void
         {
            createOfferButton.activate();
         });
         this.setScreen(screen);
         this.createOfferButton.deactivate(8750469);
      }
      
      public function myOffers() : void
      {
         var screen:MarketMyOffersScreen = new MarketMyOffersScreen();
         screen.removed.add(function():void
         {
            myOffersButton.activate();
         });
         this.setScreen(screen);
         this.myOffersButton.deactivate(8750469);
      }
      
      public function setScreen(param1:Sprite) : void
      {
         if(this.currentScreen && contains(this.currentScreen))
         {
            removeChild(this.currentScreen);
         }
         this.currentScreen = param1;
         this.currentScreen.y = 100;
         addChild(param1);
      }
      
      override protected function makeModalBackground() : Sprite
      {
         x = 0;
         y = 0;
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0,0.9);
         _loc1_.graphics.drawRect(0,0,600,600);
         _loc1_.graphics.endFill();
         _loc1_.graphics.beginFill(16777215,1);
         _loc1_.graphics.drawRect(0,98,600,2);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      private function createButton(param1:String, param2:Number, param3:Function, param4:Boolean = false) : TextButton
      {
         var _loc5_:TextButton = null;
         _loc5_ = new TextButton(param1,18,false);
         _loc5_.setAutoSize(TextFieldAutoSize.LEFT);
         _loc5_.setVerticalAlign(VerticalAlign.MIDDLE);
         _loc5_.x = param2;
         _loc5_.y = 85;
         _loc5_.clicked.add(param3);
         if(param4)
         {
            _loc5_.deactivate(8750469);
         }
         addChild(_loc5_);
         return _loc5_;
      }
   }
}
