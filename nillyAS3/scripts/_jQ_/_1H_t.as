package _jQ_
{
   import _0wP_._C_Q_;
   import _wi.Injector;
   
   public class _1H_t implements _C_Q_
   {
       
      
      private var _T_X_:Injector;
      
      private var _02j:Class;
      
      private var handler:Object;
      
      public function _1H_t()
      {
         super();
      }
      
      public function setType(param1:Class) : _1H_t
      {
         this._02j = param1;
         return this;
      }
      
      public function setInjector(param1:Injector) : _1H_t
      {
         this._T_X_ = param1;
         return this;
      }
      
      public function getMethod() : Function
      {
         return !!this.handler?this.handler.execute:this._06u();
      }
      
      private function _06u() : Function
      {
         if(!this._02j)
         {
            return null;
         }
         this.handler = this._T_X_.getInstance(this._02j);
         return this.handler.execute;
      }
   }
}
