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
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import _0E_Z_._1tn;
   import _eN_._0M_5;
   import _0H_6.GameContext;
   import _ek._18o;
   import _T_n._1zM_;
   import _1xa._dU_;
   import flash.events.Event;
   import _wi.Injector;
   import _4u.Account;
   import _3b.DialogSignal;
   import _0J_8.NeedRegistrationDialog;
   import com.company.assembleegameclient.util.Currency;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import _xr._1kd;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import _1pp._8u;
   
   public class FortuneGroundPanel extends Panel
   {
      
      private static var _H_Z_:Boolean;
       
      
      private const _1I_m:int = 17;
      
      public var _kz:Signal;
      
      private var _1od:SellableObject;
      
      private var nameText_:SimpleText;
      
      private var _1la:_1gJ_;
      
      private var _G_U_:Button;
      
      private var _1kE_:Sprite;
      
      private var bitmap_:Bitmap;
      
      private var _0ah:Sprite;
      
      public function FortuneGroundPanel(param1:GameSprite, param2:uint)
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
         var _loc5_:* = "FortuneGroundPanel.play";
         var _loc6_:* = "MysteryBoxPanel.checkBackLater";
         var _loc7_:* = "FortuneGroundPanel.alchemist";
         var _loc8_:_18o = _loc3_.getInstance(_18o);
         var _loc9_:Account = _loc3_.getInstance(Account);
         if(_18o._1Q_W_ && _loc9_.registered())
         {
            this._G_U_ = new Button(16,_loc5_);
            addChild(this._G_U_);
         }
         else
         {
            this._G_U_ = new Button(16,_loc6_);
            addChild(this._G_U_);
         }
         this.nameText_.setStringBuilder(new _dU_().setParams(_loc7_));
         this.bitmap_.bitmapData = _8u._1lz(param2).bitmapData;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         if(!_1tn._T_0)
         {
            this._G_U_.addEventListener(MouseEvent.CLICK,this._1K_9);
            WebMain.stage_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         }
         else
         {
            _1tn.closed.add(this._15b);
         }
      }
      
      private function _15b() : void
      {
         this._G_U_.addEventListener(MouseEvent.CLICK,this._1K_9);
         WebMain.stage_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         _1tn.closed.remove(this._15b);
      }
      
      private function _0kR_(param1:MouseEvent) : void
      {
         var _loc2_:_0M_5 = null;
         if(this._0ah == null)
         {
            _loc2_ = GameContext.getInjector().getInstance(_18o).getFortune();
            this._0ah = _1zM_.make(_loc2_._3s);
            this._0ah.x = this._0ah.x - (this._0ah.width + 10);
            this._0ah.y = this._0ah.y - (this._0ah.height - this.height);
            if(this._0ah != null)
            {
               addChild(this._0ah);
            }
         }
      }
      
      private function _D_C_(param1:MouseEvent) : void
      {
         if(this._0ah != null && this._0ah.parent)
         {
            removeChild(this._0ah);
            this._0ah = null;
         }
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
         this._1kE_.x = -4;
         this._1kE_.y = -8;
         this.nameText_.x = 44;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         this._G_U_.removeEventListener(MouseEvent.CLICK,this._1K_9);
         _1tn.closed.remove(this._15b);
      }
      
      private function _1K_9(param1:MouseEvent) : void
      {
         this._0I_c();
      }
      
      private function _0I_c() : void
      {
         if(_1tn._T_0)
         {
            return;
         }
         var _loc1_:Injector = GameContext.getInjector();
         var _loc2_:_18o = _loc1_.getInstance(_18o);
         var _loc3_:Account = _loc1_.getInstance(Account);
         var _loc4_:DialogSignal = _loc1_.getInstance(DialogSignal);
         if(_loc2_._fk() && _loc3_.registered())
         {
            _loc4_.dispatch(new _1tn());
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
            this._G_U_.removeEventListener(MouseEvent.CLICK,this._1K_9);
            _1tn.closed.add(this._15b);
         }
         else if(!_loc3_.registered())
         {
            _loc4_.dispatch(new NeedRegistrationDialog("SellableObjectPanelMediator.text",{"type":Currency.CurrencyName(Currency.GOLD)}));
         }
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this._0I_c();
         }
      }
      
      override public function draw() : void
      {
         this.nameText_.y = this.nameText_.height > 30?Number(0):Number(12);
         this._G_U_.x = WIDTH / 2 - this._G_U_.width / 2;
         this._G_U_.y = HEIGHT - this._G_U_.height / 2 - this._1I_m;
         if(!contains(this._G_U_))
         {
            addChild(this._G_U_);
         }
      }
   }
}
