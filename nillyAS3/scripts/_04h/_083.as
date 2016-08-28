package _04h
{
   import flash.display.BitmapData;
   import _1F_z._1Z_D_;
   
   public class _083
   {
       
      
      public var _each:BitmapData;
      
      public var name:String;
      
      public var pet:_1Z_D_;
      
      public var _bT_:Vector.<int>;
      
      public var _W_V_:Vector.<int>;
      
      public var arenaTime:Number;
      
      public var arenaWave:int;
      
      public var guildName:String;
      
      public var _17I_:int;
      
      public var rank:int = -1;
      
      public var _0I_p:Boolean = false;
      
      public function _083()
      {
         super();
      }
      
      public function _1N_z(param1:_083) : Boolean
      {
         return param1.name == this.name && this.arenaTime == param1.arenaTime && this.arenaWave == param1.arenaWave;
      }
      
      public function _0dV_(param1:_083) : Boolean
      {
         return this.arenaWave > param1.arenaWave || this.arenaWave == param1.arenaWave && this.arenaTime < param1.arenaTime;
      }
   }
}
