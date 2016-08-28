package _1S_e
{
   import _0Z_1.Panel;
   import _1R_o._Y_5;
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.ui.RankDisplay;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.GuildUtil;
   import _1R_o._0xf;
   import _f7.Signal;
   import com.company.assembleegameclient.objects.SellableObject;
   import _T_n._1gJ_;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui.ConfirmBuyModal;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0H_6.GameContext;
   import _4u.Account;
   import com.company.assembleegameclient.objects.Player;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.util.Currency;
   
   public class SellableObjectPanel extends Panel implements _Y_5
   {
       
      
      private const _1I_m:int = 17;
      
      public var _18D_:_0xf;
      
      public var _kz:Signal;
      
      private var _1od:SellableObject;
      
      private var nameText_:SimpleText;
      
      private var _1la:_1gJ_;
      
      private var _0lS_:Sprite;
      
      private var _0nn:SimpleText;
      
      private var _1kE_:Sprite;
      
      private var bitmap_:Bitmap;
      
      private var _d4:ConfirmBuyModal;
      
      public function SellableObjectPanel(param1:GameSprite, param2:SellableObject)
      {
         this._18D_ = new _0xf();
         this._kz = new Signal(SellableObject);
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
         this._1la = new _1gJ_(_1O_I_._0A_w,16,0,Currency.INVALID);
         this._1la.addEventListener(MouseEvent.CLICK,this._1hS_);
         addChild(this._1la);
         this._13z(param2);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._18D_._bD_(this);
         this._18D_.tooltip = param2.getTooltip();
      }
      
      private static function _0J_u(param1:int) : Sprite
      {
         var requiredText:SimpleText = null;
         var rankText:Sprite = null;
         var rankReq:int = param1;
         var rankReqText:Sprite = new Sprite();
         requiredText = new SimpleText().setSize(16).setColor(16777215).setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         requiredText.filters = [new DropShadowFilter(0,0,0)];
         rankReqText.addChild(requiredText);
         rankText = new RankDisplay(rankReq,false,false,0,false);
         rankReqText.addChild(rankText);
         requiredText.textChanged.addOnce(function():void
         {
            rankText.x = requiredText.width * 0.5 + 4;
            rankText.y = -rankText.height / 2;
         });
         requiredText.setStringBuilder(new _dU_().setParams(_1O_I_._0M_C_));
         return rankReqText;
      }
      
      private static function _1H_D_(param1:int) : SimpleText
      {
         var _loc2_:SimpleText = null;
         _loc2_ = new SimpleText().setSize(16).setColor(16711680).setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         var _loc3_:String = GuildUtil._oB_(param1);
         _loc2_.setStringBuilder(new _dU_().setParams(_1O_I_._0fQ_,{"amount":_loc3_}));
         _loc2_.filters = [new DropShadowFilter(0,0,0)];
         return _loc2_;
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
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         this._1kE_.x = -4;
         this._1kE_.y = -8;
         this.nameText_.x = 44;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         if(parent != null && this._d4 != null && this._d4.open)
         {
            parent.removeChild(this._d4);
         }
      }
      
      private function _1hS_(param1:MouseEvent) : void
      {
         if(ConfirmBuyModal._pc)
         {
            this._H_t();
         }
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null && ConfirmBuyModal._pc)
         {
            this._H_t();
         }
      }
      
      private function _H_t() : void
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         if(parent != null && _loc1_.registered() && this._1od.objectType_ != 1285)
         {
            this._d4 = new ConfirmBuyModal(this._kz,this._1od,this._1la.width);
            parent.addChild(this._d4);
         }
         else
         {
            this._kz.dispatch(this._1od);
         }
      }
      
      override public function draw() : void
      {
         var _loc1_:Player = gs_.map.player_;
         this.nameText_.y = this.nameText_.height > 30?Number(0):Number(12);
         var _loc2_:int = this._1od._sO_;
         if(_loc1_.numStars_ < _loc2_)
         {
            if(contains(this._1la))
            {
               removeChild(this._1la);
            }
            if(this._0lS_ == null || !contains(this._0lS_))
            {
               this._0lS_ = _0J_u(_loc2_);
               this._0lS_.x = WIDTH / 2 - this._0lS_.width / 2;
               this._0lS_.y = HEIGHT - this._0lS_.height / 2 - 20;
               addChild(this._0lS_);
            }
         }
         else if(_loc1_.guildRank_ < this._1od._0Q_V_)
         {
            if(contains(this._1la))
            {
               removeChild(this._1la);
            }
            if(this._0nn == null || !contains(this._0nn))
            {
               this._0nn = _1H_D_(this._1od._0Q_V_);
               this._0nn.x = WIDTH / 2 - this._0nn.width / 2;
               this._0nn.y = HEIGHT - this._0nn.height / 2 - 20;
               addChild(this._0nn);
            }
         }
         else
         {
            this._1la.setPrice(this._1od.price_,this._1od.currency_);
            this._1la.setEnabled(gs_.gsc_.outstandingBuy_ == null);
            this._1la.x = WIDTH / 2 - this._1la.width / 2;
            this._1la.y = HEIGHT - this._1la.height / 2 - this._1I_m;
            if(!contains(this._1la))
            {
               addChild(this._1la);
            }
            if(this._0lS_ != null && contains(this._0lS_))
            {
               removeChild(this._0lS_);
            }
         }
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
   }
}
