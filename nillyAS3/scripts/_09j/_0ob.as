package _09j
{
   public class _0ob
   {
       
      
      private var _1f__:Boolean = false;
      
      private var seconds:int;
      
      private var minutes:int;
      
      private var _f8:int;
      
      private var days:int;
      
      private var _H_R_:Array;
      
      public function _0ob()
      {
         super();
      }
      
      public function _9l(param1:Number) : String
      {
         this.seconds = Math.floor(param1 / 1000);
         this.minutes = Math.floor(this.seconds / 60);
         this._f8 = Math.floor(this.minutes / 60);
         this.days = Math.floor(this._f8 / 24);
         this.seconds = this.seconds % 60;
         this.minutes = this.minutes % 60;
         this._f8 = this._f8 % 24;
         this._1f__ = false;
         this._H_R_ = [];
         this._1B_U_(this.days,"d");
         this._1B_U_(this._f8,"h");
         this._1B_U_(this.minutes,"m",2);
         this._1B_U_(this.seconds,"s",2);
         this._1f__ = false;
         return this._H_R_.join(" ");
      }
      
      private function _1B_U_(param1:int, param2:String, param3:int = -1) : void
      {
         if(param1 == 0 && !this._1f__)
         {
            return;
         }
         this._1f__ = true;
         var _loc4_:String = param1.toString();
         if(param3 == -1)
         {
            param3 = _loc4_.length;
         }
         var _loc5_:* = "";
         var _loc6_:int = _loc4_.length;
         while(_loc6_ < param3)
         {
            _loc5_ = _loc5_ + "0";
            _loc6_++;
         }
         _loc4_ = _loc5_ + _loc4_ + param2;
         this._H_R_.push(_loc4_);
      }
   }
}
