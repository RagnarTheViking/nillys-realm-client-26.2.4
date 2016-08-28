package _1S_e
{
   import _0Z_1.Panel;
   import _f7.Signal;
   import com.company.assembleegameclient.objects.SellableObject;
   import _1gF_.SimpleText;
   import _T_n._1gJ_;
   import com.company.assembleegameclient.ui.Button;
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import _1xa._dU_;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import _0H_6.GameContext;
   import _wi.Injector;
   import _xr._0P_R_;
   import _4u.Account;
   import _3b.DialogSignal;
   import _12p.MysteryBoxSelectModal;
   import _0J_8.NeedRegistrationDialog;
   import com.company.assembleegameclient.util.Currency;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import _xr._1kd;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import _1pp._8u;
   
   public class MysteryBoxPanel extends Panel
   {
       
      
      private const _1I_m:int = 17;
      
      public var _kz:Signal;
      
      private var _1od:SellableObject;
      
      private var nameText_:SimpleText;
      
      private var _1la:_1gJ_;
      
      private var buyBtn:Button;
      
      private var _1kE_:Sprite;
      
      private var bitmap_:Bitmap;
      
      public function MysteryBoxPanel(param1:GameSprite, param2:uint)
      {
         this._kz = new Signal(SellableObject);
         var _loc3_:Injector = GameContext.getInjector();
         var _loc4_:_1kd = _loc3_.getInstance(_1kd);
         _loc4_.start();
         super(param1);
         this.nameText_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(WIDTH - 44);
         this.nameText_.setBold(true);
         this.nameText_.setStringBuilder(new _dU_().setParams(_1O_I_._0C_h));
         this.nameText_.setWordWrap(true);
         this.nameText_.setMultiLine(true);
         this.nameText_.setAutoSize(TextFieldAutoSize.CENTER);
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this._1kE_ = new Sprite();
         addChild(this._1kE_);
         this.bitmap_ = new Bitmap(null);
         this._1kE_.addChild(this.bitmap_);
         var _loc5_:* = "MysteryBoxPanel.open";
         var _loc6_:* = "MysteryBoxPanel.checkBackLater";
         var _loc7_:* = "MysteryBoxPanel.mysteryBoxShop";
         var _loc8_:_0P_R_ = _loc3_.getInstance(_0P_R_);
         var _loc9_:Account = _loc3_.getInstance(Account);
         if(_loc8_.isInitialized() || !_loc9_.registered())
         {
            this.buyBtn = new Button(16,_loc5_);
            this.buyBtn.addEventListener(MouseEvent.CLICK,this.buyBtnClicked);
            addChild(this.buyBtn);
         }
         else
         {
            this.buyBtn = new Button(16,_loc6_);
            addChild(this.buyBtn);
         }
         this.nameText_.setStringBuilder(new _dU_().setParams(_loc7_));
         this.bitmap_.bitmapData = _8u._1lz(param2).bitmapData;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function _13z(param1:SellableObject) : void
      {
         if(param1 == this._1od)
         {
            return;
         }
         this._1od = param1;
         this._1la.setPrice(this._1od.price_,this._1od.currency_);
         var _loc2_:String = this._1od.soldObjectName();
         this.nameText_.setStringBuilder(new _dU_().setParams(_loc2_));
         this.bitmap_.bitmapData = this._1od.getIcon();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyPressed);
         this._1kE_.x = -4;
         this._1kE_.y = -8;
         this.nameText_.x = 44;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyPressed);
         this.buyBtn.removeEventListener(MouseEvent.CLICK,this.buyBtnClicked);
      }
      
      private function buyBtnClicked(param1:MouseEvent) : void
      {
         this.showMysteryBoxEntries();
      }
      
      private function showMysteryBoxEntries() : void
      {
         var _loc1_:Injector = GameContext.getInjector();
         var _loc2_:_0P_R_ = _loc1_.getInstance(_0P_R_);
         var _loc3_:Account = _loc1_.getInstance(Account);
         var _loc4_:DialogSignal = _loc1_.getInstance(DialogSignal);
         if(_loc2_.isInitialized() && _loc3_.registered())
         {
            _loc4_.dispatch(new MysteryBoxSelectModal());
         }
         else if(!_loc3_.registered())
         {
            _loc4_.dispatch(new NeedRegistrationDialog("SellableObjectPanelMediator.text",{"type":Currency.CurrencyName(Currency.GOLD)}));
         }
      }
      
      private function keyPressed(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this.showMysteryBoxEntries();
         }
      }
      
      override public function draw() : void
      {
         this.nameText_.y = this.nameText_.height > 30?Number(0):Number(12);
         this.buyBtn.x = WIDTH / 2 - this.buyBtn.width / 2;
         this.buyBtn.y = HEIGHT - this.buyBtn.height / 2 - this._1I_m;
         if(!contains(this.buyBtn))
         {
            addChild(this.buyBtn);
         }
      }
   }
}
