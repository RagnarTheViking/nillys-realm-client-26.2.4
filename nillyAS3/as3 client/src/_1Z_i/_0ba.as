package _1Z_i
{
   import _1kz._0gB_;
   
   public class _0ba
   {
       
      
      protected var _Q_t:_0gB_;
      
      public function _0ba()
      {
         super();
      }
      
      public function get _1iX_() : _0gB_
      {
         return this._Q_t;
      }
      
      public function set _1iX_(param1:_0gB_) : void
      {
         if(param1 !== this._Q_t)
         {
            this._Q_t = param1;
         }
      }
      
      public function get _1Z_() : _0gB_
      {
         if(!this._Q_t)
         {
            return null;
         }
         var _loc1_:_0gB_ = this._Q_t;
         while(_loc1_.next)
         {
            _loc1_ = _loc1_.next;
         }
         return _loc1_;
      }
      
      public function remove(param1:_0gB_) : void
      {
         var _loc2_:_0gB_ = this._Q_t;
         if(_loc2_ == param1)
         {
            this._Q_t = param1.next;
         }
         while(_loc2_)
         {
            if(_loc2_.next == param1)
            {
               _loc2_.next = param1.next;
            }
            _loc2_ = _loc2_.next;
         }
      }
   }
}
