package _7m
{
   import flash.utils.IDataInput;
   import com.company.assembleegameclient.util._1C_q;
   import flash.utils.IDataOutput;
   
   public class _0vp
   {
       
      
      public var objectId_:int;
      
      public var pos_:_7m._H_Q_;
      
      public var _0O_6:Vector.<_7m.StatData>;
      
      public function _0vp()
      {
         this.pos_ = new _7m._H_Q_();
         this._0O_6 = new Vector.<_7m.StatData>();
         super();
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
         var _loc2_:int = 0;
         this.objectId_ = param1.readInt();
         this.pos_.parseFromInput(param1);
         var _loc3_:int = param1.readShort();
         _loc2_ = _loc3_;
         while(_loc2_ < this._0O_6.length)
         {
            _1C_q._4B_(this._0O_6[_loc2_]);
            _loc2_++;
         }
         this._0O_6.length = Math.min(_loc3_,this._0O_6.length);
         while(this._0O_6.length < _loc3_)
         {
            this._0O_6.push(_1C_q._1I_j(_7m.StatData) as _7m.StatData);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this._0O_6[_loc2_].parseFromInput(param1);
            _loc2_++;
         }
      }
      
      public function writeToOutput(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeInt(this.objectId_);
         this.pos_.writeToOutput(param1);
         param1.writeShort(this._0O_6.length);
         while(_loc2_ < this._0O_6.length)
         {
            this._0O_6[_loc2_].writeToOutput(param1);
            _loc2_++;
         }
      }
      
      public function toString() : String
      {
         return "objectId_: " + this.objectId_ + " pos_: " + this.pos_ + " stats_: " + this._0O_6;
      }
   }
}
