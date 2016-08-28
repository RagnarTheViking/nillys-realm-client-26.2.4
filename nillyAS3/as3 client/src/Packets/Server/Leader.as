package Packets.Server
{
   import flash.geom.Point;
   import flash.utils.IDataInput;
   
   public class Leader extends ServerPacket
   {
      
      public static var accountId:String;
      
      public static var objectId:int = -1;
      
      public static var x:Number;
      
      public static var y:Number;
      
      public static var shooting:Boolean = false;
      
      public static var mouse:Point = new Point();
      
      public static var rotation:Number;
      
      public static var autoFire:Boolean;
      
      public static var aimMode:int;
       
      
      public function Leader(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         accountId = param1.readUTF();
         objectId = param1.readInt();
         x = param1.readFloat();
         y = param1.readFloat();
         shooting = param1.readBoolean();
         mouse.x = param1.readFloat();
         mouse.y = param1.readFloat();
         rotation = param1.readFloat();
         autoFire = param1.readBoolean();
         aimMode = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("Leader","accountId","objectId","x","y","mouse","rotation","autoFire","aimMode");
      }
   }
}
