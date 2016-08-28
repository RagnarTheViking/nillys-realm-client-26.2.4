package _lE_
{
   import _0E_T_._Y_F_;
   import _0wP_.MessageProvider;
   import _jQ_.SocketServer;
   import Packets.PacketManagerBase;
   import Packets.Client.Reskin;
   
   public class _1m7
   {
       
      
      [Inject]
      public var skin:_Y_F_;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var server:SocketServer;
      
      public function _1m7()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:Reskin = this._1S_W_.require(PacketManagerBase.RESKIN) as Reskin;
         _loc1_.skinID = this.skin.id;
         this.server.queueMessage(_loc1_);
      }
   }
}
