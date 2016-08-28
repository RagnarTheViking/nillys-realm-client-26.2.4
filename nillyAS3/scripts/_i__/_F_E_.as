package _i__
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   import _wi._1F_t;
   import flash.utils.getQualifiedClassName;
   import _k1.SsInternal;
   import _K_m._0xu;
   import _K_m._nm;
   
   public class _F_E_ implements _0__L_
   {
       
      
      private var _0bv:Class;
      
      private var _1mt:Injector;
      
      private var _lT_:Object;
      
      private var _0E_3:Boolean;
      
      public function _F_E_(param1:Class, param2:Injector)
      {
         super();
         this._0bv = param1;
         this._1mt = param2;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._lT_ = this._lT_ || this._S_8(this._1mt);
      }
      
      private function _S_8(param1:Injector) : Object
      {
         if(this._0E_3)
         {
            throw new _1F_t("Forbidden usage of unmapped singleton provider for type " + getQualifiedClassName(this._0bv));
         }
         return param1.SsInternal::_4Q_(this._0bv);
      }
      
      public function destroy() : void
      {
         this._0E_3 = true;
         if(!this._lT_)
         {
            return;
         }
         var _loc1_:_0xu = this._1mt._1dO_(this._0bv);
         var _loc2_:_nm = _loc1_._eG_;
         while(_loc2_)
         {
            _loc2_.applyInjection(this._lT_,this._0bv,this._1mt);
            _loc2_ = _nm(_loc2_.next);
         }
         this._lT_ = null;
      }
   }
}
