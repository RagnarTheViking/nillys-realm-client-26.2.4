package _I_w
{
   import _0eG_._xn;
   import _0k0.allOf;
   import _0wG_.instanceOf;
   import _0k0.not;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import _wi.Injector;
   import _1__8._19A_;
   import _1__8._4L_;
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   
   public class _V_r
   {
      
      private static const _1nh:_xn = allOf(instanceOf(Object),not(instanceOf(Class)),not(instanceOf(DisplayObject)));
       
      
      private const _0yi:String = _0S_m.create(_V_r);
      
      private const _0lf:_I_w.ObjectProcessor = new _I_w.ObjectProcessor();
      
      private const _0S_I_:Dictionary = new Dictionary();
      
      private const _18y:Array = [];
      
      private var _A_A_:Injector;
      
      private var _1aY_:_19A_;
      
      private var _81:Boolean;
      
      public function _V_r(param1:_1Q_O_)
      {
         super();
         this._A_A_ = param1._T_X_;
         this._1aY_ = param1._A_9(this);
         this._09l(instanceOf(Class),this._1G_5);
         this._09l(_1nh,this._18Z_);
         param1._1za.addEventListener(_4L_._1ji,this.initialize,false,-100);
      }
      
      public function _08l(param1:Object) : void
      {
         if(!this._0S_I_[param1])
         {
            this._0S_I_[param1] = true;
            this._0lf._vx(param1);
         }
      }
      
      public function _09l(param1:_xn, param2:Function) : void
      {
         this._0lf._1q9(param1,param2);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function initialize(param1:_4L_) : void
      {
         if(!this._81)
         {
            this._81 = true;
            this._1dL_();
         }
      }
      
      private function _1G_5(param1:Class) : void
      {
         if(this._81)
         {
            this._1aY_.debug("Already initialized. Instantiating config class {0}",[param1]);
            this._0wZ_(param1);
         }
         else
         {
            this._1aY_.debug("Not yet initialized. Queuing config class {0}",[param1]);
            this._18y.push(param1);
         }
      }
      
      private function _18Z_(param1:Object) : void
      {
         if(this._81)
         {
            this._1aY_.debug("Already initialized. Injecting into config object {0}",[param1]);
            this._vx(param1);
         }
         else
         {
            this._1aY_.debug("Not yet initialized. Queuing config object {0}",[param1]);
            this._18y.push(param1);
         }
      }
      
      private function _1dL_() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._18y)
         {
            if(_loc1_ is Class)
            {
               this._1aY_.debug("Now initializing. Instantiating config class {0}",[_loc1_]);
               this._0wZ_(_loc1_ as Class);
            }
            else
            {
               this._1aY_.debug("Now initializing. Injecting into config object {0}",[_loc1_]);
               this._vx(_loc1_);
            }
         }
         this._18y.length = 0;
      }
      
      private function _0wZ_(param1:Class) : void
      {
         var _loc2_:IConfig = this._A_A_.getInstance(param1) as IConfig;
         _loc2_ && _loc2_.configure();
      }
      
      private function _vx(param1:Object) : void
      {
         this._A_A_._S_t(param1);
         var _loc2_:IConfig = param1 as IConfig;
         _loc2_ && _loc2_.configure();
      }
   }
}
