package Packets.Server
{
   import Market.PlayerShopItem;
   import flash.utils.IDataInput;
   
   public class MarketResult extends ServerPacket
   {
      
      public static const MARKET_ERROR:int = 0;
      
      public static const MARKET_SUCCESS:int = 1;
      
      public static const MARKET_REQUEST_RESULT:int = 2;
       
      
      public var commandId:int;
      
      public var message:String;
      
      public var error:Boolean;
      
      public var items:Vector.<PlayerShopItem>;
      
      public function MarketResult(param1:uint, param2:Function)
      {
         this.items = new Vector.<PlayerShopItem>();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:PlayerShopItem = null;
         this.commandId = param1.readByte();
         switch(this.commandId)
         {
            case MARKET_ERROR:
            case MARKET_SUCCESS:
               this.message = param1.readUTF();
               this.error = this.commandId == MARKET_ERROR;
               break;
            case MARKET_REQUEST_RESULT:
               this.items.length = 0;
               _loc2_ = param1.readInt();
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc4_ = new PlayerShopItem();
                  _loc4_.parseFromInput(param1);
                  this.items.push(_loc4_);
                  _loc3_++;
               }
         }
      }
   }
}
