package _0S_w
{
   import _1ar.Command;
   
   public class _11V_ extends Command
   {
       
      
      private var map_:_0S_w._056;
      
      private var x_:int;
      
      private var y_:int;
      
      private var _P_Z_:int;
      
      private var _1j__:int;
      
      private var _s1:int;
      
      public function _11V_(param1:_0S_w._056, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this.map_ = param1;
         this.x_ = param2;
         this.y_ = param3;
         this._P_Z_ = param4;
         this._1j__ = param5;
         this._s1 = param6;
      }
      
      override public function execute() : void
      {
         this.map_._yE_(this.x_,this.y_,this._P_Z_,this._s1);
      }
      
      override public function unexecute() : void
      {
         this.map_._yE_(this.x_,this.y_,this._P_Z_,this._1j__);
      }
   }
}
