package _12p
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _17B_.XImageButton;
   import _D_2.MysteryBoxInfo;
   import flash.display.Bitmap;
   import _T_n._1gJ_;
   import _1gF_.SimpleText;
   import _aW_.IWebRequest;
   import _4u.Account;
   import flash.utils.Timer;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _3b.DialogSignal;
   import _v4.Client;
   import _0H_6.GameContext;
   import _ge._v1;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.util.Currency;
   import _05g.NotEnoughGoldDialog;
   import _1O_R_.NotEnoughFameDialog;
   import _1O_R_.Dialog;
   import _wi.Injector;
   import _xr._1kd;
   import flash.events.Event;
   import _1xa.SText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _0mi._13u;
   import flash.events.MouseEvent;
   import _T_J_.GTween;
   import _1__I_._bY_;
   import _0xn._1uk;
   import kabam.rotmg.assets.Assets;
   
   public class MysteryBoxRollModal extends Sprite
   {
      
      public static const WIDTH:int = 415;
      
      public static const HEIGHT:int = 290;
      
      public static const _1Y_6:int = 20;
      
      public static var open:Boolean;
       
      
      private const playAgainString:String = "MysteryBoxRollModal.playAgainString";
      
      private const youWonString:String = "MysteryBoxRollModal.youWonString";
      
      private const rewardsInVaultString:String = "MysteryBoxRollModal.rewardsInVaultString";
      
      private const _0xy:int = 1;
      
      private const _1mJ_:int = 0;
      
      private var _1D_r:XImageButton;
      
      private var _K_n:MysteryBoxInfo;
      
      private var _5M_:Vector.<Bitmap>;
      
      private var _0kw:_1gJ_;
      
      private var _1N_S_:SimpleText;
      
      private var _0hD_:Vector.<SimpleText>;
      
      private var _1X_1:SimpleText;
      
      public var client:IWebRequest;
      
      public var account:Account;
      
      private var timer:Timer;
      
      private var _hZ_:Timer;
      
      private var _0wC_:Vector.<int>;
      
      private var _1Z_s:Number = 160;
      
      private var _14a:String = "";
      
      private var _eJ_:Boolean = false;
      
      private var _11F_:Boolean = false;
      
      private var _0L_d:DisplayObject;
      
      private var _2o:DisplayObject;
      
      private var _0c7:Sprite;
      
      public var _jI_:_12p.MysteryBoxSelectModal;
      
      private var state:int;
      
      private var _H_X_:Boolean = false;
      
      public function MysteryBoxRollModal(param1:MysteryBoxInfo)
      {
         var _loc3_:uint = 0;
         this._1D_r = _1uk._V_w(WIDTH);
         this._5M_ = new Vector.<Bitmap>();
         this._0kw = new _1gJ_(this.playAgainString,16,0,Currency.INVALID);
         this._0hD_ = new Vector.<SimpleText>();
         this.timer = new Timer(50);
         this._hZ_ = new Timer(2000);
         this._0wC_ = new Vector.<int>();
         this._0L_d = new Assets.EvolveBackground();
         this._2o = new Assets.EvolveBackground();
         this._0c7 = new Sprite();
         super();
         this._K_n = param1;
         this._1D_r._0P_n();
         this._1D_r.addEventListener(MouseEvent.CLICK,this.onCloseClick);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         if(this._K_n._0tF_())
         {
            this._0kw.setPrice(this._K_n._0__l,this._K_n._G_5);
         }
         else
         {
            this._0kw.setPrice(this._K_n._1P_G_,this._K_n._0Z_E_);
         }
         this._0kw.addEventListener(MouseEvent.CLICK,this._1zz);
         this._0kw.x = this._0kw.x + (WIDTH / 2 - 100);
         this._0kw.y = this._0kw.y + (HEIGHT - 40);
         this._0kw._1Y_4 = 200;
         this._1X_1 = this._1g8(this.rewardsInVaultString,_1Y_6,220).setSize(20).setColor(0);
         this._1X_1.filters = [];
         this._0sF_();
         open = true;
         var _loc2_:Injector = GameContext.getInjector();
         this.client = _loc2_.getInstance(IWebRequest);
         this.account = _loc2_.getInstance(Account);
         while(_loc3_ < this._K_n._wJ_.length)
         {
            this._0wC_.push(0);
            _loc3_++;
         }
         this._5a();
         this._include();
      }
      
      private static function makeModalBackground(param1:int, param2:int) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2,_1dh._1rP_);
         return _loc3_;
      }
      
      private function _include() : void
      {
         this.state = this._0xy;
         if(!this._00g())
         {
            this.close(true);
         }
         this._1D_r.visible = false;
         var _loc1_:Object = this.account.credentials();
         _loc1_.boxId = this._K_n.id;
         if(this._K_n._0tF_())
         {
            _loc1_.price = this._K_n._0eC_;
            _loc1_.currency = this._K_n._0A_X_;
         }
         else
         {
            _loc1_.price = this._K_n._1G_t;
            _loc1_.currency = this._K_n._1D_Q_;
         }
         this.client.sendRequest("/account/purchaseMysteryBox",_loc1_);
         this._1N_S_ = this._1g8(this._K_n._title,_1Y_6,6,true).setSize(18);
         this._1N_S_.setColor(16768512);
         addChild(this._1N_S_);
         addChild(this._1X_1);
         this._cT_();
         this._14a = "";
         this._eJ_ = false;
         this._11F_ = false;
         this._hZ_.addEventListener(TimerEvent.TIMER,this._00J_);
         this._hZ_.start();
         this.client.complete.addOnce(this.onComplete);
      }
      
      private function _00J_(param1:TimerEvent) : void
      {
         this._hZ_.stop();
         this._11F_ = true;
         if(this._eJ_)
         {
            this._18F_(this._14a);
         }
         this._hZ_.removeEventListener(TimerEvent.TIMER,this._00J_);
      }
      
      private function _cT_() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:Bitmap = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._K_n._wJ_.length)
         {
            _loc2_ = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(this._K_n._wJ_[_loc3_][this._0wC_[_loc3_]],this._1Z_s,true));
            this._5M_.push(_loc2_);
            _loc3_++;
         }
         switch(this._5M_.length)
         {
            case 1:
               this._5M_[0].x = this._5M_[0].x + (WIDTH / 2 - 40);
               this._5M_[0].y = this._5M_[0].y + (HEIGHT / 2 - 20);
               break;
            case 2:
               this._5M_[0].x = this._5M_[0].x + (WIDTH / 2 + 20);
               this._5M_[0].y = this._5M_[0].y + (HEIGHT / 2 - 20);
               this._5M_[1].x = this._5M_[1].x + (WIDTH / 2 - 100);
               this._5M_[1].y = this._5M_[1].y + (HEIGHT / 2 - 20);
               break;
            case 3:
               this._5M_[0].x = this._5M_[0].x + (WIDTH / 2 - 140);
               this._5M_[0].y = this._5M_[0].y + (HEIGHT / 2 - 20);
               this._5M_[1].x = this._5M_[1].x + (WIDTH / 2 - 40);
               this._5M_[1].y = this._5M_[1].y + (HEIGHT / 2 - 20);
               this._5M_[2].x = this._5M_[2].x + (WIDTH / 2 + 60);
               this._5M_[2].y = this._5M_[2].y + (HEIGHT / 2 - 20);
         }
         for each(_loc1_ in this._5M_)
         {
            addChild(_loc1_);
         }
         this.timer.addEventListener(TimerEvent.TIMER,this._sA_);
         this.timer.start();
      }
      
      private function _sA_(param1:TimerEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         this.timer.stop();
         while(_loc2_ < this._0wC_.length)
         {
            if(this._0wC_[_loc2_] < this._K_n._wJ_[_loc2_].length - 1)
            {
               _loc3_ = this._0wC_;
               _loc4_ = _loc2_;
               _loc5_ = _loc3_[_loc4_] + 1;
               _loc3_[_loc4_] = _loc5_;
            }
            else
            {
               this._0wC_[_loc2_] = 0;
            }
            this._5M_[_loc2_].bitmapData = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(this._K_n._wJ_[_loc2_][this._0wC_[_loc2_]],this._1Z_s,true)).bitmapData;
            _loc2_++;
         }
         this.timer.start();
      }
      
      private function _00g() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:DialogSignal = null;
         var _loc4_:Client = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._K_n._0__l != "")
         {
            _loc1_ = int(this._K_n._G_5);
            _loc2_ = int(this._K_n._0__l);
         }
         else
         {
            _loc1_ = int(this._K_n._0Z_E_);
            _loc2_ = int(this._K_n._1P_G_);
         }
         var _loc5_:Boolean = true;
         var _loc8_:Player = GameContext.getInjector().getInstance(_v1).player;
         if(_loc8_ != null)
         {
            _loc7_ = _loc8_.credits_;
            _loc6_ = _loc8_.currentFame_;
         }
         else
         {
            _loc4_ = GameContext.getInjector().getInstance(Client);
            if(_loc4_ != null)
            {
               _loc7_ = _loc4_.getCredits();
               _loc6_ = _loc4_.getFame();
            }
         }
         if(_loc1_ == Currency.GOLD && _loc7_ < _loc2_)
         {
            _loc3_ = GameContext.getInjector().getInstance(DialogSignal);
            _loc3_.dispatch(new NotEnoughGoldDialog());
            _loc5_ = false;
         }
         else if(_loc1_ == Currency.FAME && _loc6_ < _loc2_)
         {
            _loc3_ = GameContext.getInjector().getInstance(DialogSignal);
            _loc3_.dispatch(new NotEnoughFameDialog());
            _loc5_ = false;
         }
         return _loc5_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Client = null;
         var _loc5_:DialogSignal = null;
         var _loc6_:Dialog = null;
         var _loc7_:Injector = null;
         var _loc8_:_1kd = null;
         this._eJ_ = true;
         if(param1)
         {
            _loc3_ = new XML(param2);
            this._14a = _loc3_.Awards;
            if(this._11F_)
            {
               this._18F_(_loc3_.Awards);
            }
            _loc4_ = GameContext.getInjector().getInstance(Client);
            if(_loc4_ != null)
            {
               if(_loc3_.hasOwnProperty("Gold"))
               {
                  _loc4_.setCredits(int(_loc3_.Gold));
               }
               else if(_loc3_.hasOwnProperty("Fame"))
               {
                  _loc4_.setFame(int(_loc3_.Fame));
               }
            }
         }
         else
         {
            _loc5_ = GameContext.getInjector().getInstance(DialogSignal);
            _loc6_ = new Dialog("MysteryBoxRollModal.purchaseFailedString","MysteryBoxRollModal.pleaseTryAgainString","MysteryBoxRollModal.okString",null,null);
            _loc6_.addEventListener(Dialog.LEFT_BUTTON,this._19i);
            _loc5_.dispatch(_loc6_);
            _loc7_ = GameContext.getInjector();
            _loc8_ = _loc7_.getInstance(_1kd);
            _loc8_._1B_2();
            _loc8_.start();
            this.close(true);
         }
      }
      
      private function _19i(param1:Event) : void
      {
         var _loc2_:DialogSignal = null;
         _loc2_ = GameContext.getInjector().getInstance(DialogSignal);
         _loc2_.dispatch(new _12p.MysteryBoxSelectModal());
      }
      
      public function _1g8(param1:String, param2:int, param3:int, param4:Boolean = false) : SimpleText
      {
         var _loc5_:SimpleText = new SimpleText().setSize(16).setColor(16777215).setTextWidth(WIDTH - _1Y_6 * 2);
         _loc5_.setBold(true);
         if(param4)
         {
            _loc5_.setStringBuilder(new SText(param1));
         }
         else
         {
            _loc5_.setStringBuilder(new _dU_().setParams(param1));
         }
         _loc5_.setWordWrap(true);
         _loc5_.setMultiLine(true);
         _loc5_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc5_.setHorizontalAlign(TextFormatAlign.CENTER);
         _loc5_.filters = [new DropShadowFilter(0,0,0)];
         _loc5_.x = param2;
         _loc5_.y = param3;
         return _loc5_;
      }
      
      private function _0sF_() : void
      {
         var _loc1_:int = 27;
         var _loc2_:int = 28;
         this._2o.y = this._0L_d.y = _loc1_;
         this._2o.x = this._0L_d.x = 1;
         this._2o.width = this._0L_d.width = WIDTH - 1;
         this._2o.height = this._0L_d.height = HEIGHT - _loc2_;
         var _loc3_:_13u = new _13u();
         var _loc4_:_13u = new _13u();
         _loc3_._ds = 50;
         _loc4_._ds = _loc3_._ds * 1.5;
         var _loc5_:Number = 0.7;
         _loc4_.width = _loc3_.width * _loc5_;
         _loc4_.height = _loc3_.height * _loc5_;
         _loc4_.alpha = _loc3_.alpha = 0.7;
         this._0c7.addChild(_loc3_);
         this._0c7.addChild(_loc4_);
         this._0c7.mask = this._2o;
         this._0c7.x = WIDTH / 2;
         this._0c7.y = (HEIGHT - 30) / 2 + 30;
         addChild(this._0L_d);
         addChild(this._2o);
         this._0c7.alpha = 0;
         addChild(this._0c7);
         addChild(makeModalBackground(WIDTH,HEIGHT));
         addChild(this._1D_r);
      }
      
      public function onCloseClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function close(param1:Boolean = false) : void
      {
         var _loc2_:DialogSignal = null;
         if(this.state == this._0xy)
         {
            return;
         }
         if(!param1)
         {
            _loc2_ = GameContext.getInjector().getInstance(DialogSignal);
            if(this._jI_ != null)
            {
               _loc2_.dispatch(this._jI_);
            }
            else
            {
               _loc2_.dispatch(new _12p.MysteryBoxSelectModal());
            }
         }
         open = false;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         open = false;
      }
      
      private function _18F_(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         var _loc4_:SimpleText = null;
         this.timer.removeEventListener(TimerEvent.TIMER,this._sA_);
         this.timer.stop();
         this.state = this._1mJ_;
         this._1D_r.visible = true;
         var _loc5_:Array = param1.split(",");
         removeChild(this._1X_1);
         this._1N_S_.setStringBuilder(new _dU_().setParams(this.youWonString));
         this._1N_S_.setColor(16768512);
         var _loc6_:int = 40;
         for each(_loc2_ in _loc5_)
         {
            _loc4_ = this._1g8(ObjectLibrary._O_S_[_loc2_],_1Y_6,_loc6_).setSize(16).setColor(0);
            _loc4_.filters = [];
            _loc4_.setSize(18);
            _loc4_.alpha = 0;
            addChild(_loc4_);
            this._0hD_.push(_loc4_);
            this._0pX_(_loc4_,{
               "alpha":0,
               "x":100
            },{
               "alpha":1,
               "x":20
            });
            _loc6_ = _loc6_ + 25;
         }
         this._0kw.alpha = 0;
         addChild(this._0kw);
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            this._5M_[_loc3_].bitmapData = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(int(_loc5_[_loc3_]),this._1Z_s,true)).bitmapData;
            this._0pX_(this._5M_[_loc3_],{
               "scaleX":1.25,
               "scaleY":1.25
            },{
               "scaleX":1,
               "scaleY":1
            });
            _loc3_++;
         }
         this._0pX_(this._0c7,{"alpha":0},{"alpha":1});
         this._0pX_(this._0kw,{"alpha":0},{"alpha":1});
         this._H_X_ = true;
      }
      
      private function _0pX_(param1:DisplayObject, param2:Object = null, param3:Object = null) : void
      {
         var _loc4_:GTween = new GTween(param1,0.5 * 1,param2,{"ease":_bY_._0O_C_});
         _loc4_._Y_I_ = new GTween(param1,0.5 * 1,param3,{"ease":_bY_._11O_});
         _loc4_._Y_I_.paused = true;
      }
      
      private function _0__c() : void
      {
         var _loc1_:SimpleText = null;
         var _loc2_:Bitmap = null;
         this._0c7.alpha = 0;
         removeChild(this._1N_S_);
         for each(_loc1_ in this._0hD_)
         {
            removeChild(_loc1_);
         }
         while(this._0hD_.length > 0)
         {
            this._0hD_.pop();
         }
         removeChild(this._0kw);
         for each(_loc2_ in this._5M_)
         {
            removeChild(_loc2_);
         }
         while(this._5M_.length > 0)
         {
            this._5M_.pop();
         }
      }
      
      private function _5a() : void
      {
         x = 800 / 2 - WIDTH / 2;
         y = 600 / 2 - HEIGHT / 2;
      }
      
      private function _1zz(param1:MouseEvent) : void
      {
         this._0__c();
         this._include();
      }
   }
}
