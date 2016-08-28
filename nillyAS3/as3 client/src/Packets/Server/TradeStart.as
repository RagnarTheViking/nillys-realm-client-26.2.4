package Packets.Server
{
   import _7m._0wb;
   import flash.utils.IDataInput;
   import com.company.assembleegameclient.util._1C_q;
   
   public class TradeStart extends ServerPacket
   {
       
      
      public var myItems_:Vector.<_0wb>;
      
      public var yourName_:String;
      
      public var yourItems_:Vector.<_0wb>;
      
      public function TradeStart(param1:uint, param2:Function)
      {
         this.myItems_ = new Vector.<_0wb>();
         this.yourItems_ = new Vector.<_0wb>();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.readShort();
         _loc2_ = _loc3_;
         while(_loc2_ < this.myItems_.length)
         {
            _1C_q._4B_(this.myItems_[_loc2_]);
            _loc2_++;
         }
         this.myItems_.length = Math.min(_loc3_,this.myItems_.length);
         while(this.myItems_.length < _loc3_)
         {
            this.myItems_.push(_1C_q._1I_j(_0wb) as _0wb);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.myItems_[_loc2_].parseFromInput(param1);
            _loc2_++;
         }
         this.yourName_ = param1.readUTF();
         _loc3_ = param1.readShort();
         _loc2_ = _loc3_;
         while(_loc2_ < this.yourItems_.length)
         {
            _1C_q._4B_(this.yourItems_[_loc2_]);
            _loc2_++;
         }
         this.yourItems_.length = Math.min(_loc3_,this.yourItems_.length);
         while(this.yourItems_.length < _loc3_)
         {
            this.yourItems_.push(_1C_q._1I_j(_0wb) as _0wb);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.yourItems_[_loc2_].parseFromInput(param1);
            _loc2_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("TRADESTART","myItems_","yourName_","yourItems_");
      }
   }
}
