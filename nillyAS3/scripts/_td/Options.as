package _td
{
   import flash.display.Sprite;
   import _C_._1O_I_;
   import _1xa._1eo;
   import _1xa.SText;
   import _1xa._dU_;
   import com.company.assembleegameclient.ui.StatusBar;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.Cursor;
   import com.company.assembleegameclient.game.GameSprite;
   import _W_Q_.TextButton;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.system.Capabilities;
   import flash.events.KeyboardEvent;
   import com.company.util.Keys;
   import flash.display.StageDisplayState;
   import _ll.Music;
   import _ll._1C_c;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import com.company.rotmg.graphics.ScreenGraphic;
   
   public class Options extends Sprite
   {
      
      private static const _11J_:Vector.<String> = new <String>[_1O_I_._1A_X_,_1O_I_._0aN_,_1O_I_._1I_V_,_1O_I_._O_F_,_1O_I_.OptionsHpBars,_1O_I_._1yD_];
      
      public static const _02H_:int = 550;
      
      public static const _0K_k:String = "chatCommand";
      
      public static const _02d:String = "chat";
      
      public static const _1hx:String = "tell";
      
      public static const _1ip:String = "guildChat";
      
      public static const _1Q_4:String = "scrollChatUp";
      
      public static const _1qE_:String = "scrollChatDown";
       
      
      private var gs_:GameSprite;
      
      private var _1oK_:TextButton;
      
      private var _0s2:TextButton;
      
      private var _1B_H_:TextButton;
      
      private var _R_7:Vector.<_td._1G_E_>;
      
      private var selected_:_td._1G_E_ = null;
      
      private var _1Z_H_:Vector.<Sprite>;
      
      public function Options(param1:GameSprite)
      {
         var _loc2_:int = 0;
         var _loc3_:_td._1G_E_ = null;
         var _loc4_:SimpleText = null;
         var _loc5_:int = 0;
         this._R_7 = new Vector.<_td._1G_E_>();
         this._1Z_H_ = new Vector.<Sprite>();
         super();
         this.gs_ = param1;
         graphics.clear();
         graphics.beginFill(2829099,0.8);
         graphics.drawRect(0,0,800,600);
         graphics.endFill();
         graphics.lineStyle(1,6184542);
         graphics.moveTo(0,100);
         graphics.lineTo(800,100);
         graphics.lineStyle();
         _loc4_ = new SimpleText().setSize(36).setColor(16777215);
         _loc4_.setBold(true);
         _loc4_.setStringBuilder(new _dU_().setParams(_1O_I_._1l0));
         _loc4_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc4_.filters = [new DropShadowFilter(0,0,0)];
         _loc4_.x = 800 / 2 - _loc4_.width / 2;
         _loc4_.y = 8;
         addChild(_loc4_);
         addChild(new ScreenGraphic());
         this._1oK_ = new TextButton(_1O_I_._064,36,false);
         this._1oK_.setVerticalAlign(SimpleText.MIDDLE);
         this._1oK_.setAutoSize(TextFieldAutoSize.CENTER);
         this._1oK_.addEventListener(MouseEvent.CLICK,this._x6);
         addChild(this._1oK_);
         this._0s2 = new TextButton(_1O_I_._0U_y,22,false);
         this._0s2.setVerticalAlign(SimpleText.MIDDLE);
         this._0s2.setAutoSize(TextFieldAutoSize.LEFT);
         this._0s2.addEventListener(MouseEvent.CLICK,this._0T_3);
         addChild(this._0s2);
         this._1B_H_ = new TextButton(_1O_I_._zB_,22,false);
         this._1B_H_.setVerticalAlign(SimpleText.MIDDLE);
         this._1B_H_.setAutoSize(TextFieldAutoSize.RIGHT);
         this._1B_H_.addEventListener(MouseEvent.CLICK,this._1U_V_);
         addChild(this._1B_H_);
         _loc2_ = 14;
         while(_loc5_ < _11J_.length)
         {
            _loc3_ = new _td._1G_E_(_11J_[_loc5_]);
            _loc3_.x = _loc2_;
            _loc3_.y = 70;
            addChild(_loc3_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._1w4);
            this._R_7.push(_loc3_);
            _loc2_ = _loc2_ + 108;
            _loc5_++;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private static function _0H_Y_() : _11I_
      {
         return new _11I_("contextualPotionBuy",_0X_h(),[true,false],_1O_I_._1F_u,_1O_I_._a3,null);
      }
      
      private static function _0X_h() : Vector.<_1eo>
      {
         return new <_1eo>[_hm(_1O_I_._0sn),_hm(_1O_I_._X_p)];
      }
      
      private static function _0X_() : Vector.<_1eo>
      {
         return new <_1eo>[new SText("Off"),new SText("1"),new SText("2"),new SText("3"),new SText("5"),new SText("10")];
      }
      
      private static function particleOptions() : Vector.<_1eo>
      {
         return new <_1eo>[new SText("High"),new SText("Low")];
      }
      
      private static function _hm(param1:String) : _dU_
      {
         return new _dU_().setParams(param1);
      }
      
      private static function _1hW_() : _11I_
      {
         return new _11I_("clickForGold",_0X_h(),[true,false],_1O_I_._1Y_k,_1O_I_._0I_y,null);
      }
      
      private static function _1Y_s() : void
      {
         StatusBar._tf.dispatch(Parameters.data_.toggleBarText);
      }
      
      private static function toggleCursor() : void
      {
         Cursor.setMouseIcon();
      }
      
      private static function _3W_() : Vector.<_1eo>
      {
         return new <_1eo>[new SText("45°"),new SText("0°")];
      }
      
      private static function _1sj() : void
      {
         Parameters.data_.cameraAngle = Parameters.data_.defaultCameraAngle;
         Parameters.save();
      }
      
      private function _x6(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function _0T_3(param1:MouseEvent) : void
      {
         var _loc2_:_011 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._1Z_H_.length)
         {
            _loc2_ = this._1Z_H_[_loc3_] as _011;
            if(_loc2_ != null)
            {
               delete Parameters.data_[_loc2_._bb];
            }
            _loc3_++;
         }
         Parameters._12r();
         Parameters.save();
         this.refresh();
      }
      
      private function _1U_V_(param1:MouseEvent) : void
      {
         this.close();
         this.gs_.closed.dispatch();
      }
      
      private function _1w4(param1:MouseEvent) : void
      {
         var _loc2_:_td._1G_E_ = param1.currentTarget as _td._1G_E_;
         this.setSelected(_loc2_);
      }
      
      private function setSelected(param1:_td._1G_E_) : void
      {
         if(param1 == this.selected_)
         {
            return;
         }
         if(this.selected_ != null)
         {
            this.selected_.setSelected(false);
         }
         this.selected_ = param1;
         this.selected_.setSelected(true);
         this._1hH_();
         switch(this.selected_.text_)
         {
            case _1O_I_._1A_X_:
               this._0je();
               return;
            case _1O_I_._0aN_:
               this._0uO_();
               return;
            case _1O_I_._1I_V_:
               this._0E_e();
               return;
            case _1O_I_._O_F_:
               this._0O_B_();
               return;
            case _1O_I_._1yD_:
               this._1F_J_();
               return;
            case _1O_I_.OptionsHpBars:
               this.hpBars();
               return;
            default:
               return;
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage;
         this._1oK_.x = 800 / 2;
         this._1oK_.y = _02H_;
         this._0s2.x = 20;
         this._0s2.y = _02H_;
         stage;
         this._1B_H_.x = 800 - 20;
         this._1B_H_.y = _02H_;
         if(Capabilities.playerType == "Desktop")
         {
            Parameters.data_.fullscreenMode = stage.displayState == "fullScreenInteractive";
            Parameters.save();
         }
         this.setSelected(this._R_7[0]);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_,false,1);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._C_6,false,1);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_,false);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._C_6,false);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(Capabilities.playerType == "Desktop" && param1.keyCode == Keys.ESCAPE)
         {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
            this.refresh();
         }
         if(param1.keyCode == Parameters.data_.options)
         {
            this.close();
         }
         param1.stopImmediatePropagation();
      }
      
      private function close() : void
      {
         stage.focus = null;
         parent.removeChild(this);
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _1hH_() : void
      {
         var _loc1_:Sprite = null;
         for each(_loc1_ in this._1Z_H_)
         {
            removeChild(_loc1_);
         }
         this._1Z_H_.length = 0;
      }
      
      public function hpBars() : *
      {
         this._01O_(new _11I_("showHpBar",_0X_h(),[true,false],"Options.HPBar.Display","Options.HPBar.Display.desc",this.hpBars_options));
         this._01O_(new _11I_("STDamage",_0X_h(),[true,false],"Options.ST.Damage","Options.ST.Damage.desc",null));
         this._01O_(new _11I_("HPBarAlly",_0X_h(),[true,false],"Options.HPBar.Ally","Options.HPBar.Ally.desc",null));
         this._01O_(new _11I_("STHealth",_0X_h(),[true,false],"Options.ST.Health","Options.ST.Health.desc",null));
         this._01O_(new _11I_("HPBarEnemy",_0X_h(),[true,false],"Options.HPBar.Enemy","Options.HPBar.Enemy.desc",null));
         this._01O_(new _11I_("STColor",_0X_h(),[true,false],"Options.ST.Color","Options.ST.Color.desc",null));
         this._01O_(new _11I_("HPBarMagic",_0X_h(),[true,false],"Options.HPBar.Magic","Options.HPBar.Magic.desc",null));
         this._01O_(new _rQ_());
         this._01O_(new _11I_("HPBarOwn",_0X_h(),[true,false],"Options.HPBar.Own","Options.HPBar.Own.desc",null));
         this._01O_(new _rQ_());
         this._01O_(new _11I_("HPBarSafeZone",_0X_h(),[true,false],"Options.HPBar.SafeZone","Options.HPBar.SafeZone.desc",null));
         this.hpBars_options();
      }
      
      public function hpBars_options() : void
      {
         var _loc1_:_11I_ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._1Z_H_.length)
         {
            _loc1_ = this._1Z_H_[_loc2_] as _11I_;
            if(_loc1_ != null)
            {
               if(_loc1_._bb == "HPBarSafeZone" || _loc1_._bb == "HPBarAlly" || _loc1_._bb == "HPBarEnemy" || _loc1_._bb == "HPBarMagic" || _loc1_._bb == "HPBarOwn")
               {
                  _loc1_.enable(Parameters.data_.showHpBar == false);
               }
            }
            _loc2_++;
         }
      }
      
      private function _0je() : void
      {
         this._01O_(new _1H_J_("moveUp",_1O_I_._A_U_,_1O_I_._V_Y_));
         this._01O_(new _1H_J_("moveLeft",_1O_I_._1hq,_1O_I_._7s));
         this._01O_(new _1H_J_("moveDown",_1O_I_._0l3,_1O_I_._1Q_9));
         this._01O_(new _1H_J_("moveRight",_1O_I_._0qr,_1O_I_._X_8));
         this._01O_(this._04w());
         this._01O_(new _1H_J_("rotateLeft",_1O_I_._1M_s,_1O_I_._0F_Q_,!Parameters.data_.allowRotation));
         this._01O_(new _1H_J_("rotateRight",_1O_I_._1C_I_,_1O_I_._1r1,!Parameters.data_.allowRotation));
         this._01O_(new _1H_J_("useSpecial",_1O_I_._0V_8,_1O_I_._1lw));
         this._01O_(new _1H_J_("autofireToggle",_1O_I_._0yd,_1O_I_._0P_b));
         this._01O_(new _1H_J_("resetToDefaultCameraAngle",_1O_I_._lf,_1O_I_._02a));
         this._01O_(new _1H_J_("togglePerformanceStats",_1O_I_._c7,_1O_I_._0u3));
         this._01O_(new _1H_J_("toggleCentering",_1O_I_._K_6,_1O_I_._0rD_));
         this._01O_(new _1H_J_("interact",_1O_I_._15l,_1O_I_._qw));
         this._01O_(_1hW_());
         this._01O_(_0H_Y_());
      }
      
      private function _04w() : _11I_
      {
         return new _11I_("allowRotation",_0X_h(),[true,false],_1O_I_._119,_1O_I_._eQ_,this._1I_i);
      }
      
      private function _1I_i() : void
      {
         var _loc1_:_1H_J_ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._1Z_H_.length)
         {
            _loc1_ = this._1Z_H_[_loc2_] as _1H_J_;
            if(_loc1_ != null)
            {
               if(_loc1_._bb == "rotateLeft" || _loc1_._bb == "rotateRight")
               {
                  _loc1_._1X_u(!Parameters.data_.allowRotation);
               }
            }
            _loc2_++;
         }
      }
      
      private function _0uO_() : void
      {
         this._01O_(new _1H_J_("useHealthPotion",_1O_I_._K_E_,_1O_I_._1I_H_));
         this._01O_(new _1H_J_("useMagicPotion",_1O_I_._0T_q,_1O_I_._C_I_));
         this._P_1();
         this._01O_(new _1H_J_("miniMapZoomIn",_1O_I_._1H_1,_1O_I_._V_K_));
         this._01O_(new _1H_J_("miniMapZoomOut",_1O_I_._0J_5,_1O_I_._uU_));
         this._01O_(new _1H_J_("escapeToNexus",_1O_I_._1D_a,_1O_I_._0si));
         this._01O_(new _1H_J_("options",_1O_I_._1jD_,_1O_I_._1u__));
         this._01O_(new _1H_J_("switchTabs",_1O_I_._ya,_1O_I_._3j));
         this._01O_(new _1H_J_("GPURenderToggle",_1O_I_._0v1,_1O_I_._1ce));
         this._0s5();
         this._01O_(new _1H_J_("toggleAllyProj","Options.AllyProjectilesToggle","Options.AllyProjectilesToggleDesc"));
         if(this._8W_())
         {
            this._01O_(new _1H_J_("toggleFullscreen",_1O_I_._1A_0,_1O_I_._0eV_));
         }
      }
      
      public function _8W_() : Boolean
      {
         return Capabilities.playerType == "Desktop";
      }
      
      public function _0s5() : void
      {
         var _loc1_:String = Capabilities.os.split(" ")[0] == "Mac"?"Command":"Ctrl";
         var _loc2_:_11I_ = new _11I_("inventorySwap",_0X_h(),[true,false],_1O_I_._187,"",null);
         _loc2_._0M_o(new _dU_().setParams(_1O_I_._1qC_,{"key":_loc1_}));
         this._01O_(_loc2_);
      }
      
      public function _P_1() : void
      {
         var _loc1_:_1H_J_ = null;
         var _loc2_:int = 1;
         while(_loc2_ <= 8)
         {
            _loc1_ = new _1H_J_("useInvSlot" + _loc2_,"","");
            _loc1_._0Y_a(new _dU_().setParams(_1O_I_._1dQ_,{"n":_loc2_}));
            _loc1_._0M_o(new _dU_().setParams(_1O_I_._0J_3,{"n":_loc2_}));
            this._01O_(_loc1_);
            _loc2_++;
         }
      }
      
      private function _0E_e() : void
      {
         this._01O_(new _1H_J_(_02d,_1O_I_._0K_Y_,_1O_I_._0D_9));
         this._01O_(new _1H_J_(_0K_k,_1O_I_._0jp,_1O_I_._1G_g));
         this._01O_(new _1H_J_(_1hx,_1O_I_._0rL_,_1O_I_._1K_h));
         this._01O_(new _1H_J_(_1ip,_1O_I_._0w0,_1O_I_._1B_8));
         this._01O_(new _11I_("filterLanguage",_0X_h(),[true,false],_1O_I_._16j,_1O_I_._1iq,null));
         this._01O_(new _1H_J_(_1Q_4,_1O_I_._1gY_,_1O_I_._16Y_));
         this._01O_(new _1H_J_(_1qE_,_1O_I_._1B_F_,_1O_I_._0xE_));
         this._01O_(new _11I_("forceChatQuality",_0X_h(),[true,false],_1O_I_._1U_d,_1O_I_._1X_P_,null));
         this._01O_(new _11I_("hidePlayerChat",_0X_h(),[true,false],_1O_I_._16O_,_1O_I_._1yn,null));
         this._01O_(new _11I_("chatStarRequirement",_0X_(),[0,1,2,3,5,10],_1O_I_._1zI_,_1O_I_._p7,null));
         this._01O_(new _11I_("chatAll",_0X_h(),[true,false],_1O_I_._17X_,_1O_I_._0I_H_,this._0jP_));
         this._01O_(new _11I_("chatWhisper",_0X_h(),[true,false],_1O_I_._0R_M_,_1O_I_._0T_0,this._0M_a));
         this._01O_(new _11I_("chatGuild",_0X_h(),[true,false],_1O_I_._0X_a,_1O_I_._1zg,this._0M_a));
         this._01O_(new _11I_("chatTrade",_0X_h(),[true,false],_1O_I_._18l,_1O_I_._1xp,null));
      }
      
      private function _0M_a() : void
      {
         var _loc1_:_11I_ = null;
         var _loc2_:int = 0;
         Parameters.data_.chatAll = false;
         while(_loc2_ < this._1Z_H_.length)
         {
            _loc1_ = this._1Z_H_[_loc2_] as _11I_;
            if(_loc1_ != null)
            {
               switch(_loc1_._bb)
               {
                  case "chatAll":
                     _loc1_._01g();
               }
            }
            _loc2_++;
         }
      }
      
      private function _0jP_() : void
      {
         var _loc1_:_11I_ = null;
         var _loc2_:int = 0;
         Parameters.data_.hidePlayerChat = false;
         Parameters.data_.chatWhisper = true;
         Parameters.data_.chatGuild = true;
         while(_loc2_ < this._1Z_H_.length)
         {
            _loc1_ = this._1Z_H_[_loc2_] as _11I_;
            if(_loc1_ != null)
            {
               switch(_loc1_._bb)
               {
                  case "hidePlayerChat":
                  case "chatWhisper":
                  case "chatGuild":
                     _loc1_._01g();
               }
            }
            _loc2_++;
         }
      }
      
      private function _0O_B_() : void
      {
         var _loc1_:String = null;
         var _loc2_:Number = NaN;
         this._01O_(new _11I_("defaultCameraAngle",_3W_(),[7 * Math.PI / 4,0],_1O_I_._1gO_,_1O_I_._0hE_,_1sj));
         this._01O_(new _11I_("centerOnPlayer",_0X_h(),[true,false],_1O_I_._va,_1O_I_._1F_E_,null));
         this._01O_(new _11I_("showQuestPortraits",_0X_h(),[true,false],_1O_I_._hQ_,_1O_I_._0S_s,this._pk));
         this._01O_(new _11I_("showProtips",_0X_h(),[true,false],_1O_I_._144,_1O_I_._0S_6,null));
         this._01O_(new _11I_("drawShadows",_0X_h(),[true,false],_1O_I_._0A_Y_,_1O_I_._9d,null));
         this._01O_(new _11I_("textBubbles",_0X_h(),[true,false],_1O_I_._16C_,_1O_I_._1D_D_,null));
         this._01O_(new _11I_("showTradePopup",_0X_h(),[true,false],_1O_I_._1bQ_,_1O_I_._0q1,null));
         this._01O_(new _11I_("showGuildInvitePopup",_0X_h(),[true,false],_1O_I_._1m5,_1O_I_._121,null));
         if(!Parameters.forceSoftwareRender)
         {
            _loc1_ = _1O_I_._L_A_;
            _loc2_ = 16777215;
         }
         else
         {
            _loc1_ = _1O_I_._X_g;
            _loc2_ = 16724787;
         }
         this._01O_(new _11I_("GPURender",_0X_h(),[true,false],_1O_I_._1K_i,_loc1_,null,_loc2_));
         if(Capabilities.playerType == "Desktop")
         {
            this._01O_(new _11I_("fullscreenMode",_0X_h(),[true,false],_1O_I_._bL_,_1O_I_._0C_t,this._11A_));
         }
         this._01O_(new _11I_("toggleBarText",_0X_h(),[true,false],_1O_I_._T_s,_1O_I_._ed,_1Y_s));
         this._01O_(new _11I_("proCursor",_0X_h(),[true,false],"Options.ToggleProCursor","Options.ToggleProCursorDesc",toggleCursor));
         this._01O_(new _11I_("enhancedQuestToolTip",_0X_h(),[true,false],"Options.EnhancedQuestToolTip","Options.EnhancedQuestToolTipDesc",null));
         this._01O_(new _11I_("particleEffect",particleOptions(),[true,false],"Options.ParticleEffect","Options.ParticleEffectDesc",null));
         this._01O_(new _11I_("allyProjectiles",_0X_h(),[true,false],"Options.AllyProjectiles","Options.AllyProjectilesDesc",null));
      }
      
      private function _pk() : void
      {
         if(this.gs_ != null && this.gs_.map != null && this.gs_.map.partyOverlay_ != null && this.gs_.map.partyOverlay_.questArrow_ != null)
         {
            this.gs_.map.partyOverlay_.questArrow_.refreshToolTip();
         }
      }
      
      private function _11A_() : void
      {
         stage.displayState = !!Parameters.data_.fullscreenMode?"fullScreenInteractive":StageDisplayState.NORMAL;
      }
      
      private function _1F_J_() : void
      {
         this._01O_(new _11I_("playMusic",_0X_h(),[true,false],_1O_I_._0Y_i,_1O_I_._qV_,this._Y_E_));
         this._01O_(new _rQ_());
         this._01O_(new _11I_("playSFX",_0X_h(),[true,false],_1O_I_._1iU_,_1O_I_._1om,this._1T_R_));
         this._01O_(new _rQ_());
         this._01O_(new _11I_("playPewPew",_0X_h(),[true,false],_1O_I_._0G_p,_1O_I_._1pP_,null));
      }
      
      private function _Y_E_() : void
      {
         Music.Play(Parameters.data_.playMusic);
      }
      
      private function _1T_R_() : void
      {
         _1C_c._U_d(Parameters.data_.playSFX);
      }
      
      private function _01O_(param1:_nl) : void
      {
         var positionOption:Function = null;
         var option:_nl = param1;
         positionOption = function():void
         {
            option.x = _1Z_H_.length % 2 == 0?Number(20):Number(415);
            option.y = int(_1Z_H_.length / 2) * 44 + 122;
         };
         option.textChanged.addOnce(positionOption);
         this._nG_(option);
      }
      
      private function _nG_(param1:_nl) : void
      {
         addChild(param1);
         param1.addEventListener(Event.CHANGE,this._1C___);
         this._1Z_H_.push(param1);
      }
      
      private function _1C___(param1:Event) : void
      {
         this.refresh();
      }
      
      private function refresh() : void
      {
         var _loc1_:_011 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._1Z_H_.length)
         {
            _loc1_ = this._1Z_H_[_loc2_] as _011;
            if(_loc1_ != null)
            {
               _loc1_.refresh();
            }
            _loc2_++;
         }
      }
   }
}
