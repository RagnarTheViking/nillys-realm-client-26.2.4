package _0hJ_
{
   public class Server
   {
       
      
      public var name:String;
      
      public var address:String;
      
      public var port:int;
      
      public var _0f5:_0hJ_._1ph;
      
      public var _1N_m:Number;
      
      public var _S_g:Boolean;
      
      public function Server()
      {
         super();
      }
      
      public function setName(param1:String) : Server
      {
         this.name = param1;
         return this;
      }
      
      public function setAddress(param1:String) : Server
      {
         this.address = param1;
         return this;
      }
      
      public function setPort(param1:int) : Server
      {
         this.port = param1;
         return this;
      }
      
      public function setLatLong(param1:Number, param2:Number) : Server
      {
         this._0f5 = new _0hJ_._1ph(param1,param2);
         return this;
      }
      
      public function setUsage(param1:Number) : Server
      {
         this._1N_m = param1;
         return this;
      }
      
      public function setIsAdminOnly(param1:Boolean) : Server
      {
         this._S_g = param1;
         return this;
      }
      
      public function priority() : int
      {
         if(this._S_g)
         {
            return 2;
         }
         if(this._0lJ_())
         {
            return 1;
         }
         return 0;
      }
      
      public function _0lJ_() : Boolean
      {
         return this._1N_m >= 0.66;
      }
      
      public function _M_w() : Boolean
      {
         return this._1N_m >= 1;
      }
      
      public function toString() : String
      {
         return "[" + this.name + ": " + this.address + ":" + this.port + ":" + this._0f5 + ":" + this._1N_m + ":" + this._S_g + "]";
      }
   }
}
