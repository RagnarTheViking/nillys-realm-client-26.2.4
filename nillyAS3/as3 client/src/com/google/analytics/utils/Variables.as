package com.google.analytics.utils
{
   import flash.net.URLVariables;
   
   public dynamic class Variables
   {
       
      
      public var post:Array;
      
      public var URIencode:Boolean;
      
      public var pre:Array;
      
      public var sort:Boolean = true;
      
      public function Variables(param1:String = null, param2:Array = null, param3:Array = null)
      {
         this.pre = [];
         this.post = [];
         super();
         if(param1)
         {
            this.decode(param1);
         }
         if(param2)
         {
            this.pre = param2;
         }
         if(param3)
         {
            this.post = param3;
         }
      }
      
      private function _join(param1:Variables) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
      }
      
      public function join(... rest) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = rest.length;
         while(_loc3_ < _loc2_)
         {
            if(rest[_loc3_] is Variables)
            {
               this._join(rest[_loc3_]);
            }
            _loc3_++;
         }
      }
      
      public function toString() : String
      {
         var _loc1_:String = null;
         var _loc2_:* = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Array = [];
         for(_loc2_ in this)
         {
            _loc1_ = this[_loc2_];
            if(this.URIencode)
            {
               _loc1_ = encodeURI(_loc1_);
            }
            _loc8_.push(_loc2_ + "=" + _loc1_);
         }
         if(this.sort)
         {
            _loc8_.sort();
         }
         if(this.pre.length > 0)
         {
            this.pre.reverse();
            _loc4_ = 0;
            while(_loc4_ < this.pre.length)
            {
               _loc6_ = this.pre[_loc4_];
               _loc5_ = 0;
               while(_loc5_ < _loc8_.length)
               {
                  _loc3_ = _loc8_[_loc5_];
                  if(_loc3_.indexOf(_loc6_) == 0)
                  {
                     _loc8_.unshift(_loc8_.splice(_loc5_,1)[0]);
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
            this.pre.reverse();
         }
         if(this.post.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < this.post.length)
            {
               _loc7_ = this.post[_loc4_];
               _loc5_ = 0;
               while(_loc5_ < _loc8_.length)
               {
                  _loc3_ = _loc8_[_loc5_];
                  if(_loc3_.indexOf(_loc7_) == 0)
                  {
                     _loc8_.push(_loc8_.splice(_loc5_,1)[0]);
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         return _loc8_.join("&");
      }
      
      public function decode(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         if(param1 == "")
         {
            return;
         }
         if(param1.charAt(0) == "?")
         {
            param1 = param1.substr(1,param1.length);
         }
         if(param1.indexOf("&") > -1)
         {
            _loc2_ = param1.split("&");
         }
         else
         {
            _loc2_ = [param1];
         }
         while(_loc7_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc7_];
            if(_loc3_.indexOf("=") > -1)
            {
               _loc6_ = _loc3_.split("=");
               _loc4_ = _loc6_[0];
               _loc5_ = decodeURI(_loc6_[1]);
               this[_loc4_] = _loc5_;
            }
            _loc7_++;
         }
      }
      
      public function toURLVariables() : URLVariables
      {
         var _loc1_:* = null;
         var _loc2_:URLVariables = new URLVariables();
         for(_loc1_ in this)
         {
            _loc2_[_loc1_] = this[_loc1_];
         }
         return _loc2_;
      }
   }
}
