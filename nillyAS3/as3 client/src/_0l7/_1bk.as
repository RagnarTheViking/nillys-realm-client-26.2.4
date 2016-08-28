package _0l7
{
   import _P_S_.Command;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   import _1F_z._0P_4;
   import Packets.PacketManagerBase;
   import Packets.Client.PetCommand;
   import _0xn._bf;
   
   public class _1bk extends Command
   {
       
      
      [Inject]
      public var _gh:uint;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var server:SocketServer;
      
      [Inject]
      public var model:_0P_4;
      
      public function _1bk()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:PetCommand = this._1S_W_.require(PacketManagerBase.PETCOMMAND) as PetCommand;
         _loc1_._1fG_ = this._gh;
         _loc1_._1T_n = _bf._V_9;
         this.server.queueMessage(_loc1_);
      }
   }
}
