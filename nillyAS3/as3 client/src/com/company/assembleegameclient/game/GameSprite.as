package com.company.assembleegameclient.game
{
   import flash.filters.ColorMatrixFilter;
   import Packets.Server.MapInfo;
   import _0H_6.GameContext;
   import _0Z_d._0D_M_;
   import _0Z_d._ee;
   import com.company.util.MoreColorUtil;
   import _f7.Signal;
   import _Y_8.Chat;
   import com.company.assembleegameclient.ui.RankDisplay;
   import com.company.assembleegameclient.ui.GuildDisplay;
   import _1S_e.CurrencyDisplay;
   import _1S_e.GiftDisplay;
   import _1S_e.ArenaDisplay;
   import _1S_e.PrivateMessageDisplay;
   import _1S_e.NewsDisplay;
   import _bv.AnnounceDisplay;
   import _1U_P_._02M_;
   import _1U_P_._08Q_;
   import _v4._f0;
   import _Z_U_._117;
   import _0b6._I_A_;
   import _1y1._al;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.DisplayObject;
   import _Y_M_.PlayerMenu;
   import _0C_j.PackageButton;
   import _06._1P_b;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.objects.Player;
   import _05g.UserHud;
   import _7i._0P_E_;
   import com.company.assembleegameclient.map.Map;
   import _aW_.IWebRequest;
   import _4u.Account;
   import com.company.util._l5;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.Event;
   import Queue.QueueEvent;
   import _T_E_._0Z_v;
   import _1C_p.News;
   import flash.external.ExternalInterface;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.assembleegameclient.objects._1kF_;
   import _1pm._1Y_F_;
   import com.company.assembleegameclient.objects.Pet;
   import com.company.util.PointUtil;
   import flash.display.StageScaleMode;
   import _V_E_.R3D;
   import flash.utils.getTimer;
   import _1iT_.CurrencyEvent;
   import _2f.TimedTask;
   import _2f.TimedFunctionCall;
   import com.company.util._1eD_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.assembleegameclient.objects.Projectile;
   import _ll.Music;
   import _0hJ_.Server;
   import flash.utils.ByteArray;
   import _v4.Client;
   import flash.display.Sprite;
   import Packets.PacketManager;
   import _1S_e.GlobalArenaInformation;
   
   public class GameSprite extends GameSpriteBase
   {
      
      protected static const GrayOverlay:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
       
      
      public const _0rU_:Signal = new Signal(String,int);
      
      public const _0J_7:Signal = new Signal();
      
      public const _11X_:Signal = new Signal(Player);
      
      public var chat_:Chat;
      
      public var isNexus_:Boolean = false;
      
      public var _idleWatch:com.company.assembleegameclient.game.IdleWatch;
      
      public var rankDisplay:RankDisplay;
      
      public var guildDisplay:GuildDisplay;
      
      public var currencyDisplay:CurrencyDisplay;
      
      public var giftDisplay:GiftDisplay;
      
      public var arenaDisplay:ArenaDisplay;
      
      public var privateMessageDisplay:PrivateMessageDisplay;
      
      public var newsDisplay:NewsDisplay;
      
      public var announceDisplay:AnnounceDisplay;
      
      public var _1dJ_:_02M_;
      
      public var _1yw:_08Q_;
      
      public var _0X_p:_f0;
      
      public var _19F_:_117;
      
      public var _yM_:_I_A_;
      
      public var _1m8:Signal;
      
      public var _F_D_:_al;
      
      private var focus:GameObject;
      
      private var _elapsedMS:int = 0;
      
      private var _tickCount:int = 0;
      
      private var _connected:Boolean;
      
      private var nextInfoOffset:uint = 4;
      
      private var offerDisplay:DisplayObject;
      
      private var infoOffset:Number;
      
      public var _0wN_:PlayerMenu;
      
      public var specialOffer:PackageButton;
      
      public var packageOffer:_1P_b;
      
      private var initialized:Boolean;
      
      public function GameSprite(param1:Server, param2:int, param3:Boolean, param4:int, param5:int, param6:ByteArray, param7:Client, param8:String, param9:Boolean)
      {
         this._1m8 = new Signal();
         this.offerDisplay = new Sprite();
         super();
         model = param7;
         map = new Map(this);
         addChild(map);
         gsc_ = new PacketManager(this,param1,param2,param3,param4,param5,param6,param8,param9);
         mui_ = new HotKeys(this);
         this.chat_ = new Chat();
         this.chat_.list.addEventListener(MouseEvent.MOUSE_DOWN,this._1fl);
         this.chat_.list.addEventListener(MouseEvent.MOUSE_UP,this._1H_H_);
         addChild(this.chat_);
         this._idleWatch = new com.company.assembleegameclient.game.IdleWatch();
         (GameContext.getInjector().getInstance(GlobalArenaInformation) as GlobalArenaInformation).reset();
      }
      
      public static function _fp(param1:MapInfo) : void
      {
         var _loc2_:_0D_M_ = GameContext.getInjector().getInstance(_0D_M_);
         _loc2_ && _loc2_.dispatch(param1);
      }
      
      private static function _0K_1() : void
      {
         var _loc1_:_ee = GameContext.getInjector().getInstance(_ee);
         _loc1_ && _loc1_.dispatch();
      }
      
      public function _1fl(param1:MouseEvent) : void
      {
         if(this._0wN_ != null)
         {
            this._1j2();
         }
         mui_.onMouseDown(param1);
      }
      
      public function _1H_H_(param1:MouseEvent) : void
      {
         mui_.onMouseUp(param1);
      }
      
      override public function setFocus(param1:GameObject, param2:Boolean = false) : void
      {
         param1 = param1 || map.player_;
         this.focus = param1;
         if(param2)
         {
            map.spectatePlayer = param1 as Player;
         }
      }
      
      public function _9P_(param1:Player, param2:Number, param3:Number, param4:String = null, param5:Boolean = false, param6:Boolean = false) : void
      {
         this._1j2();
         this._0wN_ = new PlayerMenu();
         if(param4 == null)
         {
            this._0wN_.init(this,param1);
         }
         else if(param6)
         {
            this._0wN_._0N_P_(this,param4,param5,param6);
         }
         else
         {
            if(param4.length > 0 && (param4.charAt(0) == "#" || param4.charAt(0) == "*" || param4.charAt(0) == "@"))
            {
               return;
            }
            this._0wN_._0N_P_(this,param4,param5);
         }
         addChild(this._0wN_);
      }
      
      public function _1j2() : void
      {
         if(this._0wN_ != null && this._0wN_.parent != null)
         {
            removeChild(this._0wN_);
            this._0wN_ = null;
         }
      }
      
      override public function applyMapInfo(param1:MapInfo) : void
      {
         map.setProps(param1.width_,param1.height_,param1.name_,param1.background_,param1.allowPlayerTeleport_,param1.showDisplays_);
         _fp(param1);
      }
      
      public function _a__() : void
      {
         hudView = new UserHud();
         hudView.x = 600;
         addChild(hudView);
      }
      
      override public function initialize() : void
      {
         var _loc1_:_0P_E_ = null;
         map.initialize();
         this._0J_7.dispatch();
         if(this.evalIsNotInCombatMapArea())
         {
            this._8t();
         }
         if(map.name_ == "Arena" || map.name_ == "DeathArena")
         {
            this._V_G_();
            this._1U_2();
         }
         this.isNexus_ = map.name_ == Map._Nexus;
         if(this.isNexus_ || map.name_ == Map._DailyQuestRoom)
         {
            this.currencyDisplay = new CurrencyDisplay(this,true,true);
         }
         else
         {
            this.currencyDisplay = new CurrencyDisplay(this);
         }
         this.currencyDisplay.x = 594;
         this.currencyDisplay.y = 0;
         addChild(this.currencyDisplay);
         var _loc2_:IWebRequest = GameContext.getInjector().getInstance(IWebRequest);
         var _loc3_:Account = GameContext.getInjector().getInstance(Account);
         var _loc4_:Object = {
            "game_net_user_id":_loc3_._00Z_(),
            "game_net":_loc3_._L_y(),
            "play_platform":_loc3_._0fT_()
         };
         _l5._0an(_loc4_,_loc3_.credentials());
         if(map.name_ != "Kitchen" && map.name_ != "Tutorial" && map.name_ != "Nexus Explanation" && Parameters.data_.watchForTutorialExit == true)
         {
            Parameters.data_.watchForTutorialExit = false;
            this._0sV_("rotmg.Marketing.track(\"tutorialComplete\")");
            _loc4_["fteStepCompleted"] = 9900;
            _loc2_.sendRequest("/log/logFteStep",_loc4_);
         }
         if(map.name_ == "Kitchen")
         {
            _loc4_["fteStepCompleted"] = 200;
            _loc2_.sendRequest("/log/logFteStep",_loc4_);
         }
         if(map.name_ == "Tutorial")
         {
            if(Parameters.data_.needsTutorial == true)
            {
               Parameters.data_.watchForTutorialExit = true;
               this._0sV_("rotmg.Marketing.track(\"install\")");
               _loc4_["fteStepCompleted"] = 100;
               _loc2_.sendRequest("/log/logFteStep",_loc4_);
            }
            this._R_9();
         }
         else if(map.name_ != "Arena" && map.name_ != "Kitchen" && map.name_ != "Nexus Explanation" && map.name_ != "Vault Explanation" && map.name_ != "Guild Explanation" && !this.evalIsNotInCombatMapArea() && Parameters.data_.showProtips)
         {
            _loc1_ = GameContext.getInjector().getInstance(_0P_E_);
            _loc1_ && _loc1_.dispatch();
         }
         Parameters.save();
         _0K_1();
         stage.dispatchEvent(new Event(Event.RESIZE));
         dispatchEvent(new Event(QueueEvent.DESTROY));
         this.initialized = true;
      }
      
      private function _8t() : void
      {
         this.addRankDisplay();
         this.addGuildDisplay();
         this._1K_F_();
         this.addGiftDisplay();
         if("production".toLowerCase() == "dev" || Player.isAdmin || "production".toLowerCase() == "localhost")
         {
            this.addNewsDisplay();
         }
         this.addAnnounceDisplay();
      }
      
      private function _V_G_() : void
      {
         this._1dJ_ = new _02M_();
         this._1dJ_.y = 5;
         addChild(this._1dJ_);
      }
      
      private function _1U_2() : void
      {
         this._1yw = new _08Q_();
         this._1yw.y = 5;
         this._1yw.x = 5;
         addChild(this._1yw);
      }
      
      private function addAnnounceDisplay() : void
      {
         this.announceDisplay = new AnnounceDisplay();
         this.announceDisplay.x = 300 - this.announceDisplay.width / 2;
         this.announceDisplay.y = 5 + _0Z_v.INFO_SPACING;
         addChild(this.announceDisplay);
      }
      
      private function addGiftDisplay() : void
      {
         this.giftDisplay = new GiftDisplay();
         this.giftDisplay.x = 6;
         this.giftDisplay.y = this.nextInfoOffset + 2;
         this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         addChild(this.giftDisplay);
      }
      
      private function addArenaDisplay() : void
      {
         this.arenaDisplay = new ArenaDisplay(this);
         this.arenaDisplay.x = 6;
         this.arenaDisplay.y = this.nextInfoOffset + 2;
         this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         addChild(this.arenaDisplay);
      }
      
      private function addPrivateMessageDisplay() : void
      {
         this.privateMessageDisplay = new PrivateMessageDisplay(this);
         this.privateMessageDisplay.x = 6;
         this.privateMessageDisplay.y = this.nextInfoOffset + 2;
         this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         addChild(this.privateMessageDisplay);
      }
      
      private function addNewsDisplay(param1:Boolean = true) : void
      {
         var _loc2_:NewsDisplay = null;
         var _loc3_:News = GameContext.getInjector().getInstance(News);
         if(!_loc3_.hasItems())
         {
            return;
         }
         _loc2_ = new NewsDisplay();
         _loc2_.x = 6;
         _loc2_.y = 92;
         if(param1)
         {
            this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         }
         if(this.newsDisplay != null)
         {
            removeChild(this.newsDisplay);
         }
         this.newsDisplay = _loc2_;
         addChild(this.newsDisplay);
      }
      
      public function _Q_S_() : void
      {
         this.addNewsDisplay(false);
      }
      
      private function _1K_F_() : void
      {
         this.infoOffset = this.nextInfoOffset + 2;
         this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         this.setOfferPos();
      }
      
      private function setOfferPos() : void
      {
         this.offerDisplay.x = 6;
         this.offerDisplay.y = this.infoOffset;
      }
      
      public function _13Z_() : void
      {
         if(!this.evalIsNotInCombatMapArea())
         {
            return;
         }
         this.packageOffer = new _1P_b();
         this.addOfferDisplay(this.packageOffer);
      }
      
      public function _18g() : void
      {
         if(!this.evalIsNotInCombatMapArea())
         {
            return;
         }
         this.specialOffer = new PackageButton();
         this.addOfferDisplay(this.specialOffer);
      }
      
      private function addOfferDisplay(param1:DisplayObject) : void
      {
         this.offerDisplay = param1;
         addChild(this.offerDisplay);
         this.setOfferPos();
      }
      
      private function addGuildDisplay() : void
      {
         this.guildDisplay = new GuildDisplay("",-1);
         this.guildDisplay.x = 64;
         this.guildDisplay.y = 6;
         addChild(this.guildDisplay);
      }
      
      private function addRankDisplay() : void
      {
         this.rankDisplay = new RankDisplay(-1,true,false,0,false);
         this.rankDisplay.x = 8;
         this.rankDisplay.y = this.nextInfoOffset;
         this.nextInfoOffset = this.nextInfoOffset + _0Z_v.INFO_SPACING;
         addChild(this.rankDisplay);
      }
      
      private function _0sV_(param1:String) : void
      {
         if(ExternalInterface.available == false)
         {
            return;
         }
         try
         {
            ExternalInterface.call(param1);
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function _R_9() : void
      {
         tutorial_ = new Tutorial(this);
         addChild(tutorial_);
      }
      
      private function _1a7() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:GameObject = null;
         var _loc3_:_1kF_ = null;
         var _loc6_:_1kF_ = null;
         if(!map || !map.player_)
         {
            return;
         }
         var _loc4_:Player = map.player_;
         var _loc5_:Number = _1Y_F_._1M_d;
         var _loc7_:Number = _loc4_.x_;
         var _loc8_:Number = _loc4_.y_;
         for each(_loc2_ in map.goDict_)
         {
            _loc3_ = _loc2_ as _1kF_;
            if(_loc3_ && (!(_loc3_ is Pet) || this.map.isPetYard))
            {
               if(Math.abs(_loc7_ - _loc2_.x_) < _1Y_F_._1M_d || Math.abs(_loc8_ - _loc2_.y_) < _1Y_F_._1M_d)
               {
                  _loc1_ = PointUtil.getDistance(_loc2_.x_,_loc2_.y_,_loc7_,_loc8_);
                  if(_loc1_ < _1Y_F_._1M_d && _loc1_ < _loc5_)
                  {
                     _loc5_ = _loc1_;
                     _loc6_ = _loc3_;
                  }
               }
            }
         }
         this._0X_p._0c8 = _loc6_;
      }
      
      private function _N_z() : Boolean
      {
         return true;
      }
      
      public function onScreenResize(param1:Event) : void
      {
         var _loc2_:Boolean = Parameters.data_["uiscale"];
         var _loc3_:Boolean = true;
         var _loc4_:Boolean = true;
         var _loc5_:Boolean = true;
         var _loc6_:Boolean = true;
         var _loc7_:Boolean = true;
         var _loc8_:Boolean = true;
         var _loc9_:Boolean = true;
         var _loc10_:Boolean = true;
         var _loc11_:Boolean = true;
         var _loc12_:Number = 800 / stage.stageWidth;
         var _loc13_:Number = 600 / stage.stageHeight;
         if(this.map != null && _loc3_)
         {
            this.map.scaleX = _loc12_ * (stage.scaleMode != StageScaleMode.EXACT_FIT?Parameters.data_["mscale"]:1);
            this.map.scaleY = _loc13_ * (stage.scaleMode != StageScaleMode.EXACT_FIT?Parameters.data_["mscale"]:1);
         }
         if(this.hudView != null)
         {
            if(_loc2_)
            {
               this.hudView.scaleX = _loc12_ / _loc13_;
               this.hudView.scaleY = 1;
               this.hudView.y = 0;
            }
            else if(_loc4_)
            {
               this.hudView.scaleX = _loc12_;
               this.hudView.scaleY = _loc13_;
               this.hudView.y = 300 * (1 - _loc13_);
            }
            this.hudView.x = 800 - 200 * this.hudView.scaleX;
            if(this.currencyDisplay != null)
            {
               this.currencyDisplay.x = this.hudView.x - 6 * this.currencyDisplay.scaleX;
            }
         }
         if(this.newsDisplay != null)
         {
            this.newsDisplay.x = (800 - (200 * this.hudView.scaleX + 115 * this.newsDisplay.scaleX)) / 2;
         }
         if(this.chat_ != null)
         {
            if(_loc2_)
            {
               this.chat_.scaleX = _loc12_ / _loc13_;
               this.chat_.scaleY = 1;
            }
            else if(_loc5_)
            {
               this.chat_.scaleX = _loc12_;
               this.chat_.scaleY = _loc13_;
            }
            this.chat_.y = 300 + 300 * (1 - this.chat_.scaleY);
         }
         if(this.rankDisplay != null)
         {
            if(_loc2_)
            {
               this.rankDisplay.scaleX = _loc12_ / _loc13_;
               this.rankDisplay.scaleY = 1;
            }
            else if(_loc6_)
            {
               this.rankDisplay.scaleX = _loc12_;
               this.rankDisplay.scaleY = _loc13_;
            }
            this.rankDisplay.x = 8 * this.rankDisplay.scaleX;
            this.rankDisplay.y = 4 * this.rankDisplay.scaleY;
         }
         if(this.guildDisplay != null)
         {
            if(_loc2_)
            {
               this.guildDisplay.scaleX = _loc12_ / _loc13_;
               this.guildDisplay.scaleY = 1;
            }
            else if(_loc7_)
            {
               this.guildDisplay.scaleX = _loc12_;
               this.guildDisplay.scaleY = _loc13_;
            }
            this.guildDisplay.x = this.rankDisplay.width + 16 * this.guildDisplay.scaleX;
            this.guildDisplay.y = 6 * this.guildDisplay.scaleY;
         }
         if(this.currencyDisplay != null)
         {
            if(_loc2_)
            {
               this.currencyDisplay.scaleX = _loc12_ / _loc13_;
               this.currencyDisplay.scaleY = 1;
            }
            else if(_loc8_)
            {
               this.currencyDisplay.scaleX = _loc12_;
               this.currencyDisplay.scaleY = _loc13_;
            }
         }
         if(this.specialOffer != null)
         {
            if(_loc2_)
            {
               this.specialOffer.scaleX = _loc12_ / _loc13_;
               this.specialOffer.scaleY = 1;
            }
            else if(_loc9_)
            {
               this.specialOffer.scaleX = _loc12_;
               this.specialOffer.scaleY = _loc13_;
            }
            this.specialOffer.x = 6 * this.specialOffer.scaleX;
            this.specialOffer.y = 34 * this.specialOffer.scaleY;
         }
         if(this.giftDisplay != null)
         {
            if(_loc2_)
            {
               this.giftDisplay.scaleX = _loc12_ / _loc13_;
               this.giftDisplay.scaleY = 1;
            }
            else if(_loc10_)
            {
               this.giftDisplay.scaleX = _loc12_;
               this.giftDisplay.scaleY = _loc13_;
            }
            this.giftDisplay.x = 6 * this.giftDisplay.scaleX;
            this.giftDisplay.y = 60 * this.giftDisplay.scaleY;
         }
         if(this.arenaDisplay != null)
         {
            if(_loc2_)
            {
               this.arenaDisplay.scaleX = _loc12_ / _loc13_;
               this.arenaDisplay.scaleY = 1;
            }
            else if(_loc10_)
            {
               this.arenaDisplay.scaleX = _loc12_;
               this.arenaDisplay.scaleY = _loc13_;
            }
            this.arenaDisplay.x = 6 * this.arenaDisplay.scaleX;
            this.arenaDisplay.y = 86 * this.arenaDisplay.scaleY;
         }
         if(this.privateMessageDisplay != null)
         {
            if(_loc2_)
            {
               this.privateMessageDisplay.scaleX = _loc12_ / _loc13_;
               this.privateMessageDisplay.scaleY = 1;
            }
            else if(_loc10_)
            {
               this.privateMessageDisplay.scaleX = _loc12_;
               this.privateMessageDisplay.scaleY = _loc13_;
            }
            this.privateMessageDisplay.x = 6 * this.arenaDisplay.scaleX;
            this.privateMessageDisplay.y = 112 * this.arenaDisplay.scaleY;
         }
         if(this.packageOffer != null)
         {
            if(_loc2_)
            {
               this.packageOffer.scaleX = _loc12_ / _loc13_;
               this.packageOffer.scaleY = 1;
            }
            else if(_loc11_)
            {
               this.packageOffer.scaleX = _loc12_;
               this.packageOffer.scaleY = _loc13_;
            }
            this.packageOffer.x = 6 * this.packageOffer.scaleX;
            this.packageOffer.y = 32 * this.packageOffer.scaleY;
         }
         if(this.newsDisplay != null)
         {
            if(_loc2_)
            {
               this.newsDisplay.scaleX = _loc12_ / _loc13_;
               this.newsDisplay.scaleY = 1;
            }
            else if(_loc11_)
            {
               this.newsDisplay.scaleX = _loc12_;
               this.newsDisplay.scaleY = _loc13_;
            }
         }
         if(map != null)
         {
            map.resetOverlays();
         }
      }
      
      public function connect() : void
      {
         if(!this._connected)
         {
            this._connected = true;
            R3D.Ready = true;
            gsc_.connect();
            this._idleWatch.start(this);
            lastUpdate_ = getTimer();
            stage.addEventListener(CurrencyEvent.MONEY_CHANGED,this.onMoneyChanged);
            stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            if(Parameters.data_["mscale"] == undefined)
            {
               Parameters.data_["mscale"] = "1.0";
               Parameters.save();
            }
            if(Parameters.data_["stageScale"] == undefined)
            {
               Parameters.data_["stageScale"] = StageScaleMode.NO_SCALE;
               Parameters.save();
            }
            if(Parameters.data_["uiscale"] == undefined)
            {
               Parameters.data_["uiscale"] = true;
               Parameters.save();
            }
            stage.scaleMode = Parameters.data_["stageScale"];
            stage.addEventListener(Event.RESIZE,this.onScreenResize);
            stage.dispatchEvent(new Event(Event.RESIZE));
            Cursor.setMouseIcon();
            TimedTask.addTask(new TimedFunctionCall(100,this._1a7));
         }
      }
      
      public function disconnect() : void
      {
         if(!this._connected)
         {
            return;
         }
         this._connected = false;
         R3D.Ready = false;
         this._idleWatch.stop();
         stage.removeEventListener(CurrencyEvent.MONEY_CHANGED,this.onMoneyChanged);
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.removeEventListener(Event.RESIZE,this.onScreenResize);
         stage.scaleMode = StageScaleMode.EXACT_FIT;
         stage.dispatchEvent(new Event(Event.RESIZE));
         dispatchEvent(new Event(QueueEvent.DESTROY));
         TimedTask.destroyAll();
         contains(map) && removeChild(map);
         map.dispose();
         _1eD_.clear();
         TextureRedrawer.clearCache();
         Projectile.dispose();
         gsc_.disconnect();
      }
      
      private function onMoneyChanged(param1:Event) : void
      {
         gsc_.checkCredits();
      }
      
      override public function evalIsNotInCombatMapArea() : Boolean
      {
         return map.name_ == Map._Nexus || map.name_ == Map._Vault || map.name_ == Map._GuildHall || map.name_ == Map._ClothBazaar || map.name_ == Map._NexusExplaination || map.name_ == Map._DailyQuestRoom || map.name_ == Map._Marketplace;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:int = _loc2_ - lastUpdate_;
         this.gsc_.serverConnection.sendPendingMessages();
         if(Parameters.data_["mscale"] < 0.5)
         {
            Parameters.data_["mscale"] = 0.5;
         }
         if(Parameters.data_["mscale"] > 5)
         {
            Parameters.data_["mscale"] = 5;
         }
         Music.UpdateFade();
         if(this.initialized && this._idleWatch.Update(_loc3_))
         {
            closed.dispatch();
            return;
         }
         TimedTask.runTasks(_loc2_);
         var _loc4_:int = getTimer();
         map.update(_loc2_,_loc3_);
         this._0rU_.dispatch("Map.update",getTimer() - _loc4_);
         camera_.update(_loc3_);
         var _loc5_:Player = map.player_;
         if(this.focus)
         {
            camera_.ConfigureCamera(this.focus,!!_loc5_?Boolean(_loc5_.isHallucinating()):false,!!_loc5_?Boolean(_loc5_.isPartyVision()):false,!!_loc5_?Boolean(_loc5_.isXMasVision()):false);
            map.draw(camera_,_loc2_);
         }
         if(_loc5_ != null)
         {
            this.currencyDisplay.draw(_loc5_.credits_,_loc5_.currentFame_,_loc5_.tokens);
            this._11X_.dispatch(_loc5_);
            if(this.evalIsNotInCombatMapArea())
            {
               this.rankDisplay.draw(_loc5_.numStars_,_loc5_.rank_,_loc5_.admin_);
               this.guildDisplay.draw(_loc5_.guildName_,_loc5_.guildRank_);
               this.guildDisplay.x = this.rankDisplay.width + 16 * this.guildDisplay.scaleX;
            }
            if(_loc5_.isPaused())
            {
               hudView.filters = [GrayOverlay];
               map.mouseEnabled = false;
               map.mouseChildren = false;
               hudView.mouseEnabled = false;
               hudView.mouseChildren = false;
            }
            else if(hudView.filters.length > 0)
            {
               hudView.filters = [];
               map.mouseEnabled = true;
               map.mouseChildren = true;
               hudView.mouseEnabled = true;
               hudView.mouseChildren = true;
            }
            moveRecords_.addRecord(_loc2_,_loc5_.x_,_loc5_.y_);
         }
         lastUpdate_ = _loc2_;
         this._0rU_.dispatch("GameSprite.loop",getTimer() - _loc2_);
      }
      
      public function _0K_D_(param1:Boolean) : void
      {
      }
   }
}
