package _Y_M_
{
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._1vJ_;
   import com.company.util.TextureLibrary;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.util.GuildUtil;
   import flash.events.Event;
   import _0H_6.GameContext;
   import _1I_S_._0J_a;
   import _3b.DialogSignal;
   
   public class PlayerMenu extends Menu
   {
       
      
      public var gs_:GameSpriteBase;
      
      public var _7N_:String;
      
      public var player_:Player;
      
      public var _R_G_:_1vJ_;
      
      public function PlayerMenu()
      {
         super(3552822,16777215);
      }
      
      public function _0N_P_(param1:GameSpriteBase, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:MenuItem = null;
         this.gs_ = param1;
         this._7N_ = param2;
         this.player_ = null;
         this.nextMenuItemY = this.nextMenuItemY - 25;
         _loc5_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",21),16777215,_1O_I_._0zg);
         _loc5_.addEventListener(MouseEvent.CLICK,this._1jo);
         addMenuItem(_loc5_);
         if(param3)
         {
            _loc5_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",21),16777215,_1O_I_._1A_u);
            _loc5_.addEventListener(MouseEvent.CLICK,this._0ac);
            addMenuItem(_loc5_);
         }
         if(param4)
         {
            _loc5_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",7),16777215,_1O_I_._0C_R_);
            _loc5_.addEventListener(MouseEvent.CLICK,this._0J_Y_);
            addMenuItem(_loc5_);
         }
      }
      
      public function init(param1:GameSpriteBase, param2:Player) : void
      {
         var _loc3_:MenuItem = null;
         this.gs_ = param1;
         this._7N_ = param2.name_;
         this.player_ = param2;
         this._R_G_ = new _1vJ_(11776947,true,this.player_);
         this.nextMenuItemY = this.nextMenuItemY + 7;
         addChild(this._R_G_);
         if(Player.isAdmin)
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",10),16777215,"Ban Menu");
            _loc3_.addEventListener(MouseEvent.CLICK,this.openBanMenu);
            addMenuItem(_loc3_);
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",10),16777215,_1O_I_._H_G_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._0wL_);
            addMenuItem(_loc3_);
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",4),16777215,"Mute Menu");
            _loc3_.addEventListener(MouseEvent.CLICK,this.openMuteMenu);
            addMenuItem(_loc3_);
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",3),16777215,_1O_I_._lA_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._0T_s);
            addMenuItem(_loc3_);
         }
         if(this.gs_.map.allowTeleport() && this.player_._D_a(this.player_))
         {
            _loc3_ = new TeleportMenuOption(this.gs_.map.player_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._1J_n);
            addMenuItem(_loc3_);
         }
         if(this.gs_.map.player_.guildRank_ >= GuildUtil._0k3 && (param2.guildName_ == null || param2.guildName_.length == 0))
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",10),16777215,_1O_I_._0P_A_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._H_h);
            addMenuItem(_loc3_);
         }
         if(!this.player_.starred_)
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterface2",5),16777215,_1O_I_._1__C_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._1W_G_);
            addMenuItem(_loc3_);
         }
         else
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterface2",6),16777215,_1O_I_._xS_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._1qZ_);
            addMenuItem(_loc3_);
         }
         _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",7),16777215,_1O_I_._0C_R_);
         _loc3_.addEventListener(MouseEvent.CLICK,this._0J_G_);
         addMenuItem(_loc3_);
         _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",21),16777215,_1O_I_._0zg);
         _loc3_.addEventListener(MouseEvent.CLICK,this._1jo);
         addMenuItem(_loc3_);
         if(this.player_._0xU_)
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",21),16777215,_1O_I_._1A_u);
            _loc3_.addEventListener(MouseEvent.CLICK,this._0ac);
            addMenuItem(_loc3_);
         }
         if(!this.player_.ignored_)
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",8),16777215,_1O_I_._1yt);
            _loc3_.addEventListener(MouseEvent.CLICK,this._0ai);
            addMenuItem(_loc3_);
         }
         else
         {
            _loc3_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",9),16777215,_1O_I_._native);
            _loc3_.addEventListener(MouseEvent.CLICK,this._0gp);
            addMenuItem(_loc3_);
         }
      }
      
      private function _0wL_(param1:Event) : void
      {
         this.gs_.gsc_.playerText("/kick " + this.player_.name_);
         remove();
      }
      
      private function _0T_s(param1:Event) : void
      {
         this.gs_.gsc_.playerText("/unmute " + this.player_.name_);
         remove();
      }
      
      private function _1jo(param1:Event) : void
      {
         var _loc2_:_0J_a = GameContext.getInjector().getInstance(_0J_a);
         _loc2_.dispatch(true,"/tell " + this._7N_ + " ");
         remove();
      }
      
      private function _0J_Y_(param1:Event) : void
      {
         var _loc2_:_0J_a = GameContext.getInjector().getInstance(_0J_a);
         _loc2_.dispatch(true,"/trade " + this._7N_);
         remove();
      }
      
      private function _0ac(param1:Event) : void
      {
         var _loc2_:_0J_a = GameContext.getInjector().getInstance(_0J_a);
         _loc2_.dispatch(true,"/g ");
         remove();
      }
      
      private function _1J_n(param1:Event) : void
      {
         this.gs_.map.player_.teleport(this.player_);
         remove();
      }
      
      private function _H_h(param1:Event) : void
      {
         this.gs_.gsc_.guildInvite(this._7N_);
         remove();
      }
      
      private function _1W_G_(param1:Event) : void
      {
         this.gs_.map.playerList_.setLock(this.player_);
         remove();
      }
      
      private function _1qZ_(param1:Event) : void
      {
         this.gs_.map.playerList_.removeLock(this.player_);
         remove();
      }
      
      private function _0J_G_(param1:Event) : void
      {
         this.gs_.gsc_.requestTrade(this._7N_);
         remove();
      }
      
      private function _0ai(param1:Event) : void
      {
         this.gs_.map.playerList_.setIgnore(this.player_);
         remove();
      }
      
      private function _0gp(param1:Event) : void
      {
         this.gs_.map.playerList_.removeIgnore(this.player_);
         remove();
      }
      
      private function openBanMenu(param1:MouseEvent) : void
      {
         GameContext.getInjector().getInstance(DialogSignal).dispatch(new BanPlayerDialog(this.player_));
         remove();
      }
      
      private function openMuteMenu(param1:MouseEvent) : void
      {
         GameContext.getInjector().getInstance(DialogSignal).dispatch(new MutePlayerDialog(this.player_));
         remove();
      }
   }
}

