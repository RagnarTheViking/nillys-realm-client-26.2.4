package _0l7
{
   import _P_S_.Command;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   import Packets.PacketManagerBase;
   import Packets.Client.PetCommand;
   import _0xn._bf;
   
   public class _1vu extends Command
   {
       
      
      [Inject]
      public var _gh:uint;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var server:SocketServer;
      
      public function _1vu()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:PetCommand = this._1S_W_.require(PacketManagerBase.PETCOMMAND) as PetCommand;
         _loc1_._1fG_ = this._gh;
         _loc1_._1T_n = _bf._10X_;
         this.server.queueMessage(_loc1_);
      }
   }
}
