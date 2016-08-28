package _T_W_
{
   import _wi.Injector;
   import _i__._1lj;
   import _i__._F_E_;
   import _i__._W_b;
   import _i__._0__L_;
   import _wi._1F_t;
   import _k1.SsInternal;
   import _i__._0Q_;
   import _i__._q7;
   import _i__._E_C_;
   import _i__._0nV_;
   
   public class _1M_q implements _0L_q, _1R_z
   {
       
      
      private var _15:Class;
      
      private var _name:String;
      
      private var _1sy:String;
      
      private var _1mt:Injector;
      
      private var _0iN_:Boolean;
      
      private var _1P_D_:Injector;
      
      private var _0L_U_:Boolean;
      
      private var _1e9:Boolean;
      
      private var _1G_x:Boolean;
      
      private var _B_p:Object;
      
      public function _1M_q(param1:Injector, param2:Class, param3:String, param4:String)
      {
         super();
         this._1mt = param1;
         this._15 = param2;
         this._name = param3;
         this._1sy = param4;
         this._0iN_ = true;
         this._01__(new _1lj(param2));
      }
      
      public function asSingleton() : _1R_z
      {
         this._015(this._15);
         return this;
      }
      
      public function _0L_2(param1:Class) : _1R_z
      {
         this._0K_M_(new _1lj(param1));
         return this;
      }
      
      public function _015(param1:Class) : _1R_z
      {
         this._0K_M_(new _F_E_(param1,this._1mt));
         return this;
      }
      
      public function _1as(param1:Object) : _1R_z
      {
         this._0K_M_(new _W_b(param1));
         return this;
      }
      
      public function _0K_M_(param1:_0__L_) : _1R_z
      {
         this._1G_x && this._1E_T_();
         if(this._15z() && param1 != null && !this._0iN_)
         {
            this._1mt.hasEventListener(_1n3._1a4) && this._1mt.dispatchEvent(new _1n3(_1n3._1a4,this._15,this._name,this));
         }
         this._00l();
         this._0iN_ = false;
         this._01__(param1);
         this._L_x();
         return this;
      }
      
      public function _s7() : _0L_q
      {
         var _loc1_:_0__L_ = null;
         this._1G_x && this._1E_T_();
         if(!this._0L_U_)
         {
            _loc1_ = this._0K_O_();
            this._00l();
            this._0L_U_ = true;
            this._01__(_loc1_);
            this._L_x();
         }
         return this;
      }
      
      public function _0X_X_() : _0L_q
      {
         this._1G_x && this._1E_T_();
         if(this._1e9)
         {
            return this;
         }
         var _loc1_:_0__L_ = this._0K_O_();
         this._00l();
         this._1e9 = true;
         this._01__(_loc1_);
         this._L_x();
         return this;
      }
      
      public function _db() : Object
      {
         if(this._1G_x)
         {
            throw new _1F_t("Mapping is already sealed.");
         }
         this._1G_x = true;
         this._B_p = {};
         return this._B_p;
      }
      
      public function _7Y_(param1:Object) : _1M_q
      {
         if(!this._1G_x)
         {
            throw new _1F_t("Can\'t unseal a non-sealed mapping.");
         }
         if(param1 !== this._B_p)
         {
            throw new _1F_t("Can\'t unseal mapping without the correct key.");
         }
         this._1G_x = false;
         this._B_p = null;
         return this;
      }
      
      public function get _0xo() : Boolean
      {
         return this._1G_x;
      }
      
      public function _15z() : Boolean
      {
         return Boolean(this._1mt.SsInternal::_L_O_[this._1sy]);
      }
      
      public function _0K_O_() : _0__L_
      {
         var _loc1_:_0__L_ = this._1mt.SsInternal::_L_O_[this._1sy];
         while(_loc1_ is _0Q_)
         {
            _loc1_ = _0Q_(_loc1_).provider;
         }
         return _loc1_;
      }
      
      public function setInjector(param1:Injector) : _1M_q
      {
         this._1G_x && this._1E_T_();
         if(param1 == this._1P_D_)
         {
            return this;
         }
         var _loc2_:_0__L_ = this._0K_O_();
         this._1P_D_ = param1;
         this._01__(_loc2_);
         return this;
      }
      
      private function _01__(param1:_0__L_) : void
      {
         if(this._0L_U_)
         {
            param1 = new _q7(param1);
         }
         if(this._1e9)
         {
            param1 = new _E_C_(param1);
         }
         if(this._1P_D_)
         {
            param1 = new _0nV_(this._1P_D_,param1);
         }
         this._1mt.SsInternal::_L_O_[this._1sy] = param1;
      }
      
      private function _1E_T_() : void
      {
         throw new _1F_t("Can\'t change a sealed mapping");
      }
      
      private function _00l() : void
      {
         this._1mt.hasEventListener(_1n3._77) && this._1mt.dispatchEvent(new _1n3(_1n3._77,this._15,this._name,this));
      }
      
      private function _L_x() : void
      {
         this._1mt.hasEventListener(_1n3._1J_D_) && this._1mt.dispatchEvent(new _1n3(_1n3._1J_D_,this._15,this._name,this));
      }
   }
}
