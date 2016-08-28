package Packets
{
   import _f7.Signal;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _0hJ_.Server;
   import flash.utils.ByteArray;
   import _jQ_.SocketServer;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Projectile;
   import com.company.assembleegameclient.objects.Player;
   import Market.PlayerShopItem;
   import Market.MarketOffer;
   
   public class PacketManagerBase
   {
      
      public static const FAILURE:int = 0;
      
      public static const CREATE_SUCCESS:int = 81;
      
      public static const CREATE:int = 12;
      
      public static const PLAYERSHOOT:int = 66;
      
      public static const MOVE:int = 16;
      
      public static const PLAYERTEXT:int = 47;
      
      public static const TEXT:int = 96;
      
      public static const SHOOT:int = 92;
      
      public static const DAMAGE:int = 97;
      
      public static const UPDATE:int = 42;
      
      public static const UPDATEACK:int = 91;
      
      public static const NOTIFICATION:int = 33;
      
      public static const NEW_TICK:int = 68;
      
      public static const INVSWAP:int = 25;
      
      public static const USEITEM:int = 1;
      
      public static const SHOW_EFFECT:int = 38;
      
      public static const HELLO:int = 9;
      
      public static const GOTO:int = 30;
      
      public static const INVDROP:int = 18;
      
      public static const INVRESULT:int = 63;
      
      public static const RECONNECT:int = 14;
      
      public static const PING:int = 85;
      
      public static const PONG:int = 64;
      
      public static const MAPINFO:int = 74;
      
      public static const LOAD:int = 26;
      
      public static const PIC:int = 46;
      
      public static const SETCONDITION:int = 60;
      
      public static const TELEPORT:int = 45;
      
      public static const USEPORTAL:int = 6;
      
      public static const DEATH:int = 83;
      
      public static const BUY:int = 93;
      
      public static const BUYRESULT:int = 50;
      
      public static const AOE:int = 89;
      
      public static const GROUNDDAMAGE:int = 98;
      
      public static const PLAYERHIT:int = 10;
      
      public static const ENEMYHIT:int = 19;
      
      public static const AOEACK:int = 77;
      
      public static const SHOOTACK:int = 35;
      
      public static const OTHERHIT:int = 57;
      
      public static const SQUAREHIT:int = 13;
      
      public static const GOTOACK:int = 79;
      
      public static const EDITACCOUNTLIST:int = 62;
      
      public static const ACCOUNTLIST:int = 44;
      
      public static const QUESTOBJID:int = 28;
      
      public static const CHOOSENAME:int = 23;
      
      public static const NAMERESULT:int = 22;
      
      public static const CREATEGUILD:int = 95;
      
      public static const CREATE_GUILD_RESULT:int = 82;
      
      public static const GUILDREMOVE:int = 49;
      
      public static const GUILDINVITE:int = 41;
      
      public static const ALLYSHOOT:int = 36;
      
      public static const MULTI_SHOOT:int = 52;
      
      public static const REQUESTTRADE:int = 34;
      
      public static const TRADEREQUESTED:int = 80;
      
      public static const TRADESTART:int = 31;
      
      public static const CHANGETRADE:int = 55;
      
      public static const TRADECHANGED:int = 4;
      
      public static const ACCEPTTRADE:int = 3;
      
      public static const CANCELTRADE:int = 39;
      
      public static const TRADEDONE:int = 94;
      
      public static const TRADEACCEPTED:int = 78;
      
      public static const CLIENTSTAT:int = 75;
      
      public static const CHECKCREDITS:int = 20;
      
      public static const ESCAPE:int = 87;
      
      public static const FILE:int = 56;
      
      public static const INVITEDTOGUILD:int = 58;
      
      public static const JOINGUILD:int = 27;
      
      public static const CHANGEGUILDRANK:int = 11;
      
      public static const PLAYSOUND:int = 59;
      
      public static const GLOBAL_NOTIFICATION:int = 24;
      
      public static const RESKIN:int = 15;
      
      public static const PETYARDCOMMAND:int = 67;
      
      public static const PETCOMMAND:int = 90;
      
      public static const PETUPDATE:int = 76;
      
      public static const PETNEWABILITY:int = 21;
      
      public static const PETYARDUPGRADED:int = 53;
      
      public static const PETEVOLVED:int = 7;
      
      public static const PETRELEASED:int = 8;
      
      public static const PETADDED:int = 86;
      
      public static const ENTERARENA:int = 48;
      
      public static const IMMINENTARENAWAVE:int = 5;
      
      public static const ARENADEATH:int = 17;
      
      public static const LEAVEARENA:int = 84;
      
      public static const VERIFY_EMAIL:int = 61;
      
      public static const RESKIN_RESULT:int = 40;
      
      public static const PASSWORD_PROMPT:int = 69;
      
      public static const VIEWQUESTS:int = 51;
      
      public static const TINKERQUEST:int = 37;
      
      public static const QUEST_FETCH_RESPONSE:int = 65;
      
      public static const QUEST_REDEEM_RESPONSE:int = 88;
      
      public static const MARKETCOMMAND:int = 99;
      
      public static const MARKETRESULT:int = 100;
      
      public static const TEXTBOX:int = 102;
      
      public static const TEXTBOXBUTTON:int = 103;
      
      public static const SWITCHMUSIC:int = 106;
      
      public static const CHEATING:int = 104;
      
      public static const SETFOCUS:int = 108;
      
      public static const SERVERFULL:int = 110;
      
      public static const QUEUEPING:int = 111;
      
      public static const QUEUEPONG:int = 112;
      
      public static const LEADER:int = 200;
      
      public static const LEADERUPDATE:int = 201;
      
      public static const REQLEADERUPDATE:int = 202;
      
      public static const MULTIBOX:int = 203;
      
      public static var instance:Packets.PacketManagerBase;
       
      
      public var _R_m:Signal;
      
      public var gs_:GameSpriteBase;
      
      public var server_:Server;
      
      public var gameId_:int;
      
      public var _S_a:Boolean;
      
      public var charId_:int;
      
      public var keyTime_:int;
      
      public var key_:ByteArray;
      
      public var _01H_:String;
      
      public var isFromArena_:Boolean = false;
      
      public var lastTickId_:int = -1;
      
      public var jitterWatcher_:Packets.JitterWatcher;
      
      public var serverConnection:SocketServer;
      
      public var outstandingBuy_:Packets._9r = null;
      
      public function PacketManagerBase()
      {
         super();
      }
      
      public function chooseName(param1:String) : void
      {
      }
      
      public function createGuild(param1:String) : void
      {
      }
      
      public function connect() : void
      {
      }
      
      public function disconnect() : void
      {
      }
      
      public function checkCredits() : void
      {
      }
      
      public function escape() : void
      {
      }
      
      public function useItem(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:int) : void
      {
      }
      
      public function useItem_new(param1:GameObject, param2:int) : Boolean
      {
         return false;
      }
      
      public function enableJitterWatcher() : void
      {
      }
      
      public function disableJitterWatcher() : void
      {
      }
      
      public function editAccountList(param1:int, param2:Boolean, param3:int) : void
      {
      }
      
      public function guildRemove(param1:String) : void
      {
      }
      
      public function guildInvite(param1:String) : void
      {
      }
      
      public function requestTrade(param1:String) : void
      {
      }
      
      public function changeTrade(param1:Vector.<Boolean>) : void
      {
      }
      
      public function acceptTrade(param1:Vector.<Boolean>, param2:Vector.<Boolean>) : void
      {
      }
      
      public function cancelTrade() : void
      {
      }
      
      public function joinGuild(param1:String) : void
      {
      }
      
      public function changeGuildRank(param1:String, param2:int) : void
      {
      }
      
      public function isConnected() : Boolean
      {
         return false;
      }
      
      public function teleport(param1:int) : void
      {
      }
      
      public function usePortal(param1:int) : void
      {
      }
      
      public function getNextDamage(param1:uint, param2:uint) : uint
      {
         return 0;
      }
      
      public function groundDamage(param1:int, param2:Number, param3:Number) : void
      {
      }
      
      public function playerShoot(param1:int, param2:Projectile) : void
      {
      }
      
      public function playerHit(param1:int, param2:int) : void
      {
      }
      
      public function enemyHit(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
      }
      
      public function otherHit(param1:int, param2:int, param3:int, param4:int) : void
      {
      }
      
      public function squareHit(param1:int, param2:int, param3:int) : void
      {
      }
      
      public function playerText(param1:String) : void
      {
      }
      
      public function invSwap(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         return false;
      }
      
      public function invSwapPotion(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         return false;
      }
      
      public function invDrop(param1:GameObject, param2:int, param3:int) : void
      {
      }
      
      public function setCondition(param1:uint, param2:Number) : void
      {
      }
      
      public function buy(param1:int) : void
      {
      }
      
      public function questFetch() : void
      {
      }
      
      public function questRedeem(param1:int, param2:int, param3:int) : void
      {
      }
      
      public function cheating(param1:int) : void
      {
      }
      
      public function requestMarketOffers() : void
      {
      }
      
      public function removeMarketOffer(param1:PlayerShopItem) : void
      {
      }
      
      public function addOffer(param1:Vector.<MarketOffer>) : void
      {
      }
   }
}
