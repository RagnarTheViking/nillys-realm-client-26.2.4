package _gs
{
   import _V_y.ISignalCommandMap;
   import flash.utils.Dictionary;
   import _wi.Injector;
   import _1kz.ICommandCenter;
   import _J_4._1I_J_;
   import _1kz._1a9;
   import _J_4._U_D_;
   
   public class _123 implements ISignalCommandMap
   {
       
      
      private const _H_O_:Dictionary = new Dictionary();
      
      private var _A_A_:Injector;
      
      private var _0mN_:ICommandCenter;
      
      public function _123(param1:Injector, param2:ICommandCenter)
      {
         super();
         this._A_A_ = param1;
         this._0mN_ = param2;
      }
      
      public function map(param1:Class, param2:Boolean = false) : _1I_J_
      {
         var _loc3_:_1a9 = this._H_O_[param1] = this._H_O_[param1] || this._1lp(param1,param2);
         return this._0mN_.map(_loc3_);
      }
      
      public function _1kw(param1:Class) : _U_D_
      {
         return this._0mN_._1kw(this._06L_(param1));
      }
      
      private function _1lp(param1:Class, param2:Boolean = false) : _1a9
      {
         return new _1O_p(this._A_A_,param1,param2);
      }
      
      private function _06L_(param1:Class) : _1a9
      {
         return this._H_O_[param1];
      }
   }
}
