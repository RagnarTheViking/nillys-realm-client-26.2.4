package _1I_S_
{
   public class _19G_
   {
       
      
      private var _0W_v:Array;
      
      private var _1xv:Array;
      
      private var _w0:RegExp;
      
      public function _19G_()
      {
         super();
      }
      
      public function _0Z_O_(param1:Array) : void
      {
         this._0W_v = param1;
         this._1xv = this._0n2();
         var _loc2_:String = this._1xv.join("|");
         if(_loc2_ != "")
         {
            this._w0 = new RegExp(_loc2_,"gi");
         }
      }
      
      public function _ht(param1:String) : Boolean
      {
         if(this._w0 == null)
         {
            return false;
         }
         this._w0.lastIndex = 0;
         return this._w0.test(param1);
      }
      
      private function _0n2() : Array
      {
         var _loc1_:String = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         while(_loc3_ < this._0W_v.length)
         {
            _loc1_ = "";
            _loc2_ = 0;
            while(_loc2_ < this._0W_v[_loc3_].length)
            {
               if(this._0W_v[_loc3_].charAt(_loc2_) != "\'" && this._0W_v[_loc3_].charAt(_loc2_) != "\"")
               {
                  _loc1_ = _loc1_.concat(this._0W_v[_loc3_].charAt(_loc2_));
               }
               _loc2_++;
            }
            this._0W_v[_loc3_] = _loc1_;
            _loc3_++;
         }
         var _loc4_:Array = this._0W_v;
         _loc4_.sort();
         return _loc4_;
      }
   }
}
