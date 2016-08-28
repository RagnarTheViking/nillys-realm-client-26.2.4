package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class LeaderUpdate extends ClientPacket
   {
       
      
      public var x:Number;
      
      public var y:Number;
      
      public var shooting:Boolean;
      
      public var mouseX:Number;
      
      public var mouseY:Number;
      
      public var rotation:Number;
      
      public var autoFire:Boolean;
      
      public var aimMode:int;
      
      public function LeaderUpdate(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeFloat(this.x);
         param1.writeFloat(this.y);
         param1.writeBoolean(this.shooting);
         param1.writeFloat(this.mouseX);
         param1.writeFloat(this.mouseY);
         param1.writeFloat(this.rotation);
         param1.writeBoolean(this.autoFire);
         param1.writeInt(this.aimMode);
      }
      
      override public function toString() : String
      {
         return formatToString("LEADERUPDATE","x","y","shooting","mouseX","mouseY","rotation","autoFire","aimMode");
      }
   }
}
