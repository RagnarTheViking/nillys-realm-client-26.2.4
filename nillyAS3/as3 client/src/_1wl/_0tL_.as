package _1wl
{
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   use namespace flash_proxy;
   
   public dynamic class _0tL_ extends Proxy
   {
       
      
      private var _qb:Array;
      
      private var _0vq:Object;
      
      public function _0tL_()
      {
         super();
         this._0vq = new Object();
      }
      
      public function _set(param1:String, param2:Object, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            delete this._0vq[param1];
         }
         else
         {
            this._0vq[param1] = new _0v6(param2,param3);
         }
      }
      
      public function _get(param1:String) : *
      {
         var _loc2_:_0v6 = this._0lq(param1);
         return !!_loc2_?_loc2_._1G_a:undefined;
      }
      
      public function _0lq(param1:String) : _0v6
      {
         return this._0vq[param1] as _0v6;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         return this._get(param1);
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         var _loc3_:Object = this._get(param1);
         return _loc3_.apply(this,rest);
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         this._set(param1,param2);
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return this._qb[param1 - 1];
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this[this.nextName(param1)];
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         var _loc2_:* = undefined;
         if(param1 == 0)
         {
            this._qb = new Array();
            for(_loc2_ in this._0vq)
            {
               this._qb.push(_loc2_);
            }
         }
         if(param1 < this._qb.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function deleteProperty(param1:*) : Boolean
      {
         return delete this._0vq[param1];
      }
      
      public function toString() : String
      {
         return "[WeakObject]";
      }
   }
}
