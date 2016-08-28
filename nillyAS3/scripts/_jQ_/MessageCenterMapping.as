package _jQ_
{
   import _0wP_._H_M_;
   import _wi.Injector;
   import _0wP_._C_Q_;
   
   public class MessageCenterMapping implements _H_M_
   {
       
      
      private const _1x3:NullHandlerProxy = new NullHandlerProxy();
      
      private var id:int;
      
      private var _T_X_:Injector;
      
      private var _199:Class;
      
      private var _1F_G_:int = 1;
      
      private var handler:_C_Q_;
      
      public function MessageCenterMapping()
      {
         this.handler = this._1x3;
         super();
      }
      
      public function setID(param1:int) : _H_M_
      {
         this.id = param1;
         return this;
      }
      
      public function setInjector(param1:Injector) : MessageCenterMapping
      {
         this._T_X_ = param1;
         return this;
      }
      
      public function _is(param1:Class) : _H_M_
      {
         this._199 = param1;
         return this;
      }
      
      public function _W___(param1:Class) : _H_M_
      {
         this.handler = new _1H_t().setType(param1).setInjector(this._T_X_);
         return this;
      }
      
      public function _0qC_(param1:Function) : _H_M_
      {
         this.handler = new _U_f().setMethod(param1);
         return this;
      }
      
      public function _1U_h(param1:int) : _H_M_
      {
         this._1F_G_ = param1;
         return this;
      }
      
      public function _14p() : _1G_I_
      {
         var _loc1_:_1G_I_ = new _1G_I_(this.id,this._199,this.handler.getMethod());
         _loc1_._7e(this._1F_G_);
         return _loc1_;
      }
   }
}

import _0wP_._C_Q_;

class NullHandlerProxy implements _C_Q_
{
    
   
   function NullHandlerProxy()
   {
      super();
   }
   
   public function getMethod() : Function
   {
      return null;
   }
}
