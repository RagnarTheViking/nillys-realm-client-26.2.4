package _1wl
{
   import flash.utils.ByteArray;
   
   public class _1D_7
   {
       
      
      public var line:uint;
      
      public var text:String;
      
      public var ch:String;
      
      public var priority:int;
      
      public var repeat:Boolean;
      
      public var html:Boolean;
      
      public var time:uint;
      
      public var _0xS_:String;
      
      public var _dj:String;
      
      public var _F_n:String;
      
      public var next:_1wl._1D_7;
      
      public var _17R_:_1wl._1D_7;
      
      public function _1D_7(param1:String, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this.text = param1;
         this.ch = param2;
         this.priority = param3;
         this.repeat = param4;
         this.html = param5;
      }
      
      public static function _lD_(param1:ByteArray) : _1wl._1D_7
      {
         var _loc2_:String = param1.readUTFBytes(param1.readUnsignedInt());
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:Boolean = param1.readBoolean();
         return new _1wl._1D_7(_loc2_,_loc3_,_loc4_,_loc5_,true);
      }
      
      public function _0X_E_(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(this.text);
         param1.writeUnsignedInt(_loc2_.length);
         param1.writeBytes(_loc2_);
         param1.writeUTF(this.ch);
         param1.writeInt(this.priority);
         param1.writeBoolean(this.repeat);
      }
      
      public function plainText() : String
      {
         return this.text.replace(/<.*?>/g,"").replace(/&lt;/g,"<").replace(/&gt;/g,">");
      }
      
      public function toString() : String
      {
         return "[" + this.ch + "] " + this.plainText();
      }
      
      public function clone() : _1wl._1D_7
      {
         var _loc1_:_1wl._1D_7 = new _1wl._1D_7(this.text,this.ch,this.priority,this.repeat,this.html);
         _loc1_.line = this.line;
         _loc1_.time = this.time;
         return _loc1_;
      }
   }
}
