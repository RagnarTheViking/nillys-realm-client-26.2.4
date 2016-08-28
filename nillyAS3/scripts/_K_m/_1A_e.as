package _K_m
{
   import _wi.Injector;
   import _k1.SsInternal;
   import _i__._0__L_;
   import _03N_._9A_;
   import flash.utils.getQualifiedClassName;
   import flash.utils.Dictionary;
   
   public class _1A_e extends _1gA_
   {
       
      
      private var _0N_D_:String;
      
      private var _1sy:String;
      
      private var _18T_:Boolean;
      
      public function _1A_e(param1:String, param2:String, param3:Boolean, param4:Dictionary)
      {
         super();
         this._0N_D_ = param2;
         this._1sy = param1;
         this._18T_ = param3;
         this.injectParameters = param4;
      }
      
      override public function applyInjection(param1:Object, param2:Class, param3:Injector) : void
      {
         var _loc4_:_0__L_ = param3.SsInternal::_0K_O_(this._1sy);
         if(!_loc4_)
         {
            if(this._18T_)
            {
               return;
            }
            throw new _9A_("Injector is missing a mapping to handle injection into property \"" + this._0N_D_ + "\" of object \"" + param1 + "\" with type \"" + getQualifiedClassName(param2) + "\". Target dependency: \"" + this._1sy + "\"");
         }
         param1[this._0N_D_] = _loc4_.apply(param2,param3,injectParameters);
      }
   }
}
