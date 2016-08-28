package _jQ_
{
   public class _1G_I_
   {
       
      
      public var type:Class;
      
      public var callback:Function;
      
      public var id:int;
      
      private var _1Z_:_jQ_.Message;
      
      private var count:int = 0;
      
      public function _1G_I_(param1:int, param2:Class, param3:Function)
      {
         super();
         this.type = param2;
         this.id = param1;
         this.callback = param3;
      }
      
      public function _7e(param1:int) : _1G_I_
      {
         var _loc2_:_jQ_.Message = null;
         this.count = this.count + param1;
         while(param1--)
         {
            _loc2_ = new this.type(this.id,this.callback);
            _loc2_.pool = this;
            this._1Z_ && (this._1Z_.next = _loc2_);
            _loc2_.prev = this._1Z_;
            this._1Z_ = _loc2_;
         }
         return this;
      }
      
      public function _0U_l() : _jQ_.Message
      {
         var _loc1_:_jQ_.Message = this._1Z_;
         if(_loc1_)
         {
            this._1Z_ = this._1Z_.prev;
            _loc1_.prev = null;
            _loc1_.next = null;
         }
         else
         {
            _loc1_ = new this.type(this.id,this.callback);
            _loc1_.pool = this;
            this.count++;
         }
         return _loc1_;
      }
      
      public function _0iF_() : int
      {
         return this.count;
      }
      
      function append(param1:_jQ_.Message) : void
      {
         this._1Z_ && (this._1Z_.next = param1);
         param1.prev = this._1Z_;
         this._1Z_ = param1;
      }
      
      public function dispose() : void
      {
         this._1Z_ = null;
      }
   }
}
