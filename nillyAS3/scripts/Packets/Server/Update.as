package Packets.Server
{
   import _7m._mZ_;
   import _7m._Q_x;
   import flash.utils.IDataInput;
   import com.company.assembleegameclient.util._1C_q;
   
   public class Update extends ServerPacket
   {
       
      
      public var tiles_:Vector.<_mZ_>;
      
      public var newObjs_:Vector.<_Q_x>;
      
      public var drops_:Vector.<int>;
      
      public function Update(param1:uint, param2:Function)
      {
         this.tiles_ = new Vector.<_mZ_>();
         this.newObjs_ = new Vector.<_Q_x>();
         this.drops_ = new Vector.<int>();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.readShort();
         _loc2_ = _loc3_;
         while(_loc2_ < this.tiles_.length)
         {
            _1C_q._4B_(this.tiles_[_loc2_]);
            _loc2_++;
         }
         this.tiles_.length = Math.min(_loc3_,this.tiles_.length);
         while(this.tiles_.length < _loc3_)
         {
            this.tiles_.push(_1C_q._1I_j(_mZ_) as _mZ_);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.tiles_[_loc2_].parseFromInput(param1);
            _loc2_++;
         }
         this.newObjs_.length = 0;
         _loc3_ = param1.readShort();
         _loc2_ = _loc3_;
         while(_loc2_ < this.newObjs_.length)
         {
            _1C_q._4B_(this.newObjs_[_loc2_]);
            _loc2_++;
         }
         this.newObjs_.length = Math.min(_loc3_,this.newObjs_.length);
         while(this.newObjs_.length < _loc3_)
         {
            this.newObjs_.push(_1C_q._1I_j(_Q_x) as _Q_x);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.newObjs_[_loc2_].parseFromInput(param1);
            _loc2_++;
         }
         this.drops_.length = 0;
         var _loc4_:int = param1.readShort();
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.drops_.push(param1.readInt());
            _loc2_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("UPDATE","tiles_","newObjs_","drops_");
      }
   }
}
