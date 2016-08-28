package _0l7
{
   import _P_S_.Command;
   import _1F_z._1ao;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   import _4u.Account;
   import _3b.DialogSignal;
   import Packets.PetYardCommand;
   import _1F_z._0f1;
   import Packets.PacketManagerBase;
   import _1F_z._1Y_x;
   import _1F_z._1K_e;
   import _0J_8.NeedRegistrationDialog;
   
   public class _9H_ extends Command
   {
      
      private static const _0i6:String = "In order to upgrade your yard you must be a registered user.";
       
      
      [Inject]
      public var _W_d:_1ao;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var server:SocketServer;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _9H_()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:PetYardCommand = null;
         if(this._W_d is _0f1)
         {
            if(!this.account.registered())
            {
               this._1k0(_0i6);
            }
            _loc1_ = this._1S_W_.require(PacketManagerBase.PETYARDCOMMAND) as PetYardCommand;
            _loc1_._0bm = 1;
            _loc1_.objectId = _0f1(this._W_d)._1bZ_;
            _loc1_._T_Z_ = _0f1(this._W_d)._T_Z_;
         }
         if(this._W_d is _1Y_x)
         {
            _loc1_ = this._1S_W_.require(PacketManagerBase.PETYARDCOMMAND) as PetYardCommand;
            _loc1_._0bm = 2;
            _loc1_._1oy = _1Y_x(this._W_d)._1F_V_;
            _loc1_._1J_S_ = _1Y_x(this._W_d)._1J_S_;
            _loc1_._T_Z_ = _1Y_x(this._W_d)._T_Z_;
         }
         if(this._W_d is _1K_e)
         {
            _loc1_ = this._1S_W_.require(PacketManagerBase.PETYARDCOMMAND) as PetYardCommand;
            _loc1_._0bm = 3;
            _loc1_._1oy = _1K_e(this._W_d)._00__;
            _loc1_._1vM_ = _1K_e(this._W_d)._0rK_;
            _loc1_._T_Z_ = _1K_e(this._W_d)._T_Z_;
         }
         if(_loc1_)
         {
            this.server.queueMessage(_loc1_);
         }
      }
      
      private function _1k0(param1:String) : void
      {
         this._06Z_.dispatch(new NeedRegistrationDialog(param1));
      }
   }
}
