package _f7
{
   public class Slot implements _15B_
   {
       
      
      protected var _signal:_f7._0V_a;
      
      protected var _0rc:Boolean = true;
      
      protected var _0U_R_:Function;
      
      protected var _once:Boolean = false;
      
      protected var _0fc:int = 0;
      
      protected var _1E_o:Array;
      
      public function Slot(param1:Function, param2:_f7._0V_a, param3:Boolean = false, param4:int = 0)
      {
         super();
         this._0U_R_ = param1;
         this._once = param3;
         this._signal = param2;
         this._0fc = param4;
         this._8K_(param1);
      }
      
      public function execute0() : void
      {
         if(!this._0rc)
         {
            return;
         }
         if(this._once)
         {
            this.remove();
         }
         if(this._1E_o && this._1E_o.length)
         {
            this._0U_R_.apply(null,this._1E_o);
            return;
         }
         this._0U_R_();
      }
      
      public function execute1(param1:Object) : void
      {
         if(!this._0rc)
         {
            return;
         }
         if(this._once)
         {
            this.remove();
         }
         if(this._1E_o && this._1E_o.length)
         {
            this._0U_R_.apply(null,[param1].concat(this._1E_o));
            return;
         }
         this._0U_R_(param1);
      }
      
      public function execute(param1:Array) : void
      {
         if(!this._0rc)
         {
            return;
         }
         if(this._once)
         {
            this.remove();
         }
         if(this._1E_o && this._1E_o.length)
         {
            param1 = param1.concat(this._1E_o);
         }
         var _loc2_:int = param1.length;
         if(_loc2_ == 0)
         {
            this._0U_R_();
         }
         else if(_loc2_ == 1)
         {
            this._0U_R_(param1[0]);
         }
         else if(_loc2_ == 2)
         {
            this._0U_R_(param1[0],param1[1]);
         }
         else if(_loc2_ == 3)
         {
            this._0U_R_(param1[0],param1[1],param1[2]);
         }
         else
         {
            this._0U_R_.apply(null,param1);
         }
      }
      
      public function get listener() : Function
      {
         return this._0U_R_;
      }
      
      public function set listener(param1:Function) : void
      {
         if(null == param1)
         {
            throw new ArgumentError("Given listener is null.\nDid you want to set enabled to false instead?");
         }
         this._8K_(param1);
         this._0U_R_ = param1;
      }
      
      public function get once() : Boolean
      {
         return this._once;
      }
      
      public function get priority() : int
      {
         return this._0fc;
      }
      
      public function toString() : String
      {
         return "[Slot listener: " + this._0U_R_ + ", once: " + this._once + ", priority: " + this._0fc + ", enabled: " + this._0rc + "]";
      }
      
      public function get enabled() : Boolean
      {
         return this._0rc;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._0rc = param1;
      }
      
      public function get params() : Array
      {
         return this._1E_o;
      }
      
      public function set params(param1:Array) : void
      {
         this._1E_o = param1;
      }
      
      public function remove() : void
      {
         this._signal.remove(this._0U_R_);
      }
      
      protected function _8K_(param1:Function) : void
      {
         if(null == param1)
         {
            throw new ArgumentError("Given listener is null.");
         }
         if(null == this._signal)
         {
            throw new Error("Internal signal reference has not been set yet.");
         }
      }
   }
}
