package _i__
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   
   public class _0nV_ extends _0Q_
   {
       
      
      public var _T_X_:Injector;
      
      public function _0nV_(param1:Injector, param2:_0__L_)
      {
         super(param2);
         this._T_X_ = param1;
      }
      
      override public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return provider.apply(param1,this._T_X_,param3);
      }
   }
}
