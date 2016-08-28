package Packets
{
   import _0wP_.MessageProvider;
   import com.company.assembleegameclient.objects.Player;
   import com.company.util.Random;
   import _0jo._0eZ_;
   import Packets.Server.Death;
   import flash.utils.Timer;
   import _0jo._0oc;
   import _0jo._rJ_;
   import _0Q_j._0R_C_;
   import _0Q_j._Q_O_;
   import _1__8._19A_;
   import _1ud._J_U_;
   import _1ud._08e;
   import _0O_N_._1uf;
   import _K_r._15w;
   import _0l7._1ba;
   import _3b.CloseDialogsSignal;
   import _3b.DialogSignal;
   import _1lY_._1m;
   import _1lY_._0D_i;
   import _7h._1Y_D_;
   import _7h._1a8;
   import _04h._1Q_v;
   import _0E_T_._1zi;
   import _wi.Injector;
   import _ge._v1;
   import _0l7._I_J_;
   import _1F_z._0P_4;
   import Queue.QueuePosition;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _05L_.ChatMessage;
   import com.company.assembleegameclient.parameters.Parameters;
   import _C_._1O_I_;
   import _0wP_._ou;
   import Packets.Client.Create;
   import Packets.Client.PlayerShoot;
   import Packets.Client.Movement;
   import Packets.Client.PlayerText;
   import _jQ_.Message;
   import Packets.Client.InvSwap;
   import Packets.Client.UseItem;
   import Packets.Client.Hello;
   import Packets.Client.InvDrop;
   import Packets.Client.Pong;
   import Packets.Client.QueuePong;
   import Packets.Client.Load;
   import Packets.Client.SetCondition;
   import Packets.Client.Teleport;
   import Packets.Client.UsePortal;
   import Packets.Client.Buy;
   import Packets.Client.PlayerHit;
   import Packets.Client.EnemyHit;
   import Packets.Client.AOEAck;
   import Packets.Client.ShootAck;
   import Packets.Client.OtherHit;
   import Packets.Client.SquareHit;
   import Packets.Client.GotoAck;
   import Packets.Client.GroundDamage;
   import Packets.Client.ChooseName;
   import Packets.Client.CreateGuild;
   import Packets.Client.GuildRemove;
   import Packets.Client.GuildInvite;
   import Packets.Client.RequestTrade;
   import Packets.Client.ChangeTrade;
   import Packets.Client.AcceptTrade;
   import Packets.Client.CancelTrade;
   import Packets.Client.CheckCredits;
   import Packets.Client.Escape;
   import Packets.Client.JoinGuild;
   import Packets.Client.ChangeGuildRank;
   import Packets.Client.EditAccountList;
   import Packets.Client.PetCommand;
   import _1M_z.EnterArena;
   import Packets.Client.ClientPacket;
   import _1M_z.TinkerQuest;
   import Packets.Client.MarketCommand;
   import Packets.Server.Failure;
   import Packets.Server.CreateSuccess;
   import Packets.Server.Shoot;
   import Packets.Server.Damage;
   import Packets.Server.Update;
   import Packets.Server.Notification;
   import Packets.Server.GlobalNotification;
   import Packets.Server.NewTick;
   import Packets.Server.ShowEffect;
   import Packets.Server.Goto;
   import Packets.Server.InvResult;
   import Packets.Server.Reconnect;
   import Packets.Server.Ping;
   import Packets.Server.MapInfo;
   import Packets.Server.Pic;
   import Packets.Server.BuyResult;
   import Packets.Server.AOEPacket;
   import Packets.Server.AccountList;
   import Packets.Server.QuestObjId;
   import Packets.Server.NameResult;
   import Packets.Server.CreateGuildResult;
   import Packets.Server.AllyShoot;
   import Packets.Server.MultiShoot;
   import Packets.Server.TradeRequested;
   import Packets.Server.TradeStart;
   import Packets.Server.TradeChanged;
   import Packets.Server.TradeDone;
   import Packets.Server.TradeAccepted;
   import Packets.Server.ClientStat;
   import Packets.Server.File;
   import Packets.Server.InvitedToGuild;
   import Packets.Server.PlaySound;
   import Packets.Server._O_Q_;
   import Packets.Server._0Y_g;
   import _L_K_._C_L_;
   import _L_K_._1sQ_;
   import _V_d.ImminentArenaWave;
   import _V_d.ArenaDeath;
   import Packets.Server.VerifyEmail;
   import Packets.Server.ReskinResult;
   import Packets.Server.PasswordPrompt;
   import Packets.Server.QuestFetchResponse;
   import Packets.Server.QuestRedeemResponse;
   import Packets.Server.TextBox;
   import Packets.Client.TextBoxButton;
   import Packets.Server.SwitchMusic;
   import Packets.Client.Cheating;
   import Packets.Server.SetFocus;
   import Packets.Server.ReqLeaderUpdate;
   import Packets.Server.MultiBox;
   import Packets.Server.Leader;
   import Packets.Client.LeaderUpdate;
   import Packets.Server.ServerFull;
   import Packets.Server.QueuePing;
   import Packets.Server.MarketResult;
   import _0l7._kb;
   import _0l7._0vW_;
   import _0l7._04I_;
   import _0H_6.GameContext;
   import _0l7._L_z;
   import Packets.Server._0ca;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.crypto.Crypto;
   import com.company.util._18U_;
   import _1O_R_.Dialog;
   import flash.events.Event;
   import _ll.Music;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Dictionary;
   import _0E_T_._0ih;
   import _1U_P_.BattleSummaryDialog;
   import com.company.assembleegameclient.objects.Projectile;
   import _ll.SFX;
   import _1pm._0P_M_;
   import _ge._I_I_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.utils.getTimer;
   import _K_r._1ep;
   import com.company.assembleegameclient.objects.SellableObject;
   import com.company.assembleegameclient.util.Currency;
   import flash.utils.ByteArray;
   import com.hurlant.util.der.PEM;
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.util.Base64;
   import _4u.Account;
   import com.company.assembleegameclient.map._76;
   import com.company.assembleegameclient.util._1C_q;
   import _0E_T_._Y_F_;
   import _0E_T_._1G_k;
   import _0Z_1.TradeRequestPanel;
   import _7m._Q_x;
   import _7m._0vp;
   import _S_b._Q_e;
   import _7m._mZ_;
   import _148._1zw;
   import _1xa._dU_;
   import _113._13g;
   import _18._qP_;
   import com.company.assembleegameclient.game.GameSprite;
   import _K_r._1C_w;
   import _S_b._0jn;
   import _0x1.ParticleEffect;
   import flash.geom.Point;
   import _0x1._0A_v;
   import _0x1.TeleportEffect;
   import _0x1.StreamEffect;
   import _0x1.ThrowEffect;
   import _0x1._G_Q_;
   import _0x1._0d7;
   import _0x1._0wv;
   import _0x1._6y;
   import _0x1.FlowEffect;
   import _0x1._0O_X_;
   import _0x1._1D_9;
   import _0x1._0zT_;
   import _0x1._0ts;
   import com.company.assembleegameclient.objects._T_k;
   import _qR_._1X_X_;
   import _0x1._3E_;
   import _0x1._1S_;
   import _0x1._0G_c;
   import _7m.StatData;
   import com.company.assembleegameclient.objects.Merchant;
   import com.company.assembleegameclient.objects.Pet;
   import com.company.assembleegameclient.util.ConditionEffect;
   import com.company.assembleegameclient.objects.Portal;
   import com.company.assembleegameclient.objects.Container;
   import com.company.assembleegameclient.objects.NameChanger;
   import _1pm._1Y_F_;
   import Packets.Client.Reskin;
   import com.company.assembleegameclient.objects.ObjectProperties;
   import com.company.assembleegameclient.objects.ProjectileProperties;
   import com.company.assembleegameclient.objects._sV_;
   import _0hJ_.Server;
   import _1iT_._0K_U_;
   import Queue.QueueEvent;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.ui._1S_k;
   import flash.display.BitmapData;
   import _05g.NotEnoughGoldDialog;
   import _1O_R_.NotEnoughFameDialog;
   import _0x1._D_0;
   import _1iT_._0L_n;
   import _1iT_._0J_1;
   import flash.net.FileReference;
   import _0Z_1._1S_9;
   import _1U_P_.ContinueOrQuitDialog;
   import _05g.TitleView;
   import _0Z_d._ee;
   import flash.events.TimerEvent;
   import Market.PlayerShopItem;
   import Market.MarketItemsResultSignal;
   import Market.MarketResultSignal;
   import Market.MarketOffer;
   import _0Z_d._1sk;
   import _jQ_.SocketServer;
   
   public class PacketManager extends PacketManagerBase
   {
      
      private static const _1X_t:int = 1000;
       
      
      private var _0R_e:Packets._1uh;
      
      private var messages:MessageProvider;
      
      private var objectId_:int = -1;
      
      private var player:Player;
      
      private var _2W_:Boolean = true;
      
      private var _11H_:Random = null;
      
      private var _0W_s:_0eZ_;
      
      private var death:Death;
      
      private var _1b9:Timer;
      
      private var _C_v:int = 2;
      
      private var _V_8:_0oc;
      
      private var addSpeechBalloon:_rJ_;
      
      private var _0Z_5:_0R_C_;
      
      private var _dF_:_Q_O_;
      
      private var _0G_2:_19A_;
      
      private var _0P_Y_:_J_U_;
      
      private var _0J_t:_08e;
      
      private var _0cp:_1uf;
      
      private var _0I_U_:_15w;
      
      private var _0F_C_:_1ba;
      
      private var closeDialogs:CloseDialogsSignal;
      
      private var _06Z_:DialogSignal;
      
      private var _0hq:_1m;
      
      private var _V_p:_0D_i;
      
      private var _K_Q_:_1Y_D_;
      
      private var _0F_e:_1a8;
      
      private var _1xI_:_1Q_v;
      
      private var _0ta:_1zi;
      
      private var _T_X_:Injector;
      
      private var model:_v1;
      
      private var _1U___:_I_J_;
      
      private var _0xI_:_0P_4;
      
      private var queuePos:QueuePosition;
      
      public function PacketManager(param1:GameSpriteBase, param2:Server, param3:int, param4:Boolean, param5:int, param6:int, param7:ByteArray, param8:String, param9:Boolean)
      {
         super();
         this._T_X_ = GameContext.getInjector();
         this._0W_s = this._T_X_.getInstance(_0eZ_);
         this._V_8 = this._T_X_.getInstance(_0oc);
         this.addSpeechBalloon = this._T_X_.getInstance(_rJ_);
         this._0Z_5 = this._T_X_.getInstance(_0R_C_);
         this._dF_ = this._T_X_.getInstance(_Q_O_);
         this._0F_C_ = this._T_X_.getInstance(_1ba);
         this._0I_U_ = GameContext.getInjector().getInstance(_15w);
         this._1U___ = this._T_X_.getInstance(_I_J_);
         this._0xI_ = this._T_X_.getInstance(_0P_4);
         this.closeDialogs = this._T_X_.getInstance(CloseDialogsSignal);
         _R_m = this._T_X_.getInstance(_1sk);
         this._06Z_ = this._T_X_.getInstance(DialogSignal);
         this._0hq = this._T_X_.getInstance(_1m);
         this._V_p = this._T_X_.getInstance(_0D_i);
         this._K_Q_ = this._T_X_.getInstance(_1Y_D_);
         this._0F_e = this._T_X_.getInstance(_1a8);
         this._0G_2 = this._T_X_.getInstance(_19A_);
         this._0P_Y_ = this._T_X_.getInstance(_J_U_);
         this._0J_t = this._T_X_.getInstance(_08e);
         this._0cp = this._T_X_.getInstance(_1uf);
         this._0ta = this._T_X_.getInstance(_1zi);
         serverConnection = this._T_X_.getInstance(SocketServer);
         this.messages = this._T_X_.getInstance(MessageProvider);
         this.model = this._T_X_.getInstance(_v1);
         this._1xI_ = this._T_X_.getInstance(_1Q_v);
         gs_ = param1;
         server_ = param2;
         gameId_ = param3;
         _S_a = param4;
         charId_ = param5;
         keyTime_ = param6;
         key_ = param7;
         _01H_ = param8;
         isFromArena_ = param9;
         this._1eS_();
         instance = this;
      }
      
      private static function _10I_(param1:int) : Boolean
      {
         return param1 == 2591 || param1 == 2592 || param1 == 2593 || param1 == 2612 || param1 == 2613 || param1 == 2636 || param1 == 2793 || param1 == 2794;
      }
      
      private function _1eS_() : void
      {
         this._T_X_.map(GameSpriteBase)._1as(gs_);
         this._0R_e = this._T_X_.getInstance(Packets._1uh);
         this._T_X_._1kw(GameSpriteBase);
      }
      
      override public function disconnect() : void
      {
         this._10Y_();
         this._vV_();
         serverConnection.disconnect();
      }
      
      private function _10Y_() : void
      {
         serverConnection.connected.remove(this._1dd);
         serverConnection.closed.remove(this._qN_);
         serverConnection.error.remove(this.NotifyError);
      }
      
      override public function connect() : void
      {
         this._Q_k();
         this._L_7();
         var _loc1_:ChatMessage = new ChatMessage();
         _loc1_.name = Parameters.ClientText;
         _loc1_.text = _1O_I_._0pz;
         _loc1_.tokens = {"serverName":server_.name};
         this._V_8.dispatch(_loc1_);
         serverConnection.connect(server_.address,server_.port);
      }
      
      public function _Q_k() : void
      {
         serverConnection.connected.add(this._1dd);
         serverConnection.closed.add(this._qN_);
         serverConnection.error.add(this.NotifyError);
      }
      
      public function _L_7() : void
      {
         var _loc1_:_ou = this._T_X_.getInstance(_ou);
         _loc1_.map(CREATE)._is(Create);
         _loc1_.map(PLAYERSHOOT)._is(PlayerShoot);
         _loc1_.map(MOVE)._is(Movement);
         _loc1_.map(PLAYERTEXT)._is(PlayerText);
         _loc1_.map(UPDATEACK)._is(Message);
         _loc1_.map(INVSWAP)._is(InvSwap);
         _loc1_.map(USEITEM)._is(UseItem);
         _loc1_.map(HELLO)._is(Hello);
         _loc1_.map(INVDROP)._is(InvDrop);
         _loc1_.map(PONG)._is(Pong);
         _loc1_.map(QUEUEPONG)._is(QueuePong);
         _loc1_.map(LOAD)._is(Load);
         _loc1_.map(SETCONDITION)._is(SetCondition);
         _loc1_.map(TELEPORT)._is(Teleport);
         _loc1_.map(USEPORTAL)._is(UsePortal);
         _loc1_.map(BUY)._is(Buy);
         _loc1_.map(PLAYERHIT)._is(PlayerHit);
         _loc1_.map(ENEMYHIT)._is(EnemyHit);
         _loc1_.map(AOEACK)._is(AOEAck);
         _loc1_.map(SHOOTACK)._is(ShootAck);
         _loc1_.map(OTHERHIT)._is(OtherHit);
         _loc1_.map(SQUAREHIT)._is(SquareHit);
         _loc1_.map(GOTOACK)._is(GotoAck);
         _loc1_.map(GROUNDDAMAGE)._is(GroundDamage);
         _loc1_.map(CHOOSENAME)._is(ChooseName);
         _loc1_.map(CREATEGUILD)._is(CreateGuild);
         _loc1_.map(GUILDREMOVE)._is(GuildRemove);
         _loc1_.map(GUILDINVITE)._is(GuildInvite);
         _loc1_.map(REQUESTTRADE)._is(RequestTrade);
         _loc1_.map(CHANGETRADE)._is(ChangeTrade);
         _loc1_.map(ACCEPTTRADE)._is(AcceptTrade);
         _loc1_.map(CANCELTRADE)._is(CancelTrade);
         _loc1_.map(CHECKCREDITS)._is(CheckCredits);
         _loc1_.map(ESCAPE)._is(Escape);
         _loc1_.map(JOINGUILD)._is(JoinGuild);
         _loc1_.map(CHANGEGUILDRANK)._is(ChangeGuildRank);
         _loc1_.map(EDITACCOUNTLIST)._is(EditAccountList);
         _loc1_.map(PETCOMMAND)._is(PetCommand);
         _loc1_.map(PETYARDCOMMAND)._is(PetYardCommand);
         _loc1_.map(ENTERARENA)._is(EnterArena);
         _loc1_.map(LEAVEARENA)._is(ClientPacket);
         _loc1_.map(VIEWQUESTS)._is(ClientPacket);
         _loc1_.map(TINKERQUEST)._is(TinkerQuest);
         _loc1_.map(MARKETCOMMAND)._is(MarketCommand);
         _loc1_.map(FAILURE)._is(Failure)._0qC_(this._N_t);
         _loc1_.map(CREATE_SUCCESS)._is(CreateSuccess)._0qC_(this._G_j);
         _loc1_.map(SHOOT)._is(Shoot)._0qC_(this._g__);
         _loc1_.map(DAMAGE)._is(Damage)._0qC_(this._eL_);
         _loc1_.map(UPDATE)._is(Update)._0qC_(this._x7);
         _loc1_.map(NOTIFICATION)._is(Notification)._0qC_(this._jZ_);
         _loc1_.map(GLOBAL_NOTIFICATION)._is(GlobalNotification)._0qC_(this._0qL_);
         _loc1_.map(NEW_TICK)._is(NewTick)._0qC_(this._kx);
         _loc1_.map(SHOW_EFFECT)._is(ShowEffect)._0qC_(this._0F_r);
         _loc1_.map(GOTO)._is(Goto)._0qC_(this._0H_1);
         _loc1_.map(INVRESULT)._is(InvResult)._0qC_(this.HandleInvResult);
         _loc1_.map(RECONNECT)._is(Reconnect)._0qC_(this.HandleReconnect);
         _loc1_.map(PING)._is(Ping)._0qC_(this.HandlePing);
         _loc1_.map(MAPINFO)._is(MapInfo)._0qC_(this.HandleMapInfo);
         _loc1_.map(PIC)._is(Pic)._0qC_(this.HandlePic);
         _loc1_.map(DEATH)._is(Death)._0qC_(this.HandleDeath);
         _loc1_.map(BUYRESULT)._is(BuyResult)._0qC_(this._wM_);
         _loc1_.map(AOE)._is(AOEPacket)._0qC_(this.HandleAOEPacket);
         _loc1_.map(ACCOUNTLIST)._is(AccountList)._0qC_(this.HandleAccountList);
         _loc1_.map(QUESTOBJID)._is(QuestObjId)._0qC_(this.HandleQuestObjId);
         _loc1_.map(NAMERESULT)._is(NameResult)._0qC_(this.HandleNameResult);
         _loc1_.map(CREATE_GUILD_RESULT)._is(CreateGuildResult)._0qC_(this.HandleCreateGuildResult);
         _loc1_.map(ALLYSHOOT)._is(AllyShoot)._0qC_(this._E_x);
         _loc1_.map(MULTI_SHOOT)._is(MultiShoot)._0qC_(this._K_q);
         _loc1_.map(TRADEREQUESTED)._is(TradeRequested)._0qC_(this._1G_N_);
         _loc1_.map(TRADESTART)._is(TradeStart)._0qC_(this._01W_);
         _loc1_.map(TRADECHANGED)._is(TradeChanged)._0qC_(this._1fp);
         _loc1_.map(TRADEDONE)._is(TradeDone)._0qC_(this._1T_0);
         _loc1_.map(TRADEACCEPTED)._is(TradeAccepted)._0qC_(this._O_W_);
         _loc1_.map(CLIENTSTAT)._is(ClientStat)._0qC_(this.HandleClientStat);
         _loc1_.map(FILE)._is(File)._0qC_(this.HandleFile);
         _loc1_.map(INVITEDTOGUILD)._is(InvitedToGuild)._0qC_(this.HandleInvitedToGuild);
         _loc1_.map(PLAYSOUND)._is(PlaySound)._0qC_(this.HandlePlaySound);
         _loc1_.map(PETUPDATE)._is(_0J_j)._0qC_(this._3T_);
         _loc1_.map(PETNEWABILITY)._is(_O_Q_)._0qC_(this._1eY_);
         _loc1_.map(PETYARDUPGRADED)._is(_1M_6)._0qC_(this._0S_9);
         _loc1_.map(PETEVOLVED)._is(_0Y_g)._0qC_(this._1zq);
         _loc1_.map(PETRELEASED)._is(_C_L_)._0qC_(this._12Y_);
         _loc1_.map(PETADDED)._is(_1sQ_)._0qC_(this._05B_);
         _loc1_.map(IMMINENTARENAWAVE)._is(ImminentArenaWave)._0qC_(this.HandleImminentArenaWave);
         _loc1_.map(ARENADEATH)._is(ArenaDeath)._0qC_(this.HandleArenaDeath);
         _loc1_.map(VERIFY_EMAIL)._is(VerifyEmail)._0qC_(this.HandleVerifyEmail);
         _loc1_.map(RESKIN_RESULT)._is(ReskinResult)._0qC_(this._13m);
         _loc1_.map(PASSWORD_PROMPT)._is(PasswordPrompt)._0qC_(this.HandlePasswordPrompt);
         _loc1_.map(QUEST_FETCH_RESPONSE)._is(QuestFetchResponse)._0qC_(this.HandleQuestFetchResponse);
         _loc1_.map(QUEST_REDEEM_RESPONSE)._is(QuestRedeemResponse)._0qC_(this.HandleQuestRedeemResponse);
         _loc1_.map(TEXTBOX)._is(TextBox)._0qC_(this.receiveTextBox);
         _loc1_.map(TEXTBOXBUTTON)._is(TextBoxButton);
         _loc1_.map(SWITCHMUSIC)._is(SwitchMusic)._0qC_(this.switchMusic);
         _loc1_.map(CHEATING)._is(Cheating);
         _loc1_.map(SETFOCUS)._is(SetFocus)._0qC_(this.setFocus);
         _loc1_.map(REQLEADERUPDATE)._is(ReqLeaderUpdate)._0qC_(null);
         _loc1_.map(MULTIBOX)._is(MultiBox)._0qC_(null);
         _loc1_.map(LEADER)._is(Leader)._0qC_(null);
         _loc1_.map(LEADERUPDATE)._is(LeaderUpdate);
         _loc1_.map(SERVERFULL)._is(ServerFull)._0qC_(this.HandleServerFull);
         _loc1_.map(QUEUEPING)._is(QueuePing)._0qC_(this.HandleQueuePing);
         _loc1_.map(MARKETRESULT)._is(MarketResult)._0qC_(this.HandleMarketResult);
      }
      
      private function _05B_(param1:_1sQ_) : void
      {
         var _loc2_:_kb = this._T_X_.getInstance(_kb);
         _loc2_.dispatch(param1.petName,param1._0jt);
      }
      
      private function _12Y_(param1:_C_L_) : void
      {
         var _loc2_:_0vW_ = this._T_X_.getInstance(_0vW_);
         _loc2_.dispatch(param1._13R_);
      }
      
      private function _1eY_(param1:_O_Q_) : void
      {
         var _loc2_:_04I_ = this._T_X_.getInstance(_04I_);
         _loc2_.dispatch(param1.type);
      }
      
      private function _0S_9(param1:_1M_6) : void
      {
         var _loc2_:_L_z = GameContext.getInjector().getInstance(_L_z);
         _loc2_.dispatch(param1.type);
      }
      
      private function _1zq(param1:_0Y_g) : void
      {
         var _loc2_:_0ca = this._T_X_.getInstance(_0ca);
         _loc2_._0sA_(param1);
      }
      
      private function _3T_(param1:_0J_j) : void
      {
         this._1U___.dispatch(param1._gh);
         var _loc2_:String = param1._gh > 0?this._0xI_._0oU_(param1._gh).getName():"";
         var _loc3_:String = param1._gh < 0?_1O_I_._1mI_:_1O_I_._0xw;
         this._V_8.dispatch(ChatMessage.make(Parameters.InfoText,_loc3_,-1,-1,"",false,{"petName":_loc2_}));
      }
      
      private function _vV_() : void
      {
         var _loc1_:_ou = this._T_X_.getInstance(_ou);
         _loc1_._1kw(CREATE);
         _loc1_._1kw(PLAYERSHOOT);
         _loc1_._1kw(MOVE);
         _loc1_._1kw(PLAYERTEXT);
         _loc1_._1kw(UPDATEACK);
         _loc1_._1kw(INVSWAP);
         _loc1_._1kw(USEITEM);
         _loc1_._1kw(HELLO);
         _loc1_._1kw(INVDROP);
         _loc1_._1kw(PONG);
         _loc1_._1kw(LOAD);
         _loc1_._1kw(SETCONDITION);
         _loc1_._1kw(TELEPORT);
         _loc1_._1kw(USEPORTAL);
         _loc1_._1kw(BUY);
         _loc1_._1kw(PLAYERHIT);
         _loc1_._1kw(ENEMYHIT);
         _loc1_._1kw(AOEACK);
         _loc1_._1kw(SHOOTACK);
         _loc1_._1kw(OTHERHIT);
         _loc1_._1kw(SQUAREHIT);
         _loc1_._1kw(GOTOACK);
         _loc1_._1kw(GROUNDDAMAGE);
         _loc1_._1kw(CHOOSENAME);
         _loc1_._1kw(CREATEGUILD);
         _loc1_._1kw(GUILDREMOVE);
         _loc1_._1kw(GUILDINVITE);
         _loc1_._1kw(REQUESTTRADE);
         _loc1_._1kw(CHANGETRADE);
         _loc1_._1kw(ACCEPTTRADE);
         _loc1_._1kw(CANCELTRADE);
         _loc1_._1kw(CHECKCREDITS);
         _loc1_._1kw(ESCAPE);
         _loc1_._1kw(JOINGUILD);
         _loc1_._1kw(CHANGEGUILDRANK);
         _loc1_._1kw(EDITACCOUNTLIST);
         _loc1_._1kw(FAILURE);
         _loc1_._1kw(CREATE_SUCCESS);
         _loc1_._1kw(SHOOT);
         _loc1_._1kw(DAMAGE);
         _loc1_._1kw(UPDATE);
         _loc1_._1kw(NOTIFICATION);
         _loc1_._1kw(GLOBAL_NOTIFICATION);
         _loc1_._1kw(NEW_TICK);
         _loc1_._1kw(SHOW_EFFECT);
         _loc1_._1kw(GOTO);
         _loc1_._1kw(INVRESULT);
         _loc1_._1kw(RECONNECT);
         _loc1_._1kw(PING);
         _loc1_._1kw(MAPINFO);
         _loc1_._1kw(PIC);
         _loc1_._1kw(DEATH);
         _loc1_._1kw(BUYRESULT);
         _loc1_._1kw(AOE);
         _loc1_._1kw(ACCOUNTLIST);
         _loc1_._1kw(QUESTOBJID);
         _loc1_._1kw(NAMERESULT);
         _loc1_._1kw(CREATE_GUILD_RESULT);
         _loc1_._1kw(ALLYSHOOT);
         _loc1_._1kw(MULTI_SHOOT);
         _loc1_._1kw(TRADEREQUESTED);
         _loc1_._1kw(TRADESTART);
         _loc1_._1kw(TRADECHANGED);
         _loc1_._1kw(TRADEDONE);
         _loc1_._1kw(TRADEACCEPTED);
         _loc1_._1kw(CLIENTSTAT);
         _loc1_._1kw(FILE);
         _loc1_._1kw(INVITEDTOGUILD);
         _loc1_._1kw(PLAYSOUND);
         _loc1_._1kw(TEXTBOX);
         _loc1_._1kw(TEXTBOXBUTTON);
         _loc1_._1kw(SWITCHMUSIC);
         _loc1_._1kw(CHEATING);
         _loc1_._1kw(LEADER);
         _loc1_._1kw(MULTIBOX);
         _loc1_._1kw(REQLEADERUPDATE);
         _loc1_._1kw(LEADERUPDATE);
         _loc1_._1kw(MARKETCOMMAND);
         _loc1_._1kw(MARKETRESULT);
         _loc1_._1kw(SETFOCUS);
         _loc1_._1kw(SERVERFULL);
         _loc1_._1kw(QUEUEPING);
         _loc1_._1kw(QUEUEPONG);
      }
      
      private function _F_T_() : void
      {
         var _loc1_:ICipher = null;
         var _loc2_:ICipher = null;
         if(Parameters._11E_)
         {
            _loc1_ = Crypto.getCipher("rc4",_18U_._09U_(Parameters.RANDOM1));
            _loc2_ = Crypto.getCipher("rc4",_18U_._09U_(Parameters.RANDOM2));
            serverConnection.setOutgoingCipher(_loc1_);
            serverConnection.setIncomingCipher(_loc2_);
         }
      }
      
      override public function getNextDamage(param1:uint, param2:uint) : uint
      {
         return this._11H_._E_E_(param1,param2);
      }
      
      override public function enableJitterWatcher() : void
      {
         if(jitterWatcher_ == null)
         {
            jitterWatcher_ = new JitterWatcher();
         }
      }
      
      override public function disableJitterWatcher() : void
      {
         if(jitterWatcher_ != null)
         {
            jitterWatcher_ = null;
         }
      }
      
      private function receiveTextBox(param1:TextBox) : void
      {
         var _loc2_:* = param1.button2_;
         if(_loc2_ == "")
         {
            _loc2_ = null;
         }
         var _loc3_:Dialog = new Dialog(param1.title_,param1.msg_,param1.button1_,_loc2_,"/error");
         _loc3_.type_ = param1.type_;
         _loc3_.addEventListener(Dialog.LEFT_BUTTON,this.txtBoxBtn1);
         _loc3_.addEventListener(Dialog.RIGHT_BUTTON,this.txtBoxBtn2);
         gs_.addChild(_loc3_);
      }
      
      private function txtBoxBtn1(param1:Event) : void
      {
         var _loc2_:Dialog = param1.currentTarget as Dialog;
         _loc2_.parent.removeChild(_loc2_);
         var _loc3_:TextBoxButton = this.messages.require(TEXTBOXBUTTON) as TextBoxButton;
         _loc3_.button_ = 1;
         _loc3_.type_ = _loc2_.type_;
         serverConnection.queueMessage(_loc3_);
      }
      
      private function txtBoxBtn2(param1:Event) : void
      {
         var _loc2_:Dialog = param1.currentTarget as Dialog;
         _loc2_.parent.removeChild(_loc2_);
         var _loc3_:TextBoxButton = this.messages.require(TEXTBOXBUTTON) as TextBoxButton;
         _loc3_.button_ = 2;
         _loc3_.type_ = _loc2_.type_;
         serverConnection.queueMessage(_loc3_);
      }
      
      private function switchMusic(param1:SwitchMusic) : void
      {
         Music.Load(param1.music);
      }
      
      private function setFocus(param1:SetFocus) : void
      {
         var _loc3_:GameObject = null;
         var _loc2_:Dictionary = this.gs_.map.goDict_;
         if(_loc2_)
         {
            _loc3_ = _loc2_[param1.objId_];
            gs_.setFocus(_loc3_);
            gs_.hudView.setMiniMapFocus(_loc3_);
            this.player.commune = this.objectId_ == param1.objId_?null:_loc3_;
         }
      }
      
      private function create() : void
      {
         var _loc1_:_0ih = this._0ta._1H_j();
         var _loc2_:Create = this.messages.require(CREATE) as Create;
         _loc2_.classType = _loc1_.id;
         _loc2_.skinType = _loc1_._E_G_._0sr().id;
         serverConnection.queueMessage(_loc2_);
      }
      
      private function load() : void
      {
         var _loc1_:Load = this.messages.require(LOAD) as Load;
         _loc1_.charId_ = charId_;
         _loc1_.isFromArena_ = isFromArena_;
         serverConnection.queueMessage(_loc1_);
         if(isFromArena_)
         {
            this._06Z_.dispatch(new BattleSummaryDialog());
         }
      }
      
      override public function playerShoot(param1:int, param2:Projectile) : void
      {
         var _loc3_:PlayerShoot = this.messages.require(PLAYERSHOOT) as PlayerShoot;
         _loc3_.time_ = param1;
         _loc3_.bulletId_ = param2.bulletId_;
         _loc3_.containerType_ = param2.containerType_;
         _loc3_.startingPos_.x_ = param2.x_;
         _loc3_.startingPos_.y_ = param2.y_;
         _loc3_.angle_ = param2.angle_;
         serverConnection.queueMessage(_loc3_);
      }
      
      override public function playerHit(param1:int, param2:int) : void
      {
         var _loc3_:PlayerHit = this.messages.require(PLAYERHIT) as PlayerHit;
         _loc3_.objectId_ = param2;
         _loc3_.bulletId_ = param1;
         serverConnection.queueMessage(_loc3_);
      }
      
      override public function enemyHit(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:EnemyHit = this.messages.require(ENEMYHIT) as EnemyHit;
         _loc5_.time_ = param1;
         _loc5_.bulletId_ = param2;
         _loc5_.targetId_ = param3;
         _loc5_.kill_ = param4;
         serverConnection.queueMessage(_loc5_);
      }
      
      override public function otherHit(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:OtherHit = this.messages.require(OTHERHIT) as OtherHit;
         _loc5_.time_ = param1;
         _loc5_.bulletId_ = param2;
         _loc5_.objectId_ = param3;
         _loc5_.targetId_ = param4;
         serverConnection.queueMessage(_loc5_);
      }
      
      override public function squareHit(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:SquareHit = this.messages.require(SQUAREHIT) as SquareHit;
         _loc4_.time_ = param1;
         _loc4_.bulletId_ = param2;
         _loc4_.objectId_ = param3;
         serverConnection.queueMessage(_loc4_);
      }
      
      public function aoeAck(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:AOEAck = this.messages.require(AOEACK) as AOEAck;
         _loc4_.time_ = param1;
         _loc4_.position_.x_ = param2;
         _loc4_.position_.y_ = param3;
         serverConnection.queueMessage(_loc4_);
      }
      
      override public function groundDamage(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:GroundDamage = this.messages.require(GROUNDDAMAGE) as GroundDamage;
         _loc4_.time_ = param1;
         _loc4_.position_.x_ = param2;
         _loc4_.position_.y_ = param3;
         serverConnection.queueMessage(_loc4_);
      }
      
      public function shootAck(param1:int) : void
      {
         var _loc2_:ShootAck = this.messages.require(SHOOTACK) as ShootAck;
         _loc2_.time_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function playerText(param1:String) : void
      {
         var _loc2_:PlayerText = this.messages.require(PLAYERTEXT) as PlayerText;
         _loc2_.text_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function invSwap(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         if(!gs_)
         {
            return false;
         }
         var _loc8_:InvSwap = this.messages.require(INVSWAP) as InvSwap;
         _loc8_.time_ = gs_.lastUpdate_;
         _loc8_.position_.x_ = param1.x_;
         _loc8_.position_.y_ = param1.y_;
         _loc8_.slotObject1_.objectId_ = param2.objectId_;
         _loc8_.slotObject1_.slotId = param3;
         _loc8_.slotObject1_.objectType_ = param4;
         _loc8_.slotObject2_.objectId_ = param5.objectId_;
         _loc8_.slotObject2_.slotId = param6;
         _loc8_.slotObject2_.objectType_ = param7;
         serverConnection.queueMessage(_loc8_);
         var _loc9_:int = param2.inventory_[param3];
         param2.inventory_[param3] = param5.inventory_[param6];
         param5.inventory_[param6] = _loc9_;
         SFX.play("inventory_move_item");
         return true;
      }
      
      override public function invSwapPotion(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         if(!gs_)
         {
            return false;
         }
         var _loc8_:InvSwap = this.messages.require(INVSWAP) as InvSwap;
         _loc8_.time_ = gs_.lastUpdate_;
         _loc8_.position_.x_ = param1.x_;
         _loc8_.position_.y_ = param1.y_;
         _loc8_.slotObject1_.objectId_ = param2.objectId_;
         _loc8_.slotObject1_.slotId = param3;
         _loc8_.slotObject1_.objectType_ = param4;
         _loc8_.slotObject2_.objectId_ = param5.objectId_;
         _loc8_.slotObject2_.slotId = param6;
         _loc8_.slotObject2_.objectType_ = param7;
         param2.inventory_[param3] = _0P_M_._F_p;
         if(param4 == _I_I_._1__7)
         {
            param1.healthStackCount_++;
         }
         else if(param4 == _I_I_._11C_)
         {
            param1.magicStackCount_++;
         }
         serverConnection.queueMessage(_loc8_);
         SFX.play("inventory_move_item");
         return true;
      }
      
      override public function invDrop(param1:GameObject, param2:int, param3:int) : void
      {
         var _loc4_:InvDrop = this.messages.require(INVDROP) as InvDrop;
         _loc4_.slotObject_.objectId_ = param1.objectId_;
         _loc4_.slotObject_.slotId = param2;
         _loc4_.slotObject_.objectType_ = param3;
         serverConnection.queueMessage(_loc4_);
         if(param2 != _I_I_._1dk && param2 != _I_I_._08K_)
         {
            param1.inventory_[param2] = _0P_M_._F_p;
         }
      }
      
      override public function useItem(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:int) : void
      {
         var _loc8_:UseItem = this.messages.require(USEITEM) as UseItem;
         _loc8_.time_ = param1;
         _loc8_.slotObject_.objectId_ = param2;
         _loc8_.slotObject_.slotId = param3;
         _loc8_.slotObject_.objectType_ = param4;
         _loc8_.itemUsePos_.x_ = param5;
         _loc8_.itemUsePos_.y_ = param6;
         _loc8_.useType_ = param7;
         serverConnection.queueMessage(_loc8_);
      }
      
      override public function useItem_new(param1:GameObject, param2:int) : Boolean
      {
         var _loc3_:int = param1.inventory_[param2];
         var _loc4_:XML = ObjectLibrary.XmlData[_loc3_];
         if(_loc4_ && !param1.isPaused() && (_loc4_.hasOwnProperty("Consumable") || _loc4_.hasOwnProperty("InvUse")))
         {
            if(!this._z0(_loc3_,param1))
            {
               this._V_8.dispatch(ChatMessage.make("",_loc4_.attribute("id") + " already at maxed. Stat boosted."));
            }
            else if(_10I_(_loc3_))
            {
               this._V_8.dispatch(ChatMessage.make("",_loc4_.attribute("id") + " Consumed ++"));
            }
            this._dE_(param1,param2,_loc3_,_loc4_);
            SFX.play("use_potion");
            return true;
         }
         if(this.swapEquip(param1,param2,_loc4_))
         {
            return true;
         }
         SFX.play("error");
         return false;
      }
      
      private function _z0(param1:int, param2:GameObject) : Boolean
      {
         var p:Player = null;
         var itemId:int = param1;
         var itemOwner:GameObject = param2;
         try
         {
            if(itemOwner is Player)
            {
               p = itemOwner as Player;
            }
            else
            {
               p = this.player;
            }
            if(itemId == 2591 && p._15v == p.attack_ - p.attackBonus_ || itemId == 2592 && p._029 == p.defense_ - p.defenseBonus_ || itemId == 2593 && p._0fg == p.speed_ - p.speedBonus_ || itemId == 2612 && p._0A_h == p.vitality_ - p.vitalityBonus_ || itemId == 2613 && p._00c == p.wisdom_ - p.wisdomBonus_ || itemId == 2636 && p._I_k == p.dexterity_ - p.dexterityBonus_ || itemId == 2793 && p._1S_q == p.maxHp_ - p.hpBonus_ || itemId == 2794 && p._z2 == p.maxMp_ - p.mpBonus_)
            {
               return false;
            }
         }
         catch(err:Error)
         {
            _0G_2.error("PROBLEM IN STAT INC " + err.getStackTrace());
         }
         return true;
      }
      
      public function swapEquip(param1:GameObject, param2:int, param3:XML) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:Vector.<int> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param3 && !param1.isPaused() && param3.hasOwnProperty("SlotType"))
         {
            _loc4_ = int(param3.SlotType);
            _loc5_ = param1._01e.slice(0,4);
            _loc6_ = 0;
            for each(_loc7_ in _loc5_)
            {
               if(_loc7_ == _loc4_)
               {
                  this.swapItems(param1,_loc6_,param2);
                  return true;
               }
               _loc6_++;
            }
         }
         return false;
      }
      
      public function swapItems(param1:GameObject, param2:int, param3:int) : void
      {
         var _loc4_:Vector.<int> = param1.inventory_;
         this.invSwap(param1 as Player,param1,param2,_loc4_[param2],param1,param3,_loc4_[param3]);
      }
      
      private function _dE_(param1:GameObject, param2:int, param3:int, param4:XML) : void
      {
         var _loc5_:UseItem = this.messages.require(USEITEM) as UseItem;
         _loc5_.time_ = getTimer();
         _loc5_.slotObject_.objectId_ = param1.objectId_;
         _loc5_.slotObject_.slotId = param2;
         _loc5_.slotObject_.objectType_ = param3;
         _loc5_.itemUsePos_.x_ = 0;
         _loc5_.itemUsePos_.y_ = 0;
         serverConnection.queueMessage(_loc5_);
         if(param4.hasOwnProperty("Consumable"))
         {
            param1.inventory_[param2] = -1;
         }
      }
      
      override public function setCondition(param1:uint, param2:Number) : void
      {
         var _loc3_:SetCondition = this.messages.require(SETCONDITION) as SetCondition;
         _loc3_.conditionEffect_ = param1;
         _loc3_.conditionDuration_ = param2;
         serverConnection.queueMessage(_loc3_);
      }
      
      public function move(param1:int, param2:Player) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = -1;
         var _loc6_:Number = -1;
         var _loc7_:GameObject = param2 != null && param2.commune != null && !(param2.commune is Player)?param2.commune:param2;
         if(_loc7_ && !_loc7_.isPaused())
         {
            _loc5_ = _loc7_.x_;
            _loc6_ = _loc7_.y_;
         }
         var _loc8_:Movement = this.messages.require(MOVE) as Movement;
         _loc8_.objectId_ = _loc7_ != null?int(_loc7_.objectId_):0;
         _loc8_.tickId_ = param1;
         _loc8_.time_ = gs_.lastUpdate_;
         _loc8_.newPosition_.x_ = _loc5_;
         _loc8_.newPosition_.y_ = _loc6_;
         var _loc9_:int = gs_.moveRecords_.lastClearTime_;
         _loc8_.records_.length = 0;
         if(_loc9_ >= 0 && _loc8_.time_ - _loc9_ > 125)
         {
            _loc3_ = Math.min(10,gs_.moveRecords_.records_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(gs_.moveRecords_.records_[_loc4_].time_ >= _loc8_.time_ - 25)
               {
                  break;
               }
               _loc8_.records_.push(gs_.moveRecords_.records_[_loc4_]);
               _loc4_++;
            }
         }
         gs_.moveRecords_.clear(_loc8_.time_);
         serverConnection.queueMessage(_loc8_);
         param2 && param2._K_U_();
      }
      
      override public function teleport(param1:int) : void
      {
         var _loc2_:Teleport = this.messages.require(TELEPORT) as Teleport;
         _loc2_.objectId_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function usePortal(param1:int) : void
      {
         var _loc2_:UsePortal = this.messages.require(USEPORTAL) as UsePortal;
         _loc2_.objectId_ = param1;
         serverConnection.queueMessage(_loc2_);
         this.RemoveDavyKeys();
      }
      
      private function RemoveDavyKeys() : void
      {
         if(gs_.map && gs_.map.name_ == "Davy")
         {
            _1ep._0D_t.dispatch();
         }
      }
      
      override public function buy(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(outstandingBuy_ != null)
         {
            return;
         }
         var _loc2_:SellableObject = gs_.map.goDict_[param1];
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.currency_ == Currency.GOLD)
         {
            _loc3_ = gs_.model.getConverted() || this.player.credits_ > 100 || _loc2_.price_ > this.player.credits_;
         }
         outstandingBuy_ = new _9r(_loc2_.soldObjectInternalName(),_loc2_.price_,_loc2_.currency_,_loc3_);
         var _loc4_:Buy = this.messages.require(BUY) as Buy;
         _loc4_.objectId_ = param1;
         serverConnection.queueMessage(_loc4_);
      }
      
      public function gotoAck(param1:int) : void
      {
         var _loc2_:GotoAck = this.messages.require(GOTOACK) as GotoAck;
         _loc2_.time_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function editAccountList(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc4_:EditAccountList = this.messages.require(EDITACCOUNTLIST) as EditAccountList;
         _loc4_.accountListId_ = param1;
         _loc4_.add_ = param2;
         _loc4_.objectId_ = param3;
         serverConnection.queueMessage(_loc4_);
      }
      
      override public function chooseName(param1:String) : void
      {
         var _loc2_:ChooseName = this.messages.require(CHOOSENAME) as ChooseName;
         _loc2_.name_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function createGuild(param1:String) : void
      {
         var _loc2_:CreateGuild = this.messages.require(CREATEGUILD) as CreateGuild;
         _loc2_.name_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function guildRemove(param1:String) : void
      {
         var _loc2_:GuildRemove = this.messages.require(GUILDREMOVE) as GuildRemove;
         _loc2_.name_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function guildInvite(param1:String) : void
      {
         var _loc2_:GuildInvite = this.messages.require(GUILDINVITE) as GuildInvite;
         _loc2_.name_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function requestTrade(param1:String) : void
      {
         var _loc2_:RequestTrade = this.messages.require(REQUESTTRADE) as RequestTrade;
         _loc2_.name_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function changeTrade(param1:Vector.<Boolean>) : void
      {
         var _loc2_:ChangeTrade = this.messages.require(CHANGETRADE) as ChangeTrade;
         _loc2_.offer_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function acceptTrade(param1:Vector.<Boolean>, param2:Vector.<Boolean>) : void
      {
         var _loc3_:AcceptTrade = this.messages.require(ACCEPTTRADE) as AcceptTrade;
         _loc3_.myOffer_ = param1;
         _loc3_.yourOffer_ = param2;
         serverConnection.queueMessage(_loc3_);
      }
      
      override public function cancelTrade() : void
      {
         serverConnection.queueMessage(this.messages.require(CANCELTRADE));
      }
      
      override public function checkCredits() : void
      {
         serverConnection.queueMessage(this.messages.require(CHECKCREDITS));
      }
      
      override public function escape() : void
      {
         if(this.objectId_ == -1)
         {
            return;
         }
         if(gs_.map && gs_.map.name_ == "Nexus")
         {
            this.gs_.closed.dispatch();
            return;
         }
         var _loc1_:Reconnect = new Reconnect(RECONNECT,null);
         _loc1_.host_ = "";
         _loc1_.gameId_ = -2;
         _loc1_.name_ = "Nexus";
         _loc1_.key_ = new ByteArray();
         _loc1_.isFromArena_ = false;
         this.HandleReconnect(_loc1_);
         this.RemoveDavyKeys();
      }
      
      override public function joinGuild(param1:String) : void
      {
         var _loc2_:JoinGuild = this.messages.require(JOINGUILD) as JoinGuild;
         _loc2_.guildName_ = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      override public function changeGuildRank(param1:String, param2:int) : void
      {
         var _loc3_:ChangeGuildRank = this.messages.require(CHANGEGUILDRANK) as ChangeGuildRank;
         _loc3_.name_ = param1;
         _loc3_.guildRank_ = param2;
         serverConnection.queueMessage(_loc3_);
      }
      
      private function _1S_A_(param1:String) : String
      {
         var _loc2_:RSAKey = PEM.readRSAPublicKey(Parameters._1eT_);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeUTFBytes(param1);
         var _loc4_:ByteArray = new ByteArray();
         _loc2_.encrypt(_loc3_,_loc4_,_loc3_.length);
         return Base64.encodeByteArray(_loc4_);
      }
      
      private function _1dd() : void
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         this._V_8.dispatch(ChatMessage.make(Parameters.ClientText,_1O_I_._15F_));
         this._F_T_();
         var _loc2_:Hello = this.messages.require(HELLO) as Hello;
         _loc2_.buildVersion_ = Parameters.Build + "." + Parameters.SubBuild;
         _loc2_.gameId_ = gameId_;
         _loc2_.guid_ = this._1S_A_(_loc1_.getUserId());
         _loc2_.password_ = this._1S_A_(_loc1_._0a7());
         _loc2_.secret_ = this._1S_A_(_loc1_._1xj());
         _loc2_.keyTime_ = keyTime_;
         _loc2_.key_.length = 0;
         key_ != null && _loc2_.key_.writeBytes(key_);
         _loc2_._01H_ = _01H_ == null?"":_01H_;
         _loc2_._1Q_J_ = _loc1_._1jd();
         _loc2_._1dT_ = _loc1_._L_y();
         _loc2_._0Q_u = _loc1_._00Z_();
         _loc2_._0fT_ = _loc1_._0fT_();
         _loc2_._10f = _loc1_._0bQ_();
         serverConnection.queueMessage(_loc2_);
      }
      
      private function _G_j(param1:CreateSuccess) : void
      {
         this.objectId_ = param1.objectId_;
         charId_ = param1.charId_;
         gs_.initialize();
         _S_a = false;
      }
      
      private function _eL_(param1:Damage) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Projectile = null;
         var _loc3_:_76 = gs_.map;
         if(param1.objectId_ >= 0 && param1.bulletId_ > 0)
         {
            _loc2_ = Projectile._0B_F_(param1.objectId_,param1.bulletId_);
            _loc4_ = _loc3_.oDict_[_loc2_] as Projectile;
            if(_loc4_ != null && !_loc4_.projProps_.multiHit_)
            {
               _loc3_.removeObj(_loc2_);
            }
         }
         var _loc5_:GameObject = _loc3_.goDict_[param1.targetId_];
         if(_loc5_ != null)
         {
            _loc5_.damage(-1,param1.damageAmount_,param1.effects_,param1.kill_,_loc4_);
         }
      }
      
      private function _g__(param1:Shoot) : void
      {
         var _loc2_:* = param1.ownerId_ == this.objectId_;
         var _loc3_:GameObject = gs_.map.goDict_[param1.ownerId_];
         if(_loc3_ == null || _loc3_.dying_)
         {
            if(_loc2_)
            {
               this.shootAck(-1);
            }
            return;
         }
         var _loc4_:Projectile = _1C_q._1I_j(Projectile) as Projectile;
         var _loc5_:Player = _loc3_ as Player;
         if(_loc5_ != null)
         {
            _loc4_.reset(param1.containerType_,0,param1.ownerId_,param1.bulletId_,param1.angle_,gs_.lastUpdate_,_loc5_._sB_,_loc5_._0vn);
         }
         else
         {
            _loc4_.reset(param1.containerType_,0,param1.ownerId_,param1.bulletId_,param1.angle_,gs_.lastUpdate_);
         }
         _loc4_._0jS_(param1.damage_);
         gs_.map.addObj(_loc4_,param1.startingPos_.x_,param1.startingPos_.y_);
         if(_loc2_)
         {
            this.shootAck(gs_.lastUpdate_);
         }
      }
      
      private function _E_x(param1:AllyShoot) : void
      {
         if(!Parameters.data_.allyProjectiles)
         {
            return;
         }
         var _loc2_:GameObject = gs_.map.goDict_[param1.ownerId_];
         if(_loc2_ == null || _loc2_.dying_)
         {
            return;
         }
         var _loc3_:Projectile = _1C_q._1I_j(Projectile) as Projectile;
         var _loc4_:Player = _loc2_ as Player;
         if(_loc4_ != null)
         {
            _loc3_.reset(param1.containerType_,0,param1.ownerId_,param1.bulletId_,param1.angle_,gs_.lastUpdate_,_loc4_._sB_,_loc4_._0vn);
         }
         else
         {
            _loc3_.reset(param1.containerType_,0,param1.ownerId_,param1.bulletId_,param1.angle_,gs_.lastUpdate_);
         }
         gs_.map.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
         _loc2_.setAttack(param1.containerType_,param1.angle_);
      }
      
      private function _13m(param1:ReskinResult) : void
      {
         var _loc2_:_Y_F_ = this._0ta._0B_M_(this.model.player.objectType_)._E_G_._nV_(param1.skinID);
         _loc2_.setState(_1G_k.OWNED);
      }
      
      private function _K_q(param1:MultiShoot) : void
      {
         var _loc2_:Projectile = null;
         var _loc3_:Number = NaN;
         var _loc5_:int = 0;
         var _loc4_:GameObject = gs_.map.goDict_[param1.ownerId_];
         if(_loc4_ == null || _loc4_.dying_)
         {
            this.shootAck(-1);
            return;
         }
         while(_loc5_ < param1.numShots_)
         {
            _loc2_ = _1C_q._1I_j(Projectile) as Projectile;
            _loc3_ = param1.angle_ + param1.angleInc_ * _loc5_;
            _loc2_.reset(_loc4_.objectType_,param1.bulletType_,param1.ownerId_,(param1.bulletId_ + _loc5_) % 256,_loc3_,gs_.lastUpdate_);
            _loc2_._0jS_(param1.damage_);
            gs_.map.addObj(_loc2_,param1.startingPos_.x_,param1.startingPos_.y_);
            _loc5_++;
         }
         this.shootAck(gs_.lastUpdate_);
         _loc4_.setAttack(_loc4_.objectType_,param1.angle_ + param1.angleInc_ * ((param1.numShots_ - 1) / 2));
      }
      
      private function _1G_N_(param1:TradeRequested) : void
      {
         if(!Parameters.data_.chatTrade)
         {
            return;
         }
         if(Parameters.data_.showTradePopup)
         {
            gs_.hudView.interactPanel.setOverride(new TradeRequestPanel(gs_,param1.name_));
         }
         this._V_8.dispatch(ChatMessage.make("",param1.name_ + " wants to " + "trade with you.  Type \"/trade " + param1.name_ + "\" to trade."));
      }
      
      private function _01W_(param1:TradeStart) : void
      {
         gs_.hudView.startTrade(gs_,param1);
      }
      
      private function _1fp(param1:TradeChanged) : void
      {
         gs_.hudView.tradeChanged(param1);
      }
      
      private function _1T_0(param1:TradeDone) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         gs_.hudView.tradeDone();
         var _loc4_:* = "";
         try
         {
            _loc3_ = JSON.parse(param1.description_);
            _loc4_ = _loc3_.key;
            _loc2_ = _loc3_.tokens;
         }
         catch(e:Error)
         {
         }
         this._V_8.dispatch(ChatMessage.make(Parameters.InfoText,_loc4_,-1,-1,"",false,_loc2_));
      }
      
      private function _O_W_(param1:TradeAccepted) : void
      {
         gs_.hudView.tradeAccepted(param1);
      }
      
      private function _1X_(param1:_Q_x) : void
      {
         var _loc2_:_76 = gs_.map;
         var _loc3_:GameObject = ObjectLibrary._1zA_(param1.objectType_);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:_0vp = param1._1V_S_;
         _loc3_.setObjectId(_loc4_.objectId_);
         _loc2_.addObj(_loc3_,_loc4_.pos_.x_,_loc4_.pos_.y_);
         if(_loc3_ is Player)
         {
            this._1N_A_(_loc3_ as Player,_loc2_);
         }
         this._H_Y_(_loc4_,0,-1);
         if(_loc3_.props_.static_ && _loc3_.props_.occupySquare_ && !_loc3_.props_.noMiniMap_)
         {
            this._dF_.dispatch(new _Q_e(_loc3_.x_,_loc3_.y_,_loc3_));
         }
      }
      
      private function _1N_A_(param1:Player, param2:_76) : void
      {
         this._10k(param1,0);
         if(param1.objectId_ == this.objectId_)
         {
            this.player = param1;
            this.model.player = param1;
            param2.player_ = param1;
            gs_.setFocus(param1);
            this._0cp.dispatch(this.objectId_.toString());
         }
      }
      
      private function _x7(param1:Update) : void
      {
         var _loc2_:int = 0;
         var _loc3_:_mZ_ = null;
         var _loc4_:Message = this.messages.require(UPDATEACK);
         serverConnection.queueMessage(_loc4_);
         _loc2_ = 0;
         while(_loc2_ < param1.tiles_.length)
         {
            _loc3_ = param1.tiles_[_loc2_];
            gs_.map.setGroundTile(_loc3_.x_,_loc3_.y_,_loc3_.type_);
            this._0Z_5.dispatch(new _1zw(_loc3_.x_,_loc3_.y_,_loc3_.type_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.drops_.length)
         {
            gs_.map.removeObj(param1.drops_[_loc2_]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.newObjs_.length)
         {
            this._1X_(param1.newObjs_[_loc2_]);
            _loc2_++;
         }
      }
      
      private function _jZ_(param1:Notification) : void
      {
         var _loc2_:_dU_ = null;
         var _loc3_:_13g = null;
         var _loc4_:_qP_ = null;
         var _loc5_:GameObject = gs_.map.goDict_[param1.objectId_];
         if(_loc5_ != null)
         {
            _loc2_ = _dU_.fromJSON(param1.message);
            if(_loc2_.key == "server.plus_symbol")
            {
               _loc3_ = new _13g(_loc5_,param1.color_,1000);
               _loc3_.setStringBuilder(_loc2_);
               gs_.map.mapOverlay_.addStatusText(_loc3_);
            }
            else
            {
               _loc4_ = new _qP_(_loc5_,_loc2_,param1.color_,2000);
               gs_.map.mapOverlay_.addQueuedText(_loc4_);
               if(_loc5_ == this.player && _loc2_.key == "server.quest_complete")
               {
                  gs_.map.quest_.completed();
               }
            }
         }
      }
      
      private function _0qL_(param1:GlobalNotification) : void
      {
         var _loc2_:GameSprite = null;
         switch(param1.text)
         {
            case "yellow":
               _1C_w._0D_t.dispatch(_0jn._1J_E_);
               return;
            case "red":
               _1C_w._0D_t.dispatch(_0jn._16D_);
               return;
            case "green":
               _1C_w._0D_t.dispatch(_0jn._1L_w);
               return;
            case "purple":
               _1C_w._0D_t.dispatch(_0jn._6Q_);
               return;
            case "showKeyUI":
               _1ep._0D_t.dispatch();
               return;
            case "giftChestOccupied":
               this._0W_s.dispatch(_0eZ_._1__Q_);
               return;
            case "giftChestEmpty":
               this._0W_s.dispatch(_0eZ_._jY_);
               return;
            case "beginnersPackage":
               return;
            case "forcePrivateMessageRefresh":
               _loc2_ = this.gs_ as GameSprite;
               _loc2_.privateMessageDisplay.refresh();
               return;
            default:
               return;
         }
      }
      
      private function _kx(param1:NewTick) : void
      {
         var _loc2_:_0vp = null;
         if(jitterWatcher_ != null)
         {
            jitterWatcher_.record();
         }
         this.move(param1.tickId_,this.player);
         for each(_loc2_ in param1.statuses_)
         {
            this._H_Y_(_loc2_,param1.tickTime_,param1.tickId_);
         }
         lastTickId_ = param1.tickId_;
      }
      
      private function _0F_r(param1:ShowEffect) : void
      {
         var _loc2_:GameObject = null;
         var _loc3_:ParticleEffect = null;
         var _loc4_:Point = null;
         var _loc5_:uint = 0;
         var _loc6_:_76 = gs_.map;
         switch(param1.effectType_)
         {
            case ShowEffect.Potion:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc6_.addObj(new _0A_v(_loc2_,param1.color_),_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Teleport:
               _loc6_.addObj(new TeleportEffect(),param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.Stream:
               _loc3_ = new StreamEffect(param1.pos1_,param1.pos2_,param1.color_);
               _loc6_.addObj(_loc3_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.Throw:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               _loc4_ = _loc2_ != null?new Point(_loc2_.x_,_loc2_.y_):param1.pos2_._1O_q();
               _loc3_ = new ThrowEffect(_loc4_,param1.pos1_._1O_q(),param1.color_);
               _loc6_.addObj(_loc3_,_loc4_.x,_loc4_.y);
               return;
            case ShowEffect.AreaBlast:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _G_Q_(_loc2_,param1.pos1_.x_,param1.color_);
               _loc6_.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Dead:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _0d7(_loc2_,param1.color_);
               _loc6_.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Trail:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _0wv(_loc2_,param1.pos1_,param1.color_);
               _loc6_.addObj(_loc3_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.Diffuse:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _6y(_loc2_,param1.pos1_,param1.pos2_,param1.color_);
               _loc6_.addObj(_loc3_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.Flow:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new FlowEffect(param1.pos1_,_loc2_,param1.color_);
               _loc6_.addObj(_loc3_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.Trap:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _0O_X_(_loc2_,param1.pos1_.x_,param1.color_);
               _loc6_.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Lightning:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _1D_9(_loc2_,param1.pos1_,param1.color_,param1.pos2_.x_);
               _loc6_.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Concentrate:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _0zT_(_loc2_,param1.pos1_,param1.pos2_,param1.color_);
               _loc6_.addObj(_loc3_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.BlastWave:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _0ts(_loc2_,param1.pos1_,param1.pos2_.x_,param1.color_);
               _loc6_.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect.Earthquake:
               gs_.camera_.startJitter();
               return;
            case ShowEffect.Flashing:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_._1bO_ = new _T_k(getTimer(),param1.color_,param1.pos1_.x_,param1.pos1_.y_);
               return;
            case ShowEffect.BeachBall:
               _loc4_ = param1.pos1_._1O_q();
               _loc3_ = new _1X_X_(param1.color_,param1.pos2_._1O_q(),param1.pos1_._1O_q());
               _loc6_.addObj(_loc3_,_loc4_.x,_loc4_.y);
               return;
            case ShowEffect._S_H_:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               if(_loc2_ && _loc2_._sT_)
               {
                  _loc2_._sT_.destroy();
               }
               _loc3_ = new _3E_(_loc2_);
               _loc2_._sT_ = _3E_(_loc3_);
               gs_.map.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect._P_x:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc3_ = new _1S_(_loc2_);
               gs_.map.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
            case ShowEffect._iR_:
               _loc2_ = _loc6_.goDict_[param1.targetObjectId_];
               if(_loc2_ == null)
               {
                  break;
               }
               _loc5_ = param1.pos1_.x_ * 1000;
               _loc3_ = new _0G_c(_loc2_,_loc5_);
               gs_.map.addObj(_loc3_,_loc2_.x_,_loc2_.y_);
               return;
         }
      }
      
      private function _0H_1(param1:Goto) : void
      {
         this.gotoAck(gs_.lastUpdate_);
         var _loc2_:GameObject = gs_.map.goDict_[param1.objectId_];
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_._0H_1(param1.pos_.x_,param1.pos_.y_,gs_.lastUpdate_);
      }
      
      private function _0vS_(param1:GameObject, param2:Vector.<StatData>, param3:Boolean) : void
      {
         var _loc4_:StatData = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Player = param1 as Player;
         var _loc8_:Merchant = param1 as Merchant;
         var _loc9_:Pet = param1 as Pet;
         if(_loc9_)
         {
            this._0R_e._1D_V_(_loc9_,param2);
            if(gs_.map.isPetYard)
            {
               this._0R_e._0t7(_loc9_,param2);
            }
            return;
         }
         for each(_loc4_ in param2)
         {
            _loc5_ = _loc4_._16Q_;
            switch(_loc4_._M_K_)
            {
               case StatData.MAXHP:
                  param1.maxHp_ = _loc5_;
                  continue;
               case StatData.HP:
                  param1.hp_ = _loc5_;
                  continue;
               case StatData.SIZE:
                  if(param1 is Player)
                  {
                     (param1 as Player).setSize(_loc5_);
                  }
                  else
                  {
                     param1.size_ = _loc5_;
                  }
                  continue;
               case StatData.MAXMP:
                  _loc7_.maxMp_ = _loc5_;
                  continue;
               case StatData.MP:
                  _loc7_.mp_ = _loc5_;
                  continue;
               case StatData.EXPGOAL:
                  _loc7_.expGoal_ = _loc5_;
                  continue;
               case StatData.EXP:
                  _loc7_.exp_ = _loc5_;
                  continue;
               case StatData.LEVEL:
                  param1.level_ = _loc5_;
                  continue;
               case StatData.ATTACK:
                  _loc7_.attack_ = _loc5_;
                  continue;
               case StatData.DEFENSE:
                  param1.defense_ = _loc5_;
                  continue;
               case StatData.SPEED:
                  _loc7_.speed_ = _loc5_;
                  continue;
               case StatData.DEXTERITY:
                  _loc7_.dexterity_ = _loc5_;
                  continue;
               case StatData.VITALITY:
                  _loc7_.vitality_ = _loc5_;
                  continue;
               case StatData.WISDOM:
                  _loc7_.wisdom_ = _loc5_;
                  continue;
               case StatData.DAMAGEMIN:
                  _loc7_.damageMin_ = _loc5_;
                  continue;
               case StatData.DAMAGEMAX:
                  _loc7_.damageMax_ = _loc5_;
                  continue;
               case StatData.EFFECTS:
                  if(_loc5_ != 0 && _loc7_ == this.gs_.map.player_)
                  {
                     _loc5_ = _loc5_;
                  }
                  param1.condition_[ConditionEffect.FirstOrder] = _loc5_;
                  continue;
               case StatData.INVENTORY_0_STAT:
               case StatData.INVENTORY_1_STAT:
               case StatData.INVENTORY_2_STAT:
               case StatData.INVENTORY_3_STAT:
               case StatData.INVENTORY_4_STAT:
               case StatData.INVENTORY_5_STAT:
               case StatData.INVENTORY_6_STAT:
               case StatData.INVENTORY_7_STAT:
               case StatData.INVENTORY_8_STAT:
               case StatData.INVENTORY_9_STAT:
               case StatData.INVENTORY_10_STAT:
               case StatData.INVENTORY_11_STAT:
                  param1.inventory_[_loc4_._M_K_ - StatData.INVENTORY_0_STAT] = _loc5_;
                  continue;
               case StatData.STARS:
                  _loc7_.numStars_ = _loc5_;
                  continue;
               case StatData.NAME:
                  if(param1.name_ != _loc4_._vP_)
                  {
                     param1.name_ = _loc4_._vP_;
                     param1._11b = null;
                  }
                  continue;
               case StatData.TEX1_STAT:
                  param1.setTex1(_loc5_);
                  continue;
               case StatData.TEX2_STAT:
                  param1.setTex2(_loc5_);
                  continue;
               case StatData.MERCHANTMERCHANDISETYPE:
                  _loc8_.setMerchandiseType(_loc5_);
                  continue;
               case StatData.CREDITS:
                  _loc7_.setCredits(_loc5_);
                  continue;
               case StatData.SELLABLEPRICE:
                  (param1 as SellableObject).setPrice(_loc5_);
                  continue;
               case StatData.PROTALUSABLE:
                  (param1 as Portal).usable_ = _loc5_ != 0;
                  continue;
               case StatData.ACCOUNTID:
                  _loc7_.accountId_ = !!WebMain.pserver?String(_loc5_):_loc4_._vP_;
                  continue;
               case StatData.CURRENTFAME:
                  _loc7_.currentFame_ = _loc5_;
                  continue;
               case StatData.TOKENS:
                  _loc7_.setTokens(_loc5_);
                  continue;
               case StatData.SELLABLEPRICECURRENCY:
                  (param1 as SellableObject)._11s(_loc5_);
                  continue;
               case StatData.OBJECTCONNECTION:
                  param1.objectConnection = _loc5_;
                  continue;
               case StatData.MERCHANTREMAININGCOUNT:
                  _loc8_.merchantRemainingCount = _loc5_;
                  _loc8_.merchantRemainingTime = 0;
                  continue;
               case StatData.MERCHANTREMAININGMINUTE:
                  _loc8_.merchantRemainingMinute = _loc5_;
                  _loc8_.merchantRemainingTime = 0;
                  continue;
               case StatData.MERCHANTDISCOUNT:
                  _loc8_.merchantDiscount = _loc5_;
                  _loc8_.merchantRemainingTime = 0;
                  continue;
               case StatData.SELLABLERANKREQUIREMENT:
                  (param1 as SellableObject).setRankReq(_loc5_);
                  continue;
               case StatData.HPBONUS:
                  _loc7_.hpBonus_ = _loc5_;
                  continue;
               case StatData.MPBONUS:
                  _loc7_.mpBonus_ = _loc5_;
                  continue;
               case StatData.ATTACKBONUS:
                  _loc7_.attackBonus_ = _loc5_;
                  continue;
               case StatData.DEFENSEBONUS:
                  _loc7_.defenseBonus_ = _loc5_;
                  continue;
               case StatData.SPEEDBOUNUS:
                  _loc7_.speedBonus_ = _loc5_;
                  continue;
               case StatData.VITALITYBONUS:
                  _loc7_.vitalityBonus_ = _loc5_;
                  continue;
               case StatData.WISDOMBONUS:
                  _loc7_.wisdomBonus_ = _loc5_;
                  continue;
               case StatData.DEXTERITYBONUS:
                  _loc7_.dexterityBonus_ = _loc5_;
                  continue;
               case StatData.DAMAGEMINBONUS:
                  _loc7_.damageMinBonus_ = _loc5_;
                  continue;
               case StatData.DAMAGEMAXBONUS:
                  _loc7_.damageMaxBonus_ = _loc5_;
                  continue;
               case StatData.OWNERACCOUNTID:
                  (param1 as Container)._1e4(!!WebMain.pserver?String(_loc5_):_loc4_._vP_);
                  continue;
               case StatData.NAMECHANGERSTAR:
                  (param1 as NameChanger)._P_F_(_loc5_);
                  continue;
               case StatData.NAMECHOSEN:
                  _loc7_.nameChosen_ = _loc5_ != 0;
                  param1._11b = null;
                  continue;
               case StatData.FAME:
                  _loc7_.fame_ = _loc5_;
                  continue;
               case StatData.FAMEGOAL:
                  _loc7_.fameGoal_ = _loc5_;
                  continue;
               case StatData.GLOWING:
                  _loc7_.glowing_ = _loc5_;
                  _loc7_._1zo = new Dictionary();
                  continue;
               case StatData.SINKOFFSET:
                  if(!param3)
                  {
                     _loc7_.sinkOffset_ = _loc5_;
                  }
                  continue;
               case StatData.ALTTEXTUREINDEX:
                  param1.setAltTexture(_loc5_);
                  continue;
               case StatData.GUILD:
                  _loc7_.setGuild(_loc4_._vP_);
                  continue;
               case StatData.GUILDRANK:
                  _loc7_.guildRank_ = _loc5_;
                  continue;
               case StatData.OXYGENBAR:
                  _loc7_.breath_ = _loc5_;
                  continue;
               case StatData.XPBOOST:
                  _loc7_.xpBoost_ = _loc5_;
                  continue;
               case StatData.XPBOOSTTIME:
                  _loc7_.xpBoostTime_ = _loc5_ * _1X_t;
                  continue;
               case StatData.DROPRATETIME:
                  _loc7_.dropRateTime_ = _loc5_ * _1X_t;
                  continue;
               case StatData.LOOTTIERTIME:
                  _loc7_.lootTierTime_ = _loc5_ * _1X_t;
                  continue;
               case StatData.HEALTHSTACKCOUNT:
                  _loc7_.healthStackCount_ = _loc5_;
                  continue;
               case StatData.MAGICSTACKCOUNT:
                  _loc7_.magicStackCount_ = _loc5_;
                  continue;
               case StatData.SKIN:
                  _loc7_.skin_ != _loc5_ && this._10k(_loc7_,_loc5_);
                  _loc7_.skin_ = _loc5_;
                  continue;
               case StatData.HASBACKPACK:
                  (param1 as Player).hasBackpack_ = Boolean(_loc5_);
                  if(param3)
                  {
                     this._0I_U_.dispatch(Boolean(_loc5_));
                  }
                  continue;
               case StatData.BACKPACK_0_STAT:
               case StatData.BACKPACK_1_STAT:
               case StatData.BACKPACK_2_STAT:
               case StatData.BACKPACK_3_STAT:
               case StatData.BACKPACK_4_STAT:
               case StatData.BACKPACK_5_STAT:
               case StatData.BACKPACK_6_STAT:
               case StatData.BACKPACK_7_STAT:
                  _loc6_ = _loc4_._M_K_ - StatData.BACKPACK_0_STAT + _1Y_F_._J_p + _1Y_F_._16J_;
                  (param1 as Player).inventory_[_loc6_] = _loc5_;
                  continue;
               case StatData.EFFECTS2:
                  param1.condition_[ConditionEffect.SecondOrder] = _loc5_;
                  continue;
               case StatData.RANK:
                  _loc7_.rank_ = _loc5_;
                  continue;
               case StatData.ADMIN:
                  _loc7_.admin_ = _loc5_ == 1?true:false;
                  continue;
               default:
                  continue;
            }
         }
      }
      
      private function _10k(param1:Player, param2:int) : void
      {
         var _loc3_:Reskin = this.messages.require(RESKIN) as Reskin;
         _loc3_.skinID = param2;
         _loc3_.player = param1;
         _loc3_.consume();
      }
      
      private function _H_Y_(param1:_0vp, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_0ih = null;
         var _loc8_:XML = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:ObjectProperties = null;
         var _loc13_:ProjectileProperties = null;
         var _loc14_:Array = null;
         var _loc20_:_sV_ = null;
         var _loc15_:_76 = gs_.map;
         var _loc16_:GameObject = _loc15_.goDict_[param1.objectId_];
         if(_loc16_ == null)
         {
            return;
         }
         var _loc17_:* = param1.objectId_ == this.objectId_;
         var _loc18_:* = this.player != null && this.player.commune != null && !(this.player.commune is Player) && param1.objectId_ == this.player.commune.objectId_;
         if(param2 != 0 && !_loc17_ && !_loc18_)
         {
            _loc16_._rl(param1.pos_.x_,param1.pos_.y_,param2,param3);
         }
         var _loc19_:Player = _loc16_ as Player;
         if(_loc19_ != null)
         {
            _loc4_ = _loc19_.level_;
            _loc5_ = _loc19_.exp_;
            _loc6_ = _loc19_.skin_;
         }
         this._0vS_(_loc16_,param1._0O_6,_loc17_);
         if(_loc19_)
         {
            if(_loc17_)
            {
               _loc7_ = this._0ta._0B_M_(_loc19_.objectType_);
               if(_loc7_._0sH_() < _loc19_.level_)
               {
                  _loc7_._0Q_s(_loc19_.level_);
               }
            }
            if(_loc19_.skin_ != _loc6_)
            {
               if(ObjectLibrary.EquipmentSetSkin[_loc19_.skin_] != null)
               {
                  _loc8_ = ObjectLibrary.EquipmentSetSkin[_loc19_.skin_] as XML;
                  _loc9_ = _loc8_.attribute("color");
                  _loc10_ = _loc8_.attribute("bulletType");
                  if(_loc4_ != -1 && _loc9_.length > 0)
                  {
                     _loc19_._o8(uint(_loc9_));
                  }
                  if(_loc10_.length > 0)
                  {
                     _loc19_._sB_ = _loc10_;
                     _loc11_ = _loc19_.inventory_[0];
                     _loc12_ = ObjectLibrary._01A_[_loc11_];
                     _loc13_ = _loc12_._0hB_[0];
                     _loc19_._0vn = _loc13_.objectId_;
                  }
               }
               else if(ObjectLibrary.EquipmentSetSkin[_loc19_.skin_] == null)
               {
                  _loc19_._sB_ = "";
                  _loc19_._0vn = "";
               }
               if(_loc19_.effect_ != null)
               {
                  _loc19_.map_.removeObj(_loc19_.effect_.objectId_);
                  _loc19_.effect_ = null;
               }
               _loc20_ = ObjectLibrary._1eh[_loc19_.skin_];
               if(_loc20_ == null || _loc20_._0K_7 == null)
               {
                  _loc20_ = ObjectLibrary._1eh[_loc19_.objectType_];
               }
               if(_loc20_._0K_7 != null)
               {
                  _loc19_.effect_ = ParticleEffect._gb(_loc20_._0K_7,_loc19_);
                  if(_loc19_.map_ != null)
                  {
                     _loc19_.map_.addObj(_loc19_.effect_,_loc19_.x_,_loc19_.y_);
                  }
               }
            }
            if(_loc4_ != -1 && _loc19_.level_ > _loc4_)
            {
               if(_loc17_)
               {
                  _loc14_ = gs_.model.getNewUnlocks(_loc19_.objectType_,_loc19_.level_);
                  _loc19_._0R_t(_loc14_.length != 0);
               }
               else
               {
                  _loc19_._at(_1O_I_._0K_v);
               }
            }
            else if(_loc4_ != -1 && _loc19_.exp_ > _loc5_)
            {
               _loc19_._1pl(_loc19_.exp_ - _loc5_);
            }
         }
      }
      
      private function HandleInvResult(param1:InvResult) : void
      {
         if(param1.result_ != 0)
         {
            this._05S_();
         }
      }
      
      private function _05S_() : void
      {
         SFX.play("error");
         gs_.hudView.interactPanel.redraw();
      }
      
      private function HandleReconnect(param1:Reconnect) : void
      {
         var _loc2_:Server = new Server().setName(param1.name_).setAddress(param1.host_ != ""?param1.host_:server_.address).setPort(param1.host_ != ""?int(param1.port_):int(server_.port));
         var _loc3_:int = param1.gameId_;
         var _loc4_:Boolean = _S_a;
         var _loc5_:int = charId_;
         var _loc6_:int = param1.keyTime_;
         var _loc7_:ByteArray = param1.key_;
         isFromArena_ = param1.isFromArena_;
         var _loc8_:_0K_U_ = new _0K_U_(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,isFromArena_);
         gs_.dispatchEvent(_loc8_);
      }
      
      private function HandlePing(param1:Ping) : void
      {
         var _loc2_:Pong = this.messages.require(PONG) as Pong;
         _loc2_.serial_ = param1.serial_;
         _loc2_.time_ = getTimer();
         serverConnection.queueMessage(_loc2_);
      }
      
      private function HandleServerFull(param1:ServerFull) : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"Server is full. You have been queued."));
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"Using your nexus hotkey will put you back in the queue."));
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"If you want to avoid it use /nexus instead."));
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"Please be patient and leave the client open."));
         this.queuePos = new QueuePosition(param1.position_,param1.count_);
         gs_.addChild(this.queuePos);
         gs_.addEventListener(QueueEvent.DESTROY,this.removeQueuePos);
         Music.Load("Wait");
      }
      
      private function removeQueuePos(param1:Event) : *
      {
         if(gs_.contains(this.queuePos))
         {
            gs_.removeChild(this.queuePos);
         }
      }
      
      private function HandleQueuePing(param1:QueuePing) : void
      {
         gs_.dispatchEvent(new QueueEvent(QueueEvent.UPDATE_POSITION,param1));
         var _loc2_:QueuePong = this.messages.require(QUEUEPONG) as QueuePong;
         _loc2_.serial_ = param1.serial_;
         _loc2_.time_ = getTimer();
         serverConnection.queueMessage(_loc2_);
      }
      
      private function _pO_(param1:String) : void
      {
         var _loc2_:XML = XML(param1);
         GroundLibrary.add(_loc2_);
         ObjectLibrary.add(_loc2_);
         ObjectLibrary.add(_loc2_);
      }
      
      private function HandleMapInfo(param1:MapInfo) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         for each(_loc2_ in param1.clientXML_)
         {
            this._pO_(_loc2_);
         }
         for each(_loc3_ in param1.extraXML_)
         {
            this._pO_(_loc3_);
         }
         _R_m.dispatch();
         this.closeDialogs.dispatch();
         gs_.applyMapInfo(param1);
         this._11H_ = new Random(param1.fp_);
         if(_S_a)
         {
            this.create();
         }
         else
         {
            this.load();
         }
         if(param1.music != null)
         {
            Music.Load(param1.music);
         }
      }
      
      private function HandlePic(param1:Pic) : void
      {
         gs_.addChild(new _1S_k(param1.bitmapData_));
      }
      
      private function HandleDeath(param1:Death) : void
      {
         Music.Load("Dead");
         this.death = param1;
         var _loc2_:BitmapData = new _1wr(800,600);
         _loc2_.draw(gs_);
         param1.background = _loc2_;
         if(!gs_.isEditor)
         {
            this._0P_Y_.dispatch(param1);
         }
         this.RemoveDavyKeys();
      }
      
      private function _wM_(param1:BuyResult) : void
      {
         if(param1.result_ == BuyResult._0oN_)
         {
            if(outstandingBuy_ != null)
            {
               outstandingBuy_.record();
            }
         }
         outstandingBuy_ = null;
         this.HandleBuyResult(param1);
      }
      
      private function HandleBuyResult(param1:BuyResult) : void
      {
         var _loc2_:ChatMessage = null;
         switch(param1.result_)
         {
            case BuyResult.ErrorMessage:
               _loc2_ = ChatMessage.make(Parameters.InfoText,param1.resultString_);
               this._V_8.dispatch(_loc2_);
               return;
            case BuyResult.NotEnoughGold:
               this._06Z_.dispatch(new NotEnoughGoldDialog());
               return;
            case BuyResult.NotEnoughFame:
               this._06Z_.dispatch(new NotEnoughFameDialog());
               return;
            default:
               this.HandleBuyResultJson(param1);
               return;
         }
      }
      
      private function HandleBuyResultJson(param1:BuyResult) : void
      {
         var _loc2_:_dU_ = _dU_.fromJSON(param1.resultString_);
         var _loc3_:Boolean = param1.result_ == BuyResult._0oN_ || param1.result_ == BuyResult._K_h;
         var _loc4_:ChatMessage = ChatMessage.make(!!_loc3_?Parameters.InfoText:Parameters.ErrorText,_loc2_.key);
         _loc4_.tokens = _loc2_.tokens;
         this._V_8.dispatch(_loc4_);
      }
      
      private function HandleAccountList(param1:AccountList) : void
      {
         if(param1.accountListId_ == 0)
         {
            if(param1.lockAction_ != -1)
            {
               if(param1.lockAction_ == 1)
               {
                  gs_.map.playerList_.setLocks(param1);
               }
               else
               {
                  gs_.map.playerList_.removeLocks(param1);
               }
            }
            else
            {
               gs_.map.playerList_.setLocks(param1);
            }
         }
         else if(param1.accountListId_ == 1)
         {
            gs_.map.playerList_.setIgnores(param1);
         }
      }
      
      private function HandleQuestObjId(param1:QuestObjId) : void
      {
         gs_.map.quest_.setObject(param1.objectId_);
      }
      
      private function HandleAOEPacket(param1:AOEPacket) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<uint> = null;
         if(this.player == null)
         {
            this.aoeAck(gs_.lastUpdate_,0,0);
            return;
         }
         var _loc4_:_D_0 = new _D_0(param1.pos_._1O_q(),param1.radius_,16711680);
         gs_.map.addObj(_loc4_,param1.pos_.x_,param1.pos_.y_);
         if(this.player.isInvincible() || this.player.isPaused())
         {
            this.aoeAck(gs_.lastUpdate_,this.player.x_,this.player.y_);
            return;
         }
         var _loc5_:* = this.player._T_V_(param1.pos_) < param1.radius_;
         if(_loc5_)
         {
            _loc2_ = GameObject.GetDamage(param1.damage_,this.player.defense_,false,this.player.condition_);
            _loc3_ = null;
            if(param1.effect_ != 0)
            {
               _loc3_ = new Vector.<uint>();
               _loc3_.push(param1.effect_);
            }
            this.player.damage(param1.origType_,_loc2_,_loc3_,false,null);
         }
         this.aoeAck(gs_.lastUpdate_,this.player.x_,this.player.y_);
      }
      
      private function HandleNameResult(param1:NameResult) : void
      {
         gs_.dispatchEvent(new _0L_n(param1));
      }
      
      private function HandleCreateGuildResult(param1:CreateGuildResult) : void
      {
         var _loc2_:_dU_ = null;
         if(param1.lineBuilderJSON == "")
         {
            gs_.dispatchEvent(new _0J_1(param1.success_,"",{}));
         }
         else
         {
            _loc2_ = _dU_.fromJSON(param1.lineBuilderJSON);
            this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,_loc2_.key,-1,-1,"",false,_loc2_.tokens));
            gs_.dispatchEvent(new _0J_1(param1.success_,_loc2_.key,_loc2_.tokens));
         }
      }
      
      private function HandleClientStat(param1:ClientStat) : void
      {
         var _loc2_:Account = GameContext.getInjector().getInstance(Account);
         _loc2_._rO_(param1.name_,param1.value_);
      }
      
      private function HandleFile(param1:File) : void
      {
         new FileReference().save(param1.file_,param1.filename_);
      }
      
      private function HandleInvitedToGuild(param1:InvitedToGuild) : void
      {
         if(Parameters.data_.showGuildInvitePopup)
         {
            gs_.hudView.interactPanel.setOverride(new _1S_9(gs_,param1.name_,param1.guildName_));
         }
         this._V_8.dispatch(ChatMessage.make("","You have been invited by " + param1.name_ + " to join the guild " + param1.guildName_ + ".\n  If you wish to join type \"/join " + param1.guildName_ + "\""));
      }
      
      private function HandlePlaySound(param1:PlaySound) : void
      {
         var _loc2_:GameObject = gs_.map.goDict_[param1.ownerId_];
         _loc2_ && _loc2_._fd(param1.soundId_);
      }
      
      private function HandleImminentArenaWave(param1:ImminentArenaWave) : void
      {
         this._V_p.dispatch(param1.currentRuntime,param1.waveNumber);
      }
      
      private function HandleArenaDeath(param1:ArenaDeath) : void
      {
         this._1xI_._O_h = param1.cost;
         this._06Z_.dispatch(new ContinueOrQuitDialog(param1.cost,false));
         this._0hq.dispatch();
      }
      
      private function HandleVerifyEmail(param1:VerifyEmail) : void
      {
         TitleView._03E_ = true;
         if(gs_ != null)
         {
            gs_.closed.dispatch();
         }
         var _loc2_:_ee = GameContext.getInjector().getInstance(_ee);
         if(_loc2_ != null)
         {
            _loc2_.dispatch();
         }
      }
      
      private function HandlePasswordPrompt(param1:PasswordPrompt) : void
      {
         if(param1.cleanPasswordStatus == 3)
         {
            TitleView._9G_ = true;
         }
         else if(param1.cleanPasswordStatus == 2)
         {
            TitleView._16I_ = true;
         }
         else if(param1.cleanPasswordStatus == 4)
         {
            TitleView._0kb = true;
         }
         if(gs_ != null)
         {
            gs_.closed.dispatch();
         }
         var _loc2_:_ee = GameContext.getInjector().getInstance(_ee);
         if(_loc2_ != null)
         {
            _loc2_.dispatch();
         }
      }
      
      override public function questFetch() : void
      {
         serverConnection.queueMessage(this.messages.require(VIEWQUESTS));
      }
      
      private function HandleQuestFetchResponse(param1:QuestFetchResponse) : void
      {
         this._K_Q_.dispatch(param1);
      }
      
      private function HandleQuestRedeemResponse(param1:QuestRedeemResponse) : void
      {
         this._0F_e.dispatch(param1);
      }
      
      override public function questRedeem(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:TinkerQuest = this.messages.require(TINKERQUEST) as TinkerQuest;
         _loc4_._1J_S_.objectId_ = param1;
         _loc4_._1J_S_.slotId = param2;
         _loc4_._1J_S_.objectType_ = param3;
         serverConnection.queueMessage(_loc4_);
      }
      
      override public function cheating(param1:int) : void
      {
         var _loc2_:Cheating = this.messages.require(CHEATING) as Cheating;
         _loc2_.cheatId = param1;
         serverConnection.queueMessage(_loc2_);
      }
      
      private function _qN_() : void
      {
         var _loc1_:_ee = null;
         gs_.dispatchEvent(new Event(QueueEvent.DESTROY));
         if(this.objectId_ != -1)
         {
            gs_.closed.dispatch();
         }
         else if(this._2W_)
         {
            if(this._C_v < 10)
            {
               if(this._C_v == 6)
               {
                  _loc1_ = GameContext.getInjector().getInstance(_ee);
                  _loc1_.dispatch();
               }
               this._1dn(this._C_v++);
               this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"Connection failed!  Retrying..."));
            }
            else
            {
               gs_.closed.dispatch();
            }
         }
      }
      
      private function _1dn(param1:int) : void
      {
         this._1b9 = new Timer(param1 * 1000,1);
         this._1b9.addEventListener(TimerEvent.TIMER_COMPLETE,this._W_D_);
         this._1b9.start();
      }
      
      private function _W_D_(param1:TimerEvent) : void
      {
         serverConnection.connect(server_.address,server_.port);
      }
      
      private function NotifyError(param1:String) : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,param1));
      }
      
      private function _N_t(param1:Failure) : void
      {
         switch(param1.errorId_)
         {
            case Failure.ClientUpdateNeeded:
               this.ClientUpdateDialogDisconnect(param1);
               return;
            case Failure.MessageWithDisconnect:
               this.MessageWithDisconnect(param1);
               return;
            case Failure.MessageWithImmediateReconnect:
               this.MessageWithImmediateReconnect(param1);
               return;
            case Failure.NoMessageDisconnect:
               this.NoMessageDisconnect(param1);
               return;
            case Failure.JsonDialogDisconnect:
               this.JsonDialogDisconnect(param1);
               return;
            default:
               this.MessageWithReconnect(param1);
               return;
         }
      }
      
      private function NoMessageDisconnect(param1:Failure) : void
      {
         this._2W_ = false;
         gs_.closed.dispatch();
      }
      
      private function MessageWithImmediateReconnect(param1:Failure) : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,param1.errorDescription_));
         this.player._Z_z = 0;
      }
      
      private function MessageWithDisconnect(param1:Failure) : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,param1.errorDescription_));
         this._2W_ = false;
         gs_.closed.dispatch();
      }
      
      private function ClientUpdateDialogDisconnect(param1:Failure) : void
      {
         var _loc2_:Dialog = new Dialog(_1O_I_._0d9,"",_1O_I_._17Z_,null,"/clientUpdate");
         _loc2_._1aO_(_1O_I_._C_E_,{
            "client":Parameters.FullBuild,
            "server":param1.errorDescription_
         });
         _loc2_.addEventListener(Dialog.LEFT_BUTTON,this._1P_r);
         gs_.addChild(_loc2_);
         this._2W_ = false;
      }
      
      private function JsonDialogDisconnect(param1:Failure) : void
      {
         var _loc3_:Dialog = null;
         var _loc2_:* = JSON.parse(param1.errorDescription_);
         if(Parameters.FullBuild != _loc2_.build)
         {
            _loc3_ = new Dialog(_1O_I_._0d9,"",_1O_I_._17Z_,null,"/clientUpdate");
            _loc3_._1aO_(_1O_I_._C_E_,{
               "client":Parameters.FullBuild,
               "server":_loc2_.build
            });
         }
         else
         {
            _loc3_ = new Dialog(_loc2_.title,_loc2_.description,"Ok",null,null);
         }
         _loc3_.addEventListener(Dialog.LEFT_BUTTON,this._1P_r);
         gs_.addChild(_loc3_);
         this._2W_ = false;
      }
      
      private function MessageWithReconnect(param1:Failure) : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,param1.errorDescription_));
      }
      
      private function _1P_r(param1:Event) : void
      {
         var _loc2_:Dialog = param1.currentTarget as Dialog;
         _loc2_.parent.removeChild(_loc2_);
         gs_.closed.dispatch();
      }
      
      override public function isConnected() : Boolean
      {
         return serverConnection.isConnected();
      }
      
      override public function requestMarketOffers() : void
      {
         var _loc1_:MarketCommand = this.messages.require(MARKETCOMMAND) as MarketCommand;
         _loc1_.commandId = MarketCommand.REQUEST_MY_ITEMS;
         serverConnection.queueMessage(_loc1_);
      }
      
      override public function removeMarketOffer(param1:PlayerShopItem) : void
      {
         var _loc2_:MarketCommand = this.messages.require(MARKETCOMMAND) as MarketCommand;
         _loc2_.commandId = MarketCommand.REMOVE_OFFER;
         _loc2_.offerId = param1.id;
         serverConnection.queueMessage(_loc2_);
      }
      
      private function HandleMarketResult(param1:MarketResult) : void
      {
         switch(param1.commandId)
         {
            case MarketResult.MARKET_REQUEST_RESULT:
               GameContext.getInjector().getInstance(MarketItemsResultSignal).dispatch(param1.items);
               break;
            case MarketResult.MARKET_ERROR:
            case MarketResult.MARKET_SUCCESS:
               GameContext.getInjector().getInstance(MarketResultSignal).dispatch(param1.message,param1.error);
         }
      }
      
      override public function addOffer(param1:Vector.<MarketOffer>) : void
      {
         var _loc2_:MarketCommand = this.messages.require(MARKETCOMMAND) as MarketCommand;
         _loc2_.commandId = MarketCommand.ADD_OFFER;
         _loc2_.newOffers = param1;
         serverConnection.queueMessage(_loc2_);
      }
   }
}
