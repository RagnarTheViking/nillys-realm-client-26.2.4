package _jQ_
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class Message
   {
       
      
      public var pool:_jQ_._1G_I_;
      
      public var prev:_jQ_.Message;
      
      public var next:_jQ_.Message;
      
      private var _0ue:Boolean;
      
      public var id:uint;
      
      public var callback:Function;
      
      public function Message(param1:uint, param2:Function = null)
      {
         super();
         this.id = param1;
         this._0ue = param2 != null;
         this.callback = param2;
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
      }
      
      public function writeToOutput(param1:IDataOutput) : void
      {
      }
      
      public function toString() : String
      {
         return this.formatToString("MESSAGE","id");
      }
      
      protected function formatToString(param1:String, ... rest) : String
      {
         var _loc4_:int = 0;
         var _loc3_:String = "[" + param1;
         while(_loc4_ < rest.length)
         {
            _loc3_ = _loc3_ + (" " + rest[_loc4_] + "=\"" + this[rest[_loc4_]] + "\"");
            _loc4_++;
         }
         return _loc3_ + "]";
      }
      
      public function consume() : void
      {
         this._0ue && this.callback(this);
         this.prev = null;
         this.next = null;
         this.pool.append(this);
      }
   }
}
