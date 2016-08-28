package _K_m
{
   import flash.utils.Dictionary;
   import _wi._1F_t;
   import flash.utils.getQualifiedClassName;
   
   public class _0xu
   {
       
      
      public var ctor:_K_m._L_d;
      
      public var injectionPoints:_K_m._1gA_;
      
      public var _eG_:_K_m._nm;
      
      private var _M_S_:Boolean;
      
      public function _0xu(param1:Boolean = true)
      {
         super();
         if(param1)
         {
            this.ctor = new _1X_j();
         }
      }
      
      public function _1kL_(param1:Array, param2:Array = null, param3:uint = 2147483647, param4:Dictionary = null) : _0xu
      {
         this.ctor = new _K_m._L_d(this._J_d(param1,param2 || []),param3,param4);
         return this;
      }
      
      public function _1D_N_(param1:String, param2:Class, param3:String = "", param4:Boolean = false, param5:Dictionary = null) : _0xu
      {
         if(this._M_S_)
         {
            throw new _1F_t("Can\'t add injection point after post construct method");
         }
         this._1L_I_(new _1A_e(getQualifiedClassName(param2) + "|" + param3,param1,param4,param5));
         return this;
      }
      
      public function _0Y_8(param1:String, param2:Array, param3:Array = null, param4:uint = 2147483647, param5:Boolean = false, param6:Dictionary = null) : _0xu
      {
         if(this._M_S_)
         {
            throw new _1F_t("Can\'t add injection point after post construct method");
         }
         this._1L_I_(new _1J_K_(param1,this._J_d(param2,param3 || []),Math.min(param4,param2.length),param5,param6));
         return this;
      }
      
      public function _1L_n(param1:String, param2:Array, param3:Array = null, param4:uint = 2147483647) : _0xu
      {
         this._M_S_ = true;
         this._1L_I_(new _1V_x(param1,this._J_d(param2,param3 || []),Math.min(param4,param2.length),0));
         return this;
      }
      
      public function _B_A_(param1:String, param2:Array, param3:Array = null, param4:uint = 2147483647) : _0xu
      {
         var _loc5_:_K_m._nm = new _K_m._nm(param1,this._J_d(param2,param3 || []),Math.min(param4,param2.length),0);
         if(this._eG_)
         {
            this._eG_.last.next = _loc5_;
            this._eG_.last = _loc5_;
         }
         else
         {
            this._eG_ = _loc5_;
            this._eG_.last = _loc5_;
         }
         return this;
      }
      
      public function _1L_I_(param1:_K_m._1gA_) : void
      {
         if(this.injectionPoints)
         {
            this.injectionPoints.last.next = param1;
            this.injectionPoints.last = param1;
         }
         else
         {
            this.injectionPoints = param1;
            this.injectionPoints.last = param1;
         }
      }
      
      private function _J_d(param1:Array, param2:Array) : Array
      {
         var _loc3_:Array = new Array(param1.length);
         var _loc4_:int = _loc3_.length;
         while(_loc4_--)
         {
            _loc3_[_loc4_] = getQualifiedClassName(param1[_loc4_]) + "|" + (param2[_loc4_] || "");
         }
         return _loc3_;
      }
   }
}
