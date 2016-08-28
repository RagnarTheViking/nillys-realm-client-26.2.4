package _1cV_
{
   import _f7.Signal;
   
   final class _W_C_
   {
       
      
      private var _Q_3:Object;
      
      private var _S_3:Object;
      
      function _W_C_()
      {
         super();
         this._Q_3 = {};
         this._S_3 = {};
      }
      
      public function register(param1:String, param2:String, param3:Signal) : void
      {
         this._Q_3[param1] = param3;
         this._S_3[param1] = param2;
      }
      
      public function _1jn() : Vector.<String>
      {
         var _loc1_:* = null;
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         for(_loc1_ in this._Q_3)
         {
            _loc2_.push(_loc1_ + " - " + this._S_3[_loc1_]);
         }
         return _loc2_;
      }
      
      public function execute(param1:String) : void
      {
         var _loc2_:Array = param1.split(" ");
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:String = _loc2_.shift();
         var _loc4_:Signal = this._Q_3[_loc3_];
         if(!_loc4_)
         {
            return;
         }
         if(_loc2_.length > 0)
         {
            _loc4_.dispatch.apply(this,_loc2_.join(" ").split(","));
         }
         else
         {
            _loc4_.dispatch.apply(this);
         }
      }
      
      public function _1O_t(param1:String) : Boolean
      {
         var _loc2_:Array = param1.split(" ");
         return _loc2_.length > 0 && this._Q_3[_loc2_[0]] != null;
      }
   }
}
