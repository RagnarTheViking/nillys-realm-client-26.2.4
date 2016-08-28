package _0l7
{
   import _1ar.Command;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   import Packets.PacketManagerBase;
   import Packets.Client.PetCommand;
   import _0xn._bf;
   
   public class _0Y_9 extends Command
   {
       
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var server:SocketServer;
      
      [Inject]
      public var _gh:int;
      
      public function _0Y_9()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:PetCommand = this._1S_W_.require(PacketManagerBase.PETCOMMAND) as PetCommand;
         _loc1_._1fG_ = this._gh;
         _loc1_._1T_n = _bf._6b;
         this.server.queueMessage(_loc1_);
      }
   }
}
