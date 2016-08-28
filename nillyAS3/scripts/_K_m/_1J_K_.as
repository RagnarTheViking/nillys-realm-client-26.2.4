package _K_m
{
   import _wi.Injector;
   import _i__._0__L_;
   import _k1.SsInternal;
   import _03N_._9A_;
   import avmplus.getQualifiedClassName;
   import flash.utils.Dictionary;
   
   public class _1J_K_ extends _1gA_
   {
      
      private static const _1dy:Array = [];
       
      
      protected var _0O_Q_:Array;
      
      protected var _X_1:int;
      
      private var _0yC_:Boolean;
      
      private var _0wO_:String;
      
      public function _1J_K_(param1:String, param2:Array, param3:uint, param4:Boolean, param5:Dictionary)
      {
         super();
         this._0wO_ = param1;
         this._0O_Q_ = param2;
         this._X_1 = param3;
         this._0yC_ = param4;
         this.injectParameters = param5;
      }
      
      override public function applyInjection(param1:Object, param2:Class, param3:Injector) : void
      {
         var _loc4_:Array = this._1Y_X_(param1,param2,param3);
         if(_loc4_.length >= this._X_1)
         {
            (param1[this._0wO_] as Function).apply(param1,_loc4_);
         }
         _loc4_.length = 0;
      }
      
      protected function _1Y_X_(param1:Object, param2:Class, param3:Injector) : Array
      {
         var _loc4_:String = null;
         var _loc5_:_0__L_ = null;
         var _loc8_:int = 0;
         var _loc6_:int = this._0O_Q_.length;
         var _loc7_:Array = _1dy;
         _loc7_.length = _loc6_;
         while(_loc8_ < _loc6_)
         {
            _loc4_ = this._0O_Q_[_loc8_];
            _loc5_ = param3.SsInternal::_0K_O_(_loc4_);
            if(!_loc5_)
            {
               if(_loc8_ >= this._X_1 || this._0yC_)
               {
                  break;
               }
               throw new _9A_("Injector is missing a mapping to handle injection into target \"" + param1 + "\" of type \"" + getQualifiedClassName(param2) + "\". \t\t\t\t\t\tTarget dependency: " + _loc4_ + ", method: " + this._0wO_ + ", parameter: " + (_loc8_ + 1));
            }
            _loc7_[_loc8_] = _loc5_.apply(param2,param3,injectParameters);
            _loc8_++;
         }
         return _loc7_;
      }
   }
}
