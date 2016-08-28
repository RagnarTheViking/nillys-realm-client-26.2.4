package _1W_F_
{
   import flash.utils.getQualifiedClassName;
   
   public class _N_6 implements _15u
   {
       
      
      protected var _0rM_:Vector.<Class>;
      
      protected var _1F_s:Vector.<Class>;
      
      protected var _ix:String;
      
      protected var _0qP_:Vector.<Class>;
      
      public function _N_6(param1:Vector.<Class>, param2:Vector.<Class>, param3:Vector.<Class>)
      {
         super();
         if(!param1 || !param2 || !param3)
         {
            throw ArgumentError("TypeFilter parameters can not be null");
         }
         this._0rM_ = param1;
         this._1F_s = param2;
         this._0qP_ = param3;
      }
      
      public function get _073() : Vector.<Class>
      {
         return this._0rM_;
      }
      
      public function get _0uu() : Vector.<Class>
      {
         return this._1F_s;
      }
      
      public function get _0C___() : String
      {
         return this._ix = this._ix || this._iH_();
      }
      
      public function get _17e() : Vector.<Class>
      {
         return this._0qP_;
      }
      
      public function matches(param1:*) : Boolean
      {
         var _loc2_:uint = this._0rM_.length;
         while(_loc2_--)
         {
            if(!(param1 is this._0rM_[_loc2_]))
            {
               return false;
            }
         }
         _loc2_ = this._0qP_.length;
         while(_loc2_--)
         {
            if(param1 is this._0qP_[_loc2_])
            {
               return false;
            }
         }
         if(this._1F_s.length == 0 && (this._0rM_.length > 0 || this._0qP_.length > 0))
         {
            return true;
         }
         _loc2_ = this._1F_s.length;
         while(_loc2_--)
         {
            if(param1 is this._1F_s[_loc2_])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function _0H_u(param1:Vector.<Class>) : Vector.<String>
      {
         var _loc2_:String = null;
         var _loc5_:uint = 0;
         var _loc3_:Vector.<String> = new Vector.<String>(0);
         var _loc4_:uint = param1.length;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = getQualifiedClassName(param1[_loc5_]);
            _loc3_[_loc3_.length] = _loc2_;
            _loc5_++;
         }
         _loc3_.sort(this._dg);
         return _loc3_;
      }
      
      protected function _iH_() : String
      {
         var _loc1_:Vector.<String> = this._0H_u(this._073);
         var _loc2_:Vector.<String> = this._0H_u(this._0uu);
         var _loc3_:Vector.<String> = this._0H_u(this._17e);
         return "all of: " + _loc1_.toString() + ", any of: " + _loc2_.toString() + ", none of: " + _loc3_.toString();
      }
      
      protected function _dg(param1:String, param2:String) : int
      {
         if(param1 < param2)
         {
            return 1;
         }
         return -1;
      }
   }
}
