package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class _0Y_g extends ServerPacket
   {
       
      
      public var _13R_:int;
      
      public var _re:int;
      
      public var _1lF_:int;
      
      public function _0Y_g(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this._13R_ = param1.readInt();
         this._re = param1.readInt();
         this._1lF_ = param1.readInt();
      }
   }
}
