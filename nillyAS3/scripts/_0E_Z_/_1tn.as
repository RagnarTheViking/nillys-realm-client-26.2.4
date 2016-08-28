package _0E_Z_
{
   import _0J_8._167;
   import _f7.Signal;
   import flash.text.TextField;
   import flash.display.DisplayObject;
   import _T_J_.GTween;
   import _1__I_._bY_;
   import _T_n._0J_s;
   import _17B_.XImageButton;
   import _T_n._8k;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _ek._18o;
   import _eN_._0M_5;
   import com.company.assembleegameclient.map._1C_n;
   import flash.utils.Timer;
   import _ju._I_C_;
   import flash.display.Sprite;
   import _1S_e.CurrencyDisplay;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.util.Currency;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.text.TextFieldAutoSize;
   import flash.filters.GlowFilter;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import _0H_6.GameContext;
   import _ge._v1;
   import com.company.assembleegameclient.objects.Player;
   import _3b.DialogSignal;
   import _05g.NotEnoughGoldDialog;
   import _1O_R_.Dialog;
   import _3b.CloseDialogsSignal;
   import _1O_R_._0I_z;
   import flash.utils.getTimer;
   import com.company.assembleegameclient.objects.GameObject;
   import _0x1._G_Q_;
   import _7m._H_Q_;
   import _0x1._1D_9;
   import _wi.Injector;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _T_n._1zM_;
   
   public class _1tn extends _167
   {
      
      public static const _0W_P_:int = 800;
      
      public static const _0kV_:int = 600;
      
      public static const STATE_ROUND_1:int = 1;
      
      public static const STATE_ROUND_2:int = 2;
      
      public static const _k9:Number = 200;
      
      private static const _P_I_:int = 120;
      
      public static const closed:Signal = new Signal();
      
      public static var _1bx:Class = _1M_p;
      
      public static var _0lA_:Class = _0S_J_;
      
      public static var fortunePlatformEmbed2:Class = FortuneModal_fortunePlatformEmbed2;
      
      public static var _q9:int = _0W_P_;
      
      public static var _P_m:int = _0kV_;
      
      private static var _0gc:Vector.<TextField>;
      
      public static var _0ty:int;
      
      public static var _0zl:int;
      
      public static var _wV_:int = _0kV_ / 2 - 20;
      
      public static var _T_0:Boolean = false;
       
      
      private const _1jF_:Number = 1200;
      
      private const _1S_y:Number = 100;
      
      private const _0do:int = 0;
      
      private const _0D_N_:int = 1;
      
      private const _0W_m:int = 120;
      
      private const _0go:Number = 1.3;
      
      private const _0Z_J_:Number = 6;
      
      private const _18r:Number = 2.75;
      
      private const DISPLAY_PRIZE_TIME_1:Number = 3.75;
      
      private const DISPLAY_PRIZE_TIME_2:Number = 5;
      
      private const _1D_o:Number = 0.12;
      
      private const _0oR_:Number = 10;
      
      public var _0un:_0E_Z_._1A_i;
      
      public var _C_T_:Vector.<_0E_Z_._1S_B_>;
      
      public var _0C_L_:_0E_Z_._1S_B_ = null;
      
      private var _0zs:_0J_s;
      
      private var _1t__:_0J_s;
      
      private var _1S_O_:_0J_s;
      
      private var _ef:XImageButton;
      
      private var _0R_Q_:int = -1;
      
      private var _1D_e:_8k;
      
      public var client:IWebRequest;
      
      public var account:Account;
      
      public var model:_18o;
      
      public var _N_4:_0M_5;
      
      public var state:int = 1;
      
      private var _0ig:_1C_n;
      
      private var _0uP_:Timer;
      
      private var _1ld:int = -1;
      
      private var _103:int = 0;
      
      public var _1wk:Vector.<_0E_Z_._0qm>;
      
      private var lastUpdate_:int;
      
      public var _S_4:_I_C_;
      
      private var _dS_:Number;
      
      private var _1B_B_:int = 0;
      
      private var _0nN_:Boolean = false;
      
      private var radius:int = 200;
      
      private var _xJ_:Number = 0;
      
      private var _0L_3:int = 4;
      
      private var _02g:int = 0;
      
      private var _0jZ_:Sprite;
      
      private var _qr:Sprite;
      
      public var _O_i:CurrencyDisplay;
      
      private var _0ah:Sprite;
      
      private var _10Q_:int = -1;
      
      private var _1V_V_:int = -1;
      
      private var _0G_J_:int = -1;
      
      private var gs_:GameSprite = null;
      
      private var _1R_T_:Boolean = false;
      
      public function _1tn(param1:GameSprite = null)
      {
         this._0un = new _0E_Z_._1A_i();
         this._C_T_ = Vector.<_0E_Z_._1S_B_>([new _0E_Z_._1S_B_(),new _0E_Z_._1S_B_(),new _0E_Z_._1S_B_()]);
         this._0zs = new _0J_s("Play for ",0,Currency.INVALID);
         this._1t__ = new _0J_s("Play for ",0,Currency.INVALID);
         this._1S_O_ = new _0J_s("Return",0,Currency.INVALID);
         this._0uP_ = new Timer(this._1jF_);
         _q9 = _0W_P_;
         _P_m = _0kV_;
         super(_q9,_P_m);
         _T_0 = true;
         this._020();
         this._dS_ = _1C_n._G_A_;
         this._0ig = new _1C_n();
         addChild(this._0ig);
         this._ef = new XImageButton(1);
         addChild(this._ef);
         this._ef.y = 4;
         this._ef.x = _q9 - this._ef.width - 5;
         var _loc2_:Injector = GameContext.getInjector();
         this.client = _loc2_.getInstance(IWebRequest);
         this.account = _loc2_.getInstance(Account);
         this.model = _loc2_.getInstance(_18o);
         this._N_4 = this.model.getFortune();
         if(this._N_4 == null)
         {
            return;
         }
         this._0un.setXPos(_q9 / 2);
         this._0un.setYPos(_wV_);
         this._W_R_();
         addChild(this._0un);
         this.lastUpdate_ = getTimer();
         this._1D_e = new _8k();
         this._1D_e._11F_.add(this._I_i);
         addChild(this._1D_e);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         addEventListener(Event.REMOVED_FROM_STAGE,this._0R_o);
         this._O_i = new CurrencyDisplay(null,false,true);
         this._O_i.x = 734;
         this._O_i.y = 0;
         addChild(this._O_i);
         var _loc3_:Player = GameContext.getInjector().getInstance(_v1).player;
         if(_loc3_ != null)
         {
            this._O_i.draw(_loc3_.credits_,0,_loc3_.tokens);
         }
         if(param1 != null)
         {
            this.gs_ = param1;
            this.gs_.currencyDisplay.visible = false;
         }
         var _loc4_:BitmapData = TextureLibrary.getBitmap("lofiObj3",1172);
         _loc4_ = TextureRedrawer.redraw(_loc4_,75,true,0);
         this._0un.addEventListener(MouseEvent.ROLL_OVER,this._Z_r);
         this._0un.addEventListener(MouseEvent.ROLL_OUT,this._1G_m);
         this._0ah = _1zM_.make(this._N_4._3s);
         this._0ah.x = _q9 - (this._0ah.width + 10);
         this._0ah.y = 10;
         this._X_M_();
         this._12a();
         this.setString(0);
         this._0xv();
         addChild(this._0ah);
         this._0ah.addEventListener(MouseEvent.ROLL_OVER,this._1G_m);
         this._0ah.visible = false;
      }
      
      public static function _0xq(param1:DisplayObject, param2:Object = null, param3:Object = null, param4:Function = null) : void
      {
         var _loc5_:GTween = new GTween(param1,0.5 * 1,param2,{"ease":_bY_._0O_C_});
         _loc5_._Y_I_ = new GTween(param1,0.5 * 1,param3,{"ease":_bY_._11O_});
         _loc5_._Y_I_.paused = true;
         _loc5_._Y_I_.end();
         _loc5_._Y_I_.onComplete = param4;
      }
      
      private function _Z_r(param1:MouseEvent) : void
      {
         this._0ah.visible = true;
      }
      
      private function _1G_m(param1:MouseEvent) : void
      {
         if(!(param1.relatedObject is _0E_Z_._0qm))
         {
            this._0ah.visible = false;
         }
      }
      
      private function _0xv() : void
      {
         this._10Q_ = int(this._N_4._1k7);
         this._0G_J_ = int(this._N_4._qL_);
         this._1V_V_ = int(this._N_4._0pY_);
         this._0zs.setPrice(this._10Q_,Currency.GOLD);
         this._0zs.setEnabled(true);
         this._0zs.x = _q9 / 2 - 100 - this._0zs.width;
         this._0zs.y = _P_m * 70 / 75 - this._0zs.height / 2;
         addChild(this._0zs);
         this._0zs.addEventListener(MouseEvent.CLICK,this._0E_V_);
         this._1t__.setPrice(this._0G_J_,Currency.TOKEN);
         this._1t__.setEnabled(true);
         this._1S_O_.visible = false;
         addChild(this._1S_O_);
         this._1S_O_._0D_S_("Return");
         addChild(this._1t__);
         this._1t__.x = _q9 / 2 + 100;
         this._1t__.y = _P_m * 70 / 75 - this._1t__.height / 2;
         this._1S_O_.x = _q9 / 2 + 100;
         this._1S_O_.y = _P_m * 70 / 75 - this._1t__.height / 2;
         this._1t__.addEventListener(MouseEvent.CLICK,this._1G_4);
      }
      
      private function _12a() : void
      {
         var _loc1_:TextField = null;
         var _loc4_:uint = 0;
         _0gc = new Vector.<TextField>();
         var _loc2_:Vector.<String> = Vector.<String>(["HOW WILL YOU PLAY?","THE FIVE MASTERS OF GOZOR WILL DETERMINE YOUR PRIZE!","HERE\'S WHAT YOU CAN WIN!","Shuffling!","PICK ONE TO WIN A PRIZE!","YOU WON! ITEMS WILL BE PLACED IN YOUR GIFT CHEST","Spin Again?","PICK A SECOND PRIZE!","PLAY AGAIN?","Choose now or I will choose for you!","Determining Prizes!","Sorting Loot!","What can you win?","Big Prizes! Big Orbs! I love it!","Wooah! Awesome lewt!","Processing hadoop data..."]);
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.size = 24;
         _loc3_.font = "Myriad Pr";
         _loc3_.bold = false;
         _loc3_.align = TextFormatAlign.LEFT;
         _loc3_.leftMargin = 0;
         _loc3_.indent = 0;
         _loc3_.leading = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ = new TextField();
            _loc1_.text = _loc2_[_loc4_];
            _loc1_.textColor = 16776960;
            _loc1_.autoSize = TextFieldAutoSize.CENTER;
            _loc1_.selectable = false;
            _loc1_.defaultTextFormat = _loc3_;
            _loc1_.setTextFormat(_loc3_);
            _loc1_.filters = [new GlowFilter(16777215,1,2,2,1.5,1)];
            _0gc.push(_loc1_);
            _loc4_++;
         }
      }
      
      private function setString(param1:int) : void
      {
         if(this.parent == null)
         {
            return;
         }
         if(this._0R_Q_ >= 0 && _0gc[this._0R_Q_].parent != null)
         {
            removeChild(_0gc[this._0R_Q_]);
         }
         if(param1 < 0)
         {
            return;
         }
         this._0R_Q_ = param1;
         var _loc2_:TextField = _0gc[this._0R_Q_];
         _loc2_.x = _q9 / 2 - _loc2_.width / 2;
         _loc2_.y = _P_m * 66 / 75 - _loc2_.height / 2;
         addChild(_0gc[this._0R_Q_]);
      }
      
      private function _0R_o(param1:Event) : void
      {
         this._ef.clicked.removeAll();
         _T_0 = false;
         closed.dispatch();
         closed.removeAll();
         this._0uP_.removeEventListener(TimerEvent.TIMER,this._L_L_);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(Event.REMOVED_FROM_STAGE,this._0R_o);
         this._1D_e._11F_.removeAll();
         this._1D_e.end();
         this._1D_e = null;
         this._0g3();
         this._uV_();
         this._0un.removeEventListener(MouseEvent.ROLL_OVER,this._Z_r);
         this._0un.removeEventListener(MouseEvent.ROLL_OUT,this._1G_m);
         this._0ah.removeEventListener(MouseEvent.ROLL_OVER,this._1G_m);
         this._1S_O_.removeEventListener(MouseEvent.CLICK,this._1gs);
         if(this.gs_ != null)
         {
            this.gs_.currencyDisplay.visible = false;
         }
      }
      
      private function _L_L_(param1:TimerEvent = null) : void
      {
         var _loc2_:_0E_Z_._0qm = null;
         this._1ld++;
         if(this._1wk == null)
         {
            this._1wk = Vector.<_0E_Z_._0qm>([new _0E_Z_._0qm(this._N_4._1__e[this._1ld],_P_I_),new _0E_Z_._0qm(this._N_4._1__e[this._1ld + 1],_P_I_)]);
         }
         if(this._1ld >= this._N_4._1__e.length)
         {
            this._1ld = 0;
         }
         var _loc3_:int = this._1ld % 2;
         if(this._1wk[this._103] != null && this._1wk[this._103].parent != null)
         {
            _loc2_ = this._1wk[this._103];
            this._0pX_(_loc2_,{"alpha":0},this._93);
         }
         var _loc4_:_0E_Z_._0qm = new _0E_Z_._0qm(this._N_4._1__e[this._1ld],_P_I_,true);
         _loc4_.onMouseOver.add(this._xt);
         _loc4_.onMouseOut.add(this._var);
         _loc4_.setXPos(this._0un.getCenterX());
         _loc4_.setYPos(this._0un.getCenterY());
         this._1wk[_loc3_] = _loc4_;
         _loc4_.alpha = 0;
         addChild(_loc4_);
         this._0pX_(_loc4_,{"alpha":1});
         this._103 = _loc3_;
         var _loc5_:Player = GameContext.getInjector().getInstance(_v1).player;
         if(this._O_i != null && _loc5_ != null)
         {
            this._O_i.draw(_loc5_.credits_,0,_loc5_.tokens);
         }
      }
      
      private function _93(param1:GTween) : void
      {
         if(param1.target.parent != null)
         {
            param1.target.parent.removeChild(param1.target);
         }
      }
      
      public function _xt() : void
      {
         this._0uP_.stop();
      }
      
      public function _var() : void
      {
         this._0uP_.start();
         this._L_L_();
      }
      
      public function _X_M_() : void
      {
         this._0uP_.delay = this._1jF_;
         this._0uP_.addEventListener(TimerEvent.TIMER,this._L_L_);
         this._var();
      }
      
      private function _14() : void
      {
         var _loc1_:int = 0;
         this._0uP_.removeEventListener(TimerEvent.TIMER,this._L_L_);
         while(_loc1_ < 2)
         {
            if(this._1wk[_loc1_] != null && this._1wk[_loc1_].parent != null)
            {
               this._1wk[_loc1_].alpha = 0;
               this._1wk[_loc1_].onMouseOut.removeAll();
               this._1wk[_loc1_].onMouseOver.removeAll();
               this._1wk[_loc1_].parent.removeChild(this._1wk[_loc1_]);
            }
            _loc1_++;
         }
         this._xt();
      }
      
      private function _0iG_() : Boolean
      {
         return _18o._1Q_W_;
      }
      
      private function _0pX_(param1:DisplayObject, param2:Object = null, param3:Function = null) : void
      {
         var _loc4_:GTween = new GTween(param1,0.5,param2,{
            "ease":_bY_._0O_C_,
            "onComplete":param3
         });
      }
      
      private function _I_i() : void
      {
         var _loc1_:int = 0;
         var _loc2_:_0E_Z_._1S_B_ = null;
         do
         {
            _loc1_ = int(Math.random() * 3);
            if(this.state == STATE_ROUND_1 || this._C_T_[_loc1_] != this._0C_L_)
            {
               _loc2_ = this._C_T_[_loc1_];
            }
         }
         while(_loc2_ == null);
         
         this._U_u(_loc2_);
      }
      
      protected function _020() : void
      {
         var _loc1_:_0M_k = null;
         this._0jZ_ = new Sprite();
         _loc1_ = new _0M_k(new fortunePlatformEmbed2(),500,500);
         _loc1_.x = -_loc1_.width / 2;
         _loc1_.y = -_loc1_.height / 2;
         this._0jZ_.addChild(_loc1_);
         this._0jZ_.x = _q9 / 2;
         this._0jZ_.y = _wV_;
         this._0jZ_.alpha = 0.25;
         addChild(this._0jZ_);
         this._qr = new Sprite();
         _loc1_ = new _0M_k(new _0lA_(),700,700);
         _loc1_.x = -_loc1_.width / 2;
         _loc1_.y = -_loc1_.height / 2;
         this._qr.addChild(_loc1_);
         this._qr.x = _q9 / 2;
         this._qr.y = _wV_;
         this._qr.alpha = 0.15;
         addChild(this._qr);
      }
      
      override protected function makeModalBackground() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:DisplayObject = new _1bx();
         _loc2_.width = _q9;
         _loc2_.height = _P_m;
         _loc2_.alpha = 0.7;
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      private function _1gs(param1:MouseEvent) : void
      {
         this._1S_O_.removeEventListener(MouseEvent.CLICK,this._1gs);
         this._13F_();
      }
      
      private function _0E_V_(param1:MouseEvent) : void
      {
         this._0K_a(Currency.GOLD);
      }
      
      private function _1G_4(param1:MouseEvent) : void
      {
         this._0K_a(Currency.TOKEN);
      }
      
      private function _0K_a(param1:int) : void
      {
         var _loc2_:DialogSignal = null;
         if(!this._0iG_())
         {
            this._C_R_();
         }
         var _loc3_:Player = GameContext.getInjector().getInstance(_v1).player;
         if(_loc3_ != null)
         {
            if(param1 == Currency.GOLD && this.state == STATE_ROUND_2 && _loc3_.credits_ - this._1V_V_ < 0)
            {
               _loc2_ = GameContext.getInjector().getInstance(DialogSignal);
               _loc2_.dispatch(new NotEnoughGoldDialog());
               return;
            }
            if(param1 == Currency.GOLD && _loc3_.credits_ - this._10Q_ < 0)
            {
               _loc2_ = GameContext.getInjector().getInstance(DialogSignal);
               _loc2_.dispatch(new NotEnoughGoldDialog());
               return;
            }
            if(param1 == Currency.TOKEN && _loc3_.tokens - this._0G_J_ < 0)
            {
               return;
            }
         }
         this._0uP_.delay = this._1S_y;
         this._0un._1U_F_(_0E_Z_._1A_i._N_R_);
         var _loc4_:Object = this._1hT_();
         if(param1 == Currency.TOKEN)
         {
            _loc4_.currency = 2;
         }
         else if(param1 == Currency.GOLD)
         {
            _loc4_.currency = 0;
         }
         else
         {
            return;
         }
         if(this.state == STATE_ROUND_1)
         {
            _loc4_.status = 0;
            this._0un.removeEventListener(MouseEvent.ROLL_OVER,this._Z_r);
         }
         if(this.state == STATE_ROUND_1 && !this.client._1ru())
         {
            this._0g3();
            this._0nN_ = param1 == Currency.GOLD;
            if(_loc3_ != null)
            {
               if(this._0nN_)
               {
                  _loc3_.credits_ = _loc3_.credits_ - this._10Q_;
                  this._O_i.draw(_loc3_.credits_,0,_loc3_.tokens);
               }
               else
               {
                  if(_loc3_.tokens - this._0G_J_ < 0)
                  {
                     return;
                  }
                  _loc3_.tokens = _loc3_.tokens - this._0G_J_;
                  this._O_i.draw(_loc3_.credits_,0,_loc3_.tokens);
               }
            }
            this.client.sendRequest("/account/playFortuneGame",_loc4_);
            this.setString(10 + int(Math.random() * 6));
            this.client.complete.addOnce(this._0d2);
            this._0zs.visible = false;
            this._1t__.visible = false;
         }
         else if(this.state == STATE_ROUND_2)
         {
            this._0g3();
            this._1bd();
            _loc3_ = GameContext.getInjector().getInstance(_v1).player;
            if(_loc3_ != null)
            {
               _loc3_.credits_ = _loc3_.credits_ - this._1V_V_;
               this._O_i.draw(_loc3_.credits_,0,_loc3_.tokens);
            }
            this._0zs.visible = false;
            this._1S_O_.visible = false;
         }
      }
      
      private function _0d2(param1:Boolean, param2:*) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:Player = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:int = 0;
         var _loc8_:* = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:String = null;
         if(param1)
         {
            _loc3_ = new XML(param2);
            _loc4_ = _loc3_.Candidates.split(",");
            _loc5_ = GameContext.getInjector().getInstance(_v1).player;
            if(_loc5_ != null)
            {
               if(_loc3_.hasOwnProperty("Gold"))
               {
                  _loc5_.credits_ = int(_loc3_.Gold);
                  this._O_i.draw(_loc5_.credits_,0,_loc5_.tokens);
               }
               else if(_loc3_.hasOwnProperty("FortuneToken"))
               {
                  _loc5_.tokens = int(_loc3_.FortuneToken);
                  this._O_i.draw(_loc5_.credits_,0,_loc5_.tokens);
               }
            }
            _loc6_ = Vector.<int>([0,2,1]);
            _loc7_ = Math.floor(Math.random() * 3);
            _loc8_ = Math.random() > 0.5;
            _loc9_ = this._0un.getCenterX();
            _loc10_ = this._0un.getCenterY();
            _loc11_ = this._C_T_[_loc6_[_loc7_]].getCenterX();
            _loc12_ = this._C_T_[_loc6_[_loc7_]].getCenterY();
            _loc13_ = 0;
            _loc14_ = _loc9_;
            _loc15_ = _loc10_;
            _loc16_ = 0.25;
            _loc17_ = 1.2;
            this._14();
            for each(_loc18_ in _loc4_)
            {
               if(_loc13_ == 0)
               {
                  new _0W_y(_loc16_,this._0vC_,_loc9_,_loc10_,_loc11_,_loc12_);
                  new _0W_y(_loc16_ + 0.1,this._C_T_[_loc6_[_loc7_]].doItemShow,int(_loc18_));
               }
               else
               {
                  _loc11_ = this._C_T_[_loc6_[_loc7_]].getCenterX();
                  _loc12_ = this._C_T_[_loc6_[_loc7_]].getCenterY();
                  new _0W_y(_loc16_,this._0vC_,_loc14_,_loc15_,_loc11_,_loc12_);
                  new _0W_y(_loc16_ + 0.1,this._C_T_[_loc6_[_loc7_]].doItemShow,int(_loc18_));
               }
               _loc14_ = _loc11_;
               _loc15_ = _loc12_;
               _loc16_ = _loc16_ + _loc17_;
               _loc13_++;
               if(_loc8_)
               {
                  _loc7_ = (_loc7_ + 1) % 3;
               }
               else
               {
                  _loc7_ = --_loc7_ < 0?2:int(_loc7_);
               }
            }
            new _0W_y(this._0Z_J_,this._1bd);
         }
         else
         {
            this._0s7();
         }
      }
      
      private function _1bd() : void
      {
         var _loc1_:int = 0;
         if(this.state == STATE_ROUND_2 && this._0C_L_ != null)
         {
            this._1G_0();
         }
         while(_loc1_ < 3)
         {
            this._C_T_[_loc1_].removeItemReveal();
            this._C_T_[_loc1_].saveReturnPotion();
            this._C_T_[_loc1_].setAnimation(6,7);
            this._C_T_[_loc1_].setAnimationDuration(50);
            _loc1_++;
         }
         this._0mC_(this._0D_N_);
         this._0un._1U_F_(_0E_Z_._1A_i._mI_);
         new _0W_y(this._18r,this._0F_X_);
         this.setString(3);
      }
      
      private function _0F_X_() : void
      {
         var _loc1_:int = 0;
         this._0mC_(this._0do);
         if(this.state == STATE_ROUND_2)
         {
            this.setString(7);
         }
         else
         {
            this.setString(4);
         }
         this._7I_(this._0C_L_);
         this._0un._1U_F_(_0E_Z_._1A_i._10t);
         this._0X_l(this._0un.getCenterX(),this._0un.getCenterY(),10,65535);
         while(_loc1_ < 3)
         {
            if(!(this.state == STATE_ROUND_2 && this._C_T_[_loc1_] == this._0C_L_))
            {
               this._C_T_[_loc1_].setActive2();
               this._C_T_[_loc1_].doItemReturn();
               new _0W_y(this._1D_o,this._0X_l,int(this._C_T_[_loc1_].returnCenterX()),int(this._C_T_[_loc1_].returnCenterY()),5,65535);
               new _0W_y(this._1D_o,this._C_T_[_loc1_].setAnimationPulse);
            }
            _loc1_++;
         }
         if(this._1D_e == null)
         {
            return;
         }
         new _0W_y(this._1D_o,this._0un._1U_F_,_0E_Z_._1A_i._1iP_);
         this._1D_e.start(this._0oR_);
         this._1D_e.setXPos(this._0un.getCenterX());
         this._1D_e.setYPos(this._0un.getCenterY());
         new _0W_y(7,this._1aN_);
         this._1R_T_ = true;
      }
      
      private function _1aN_() : void
      {
         if(this._1D_e != null && this._1D_e._1zO_())
         {
            this.setString(9);
         }
      }
      
      private function _0s7() : void
      {
         var _loc1_:DialogSignal = null;
         _loc1_ = GameContext.getInjector().getInstance(DialogSignal);
         var _loc2_:Dialog = new Dialog("MysteryBoxRollModal.purchaseFailedString","MysteryBoxRollModal.pleaseTryAgainString","MysteryBoxRollModal.okString",null,null);
         _loc2_.addEventListener(Dialog.LEFT_BUTTON,this._19i,false,0,true);
         _loc1_.dispatch(_loc2_);
      }
      
      private function _19i(param1:Event) : void
      {
         var _loc2_:CloseDialogsSignal = null;
         _loc2_ = GameContext.getInjector().getInstance(CloseDialogsSignal);
         _loc2_.dispatch();
      }
      
      private function _C_R_() : void
      {
         var _loc1_:DialogSignal = null;
         _loc1_ = GameContext.getInjector().getInstance(DialogSignal);
         _loc1_.dispatch(new _0I_z("The Alchemist has left the Nexus.Please check back later.","Oh no!"));
      }
      
      private function _1hT_() : Object
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.gameId = this._N_4.id;
         return _loc1_;
      }
      
      private function _04C_(param1:MouseEvent) : void
      {
         this._U_u(param1.currentTarget);
      }
      
      private function _U_u(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(this._C_T_[_loc3_] == param1)
            {
               this._1F_Y_(_loc3_,_loc2_);
               this._C_T_[_loc3_].setAnimationClicked();
            }
            if(this._C_T_[_loc3_] != this._0C_L_)
            {
               _loc2_++;
            }
            this._C_T_[_loc3_].setGlowState(_0E_Z_._1S_B_._D_5);
            _loc3_++;
         }
         this._1R_T_ = false;
      }
      
      private function _1F_Y_(param1:int, param2:int) : void
      {
         var _loc3_:Object = this._1hT_();
         _loc3_.choice = param2;
         _loc3_.status = this.state;
         _loc3_.currency = 0;
         if(!this.client._1ru())
         {
            this._1D_e.remove();
            this._uV_();
            this._0C_L_ = this._C_T_[param1];
            this.client.sendRequest("/account/playFortuneGame",_loc3_);
            this.client.complete.addOnce(this._W_z);
         }
      }
      
      private function _W_z(param1:Boolean, param2:*) : void
      {
         var _loc3_:XML = null;
         var _loc4_:DialogSignal = null;
         if(param1)
         {
            _loc3_ = new XML(param2);
            if(this.state == STATE_ROUND_2)
            {
               new _0W_y(0.25,this._0X_l,this._0C_L_.getCenterX(),this._0C_L_.getCenterY(),6,65535);
               new _0W_y(0.25,this._0C_L_._1kC_,_loc3_.Awards);
               new _0W_y(this.DISPLAY_PRIZE_TIME_2,this._13F_);
            }
            else if(this.state == STATE_ROUND_1)
            {
               this.state = STATE_ROUND_2;
               new _0W_y(this.DISPLAY_PRIZE_TIME_1,this._T_8);
               new _0W_y(0.25,this._0X_l,this._0C_L_.getCenterX(),this._0C_L_.getCenterY(),6,65535);
               new _0W_y(0.25,this._0C_L_._1kC_,_loc3_.Awards);
            }
            new _0W_y(0.5,this.setString,5);
         }
         else
         {
            this._7I_(null);
            _loc4_ = GameContext.getInjector().getInstance(DialogSignal);
            if(this.state == STATE_ROUND_1)
            {
               _loc4_.dispatch(new _0I_z("You have run out of time to choose, but an item has been chosen for you.","Oh no!"));
            }
            else
            {
               _loc4_.dispatch(new _0I_z("You have run out of time to choose.","Oh no!"));
            }
         }
      }
      
      private function _T_8() : void
      {
         this._L_8();
         this._qp();
         this._0zs.setPrice(this._1V_V_,Currency.GOLD);
         this._0zs.visible = true;
         this._1S_O_.visible = true;
         this._1S_O_.addEventListener(MouseEvent.CLICK,this._1gs);
         this.setString(6);
      }
      
      private function _13F_() : void
      {
         var _loc1_:int = 0;
         this.state = STATE_ROUND_1;
         this._uV_();
         this._qp();
         this._0zs.setPrice(this._10Q_,Currency.GOLD);
         this._0zs.visible = true;
         this._1t__.visible = true;
         this._1S_O_.visible = false;
         this._X_M_();
         this.setString(0);
         this._L_8();
         this._0nN_ = false;
         this._0un.addEventListener(MouseEvent.ROLL_OVER,this._Z_r);
         this._0un.reset();
         while(_loc1_ < 3)
         {
            this._C_T_[_loc1_].resetVars();
            _loc1_++;
         }
         this._W_R_();
      }
      
      private function _L_8() : void
      {
         this.radius = _k9;
         this._xJ_ = 0;
         this._0L_3 = 8;
         this._02g = 0;
      }
      
      private function _0g3() : void
      {
         this._0zs.removeEventListener(MouseEvent.CLICK,this._0E_V_);
         this._1t__.removeEventListener(MouseEvent.CLICK,this._1G_4);
      }
      
      private function _qp() : void
      {
         if(this.state == STATE_ROUND_1)
         {
            this._1t__.addEventListener(MouseEvent.CLICK,this._1G_4);
         }
         this._0zs.addEventListener(MouseEvent.CLICK,this._0E_V_);
      }
      
      private function _uV_() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            this._C_T_[_loc1_].removeEventListener(MouseEvent.CLICK,this._04C_);
            _loc1_++;
         }
      }
      
      private function _7I_(param1:_0E_Z_._1S_B_ = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            if(this._C_T_[_loc2_] == param1)
            {
               this._C_T_[_loc2_].removeEventListener(MouseEvent.CLICK,this._04C_);
            }
            else
            {
               this._C_T_[_loc2_].addEventListener(MouseEvent.CLICK,this._04C_);
               this._C_T_[_loc2_].setMouseTracking(true);
            }
            _loc2_++;
         }
      }
      
      private function _W_R_() : void
      {
         var _loc1_:Number = NaN;
         var _loc3_:int = 0;
         var _loc2_:int = _k9;
         while(_loc3_ < 3)
         {
            _loc1_ = ((_loc3_ + 1) * 120 - 60) * Math.PI / 180;
            this._C_T_[_loc3_].setXPos(this._0un.getCenterX() + _loc2_ * Math.sin(_loc1_));
            this._C_T_[_loc3_].setYPos(this._0un.getCenterY() + _loc2_ * Math.cos(_loc1_));
            if(this._C_T_[_loc3_].parent == null)
            {
               addChild(this._C_T_[_loc3_]);
            }
            else if(this._C_T_[_loc3_].visible == false)
            {
               this._C_T_[_loc3_].visible = true;
            }
            this._C_T_[_loc3_].removeItemReveal();
            this._C_T_[_loc3_].setInactive();
            this._C_T_[_loc3_].reset();
            _loc3_++;
         }
         this._0C_L_ = null;
      }
      
      private function _1G_0() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = _k9;
         if(this._0C_L_ != null && this._0C_L_.parent)
         {
            this._0C_L_.visible = false;
            this._0C_L_.setInactive();
         }
         while(_loc4_ < 3)
         {
            if(this._C_T_[_loc4_] != this._0C_L_)
            {
               _loc1_ = (_loc2_ * 120 - 60) * Math.PI / 180;
               this._C_T_[_loc4_].setXPos(this._0un.getCenterX() + _loc3_ * Math.sin(_loc1_));
               this._C_T_[_loc4_].setYPos(this._0un.getCenterY() + _loc3_ * Math.cos(_loc1_));
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      public function _hI_() : void
      {
         var _loc1_:Number = NaN;
         var _loc3_:int = 0;
         var _loc2_:int = 200 * Math.abs(int(getTimer() / 2) % 1000 - 500) / 1000;
         if(this._02g < this._0W_m)
         {
            this._02g = this._02g + 4;
         }
         while(_loc3_ < 3)
         {
            _loc1_ = ((_loc3_ + 1) * (120 + this._02g) - 60 - getTimer()) * Math.PI / 180;
            this._C_T_[_loc3_].setXPos(this._0un.getCenterX() + this.radius * Math.sin(_loc1_));
            this._C_T_[_loc3_].setYPos(this._0un.getCenterY() + this.radius * Math.cos(_loc1_));
            _loc3_++;
         }
         if(this.radius == _k9)
         {
            this._0L_3 = this._0L_3 * -1;
         }
         if(this.radius < 0)
         {
            this.radius = 0;
         }
         else if(this._02g == this._0W_m)
         {
            this.radius = this.radius - this._0L_3 * 2.85 / this._18r;
         }
      }
      
      public function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:int = getTimer();
         var _loc4_:int = _loc3_ - this.lastUpdate_;
         _0ty = mouseX;
         _0zl = mouseY;
         if(this._1B_B_ == this._0D_N_)
         {
            this._hI_();
            this._0un.setAnimationDuration(this._0W_m + 80 - this._02g);
         }
         while(_loc5_ < 3)
         {
            this._C_T_[_loc5_].update(_loc3_,_loc4_);
            _loc5_++;
         }
         this._0bJ_(this._0jZ_,0.1);
         this._0bJ_(this._qr,-0.15);
         if(this._1R_T_)
         {
            _loc2_ = Math.random();
            if(_loc2_ < 0.05)
            {
               this._C_T_[int(_loc2_ * 200 % 3)].setShake(true);
            }
         }
         this.draw(_loc3_,_loc4_);
      }
      
      public function _0bJ_(param1:DisplayObject, param2:Number) : void
      {
         if(param2 < 0)
         {
            param2 = param2 * -1;
            param1.rotation = Math.abs(param1.rotation - param2 + 360) % 360;
         }
         else
         {
            param1.rotation = (param1.rotation + param2) % 360;
         }
      }
      
      public function draw(param1:int, param2:int) : void
      {
         this._0un._1G_l(param1,param2);
         this._0ig.update(param1,param2);
         this._0ig.draw(null,param1);
         this.lastUpdate_ = param1;
      }
      
      private function _0X_l(param1:Number, param2:Number, param3:int = 20, param4:int = 12447231) : void
      {
         var _loc5_:GameObject = null;
         var _loc6_:_G_Q_ = null;
         if(this._0ig != null)
         {
            _loc5_ = new GameObject(null);
            _loc5_.x_ = _1C_n._1tD_(param1);
            _loc5_.y_ = _1C_n._1tD_(param2);
            _loc6_ = new _G_Q_(_loc5_,param3,param4);
            this._0ig.addObj(_loc6_,_loc5_.x_,_loc5_.y_);
         }
      }
      
      private function _0vC_(param1:Number, param2:Number, param3:Number, param4:Number, param5:int = 200, param6:int = 12447231) : void
      {
         if(this.parent == null)
         {
            return;
         }
         var _loc7_:GameObject = new GameObject(null);
         _loc7_.x_ = _1C_n._1tD_(param1);
         _loc7_.y_ = _1C_n._1tD_(param2);
         var _loc8_:_H_Q_ = new _H_Q_();
         _loc8_.x_ = _1C_n._1tD_(param3);
         _loc8_.y_ = _1C_n._1tD_(param4);
         var _loc9_:_1D_9 = new _1D_9(_loc7_,_loc8_,param6,param5);
         this._0ig.addObj(_loc9_,_loc7_.x_,_loc7_.y_);
      }
      
      private function _0mC_(param1:int) : void
      {
         this._1B_B_ = param1;
      }
   }
}
