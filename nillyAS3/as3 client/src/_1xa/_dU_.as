package _1xa
{
   import _0H_6.GameContext;
   import _03U_._1U_N_;
   
   public class _dU_ implements _1eo
   {
       
      
      public var key:String;
      
      public var tokens:Object;
      
      private var _1zT_:String = "";
      
      private var _11P_:String = "";
      
      private var map:_1U_N_;
      
      public function _dU_()
      {
         super();
      }
      
      public static function fromJSON(param1:String) : _dU_
      {
         if(!param1.match(/^{.*}$/))
         {
            return new _dU_().setParams("blank",{"data":param1});
         }
         var _loc2_:Object = JSON.parse(param1);
         return new _dU_().setParams(_loc2_.key,_loc2_.tokens);
      }
      
      public static function _6c(param1:String, param2:Object = null) : String
      {
         var _loc3_:_dU_ = new _dU_();
         _loc3_.setParams(param1,param2);
         var _loc4_:_1U_N_ = GameContext.getInjector().getInstance(_1U_N_);
         _loc3_._0L_b(_loc4_);
         return _loc3_.getString();
      }
      
      public static function _1A_T_(param1:String) : String
      {
         var _loc2_:_dU_ = _dU_.fromJSON(param1);
         var _loc3_:_1U_N_ = GameContext.getInjector().getInstance(_1U_N_);
         _loc2_._0L_b(_loc3_);
         return _loc2_.getString();
      }
      
      public static function _T_V_(param1:String, param2:Object = null, param3:String = "", param4:String = "") : String
      {
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc7_:* = null;
         var _loc8_:String = _195(param1);
         for(_loc5_ in param2)
         {
            _loc6_ = param2[_loc5_];
            _loc7_ = "{" + _loc5_ + "}";
            while(_loc8_.indexOf(_loc7_) != -1)
            {
               _loc8_ = _loc8_.replace(_loc7_,_loc6_);
            }
         }
         _loc8_ = _loc8_.replace(/\\n/g,"\n");
         return param3 + _loc8_ + param4;
      }
      
      public static function _ss(param1:String, param2:Object = null) : String
      {
         var _loc3_:_dU_ = new _dU_();
         _loc3_.setParams(param1,param2);
         var _loc4_:_1U_N_ = GameContext.getInjector().getInstance(_1U_N_);
         _loc3_._0L_b(_loc4_);
         return _loc3_.getString();
      }
      
      private static function _195(param1:String) : String
      {
         var _loc2_:Boolean = param1 != null && param1.charAt(0) == "{" && param1.charAt(param1.length - 1) == "}";
         return !!_loc2_?param1.substr(1,param1.length - 2):param1;
      }
      
      public function _0Y_2() : String
      {
         return JSON.stringify({
            "key":this.key,
            "tokens":this.tokens
         });
      }
      
      public function setParams(param1:String, param2:Object = null) : _dU_
      {
         this.key = param1 || "";
         this.tokens = param2;
         return this;
      }
      
      public function setPrefix(param1:String) : _dU_
      {
         this._11P_ = param1;
         return this;
      }
      
      public function setPostfix(param1:String) : _dU_
      {
         this._1zT_ = param1;
         return this;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
         this.map = param1;
      }
      
      public function getString() : String
      {
         var _loc1_:* = null;
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc4_:String = _195(this.key);
         var _loc5_:String = this.map.getValue(_loc4_) || "";
         for(_loc1_ in this.tokens)
         {
            _loc2_ = this.tokens[_loc1_];
            if(_loc2_.charAt(0) == "{" && _loc2_.charAt(_loc2_.length - 1) == "}")
            {
               _loc2_ = this.map.getValue(_loc2_.substr(1,_loc2_.length - 2));
            }
            _loc3_ = "{" + _loc1_ + "}";
            while(_loc5_.indexOf(_loc3_) != -1)
            {
               _loc5_ = _loc5_.replace(_loc3_,_loc2_);
            }
         }
         _loc5_ = _loc5_.replace(/\\n/g,"\n");
         return this._11P_ + _loc5_ + this._1zT_;
      }
   }
}
