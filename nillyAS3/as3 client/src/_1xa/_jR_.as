package _1xa
{
   import _03U_._1U_N_;
   
   public class _jR_ implements _1eo
   {
       
      
      private var _0C_3:String;
      
      private var tokens:Object;
      
      private var _1zT_:String = "";
      
      private var _11P_:String = "";
      
      private var provider:_1U_N_;
      
      public function _jR_()
      {
         super();
      }
      
      public function _1F_v(param1:String, param2:Object = null) : _jR_
      {
         this._0C_3 = param1;
         this.tokens = param2;
         return this;
      }
      
      public function setPrefix(param1:String) : _jR_
      {
         this._11P_ = param1;
         return this;
      }
      
      public function setPostfix(param1:String) : _jR_
      {
         this._1zT_ = param1;
         return this;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
         this.provider = param1;
      }
      
      public function getString() : String
      {
         var _loc1_:* = null;
         var _loc2_:String = null;
         var _loc3_:String = this._0C_3;
         for(_loc1_ in this.tokens)
         {
            _loc2_ = this.tokens[_loc1_];
            if(_loc2_.charAt(0) == "{" && _loc2_.charAt(_loc2_.length - 1) == "}")
            {
               _loc2_ = this.provider.getValue(_loc2_.substr(1,_loc2_.length - 2));
            }
            _loc3_ = _loc3_.replace("{" + _loc1_ + "}",_loc2_);
         }
         _loc3_ = _loc3_.replace(/\\n/g,"\n");
         return this._11P_ + _loc3_ + this._1zT_;
      }
   }
}
