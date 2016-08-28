package Packets.Client
{
   import Market.MarketOffer;
   import flash.utils.IDataOutput;
   
   public class MarketCommand extends ClientPacket
   {
      
      public static const REQUEST_MY_ITEMS:int = 0;
      
      public static const ADD_OFFER:int = 1;
      
      public static const REMOVE_OFFER:int = 2;
       
      
      public var commandId:int;
      
      public var offerId:uint;
      
      public var newOffers:Vector.<MarketOffer>;
      
      public function MarketCommand(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         var _loc2_:MarketOffer = null;
         param1.writeByte(this.commandId);
         switch(this.commandId)
         {
            case REQUEST_MY_ITEMS:
               break;
            case ADD_OFFER:
               param1.writeInt(this.newOffers.length);
               for each(_loc2_ in this.newOffers)
               {
                  _loc2_.writeToOutput(param1);
               }
               break;
            case REMOVE_OFFER:
               param1.writeUnsignedInt(this.offerId);
         }
      }
   }
}
