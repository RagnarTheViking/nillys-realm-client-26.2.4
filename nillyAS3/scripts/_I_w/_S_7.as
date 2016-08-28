package _I_w
{
   import _1__8._0dX_;
   import _1__8._19A_;
   
   public class _S_7 implements _0dX_
   {
       
      
      private const _jh:Vector.<_0dX_> = new Vector.<_0dX_>();
      
      private var _1J_6:uint = 16;
      
      public function _S_7()
      {
         super();
      }
      
      public function get _1dX_() : uint
      {
         return this._1J_6;
      }
      
      public function set _1dX_(param1:uint) : void
      {
         this._1J_6 = param1;
      }
      
      public function _A_9(param1:Object) : _19A_
      {
         return new _1L_h(param1,this);
      }
      
      public function _1T_1(param1:_0dX_) : void
      {
         this._jh.push(param1);
      }
      
      public function log(param1:Object, param2:uint, param3:int, param4:String, param5:Array = null) : void
      {
         var _loc6_:_0dX_ = null;
         if(param2 > this._1J_6)
         {
            return;
         }
         for each(_loc6_ in this._jh)
         {
            _loc6_.log(param1,param2,param3,param4,param5);
         }
      }
   }
}
