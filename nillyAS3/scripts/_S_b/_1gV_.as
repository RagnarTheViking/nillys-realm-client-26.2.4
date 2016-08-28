package _S_b
{
   import flash.utils.Timer;
   import _1S_0._1mh;
   import _f7.Signal;
   import flash.events.TimerEvent;
   
   public class _1gV_
   {
       
      
      public var objectId:uint;
      
      private var _02X_:Array;
      
      private var _3x:uint;
      
      public var _0A_f:uint;
      
      public var _eI_:int;
      
      public var position:int;
      
      public var available:Boolean;
      
      private var _L_e:int;
      
      private var _1H_B_:Timer;
      
      private var _1I_L_:_1mh;
      
      private var _0ck:Timer;
      
      private var _0V_k:_1mh;
      
      public var update:Signal;
      
      public function _1gV_()
      {
         super();
         this.update = new Signal(int);
         this.available = true;
      }
      
      public function set _jD_(param1:Array) : void
      {
         this._02X_ = param1;
         if(param1 != null && param1.length > 0)
         {
            this._L_e = 0;
         }
      }
      
      public function get _jD_() : Array
      {
         return this._02X_;
      }
      
      public function set _M_O_(param1:uint) : void
      {
         this._3x = param1;
         this._1H_B_ = new Timer(param1,0);
         this._1I_L_ = new _1mh(this._1H_B_,TimerEvent.TIMER,TimerEvent);
         this._1I_L_.add(this._6J_);
      }
      
      public function set _0Y_y(param1:uint) : void
      {
         this._0A_f = param1;
         this._0ck = new Timer(param1,0);
         this._0V_k = new _1mh(this._0ck,TimerEvent.TIMER,TimerEvent);
         this._0V_k.add(this._4p);
      }
      
      public function _0kF_() : void
      {
         if(this.available)
         {
            this._1H_B_.reset();
            this._1H_B_.start();
            this._0ck.reset();
            this._0ck.start();
            this.available = false;
            if(this._L_e < this._jD_.length - 1)
            {
               this._L_e++;
            }
            this.update.dispatch(this.position);
         }
      }
      
      private function _4p(param1:TimerEvent) : void
      {
         if(this._L_e == 0)
         {
            this._0ck.stop();
         }
         this.available = true;
         this.update.dispatch(this.position);
      }
      
      private function _6J_(param1:TimerEvent) : void
      {
         this._L_e--;
         if(this._L_e == 0)
         {
            this._1H_B_.stop();
         }
         this.update.dispatch(this.position);
      }
      
      public function _3v(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 <= 0)
         {
            _loc2_ = this._jD_[this._L_e];
         }
         return _loc2_;
      }
   }
}
