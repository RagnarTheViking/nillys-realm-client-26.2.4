package _1I_2
{
   import flash.events.EventDispatcher;
   import _1J_2._01x;
   import flash.display.DisplayObjectContainer;
   import _1J_2._1O_N_;
   
   public class _1Q_l extends EventDispatcher implements _01x
   {
       
      
      private const _0N_i:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
      
      private const _handlers:Vector.<_1O_N_> = new Vector.<_1O_N_>();
      
      private var _O_4:_1I_2._O_g;
      
      public function _1Q_l(param1:_1I_2._O_g)
      {
         super();
         this._O_4 = param1;
      }
      
      public function get _8e() : Vector.<DisplayObjectContainer>
      {
         return this._0N_i;
      }
      
      public function _rz(param1:DisplayObjectContainer) : void
      {
         var _loc2_:_1O_N_ = null;
         if(!this._13q(param1))
         {
            return;
         }
         this._0N_i.push(param1);
         for each(_loc2_ in this._handlers)
         {
            this._O_4._rz(param1)._1jI_(_loc2_);
         }
         dispatchEvent(new _I_7(_I_7._0S_k,param1));
      }
      
      public function _G_m(param1:DisplayObjectContainer) : void
      {
         var _loc2_:_1O_N_ = null;
         var _loc3_:int = this._0N_i.indexOf(param1);
         if(_loc3_ == -1)
         {
            return;
         }
         this._0N_i.splice(_loc3_,1);
         var _loc4_:_u__ = this._O_4._1W_3(param1);
         for each(_loc2_ in this._handlers)
         {
            _loc4_._1zC_(_loc2_);
         }
         dispatchEvent(new _I_7(_I_7._1G_X_,param1));
      }
      
      public function _kd(param1:_1O_N_) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         if(this._handlers.indexOf(param1) != -1)
         {
            return;
         }
         this._handlers.push(param1);
         for each(_loc2_ in this._0N_i)
         {
            this._O_4._rz(_loc2_)._1jI_(param1);
         }
         dispatchEvent(new _I_7(_I_7._1f7,null,param1));
      }
      
      public function _1__n(param1:_1O_N_) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = this._handlers.indexOf(param1);
         if(_loc3_ == -1)
         {
            return;
         }
         this._handlers.splice(_loc3_,1);
         for each(_loc2_ in this._0N_i)
         {
            this._O_4._1W_3(_loc2_)._1zC_(param1);
         }
         dispatchEvent(new _I_7(_I_7._1pq,null,param1));
      }
      
      public function _2a() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         var _loc2_:_u__ = null;
         var _loc3_:_1O_N_ = null;
         for each(_loc1_ in this._0N_i)
         {
            _loc2_ = this._O_4._1W_3(_loc1_);
            for each(_loc3_ in this._handlers)
            {
               _loc2_._1zC_(_loc3_);
            }
         }
      }
      
      private function _13q(param1:DisplayObjectContainer) : Boolean
      {
         var _loc2_:DisplayObjectContainer = null;
         for each(_loc2_ in this._0N_i)
         {
            if(param1 == _loc2_)
            {
               return false;
            }
            if(_loc2_.contains(param1) || param1.contains(_loc2_))
            {
               throw new Error("Containers can not be nested");
            }
         }
         return true;
      }
   }
}
