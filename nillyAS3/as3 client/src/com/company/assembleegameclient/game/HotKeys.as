package com.company.assembleegameclient.game
{
   import _1f.Stats;
   import _0jo._0eZ_;
   import _0jo._0oc;
   import _0jo._r8;
   import _18._0A_6;
   import _0Q_j._mG_;
   import _0jo._1D_h;
   import _ge._I_I_;
   import _S_b._1K_S_;
   import _0E_n._jE_;
   import _0jo._1E_1;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1pm._7o;
   import com.company.assembleegameclient.tutorial.doneAction;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.map.Square;
   import com.company.util.Keys;
   import _ge._0g0;
   import _td.Options;
   import flash.system.Capabilities;
   import flash.display.StageDisplayState;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _05L_.ChatMessage;
   import _1pm._1Y_F_;
   import Packets.PacketManagerBase;
   import _0H_6.GameContext;
   import _wi.Injector;
   import _2l.ClientSettings;
   
   public class HotKeys
   {
      
      private static const _0X_0:uint = 175;
      
      private static var _0O_6:Stats = new Stats();
      
      private static var _1hI_:Boolean = false;
       
      
      public var gs_:com.company.assembleegameclient.game.GameSprite;
      
      private var _0lg:Boolean = false;
      
      private var _0P_y:Boolean = false;
      
      private var _0g9:Boolean = false;
      
      private var _z__:Boolean = false;
      
      private var _W_x:Boolean = false;
      
      private var _N_p:Boolean = false;
      
      private var _0D_k:Boolean = false;
      
      private var _1ih:Boolean = false;
      
      private var _1A_j:Boolean = false;
      
      private var _0u__:Boolean = true;
      
      private var _1Q_c:_0eZ_;
      
      private var _V_8:_0oc;
      
      private var _08a:_r8;
      
      private var _cr:_0A_6;
      
      private var _G_L_:_mG_;
      
      private var _Y_h:_1D_h;
      
      private var _B_s:_I_I_;
      
      private var _fS_:_1K_S_;
      
      private var _H_u:_jE_;
      
      private var _1we:_1E_1;
      
      private var _isTesting:Boolean;
      
      public function HotKeys(param1:com.company.assembleegameclient.game.GameSprite)
      {
         super();
         this.gs_ = param1;
         this.gs_.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.gs_.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         var _loc2_:Injector = GameContext.getInjector();
         this._1Q_c = _loc2_.getInstance(_0eZ_);
         this._V_8 = _loc2_.getInstance(_0oc);
         this._08a = _loc2_.getInstance(_r8);
         this._G_L_ = _loc2_.getInstance(_mG_);
         this._Y_h = _loc2_.getInstance(_1D_h);
         this._B_s = _loc2_.getInstance(_I_I_);
         this._fS_ = _loc2_.getInstance(_1K_S_);
         this._H_u = _loc2_.getInstance(_jE_);
         this._cr = _loc2_.getInstance(_0A_6);
         this._1we = _loc2_.getInstance(_1E_1);
         var _loc3_:ClientSettings = _loc2_.getInstance(ClientSettings);
         this._isTesting = _loc3_.IsTesting();
         this.gs_.map.signalRenderSwitch.add(this._A_V_);
      }
      
      public function _A_V_(param1:Boolean) : void
      {
         if(param1)
         {
            this.gs_.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.gs_.map.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.map.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else
         {
            this.gs_.map.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.map.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.gs_.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
      }
      
      public function clearInput() : void
      {
         this._0lg = false;
         this._0P_y = false;
         this._0g9 = false;
         this._z__ = false;
         this._W_x = false;
         this._N_p = false;
         this._0D_k = false;
         this._1ih = false;
         this._0a5();
      }
      
      public function setEnablePlayerInput(param1:Boolean) : void
      {
         if(this._0u__ != param1)
         {
            this._0u__ = param1;
            this.clearInput();
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Stage = this.gs_.stage;
         _loc2_.addEventListener(Event.ACTIVATE,this._53);
         _loc2_.addEventListener(Event.DEACTIVATE,this._fP_);
         _loc2_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         _loc2_.addEventListener(KeyboardEvent.KEY_UP,this._C_6);
         _loc2_.addEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
         if(Parameters.hwAccel())
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else
         {
            this.gs_.map.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.map.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         _loc2_.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         _loc2_.addEventListener(MouseEvent.RIGHT_CLICK,this._1P_2);
      }
      
      public function _1P_2(param1:MouseEvent) : void
      {
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         var _loc2_:Stage = this.gs_.stage;
         _loc2_.removeEventListener(Event.ACTIVATE,this._53);
         _loc2_.removeEventListener(Event.DEACTIVATE,this._fP_);
         _loc2_.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         _loc2_.removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
         _loc2_.removeEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
         if(Parameters.hwAccel())
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else
         {
            this.gs_.map.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.gs_.map.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         _loc2_.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         _loc2_.removeEventListener(MouseEvent.RIGHT_CLICK,this._1P_2);
      }
      
      private function _53(param1:Event) : void
      {
      }
      
      private function _fP_(param1:Event) : void
      {
         this.clearInput();
      }
      
      public function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Player = this.gs_.map.player_;
         if(_loc7_ == null)
         {
            return;
         }
         if(!this._0u__)
         {
            return;
         }
         if(param1.shiftKey)
         {
            _loc3_ = _loc7_.inventory_[1];
            if(_loc3_ == -1)
            {
               return;
            }
            _loc4_ = ObjectLibrary.XmlData[_loc3_];
            if(_loc4_ == null || _loc4_.hasOwnProperty("EndMpCost"))
            {
               return;
            }
            if(_loc7_.isUnstable())
            {
               _loc5_ = Math.random() * 600 - 300;
               _loc6_ = Math.random() * 600 - 325;
            }
            else
            {
               _loc5_ = this.gs_.map.mouseX;
               _loc6_ = this.gs_.map.mouseY;
            }
            if(Parameters.hwAccel())
            {
               if(param1.currentTarget == param1.target || param1.target == this.gs_.map || param1.target == this.gs_)
               {
                  _loc7_.useAltWeapon(_loc5_,_loc6_,_7o._0V_V_);
               }
            }
            else
            {
               _loc7_.useAltWeapon(_loc5_,_loc6_,_7o._0V_V_);
            }
            return;
         }
         if(Parameters.hwAccel())
         {
            if(param1.currentTarget == param1.target || param1.target == this.gs_.map || param1.target == this.gs_ || param1.currentTarget == this.gs_.chat_.list)
            {
               _loc2_ = Math.atan2(this.gs_.map.mouseY,this.gs_.map.mouseX);
            }
            else
            {
               return;
            }
         }
         else
         {
            _loc2_ = Math.atan2(this.gs_.map.mouseY,this.gs_.map.mouseX);
         }
         doneAction(this.gs_,Tutorial._0ol);
         if(_loc7_.isUnstable())
         {
            _loc7_._0J_(Math.random() * 360);
         }
         else
         {
            _loc7_._0J_(_loc2_);
         }
         this._0D_k = true;
      }
      
      public function onMouseUp(param1:MouseEvent) : void
      {
         this._0D_k = false;
         var _loc2_:Player = this.gs_.map.player_;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.isShooting = false;
      }
      
      private function _1b2(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            this._G_L_.dispatch(_mG_.IN);
         }
         else
         {
            this._G_L_.dispatch(_mG_.OUT);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Player = null;
         var _loc3_:Number = NaN;
         doneAction(this.gs_,Tutorial._ig);
         if(this._0u__ && (this._0D_k || this._1ih))
         {
            _loc2_ = this.gs_.map.player_;
            if(_loc2_ != null)
            {
               if(_loc2_.isUnstable())
               {
                  _loc2_._0J_(Math.random() * 360);
               }
               else
               {
                  _loc3_ = Math.atan2(this.gs_.map.mouseY,this.gs_.map.mouseX);
                  _loc2_._0J_(_loc3_);
               }
            }
         }
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         var _loc2_:GameObject = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Square = null;
         var _loc7_:Stage = this.gs_.stage;
         switch(param1.keyCode)
         {
            case Keys.F1:
            case Keys.F2:
            case Keys.F3:
            case Keys.F4:
            case Keys.F5:
            case Keys.F6:
            case Keys.F7:
            case Keys.F8:
            case Keys.F9:
            case Keys.F10:
            case Keys.F11:
            case Keys.F12:
            case Keys._f1:
            case Keys._S_i:
               break;
            default:
               if(_loc7_.focus != null)
               {
                  return;
               }
               break;
         }
         var _loc8_:Player = this.gs_.map.player_;
         switch(param1.keyCode)
         {
            case Parameters.data_.moveUp:
               doneAction(this.gs_,Tutorial._0V_E_);
               this._0g9 = true;
               break;
            case Parameters.data_.moveDown:
               doneAction(this.gs_,Tutorial._0a1);
               this._z__ = true;
               break;
            case Parameters.data_.moveLeft:
               doneAction(this.gs_,Tutorial._1np);
               this._0lg = true;
               break;
            case Parameters.data_.moveRight:
               doneAction(this.gs_,Tutorial._19c);
               this._0P_y = true;
               break;
            case Parameters.data_.rotateLeft:
               if(!Parameters.data_.allowRotation)
               {
                  break;
               }
               doneAction(this.gs_,Tutorial._1y);
               this._W_x = true;
               break;
            case Parameters.data_.rotateRight:
               if(!Parameters.data_.allowRotation)
               {
                  break;
               }
               doneAction(this.gs_,Tutorial._1vg);
               this._N_p = true;
               break;
            case Parameters.data_.resetToDefaultCameraAngle:
               Parameters.data_.cameraAngle = Parameters.data_.defaultCameraAngle;
               Parameters.save();
               break;
            case Parameters.data_.useSpecial:
               _loc2_ = this.gs_.map.player_;
               if(_loc2_ == null)
               {
                  break;
               }
               if(!this._1A_j)
               {
                  if(_loc8_.isUnstable())
                  {
                     _loc3_ = Math.random() * 600 - 300;
                     _loc4_ = Math.random() * 600 - 325;
                  }
                  else
                  {
                     _loc3_ = this.gs_.map.mouseX;
                     _loc4_ = this.gs_.map.mouseY;
                  }
                  _loc5_ = _loc8_.useAltWeapon(_loc3_,_loc4_,_7o._0V_V_);
                  if(_loc5_)
                  {
                     this._1A_j = true;
                  }
               }
               break;
            case Parameters.data_.autofireToggle:
               this.gs_.map.player_.isShooting = this._1ih = !this._1ih;
               break;
            case Parameters.data_.useInvSlot1:
               this.useItem(4);
               break;
            case Parameters.data_.useInvSlot2:
               this.useItem(5);
               break;
            case Parameters.data_.useInvSlot3:
               this.useItem(6);
               break;
            case Parameters.data_.useInvSlot4:
               this.useItem(7);
               break;
            case Parameters.data_.useInvSlot5:
               this.useItem(8);
               break;
            case Parameters.data_.useInvSlot6:
               this.useItem(9);
               break;
            case Parameters.data_.useInvSlot7:
               this.useItem(10);
               break;
            case Parameters.data_.useInvSlot8:
               this.useItem(11);
               break;
            case Parameters.data_.useHealthPotion:
               if(this._B_s._3l(_I_I_._1__7).available)
               {
                  this._Y_h.dispatch(new _0g0(_I_I_._1__7,_0g0._H_3));
               }
               break;
            case Parameters.data_.GPURenderToggle:
               Parameters.data_.GPURender = !Parameters.data_.GPURender;
               break;
            case Parameters.data_.useMagicPotion:
               if(this._B_s._3l(_I_I_._11C_).available)
               {
                  this._Y_h.dispatch(new _0g0(_I_I_._11C_,_0g0._H_3));
               }
               break;
            case Parameters.data_.toggleAllyProj:
               Parameters.data_.allyProjectiles = !Parameters.data_.allyProjectiles;
               break;
            case Parameters.data_.miniMapZoomOut:
               this._G_L_.dispatch(_mG_.OUT);
               break;
            case Parameters.data_.miniMapZoomIn:
               this._G_L_.dispatch(_mG_.IN);
               break;
            case Parameters.data_.togglePerformanceStats:
               this.togglePerformanceStats();
               break;
            case Parameters.data_.escapeToNexus:
            case Parameters.data_.escapeToNexus2:
               this._1we.dispatch();
               this.gs_.gsc_.escape();
               Parameters.data_.needsRandomRealm = false;
               Parameters.save();
               break;
            case Parameters.data_.options:
               this.clearInput();
               this._H_u._vj.addChild(new Options(this.gs_));
               break;
            case Parameters.data_.toggleCentering:
               Parameters.data_.centerOnPlayer = !Parameters.data_.centerOnPlayer;
               Parameters.save();
               break;
            case Parameters.data_.toggleFullscreen:
               if(Capabilities.playerType == "Desktop")
               {
                  Parameters.data_.fullscreenMode = !Parameters.data_.fullscreenMode;
                  Parameters.save();
                  _loc7_.displayState = !!Parameters.data_.fullscreenMode?"fullScreenInteractive":StageDisplayState.NORMAL;
               }
               break;
            case Parameters.data_.switchTabs:
               this._cr.dispatch();
               break;
            case Parameters.data_.testOne:
               break;
            case Parameters.data_.testTwo:
         }
         if(Parameters.EnableOverlayHotkeys)
         {
            switch(param1.keyCode)
            {
               case Keys.F2:
                  this.ToggleHud();
                  break;
               case Keys.F3:
                  Parameters.Widescreen = !Parameters.Widescreen;
                  break;
               case Keys.F4:
                  this.gs_.map.mapOverlay_.visible = !this.gs_.map.mapOverlay_.visible;
                  this.gs_.map.partyOverlay_.visible = !this.gs_.map.partyOverlay_.visible;
            }
         }
         if(this._isTesting)
         {
            switch(param1.keyCode)
            {
               case Keys.F6:
                  TextureRedrawer.clearCache();
                  Parameters._191 = (Parameters._191 + 1) % 7;
                  this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"Projectile Color Type: " + Parameters._191));
                  break;
               case Keys.F7:
                  for each(_loc6_ in this.gs_.map.squares_)
                  {
                     if(_loc6_ != null)
                     {
                        _loc6_.faces_.length = 0;
                     }
                  }
                  Parameters.BlendType = (Parameters.BlendType + 1) % 2;
                  this._V_8.dispatch(ChatMessage.make(Parameters.ClientText,"Blend type: " + Parameters.BlendType));
                  break;
               case Keys.F8:
                  Parameters.data_.surveyDate = 0;
                  Parameters.data_.needsSurvey = true;
                  Parameters.data_.playTimeLeftTillSurvey = 5;
                  Parameters.data_.surveyGroup = "testing";
                  break;
               case Keys.F9:
                  Parameters._xI_ = !Parameters._xI_;
            }
         }
         this._0a5();
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(param1.keyCode)
         {
            case Parameters.data_.moveUp:
               this._0g9 = false;
               break;
            case Parameters.data_.moveDown:
               this._z__ = false;
               break;
            case Parameters.data_.moveLeft:
               this._0lg = false;
               break;
            case Parameters.data_.moveRight:
               this._0P_y = false;
               break;
            case Parameters.data_.rotateLeft:
               this._W_x = false;
               break;
            case Parameters.data_.rotateRight:
               this._N_p = false;
               break;
            case Parameters.data_.useSpecial:
               if(this._1A_j)
               {
                  this._1A_j = false;
                  if(this.gs_.map.player_.isUnstable())
                  {
                     _loc2_ = Math.random() * 600 - 300;
                     _loc3_ = Math.random() * 600 - 325;
                  }
                  else
                  {
                     _loc2_ = this.gs_.map.mouseX;
                     _loc3_ = this.gs_.map.mouseY;
                  }
                  this.gs_.map.player_.useAltWeapon(this.gs_.map.mouseX,this.gs_.map.mouseY,_7o._0l8);
               }
         }
         this._0a5();
      }
      
      private function _0a5() : void
      {
         var _loc1_:Player = this.gs_.map.player_;
         if(_loc1_ != null)
         {
            if(this._0u__)
            {
               _loc1_._0D_B_((!!this._N_p?1:0) - (!!this._W_x?1:0),(!!this._0P_y?1:0) - (!!this._0lg?1:0),(!!this._z__?1:0) - (!!this._0g9?1:0));
            }
            else
            {
               _loc1_._0D_B_(0,0,0);
            }
         }
      }
      
      private function useItem(param1:int) : void
      {
         if(this._fS_._1F_0 == _1K_S_._069)
         {
            param1 = param1 + _1Y_F_._16J_;
         }
         PacketManagerBase.instance.useItem_new(this.gs_.map.player_,param1);
      }
      
      private function togglePerformanceStats() : void
      {
         if(this.gs_.contains(_0O_6))
         {
            this.gs_.removeChild(_0O_6);
            this.gs_.removeChild(this.gs_.gsc_.jitterWatcher_);
            this.gs_.gsc_.disableJitterWatcher();
         }
         else
         {
            this.gs_.addChild(_0O_6);
            this.gs_.gsc_.enableJitterWatcher();
            this.gs_.gsc_.jitterWatcher_.y = _0O_6.height;
            this.gs_.addChild(this.gs_.gsc_.jitterWatcher_);
         }
      }
      
      private function ToggleHud() : void
      {
         Parameters.HideHud = !Parameters.HideHud;
         if(Parameters.HideHud)
         {
            this.gs_.hudView.visible = false;
            this._08a.dispatch(false);
         }
         else
         {
            this.gs_.hudView.visible = true;
            this._08a.dispatch(true);
         }
      }
   }
}
