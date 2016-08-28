package _7m
{
   import flash.utils.IDataInput;
   
   public class _mZ_
   {
       
      
      public var x_:int;
      
      public var y_:int;
      
      public var type_:uint;
      
      public function _mZ_()
      {
         super();
      }
      
      public function parseFromInput(param1:IDataInput) : void
      {
         this.x_ = param1.readShort();
         this.y_ = param1.readShort();
         this.type_ = param1.readUnsignedShort();
      }
      
      public function toString() : String
      {
         return "x_: " + this.x_ + " y_: " + this.y_ + " type_:" + this.type_;
      }
   }
}
