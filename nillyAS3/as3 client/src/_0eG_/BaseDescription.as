package _0eG_
{
   import flash.errors.IllegalOperationError;
   
   public class BaseDescription implements Description
   {
      
      private static const _N_g:Object = {
         "\"":"\\\"",
         "\n":"\\n",
         "\r":"\\r",
         "\t":"\\t"
      };
       
      
      public function BaseDescription()
      {
         super();
      }
      
      public function _1C_f(param1:_1I_c) : Description
      {
         param1.describeTo(this);
         return this;
      }
      
      private function _1p0(param1:Object) : void
      {
         String(param1).split("").forEach(this._sS_);
      }
      
      private function _1mL_(param1:Object, param2:int = 0, param3:Array = null) : SelfDescribingValue
      {
         return new SelfDescribingValue(param1);
      }
      
      public function _0F_R_(param1:_xn, param2:*) : Description
      {
         param1.describeMismatch(param2,this);
         return this;
      }
      
      public function appendText(param1:String) : Description
      {
         this.append(param1);
         return this;
      }
      
      public function _av(param1:String, param2:String, param3:String, param4:Array) : Description
      {
         return this._10g(param1,param2,param3,param4.map(this._1mL_));
      }
      
      public function _0uv(param1:Object) : Description
      {
         if(param1 == null)
         {
            this.append("null");
         }
         else if(param1 is String)
         {
            this.append("\"");
            this._1p0(param1);
            this.append("\"");
         }
         else if(param1 is Number)
         {
            this.append("<");
            this.append(param1);
            this.append(">");
         }
         else if(param1 is int)
         {
            this.append("<");
            this.append(param1);
            this.append(">");
         }
         else if(param1 is uint)
         {
            this.append("<");
            this.append(param1);
            this.append(">");
         }
         else if(param1 is Array)
         {
            this._av("[",",","]",param1 as Array);
         }
         else if(param1 is XML)
         {
            this.append(XML(param1).toXMLString());
         }
         else
         {
            this.append("<");
            this.append(param1);
            this.append(">");
         }
         return this;
      }
      
      public function _10g(param1:String, param2:String, param3:String, param4:Array) : Description
      {
         var _loc5_:Object = null;
         var _loc6_:Boolean = false;
         this.append(param1);
         for each(_loc5_ in param4)
         {
            if(_loc6_)
            {
               this.append(param2);
            }
            if(_loc5_ is _1I_c)
            {
               this._1C_f(_loc5_ as _1I_c);
            }
            else
            {
               this._0uv(_loc5_);
            }
            _loc6_ = true;
         }
         this.append(param3);
         return this;
      }
      
      protected function append(param1:Object) : void
      {
         throw new IllegalOperationError("BaseDescription#append is abstract and must be overriden by a subclass");
      }
      
      public function toString() : String
      {
         throw new IllegalOperationError("BaseDescription#toString is abstract and must be overriden by a subclass");
      }
      
      private function _sS_(param1:String, param2:int = 0, param3:Array = null) : void
      {
         this.append(_N_g[param1] || param1);
      }
   }
}

import _0eG_._1I_c;
import _0eG_.Description;

class SelfDescribingValue implements _1I_c
{
    
   
   private var _value:Object;
   
   function SelfDescribingValue(param1:Object)
   {
      super();
      this._value = param1;
   }
   
   public function describeTo(param1:Description) : void
   {
      param1._0uv(this._value);
   }
}
