package com.company.assembleegameclient.parameters
{
   import flash.display.DisplayObject;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import com.company.util.Keys;
   import com.company.assembleegameclient.map.Map;
   import flash.events.Event;
   import com.company.util._cP_;
   import flash.system.Capabilities;
   
   public class Parameters
   {
      
      public static const Build:String = "26.2";
      
      public static const SubBuild:String = "4";
      
      public static const FullBuild:String = Build + "." + SubBuild;
      
      public static const _11E_:Boolean = true;
      
      public static const Port:int = !!WebMain.pserver?int(WebMain.pserverPort):2050;
      
      public static const EnableOverlayHotkeys:Boolean = true;
      
      public static const _0O_7:uint = 10944349;
      
      public static const _1pF_:uint = 16572160;
      
      public static const _0B_c:Number = 0.003;
      
      public static const LowBreath:int = 20;
      
      public static const InfoText:String = "";
      
      public static const ClientText:String = "*Client*";
      
      public static const ErrorText:String = "*Error*";
      
      public static const HelpText:String = "*Help*";
      
      public static const GuildText:String = "*Guild*";
      
      public static const _1U_o:Number = 1.1;
      
      public static const _1p5:int = 1000;
      
      public static const _R_f:int = 1000;
      
      public static const _1L_K_:int = -1;
      
      public static const _1lr:int = -2;
      
      public static const _0H_5:int = -3;
      
      public static const _pf:int = -6;
      
      public static const _18x:Number = 18;
      
      public static const _G_i:String = "https://www.kabam.com/corporate/terms-of-service";
      
      public static const _0bK_:String = "https://www.kabam.com/corporate/privacy-policy";
      
      public static var RANDOM1:String = !!WebMain.pserver?"B1A5ED":"311f80691451c71d09a13a2a6e";
      
      public static const RANDOM2:String = !!WebMain.pserver?"612a806cac78114ba5013cb531":"72c5583cafb6818995cdd74b80";
      
      public static const _1eT_:String = !!WebMain.pserver?"-----BEGIN PUBLIC KEY-----\n" + "MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAeyjMOLhcK4o2AnFRhn8vPteUy5Fux/cX" + "N/J+wT/zYIEUINo02frn+Kyxx0RIXJ3CvaHkwmueVL8ytfqo8Ol/OwIDAQAB\n" + "-----END PUBLIC KEY-----":"-----BEGIN PUBLIC KEY-----\n" + "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCKFctVrhfF3m2Kes0FBL/JFeO" + "cmNg9eJz8k/hQy1kadD+XFUpluRqa//Uxp2s9W2qE0EoUCu59ugcf/p7lGuL99Uo" + "SGmQEynkBvZct+/M40L0E0rZ4BVgzLOJmIbXMp0J4PnPcb6VLZvxazGcmSfjauC7" + "F3yWYqUbZd/HCBtawwIDAQAB\n" + "-----END PUBLIC KEY-----";
      
      public static var root:DisplayObject;
      
      public static var data_:Object = null;
      
      public static var forceSoftwareRender:Boolean = false;
      
      public static var BlendType:int = 1;
      
      public static var _191:int = 0;
      
      public static var _xI_:Boolean = true;
      
      public static var HideHud:Boolean = false;
      
      public static var Widescreen:Boolean = false;
      
      public static var _1C_j:Boolean = true;
      
      private static var _1fm:SharedObject = null;
      
      private static var _0D_Z_:Dictionary = new Dictionary();
       
      
      public function Parameters()
      {
         super();
      }
      
      public static function load() : void
      {
         try
         {
            _1fm = SharedObject.getLocal("NillysOptions","/");
            data_ = _1fm.data;
         }
         catch(error:Error)
         {
            data_ = new Object();
         }
         _12r();
         save();
      }
      
      public static function save() : void
      {
         try
         {
            if(_1fm != null)
            {
               _1fm.flush();
            }
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      private static function _1kV_(param1:String, param2:uint) : void
      {
         if(!data_.hasOwnProperty(param1))
         {
            data_[param1] = param2;
         }
         _0D_Z_[param1] = true;
      }
      
      public static function setKey(param1:String, param2:uint) : void
      {
         var _loc3_:* = null;
         for(_loc3_ in _0D_Z_)
         {
            if(data_[_loc3_] == param2)
            {
               data_[_loc3_] = Keys._11T_;
            }
         }
         data_[param1] = param2;
      }
      
      private static function _1wP_(param1:String, param2:*) : void
      {
         if(!data_.hasOwnProperty(param1))
         {
            data_[param1] = param2;
         }
      }
      
      public static function hwAccel() : Boolean
      {
         return !forceSoftwareRender && !Map.swAccel && data_.GPURender;
      }
      
      public static function _1K_3(param1:Event) : void
      {
         disableHardwareAccel();
      }
      
      public static function disableHardwareAccel() : void
      {
         forceSoftwareRender = true;
      }
      
      public static function _12r() : void
      {
         _1kV_("moveLeft",Keys.A);
         _1kV_("moveRight",Keys.D);
         _1kV_("moveUp",Keys.W);
         _1kV_("moveDown",Keys.S);
         _1kV_("rotateLeft",Keys.Q);
         _1kV_("rotateRight",Keys.E);
         _1kV_("useSpecial",Keys.SPACE);
         _1kV_("interact",Keys.NUMBER_0);
         _1kV_("useInvSlot1",Keys.NUMBER_1);
         _1kV_("useInvSlot2",Keys.NUMBER_2);
         _1kV_("useInvSlot3",Keys.NUMBER_3);
         _1kV_("useInvSlot4",Keys.NUMBER_4);
         _1kV_("useInvSlot5",Keys.NUMBER_5);
         _1kV_("useInvSlot6",Keys.NUMBER_6);
         _1kV_("useInvSlot7",Keys.NUMBER_7);
         _1kV_("useInvSlot8",Keys.NUMBER_8);
         _1kV_("escapeToNexus2",Keys.F5);
         _1kV_("escapeToNexus",Keys.R);
         _1kV_("autofireToggle",Keys.I);
         _1kV_("scrollChatUp",Keys._0N_O_);
         _1kV_("scrollChatDown",Keys._1bW_);
         _1kV_("miniMapZoomOut",Keys._1C_u);
         _1kV_("miniMapZoomIn",Keys._u3);
         _1kV_("resetToDefaultCameraAngle",Keys.Z);
         _1kV_("togglePerformanceStats",Keys._11T_);
         _1kV_("options",Keys.O);
         _1kV_("toggleCentering",Keys._11T_);
         _1kV_("chat",Keys.ENTER);
         _1kV_("chatCommand",Keys._0oT_);
         _1kV_("tell",Keys.TAB);
         _1kV_("guildChat",Keys.G);
         _1kV_("testOne",Keys.J);
         _1kV_("testTwo",Keys.K);
         _1kV_("toggleFullscreen",Keys._11T_);
         _1kV_("useHealthPotion",Keys.F);
         _1kV_("GPURenderToggle",Keys._11T_);
         _1kV_("toggleAllyProj",Keys.L);
         _1kV_("useMagicPotion",Keys.V);
         _1kV_("switchTabs",Keys.B);
         _1wP_("playerObjectType",782);
         _1wP_("playMusic",true);
         _1wP_("playSFX",true);
         _1wP_("playPewPew",true);
         _1wP_("centerOnPlayer",true);
         _1wP_("preferredServer",null);
         _1wP_("needsTutorial",true);
         _1wP_("needsRandomRealm",true);
         _1wP_("cameraAngle",7 * Math.PI / 4);
         _1wP_("defaultCameraAngle",7 * Math.PI / 4);
         _1wP_("showQuestPortraits",true);
         _1wP_("fullscreenMode",false);
         _1wP_("showProtips",true);
         _1wP_("protipIndex",0);
         _1wP_("joinDate",_cP_._A_a());
         _1wP_("lastDailyAnalytics",null);
         _1wP_("allowRotation",false);
         _1wP_("charIdUseMap",{});
         _1wP_("drawShadows",true);
         _1wP_("textBubbles",true);
         _1wP_("showTradePopup",true);
         _1wP_("paymentMethod",null);
         _1wP_("filterLanguage",true);
         _1wP_("showGuildInvitePopup",true);
         _1wP_("showBeginnersOffer",false);
         _1wP_("beginnersOfferTimeLeft",0);
         _1wP_("beginnersOfferShowNow",false);
         _1wP_("beginnersOfferShowNowTime",0);
         _1wP_("watchForTutorialExit",false);
         _1wP_("clickForGold",false);
         _1wP_("contextualPotionBuy",true);
         _1wP_("inventorySwap",true);
         if(Capabilities.playerType == "Desktop")
         {
            _1wP_("GPURender",false);
         }
         else
         {
            _1wP_("GPURender",false);
         }
         _1wP_("forceChatQuality",false);
         _1wP_("hidePlayerChat",false);
         _1wP_("chatStarRequirement",0);
         _1wP_("chatAll",true);
         _1wP_("chatWhisper",true);
         _1wP_("chatGuild",true);
         _1wP_("chatTrade",true);
         _1wP_("toggleBarText",false);
         _1wP_("proCursor",true);
         _1wP_("enhancedQuestToolTip",true);
         _1wP_("particleEffect",true);
         _1wP_("showHpBar",false);
         _1wP_("HPBarSafeZone",true);
         _1wP_("HPBarAlly",true);
         _1wP_("HPBarEnemy",true);
         _1wP_("HPBarMagic",true);
         _1wP_("HPBarOwn",true);
         _1wP_("STDamage",true);
         _1wP_("STHealth",true);
         _1wP_("STColor",false);
         _1wP_("allyProjectiles",true);
         _1wP_("privateMessages",new Dictionary());
      }
   }
}