import Frames.Frame;

import _1uq.JSON;

import flash.events.MouseEvent;
import _0H_6.GameContext;
import _3b.CloseDialogsSignal;
import Frames.TextInput;
import com.company.assembleegameclient.objects.Player;
import mx.utils.StringUtil;
import Packets.PacketManagerBase;
import _C_._1O_I_;
import flash.globalization.DateTimeFormatter;
import flash.globalization.LocaleID;

class BanPlayerDialog extends Frame
{
    
   
   private var banReasons:TextInput;
   
   private var liftTime:TextInput;
   
   private var player:Player;
   
   function BanPlayerDialog(param1:Player)
   {
      this.player = param1;
      super("Ban options for player " + param1.name_,_1O_I_._0cV_,"Ban","/banPlayerOptions");
      this.banReasons = new TextInput("Ban Reason",false);
      _O_n(this.banReasons);
      _rt("Ban reason example:");
      _rt("- Using Hacks <br />");
      _rt("The <br /> tag means a new line :)");
      this.liftTime = new TextInput("Ban lift time",false);
      var _loc2_:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT);
      _loc2_.setDateTimePattern("yyyy-MM-dd HH:mm:ss");
      this.liftTime.inputText_.text = _loc2_.formatUTC(new Date());
      _O_n(this.liftTime);
      _rt("");
      _rt("Ban lift time format:");
      _rt("yyyy-MM-dd HH:mm:ss");
      _rt("Date will be UTC");
      _rt("-1 for permanent ban");
      cancelButton.addEventListener(MouseEvent.CLICK,onCancel);
      actionButton.addEventListener(MouseEvent.CLICK,this.onAction);
   }
   
   private static function onCancel(param1:MouseEvent) : void
   {
      GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
   }
   
   private static function parseUTCDate(param1:String) : Date
   {
      var _loc2_:Array = param1.match(/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/);
      var _loc3_:Date = new Date();
      _loc3_.setUTCFullYear(int(_loc2_[1]),int(_loc2_[2]) - 1,int(_loc2_[3]));
      _loc3_.setUTCHours(int(_loc2_[4]),int(_loc2_[5]),int(_loc2_[6]),0);
      return _loc3_;
   }
   
   private static function isValidDate(param1:String) : Boolean
   {
      return param1.match(/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/) != null;
   }
   
   private function onAction(param1:MouseEvent) : void
   {
      var _loc2_:Date = null;
      var _loc3_:Number = NaN;
      var _loc4_:String = null;
      if(!StringUtil.trim(this.banReasons.text()))
      {
         this.banReasons.setErrorText("Specify some ban reasons.");
         return;
      }
      if(isValidDate(this.liftTime.text()) && this.liftTime.text() != "-1")
      {
         _loc2_ = parseUTCDate(this.liftTime.text());
         _loc3_ = Math.round(_loc2_.getTime() / 1000);
         _loc4_ = _1uq.JSON.encode({
            "accountId":this.player.accountId_,
            "banReasons":this.banReasons.text(),
            "banLiftTime":_loc3_
         });
         PacketManagerBase.instance.playerText("/ban " + _loc4_);
         GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
         return;
      }
      this.liftTime.setErrorText("Invalid date.");
   }
}

import Frames.Frame;
import flash.events.MouseEvent;
import _0H_6.GameContext;
import _3b.CloseDialogsSignal;
import Frames.TextInput;
import com.company.assembleegameclient.objects.Player;
import Packets.PacketManagerBase;
import _C_._1O_I_;

class MutePlayerDialog extends Frame
{
    
   
   private var muteDuration:TextInput;
   
   private var player:Player;
   
   function MutePlayerDialog(param1:Player)
   {
      this.player = param1;
      super("Mute options for player " + param1.name_,_1O_I_._0cV_,"Mute","/mutePlayerOptions");
      this.muteDuration = new TextInput("Mute Duration",false);
      this.muteDuration.inputText_.restrict = "0-9\\-";
      _O_n(this.muteDuration);
      _rt("input amount in minutes");
      _rt("-1 for permanent mute");
      cancelButton.addEventListener(MouseEvent.CLICK,onCancel);
      actionButton.addEventListener(MouseEvent.CLICK,this.onAction);
   }
   
   private static function onCancel(param1:MouseEvent) : void
   {
      GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
   }
   
   private function onAction(param1:MouseEvent) : void
   {
      if(this.muteDuration.text() == "")
      {
         this.muteDuration.setErrorText("Specify a duration for the mute.");
         return;
      }
      var _loc2_:Number = Number(this.muteDuration.text());
      PacketManagerBase.instance.playerText("/mute " + this.player.name_ + (_loc2_ > 0?" " + _loc2_:""));
      GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
   }
}
