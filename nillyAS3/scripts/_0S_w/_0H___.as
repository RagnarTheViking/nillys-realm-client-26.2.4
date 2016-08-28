package _0S_w
{
   import _1ar.Command;
   
   public class _0H___ extends Command
   {
       
      
      private var map_:_0S_w._056;
      
      private var x_:int;
      
      private var y_:int;
      
      private var _8M_:String;
      
      private var _tP_:String;
      
      public function _0H___(param1:_0S_w._056, param2:int, param3:int, param4:String, param5:String)
      {
         super();
         this.map_ = param1;
         this.x_ = param2;
         this.y_ = param3;
         this._8M_ = param4;
         this._tP_ = param5;
      }
      
      override public function execute() : void
      {
         this.map_._1I_T_(this.x_,this.y_,this._tP_);
      }
      
      override public function unexecute() : void
      {
         this.map_._1I_T_(this.x_,this.y_,this._8M_);
      }
   }
}
