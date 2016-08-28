package _L_k
{
   import _0Q_L_._I_u;
   import flash.utils.Dictionary;
   import _wi.Injector;
   import flash.events.IEventDispatcher;
   import _1kz.ICommandCenter;
   import _J_4._1I_J_;
   import _1kz._1a9;
   import _J_4._U_D_;
   
   public class _1aJ_ implements _I_u
   {
       
      
      private const _1W_g:Dictionary = new Dictionary();
      
      private var _A_A_:Injector;
      
      private var _0gL_:IEventDispatcher;
      
      private var _I_S_:ICommandCenter;
      
      public function _1aJ_(param1:Injector, param2:IEventDispatcher, param3:ICommandCenter)
      {
         super();
         this._A_A_ = param1;
         this._0gL_ = param2;
         this._I_S_ = param3;
      }
      
      public function map(param1:String, param2:Class = null) : _1I_J_
      {
         var _loc3_:_1a9 = this._1W_g[param1 + param2] = this._1W_g[param1 + param2] || this._05F_(param1,param2);
         return this._I_S_.map(_loc3_);
      }
      
      public function _1kw(param1:String, param2:Class = null) : _U_D_
      {
         return this._I_S_._1kw(this._11K_(param1,param2));
      }
      
      private function _05F_(param1:String, param2:Class = null) : _1a9
      {
         return new _J_S_(this._A_A_,this._0gL_,param1,param2);
      }
      
      private function _11K_(param1:String, param2:Class = null) : _1a9
      {
         return this._1W_g[param1 + param2];
      }
   }
}
