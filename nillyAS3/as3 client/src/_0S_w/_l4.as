package _0S_w
{
   public class _l4
   {
       
      
      public var _155:Vector.<int>;
      
      public var _09t:String = null;
      
      public function _l4()
      {
         this._155 = new <int>[-1,-1,-1];
         super();
      }
      
      public function clone() : _l4
      {
         var _loc1_:_l4 = new _l4();
         _loc1_._155 = this._155.concat();
         _loc1_._09t = this._09t;
         return _loc1_;
      }
      
      public function isEmpty() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < _F_B_._09x)
         {
            if(this._155[_loc1_] != -1)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
   }
}
