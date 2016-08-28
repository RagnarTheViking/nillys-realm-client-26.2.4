package _wi
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import _k1.SsInternal;
   import flash.system.ApplicationDomain;
   import _k1._B_X_;
   import _0ps._X_L_;
   import _T_W_._1M_q;
   import flash.utils.getQualifiedClassName;
   import _T_W_._1n3;
   import _03N_._9A_;
   import _K_m._L_d;
   import _i__._0__L_;
   import _K_m._0xu;
   import _K_m._nm;
   import _03N_._1H_z;
   import _i__._q7;
   import _i__._E_C_;
   import flash.utils.getDefinitionByName;
   import _i__._1lj;
   import _K_m._1gA_;
   import avmplus.DescribeTypeJSON;
   import _0ps._0W_;
   import _0ps._0__i;
   
   use namespace SsInternal;
   
   public class Injector extends EventDispatcher
   {
      
      private static var _1pt:Dictionary = new Dictionary(true);
       
      
      SsInternal const _L_O_:Dictionary = new Dictionary();
      
      private var _lH_:_wi.Injector;
      
      private var _fG_:ApplicationDomain;
      
      private var _2z:_B_X_;
      
      private var _A_2:Dictionary;
      
      private var _1bv:Dictionary;
      
      private var _1J_q:Dictionary;
      
      private var _1N_1:Dictionary;
      
      private var _mQ_:_X_L_;
      
      public function Injector()
      {
         super();
         this._A_2 = new Dictionary();
         this._1bv = new Dictionary();
         this._1J_q = new Dictionary();
         this._1N_1 = new Dictionary();
         try
         {
            this._mQ_ = !!DescribeTypeJSON.available?new _0W_():new _0__i();
         }
         catch(e:Error)
         {
            _mQ_ = new _0__i();
         }
         this._2z = new _B_X_(this._mQ_,_1pt);
         this._fG_ = ApplicationDomain.currentDomain;
      }
      
      SsInternal static function _0P_w() : void
      {
         _1pt = new Dictionary(true);
      }
      
      public function map(param1:Class, param2:String = "") : _1M_q
      {
         var _loc3_:String = getQualifiedClassName(param1) + "|" + param2;
         return this._A_2[_loc3_] || this._01j(param1,param2,_loc3_);
      }
      
      public function _1kw(param1:Class, param2:String = "") : void
      {
         var _loc3_:String = getQualifiedClassName(param1) + "|" + param2;
         var _loc4_:_1M_q = this._A_2[_loc3_];
         if(_loc4_ && _loc4_._0xo)
         {
            throw new _1F_t("Can\'t unmap a sealed mapping");
         }
         if(!_loc4_)
         {
            throw new _1F_t("Error while removing an injector mapping: " + "No mapping defined for dependency " + _loc3_);
         }
         _loc4_._0K_O_().destroy();
         delete this._A_2[_loc3_];
         delete this._L_O_[_loc3_];
         hasEventListener(_1n3._0cQ_) && dispatchEvent(new _1n3(_1n3._0cQ_,param1,param2,null));
      }
      
      public function _14n(param1:Class, param2:String = "") : Boolean
      {
         return this._0K_O_(getQualifiedClassName(param1) + "|" + param2) != null;
      }
      
      public function _T_c(param1:Class, param2:String = "") : Boolean
      {
         return this._L_O_[getQualifiedClassName(param1) + "|" + param2] != null;
      }
      
      public function _T_z(param1:Class, param2:String = "") : _1M_q
      {
         var _loc3_:String = getQualifiedClassName(param1) + "|" + param2;
         var _loc4_:_1M_q = this._A_2[_loc3_];
         if(!_loc4_)
         {
            throw new _9A_("Error while retrieving an injector mapping: " + "No mapping defined for dependency " + _loc3_);
         }
         return _loc4_;
      }
      
      public function _S_t(param1:Object) : void
      {
         var _loc2_:Class = this._mQ_._1V_1(param1);
         this._0I_Z_(param1,_loc2_,this._2z._1g0(_loc2_));
      }
      
      public function getInstance(param1:Class, param2:String = "", param3:Class = null) : *
      {
         var _loc4_:String = null;
         var _loc5_:_L_d = null;
         _loc4_ = getQualifiedClassName(param1) + "|" + param2;
         var _loc6_:_0__L_ = this._0K_O_(_loc4_,false);
         if(_loc6_)
         {
            _loc5_ = this._2z._1g0(param1).ctor;
            return _loc6_.apply(param3,this,!!_loc5_?_loc5_.injectParameters:null);
         }
         if(param2)
         {
            throw new _9A_("No mapping found for request " + _loc4_ + ". getInstance only creates an unmapped instance if no name is given.");
         }
         return this._4Q_(param1);
      }
      
      public function _1w__(param1:Object) : void
      {
         var _loc2_:Class = null;
         if(!param1)
         {
            return;
         }
         _loc2_ = this._mQ_._1V_1(param1);
         var _loc3_:_0xu = this._1dO_(_loc2_);
         var _loc4_:_nm = _loc3_._eG_;
         while(_loc4_)
         {
            _loc4_.applyInjection(param1,_loc2_,this);
            _loc4_ = _nm(_loc4_.next);
         }
      }
      
      public function _1b__() : void
      {
         var _loc1_:_1M_q = null;
         var _loc2_:Object = null;
         for each(_loc1_ in this._A_2)
         {
            _loc1_._0K_O_().destroy();
         }
         for each(_loc2_ in this._1N_1)
         {
            this._1w__(_loc2_);
         }
         this._A_2 = new Dictionary();
         this._1bv = new Dictionary();
         this._1J_q = new Dictionary();
         this._1N_1 = new Dictionary();
      }
      
      public function _W_9(param1:ApplicationDomain = null) : _wi.Injector
      {
         var _loc2_:_wi.Injector = new _wi.Injector();
         _loc2_._07w = param1 || this._07w;
         _loc2_._19Y_ = this;
         return _loc2_;
      }
      
      public function set _19Y_(param1:_wi.Injector) : void
      {
         this._lH_ = param1;
      }
      
      public function get _19Y_() : _wi.Injector
      {
         return this._lH_;
      }
      
      public function set _07w(param1:ApplicationDomain) : void
      {
         this._fG_ = param1 || ApplicationDomain.currentDomain;
      }
      
      public function get _07w() : ApplicationDomain
      {
         return this._fG_;
      }
      
      public function _15o(param1:Class, param2:_0xu) : void
      {
         this._2z._1on(param1,param2);
      }
      
      public function _1dO_(param1:Class) : _0xu
      {
         return this._mQ_._1B_K_(param1);
      }
      
      SsInternal function _4Q_(param1:Class) : Object
      {
         var _loc2_:_0xu = this._2z._1g0(param1);
         if(!_loc2_.ctor)
         {
            throw new _1H_z("Can\'t instantiate interface " + getQualifiedClassName(param1));
         }
         var _loc3_:* = _loc2_.ctor.createInstance(param1,this);
         hasEventListener(_0J_F_._0uZ_) && dispatchEvent(new _0J_F_(_0J_F_._0uZ_,_loc3_,param1));
         this._0I_Z_(_loc3_,param1,_loc2_);
         return _loc3_;
      }
      
      SsInternal function _0K_O_(param1:String, param2:Boolean = true) : _0__L_
      {
         var _loc3_:_0__L_ = null;
         var _loc4_:_0__L_ = null;
         var _loc5_:_wi.Injector = this;
         while(_loc5_)
         {
            _loc4_ = _loc5_._L_O_[param1];
            if(_loc4_)
            {
               if(_loc4_ is _q7)
               {
                  _loc3_ = _loc4_;
                  _loc5_ = _loc5_._19Y_;
                  continue;
               }
               if(_loc4_ is _E_C_ && _loc5_ !== this)
               {
                  _loc5_ = _loc5_._19Y_;
                  continue;
               }
               return _loc4_;
            }
            _loc5_ = _loc5_._19Y_;
         }
         if(_loc3_)
         {
            return _loc3_;
         }
         return !!param2?this._1J_F_(param1):null;
      }
      
      SsInternal function _1J_F_(param1:String) : _0__L_
      {
         var parts:Array = null;
         var definition:Object = null;
         var mappingId:String = param1;
         if(mappingId === "String|")
         {
            return null;
         }
         parts = mappingId.split("|");
         var name:String = parts.pop();
         if(name.length !== 0)
         {
            return null;
         }
         var typeName:String = parts.pop();
         try
         {
            definition = !!this._fG_.hasDefinition(typeName)?this._fG_.getDefinition(typeName):getDefinitionByName(typeName);
         }
         catch(e:Error)
         {
            return null;
         }
         if(!definition || !(definition is Class))
         {
            return null;
         }
         var type:Class = Class(definition);
         var description:_0xu = this._2z._1g0(type);
         if(!description.ctor)
         {
            return null;
         }
         return this._1J_q[type] = this._1J_q[type] || new _1lj(type);
      }
      
      private function _01j(param1:Class, param2:String, param3:String) : _1M_q
      {
         var _loc4_:_1M_q = null;
         if(this._1bv[param3])
         {
            throw new _1F_t("Can\'t change a mapping from inside a listener to it\'s creation event");
         }
         this._1bv[param3] = true;
         hasEventListener(_1n3._vw) && dispatchEvent(new _1n3(_1n3._vw,param1,param2,null));
         _loc4_ = new _1M_q(this,param1,param2,param3);
         this._A_2[param3] = _loc4_;
         var _loc5_:Object = _loc4_._db();
         hasEventListener(_1n3._1C_l) && dispatchEvent(new _1n3(_1n3._1C_l,param1,param2,_loc4_));
         delete this._1bv[param3];
         _loc4_._7Y_(_loc5_);
         return _loc4_;
      }
      
      private function _0I_Z_(param1:Object, param2:Class, param3:_0xu) : void
      {
         var _loc4_:_1gA_ = param3.injectionPoints;
         hasEventListener(_0J_F_._1y9) && dispatchEvent(new _0J_F_(_0J_F_._1y9,param1,param2));
         while(_loc4_)
         {
            _loc4_.applyInjection(param1,param2,this);
            _loc4_ = _loc4_.next;
         }
         if(param3._eG_)
         {
            this._1N_1[param1] = param1;
         }
         hasEventListener(_0J_F_._D_O_) && dispatchEvent(new _0J_F_(_0J_F_._D_O_,param1,param2));
      }
   }
}
