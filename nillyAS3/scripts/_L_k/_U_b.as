package _L_k
{
   import _1kz._1a9;
   import _1kz._0gB_;
   import _1Z_i._0ba;
   import _wi.Injector;
   import flash.events.Event;
   
   public class _U_b
   {
       
      
      private var _03L_:_1a9;
      
      private var _A_2:Vector.<_0gB_>;
      
      private var _034:_0ba;
      
      private var _A_A_:Injector;
      
      private var _0tw:Class;
      
      private var _factory:_L_k._0S_P_;
      
      public function _U_b(param1:_1a9, param2:_0ba, param3:Injector, param4:Class)
      {
         super();
         this._03L_ = param1;
         this._034 = param2;
         this._A_A_ = param3._W_9();
         this._0tw = param4;
         this._factory = new _L_k._0S_P_(this._A_A_);
      }
      
      public function execute(param1:Event) : void
      {
         var _loc2_:Class = param1["constructor"] as Class;
         if(this._0I_I_(_loc2_))
         {
            this._1S_g(param1,_loc2_);
         }
      }
      
      private function _0I_I_(param1:Class) : Boolean
      {
         return !this._0tw || param1 == this._0tw;
      }
      
      private function _1u8(param1:Class) : Boolean
      {
         return param1 != Event;
      }
      
      private function _uo(param1:Event, param2:Class) : void
      {
         this._A_A_.map(Event)._1as(param1);
         if(this._1u8(param2))
         {
            this._A_A_.map(this._0tw || param2)._1as(param1);
         }
      }
      
      private function _Y_p(param1:Class) : void
      {
         this._A_A_._1kw(Event);
         if(this._1u8(param1))
         {
            this._A_A_._1kw(this._0tw || param1);
         }
      }
      
      private function _1S_g(param1:Event, param2:Class) : void
      {
         var _loc3_:Object = null;
         var _loc4_:_0gB_ = this._034._1iX_;
         while(_loc4_)
         {
            _loc4_._df();
            this._uo(param1,param2);
            _loc3_ = this._factory.create(_loc4_);
            this._Y_p(param2);
            if(_loc3_)
            {
               this._D_R_(_loc4_);
               _loc3_.execute();
            }
            _loc4_ = _loc4_.next;
         }
      }
      
      private function _D_R_(param1:_0gB_) : void
      {
         if(param1._di)
         {
            this._03L_._rS_(param1);
         }
      }
   }
}
