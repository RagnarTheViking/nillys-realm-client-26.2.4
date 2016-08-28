package _L_k
{
   import _wi.Injector;
   import _1kz._0gB_;
   import _I_w.guardsApprove;
   import _I_w.applyHooks;
   
   public class _0S_P_
   {
       
      
      private var _A_A_:Injector;
      
      public function _0S_P_(param1:Injector)
      {
         super();
         this._A_A_ = param1;
      }
      
      public function create(param1:_0gB_) : Object
      {
         var _loc2_:Class = null;
         var _loc3_:Object = null;
         if(guardsApprove(param1._P_O_,this._A_A_))
         {
            _loc2_ = param1.commandClass;
            this._A_A_.map(_loc2_).asSingleton();
            _loc3_ = this._A_A_.getInstance(_loc2_);
            applyHooks(param1._1P_S_,this._A_A_);
            this._A_A_._1kw(_loc2_);
            return _loc3_;
         }
         return null;
      }
   }
}
