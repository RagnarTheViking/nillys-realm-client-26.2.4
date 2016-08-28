package _0ps
{
   import avmplus.DescribeTypeJSON;
   import flash.utils.getQualifiedClassName;
   import _K_m._0xu;
   import flash.utils.Dictionary;
   import _K_m._1X_j;
   import _K_m._L_d;
   import _K_m._1J_K_;
   import _K_m._1V_x;
   import _K_m._nm;
   import _K_m._1A_e;
   import _wi._1F_t;
   
   public class _0W_ extends _1K_D_ implements _X_L_
   {
       
      
      private const _ix:DescribeTypeJSON = new DescribeTypeJSON();
      
      public function _0W_()
      {
         super();
      }
      
      public function _0K_N_(param1:Class, param2:Class) : Boolean
      {
         if(param1 == param2)
         {
            return true;
         }
         var _loc3_:String = getQualifiedClassName(param2);
         var _loc4_:Object = this._ix.getInstanceDescription(param1).traits;
         return (_loc4_.bases as Array).indexOf(_loc3_) > -1 || (_loc4_.interfaces as Array).indexOf(_loc3_) > -1;
      }
      
      public function _1B_K_(param1:Class) : _0xu
      {
         var _loc2_:Object = null;
         _loc2_ = this._ix.getInstanceDescription(param1);
         var _loc3_:Object = _loc2_.traits;
         var _loc4_:String = _loc2_.name;
         var _loc5_:_0xu = new _0xu(false);
         this._e7(_loc5_,_loc3_,_loc4_);
         this._A_(_loc5_,_loc3_.variables);
         this._A_(_loc5_,_loc3_.accessors);
         this._0vR_(_loc5_,_loc3_.methods,_loc4_);
         this._zR_(_loc5_,_loc3_.variables,_loc4_);
         this._zR_(_loc5_,_loc3_.accessors,_loc4_);
         this._zR_(_loc5_,_loc3_.methods,_loc4_);
         this._0H_B_(_loc5_,_loc3_.methods,_loc4_);
         return _loc5_;
      }
      
      private function _e7(param1:_0xu, param2:Object, param3:String) : void
      {
         var _loc4_:Dictionary = null;
         var _loc5_:Array = null;
         var _loc6_:Array = param2.constructor;
         if(!_loc6_)
         {
            param1.ctor = param2.bases.length > 0?new _1X_j():null;
            return;
         }
         _loc4_ = this._1co("Inject",param2.metadata);
         _loc5_ = (_loc4_ && _loc4_.name || "").split(",");
         var _loc7_:int = this._1zp(_loc6_,_loc5_,param3);
         param1.ctor = new _L_d(_loc6_,_loc7_,_loc4_);
      }
      
      private function _0vR_(param1:_0xu, param2:Array, param3:String) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Dictionary = null;
         var _loc6_:* = false;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:uint = 0;
         var _loc10_:_1J_K_ = null;
         var _loc12_:int = 0;
         if(!param2)
         {
            return;
         }
         var _loc11_:uint = param2.length;
         while(_loc12_ < _loc11_)
         {
            _loc4_ = param2[_loc12_];
            _loc5_ = this._1co("Inject",_loc4_.metadata);
            if(_loc5_)
            {
               _loc6_ = _loc5_.optional == "true";
               _loc7_ = (_loc5_.name || "").split(",");
               _loc8_ = _loc4_.parameters;
               _loc9_ = this._1zp(_loc8_,_loc7_,param3);
               _loc10_ = new _1J_K_(_loc4_.name,_loc8_,_loc9_,_loc6_,_loc5_);
               param1._1L_I_(_loc10_);
            }
            _loc12_++;
         }
      }
      
      private function _zR_(param1:_0xu, param2:Array, param3:String) : void
      {
         var _loc5_:int = 0;
         var _loc4_:Array = this._1S_I_(_1V_x,"PostConstruct",param2,param3);
         var _loc6_:int = _loc4_.length;
         while(_loc5_ < _loc6_)
         {
            param1._1L_I_(_loc4_[_loc5_]);
            _loc5_++;
         }
      }
      
      private function _0H_B_(param1:_0xu, param2:Array, param3:String) : void
      {
         var _loc4_:Array = this._1S_I_(_nm,"PreDestroy",param2,param3);
         if(!_loc4_.length)
         {
            return;
         }
         param1._eG_ = _loc4_[0];
         param1._eG_.last = _loc4_[0];
         var _loc5_:int = 1;
         var _loc6_:int = _loc4_.length;
         while(_loc5_ < _loc6_)
         {
            param1._eG_.last.next = _loc4_[_loc5_];
            param1._eG_.last = _loc4_[_loc5_];
            _loc5_++;
         }
      }
      
      private function _A_(param1:_0xu, param2:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Dictionary = null;
         var _loc5_:String = null;
         var _loc6_:* = false;
         var _loc7_:_1A_e = null;
         var _loc9_:int = 0;
         if(!param2)
         {
            return;
         }
         var _loc8_:uint = param2.length;
         while(_loc9_ < _loc8_)
         {
            _loc3_ = param2[_loc9_];
            _loc4_ = this._1co("Inject",_loc3_.metadata);
            if(_loc4_)
            {
               _loc5_ = _loc4_.name || "";
               _loc6_ = _loc4_.optional == "true";
               _loc7_ = new _1A_e(_loc3_.type + "|" + _loc5_,_loc3_.name,_loc6_,_loc4_);
               param1._1L_I_(_loc7_);
            }
            _loc9_++;
         }
      }
      
      private function _1zp(param1:Array, param2:Array, param3:String) : uint
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:uint = 0;
         var _loc9_:int = 0;
         var _loc8_:uint = param1.length;
         while(_loc9_ < _loc8_)
         {
            _loc4_ = param1[_loc9_];
            _loc5_ = param2[_loc9_] || "";
            _loc6_ = _loc4_.type;
            if(_loc6_ == "*")
            {
               if(!_loc4_.optional)
               {
                  throw new _1F_t("Error in method definition of injectee \"" + param3 + ". Required parameters can\'t have type \"*\".");
               }
               _loc6_ = null;
            }
            if(!_loc4_.optional)
            {
               _loc7_++;
            }
            param1[_loc9_] = _loc6_ + "|" + _loc5_;
            _loc9_++;
         }
         return _loc7_;
      }
      
      private function _1S_I_(param1:Class, param2:String, param3:Array, param4:String) : Array
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:uint = 0;
         var _loc10_:int = 0;
         var _loc13_:int = 0;
         var _loc11_:Array = [];
         if(!param3)
         {
            return _loc11_;
         }
         var _loc12_:uint = param3.length;
         while(_loc13_ < _loc12_)
         {
            _loc5_ = param3[_loc13_];
            _loc6_ = this._1co(param2,_loc5_.metadata);
            if(_loc6_)
            {
               _loc7_ = (_loc6_.name || "").split(",");
               _loc8_ = _loc5_.parameters;
               if(_loc8_)
               {
                  _loc9_ = this._1zp(_loc8_,_loc7_,param4);
               }
               else
               {
                  _loc8_ = [];
                  _loc9_ = 0;
               }
               _loc10_ = parseInt(_loc6_.order,10);
               if(_loc10_.toString(10) != _loc6_.order)
               {
                  _loc10_ = int.MAX_VALUE;
               }
               _loc11_.push(new param1(_loc5_.name,_loc8_,_loc9_,_loc10_));
            }
            _loc13_++;
         }
         if(_loc11_.length > 0)
         {
            _loc11_.sortOn("order",Array.NUMERIC);
         }
         return _loc11_;
      }
      
      private function _1co(param1:String, param2:Array) : Dictionary
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:Dictionary = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc10_:int = 0;
         var _loc9_:uint = !!param2?uint(param2.length):uint(0);
         while(_loc10_ < _loc9_)
         {
            _loc3_ = param2[_loc10_];
            if(_loc3_.name == param1)
            {
               _loc4_ = _loc3_.value;
               _loc5_ = new Dictionary();
               _loc6_ = _loc4_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc8_ = _loc4_[_loc7_];
                  _loc5_[_loc8_.key] = !!_loc5_[_loc8_.key]?_loc5_[_loc8_.key] + "," + _loc8_.value:_loc8_.value;
                  _loc7_++;
               }
               return _loc5_;
            }
            _loc10_++;
         }
         return null;
      }
   }
}
