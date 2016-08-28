package _0S_w
{
   import _1ar.Command;
   
   public class _0b2 extends Command
   {
       
      
      private var map_:_056;
      
      private var x_:int;
      
      private var y_:int;
      
      private var _0__k:_l4;
      
      public function _0b2(param1:_056, param2:int, param3:int, param4:_0S_w._l4)
      {
         super();
         this.map_ = param1;
         this.x_ = param2;
         this.y_ = param3;
         this._0__k = param4.clone();
      }
      
      override public function execute() : void
      {
         this.map_._0Z_B_(this.x_,this.y_);
      }
      
      override public function unexecute() : void
      {
         this.map_._10n(this.x_,this.y_,this._0__k);
      }
   }
}
