package _E_o
{
   import _P_S_.Mediator;
   import _0Z_1.ArenaPortalPanel;
   import _jQ_.SocketServer;
   import _0wP_.MessageProvider;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _ge._v1;
   import _04h._1Q_v;
   import _wi.Injector;
   import _0jo._1E_1;
   import _4u.Account;
   import _1O_R_.Dialog;
   import com.company.assembleegameclient.util.Currency;
   import _na._1J_1;
   import _1M_z.EnterArena;
   import Packets.PacketManagerBase;
   import _C_._1O_I_;
   import _0J_8.NeedRegistrationDialog;
   import _05g.NotEnoughGoldDialog;
   import flash.events.Event;
   
   public class _0A_z extends Mediator
   {
      
      public static const TEXT:String = "SellableObjectPanelMediator.text";
       
      
      [Inject]
      public var view:ArenaPortalPanel;
      
      [Inject]
      public var _wG_:SocketServer;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _R_U_:_v1;
      
      [Inject]
      public var _1A_A_:_1Q_v;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _15T_:_1E_1;
      
      [Inject]
      public var account:Account;
      
      private var _3B_:Dialog;
      
      public function _0A_z()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0__.add(this._N_Y_);
      }
      
      private function _N_Y_(param1:int) : void
      {
         if(param1 == Currency.GOLD)
         {
            this._1tI_();
         }
         else
         {
            this._D_n();
         }
      }
      
      private function _D_n() : void
      {
         var _loc1_:_1J_1 = null;
         var _loc2_:EnterArena = null;
         if(this._R_U_.player.nameChosen_)
         {
            this._1A_A_._0e2();
            _loc1_ = this._T_X_.getInstance(_1J_1);
            _loc1_.start();
            _loc2_ = this._1S_W_.require(PacketManagerBase.ENTERARENA) as EnterArena;
            _loc2_.currency = Currency.FAME;
            this._wG_.queueMessage(_loc2_);
            this._15T_.dispatch();
         }
         else
         {
            this._3B_ = new Dialog(_1O_I_._01v,_1O_I_._0m4,_1O_I_._ng,null,null);
            this._3B_.addEventListener(Dialog.LEFT_BUTTON,this._4h);
            this._06Z_.dispatch(this._3B_);
         }
      }
      
      private function _1tI_() : void
      {
         var _loc1_:_1J_1 = null;
         var _loc2_:EnterArena = null;
         if(!this.account.registered())
         {
            this._06Z_.dispatch(new NeedRegistrationDialog(TEXT,{"type":Currency.CurrencyName(Currency.GOLD)}));
         }
         else if(!this._R_U_.player.nameChosen_)
         {
            this._3B_ = new Dialog(_1O_I_._01v,_1O_I_._0m4,_1O_I_._ng,null,null);
            this._3B_.addEventListener(Dialog.LEFT_BUTTON,this._4h);
            this._06Z_.dispatch(this._3B_);
         }
         else if(this._R_U_.player.credits_ < 50)
         {
            this._06Z_.dispatch(new NotEnoughGoldDialog());
         }
         else
         {
            this._1A_A_._0e2();
            _loc1_ = this._T_X_.getInstance(_1J_1);
            _loc1_.start();
            _loc2_ = this._1S_W_.require(PacketManagerBase.ENTERARENA) as EnterArena;
            _loc2_.currency = Currency.GOLD;
            this._wG_.queueMessage(_loc2_);
            this._15T_.dispatch();
         }
      }
      
      private function _4h(param1:Event) : void
      {
         if(this._3B_ && this._3B_.hasEventListener(Dialog.LEFT_BUTTON))
         {
            this._3B_.removeEventListener(Dialog.LEFT_BUTTON,this._4h);
         }
         this._3B_ = null;
         this._0dR_.dispatch();
      }
   }
}
