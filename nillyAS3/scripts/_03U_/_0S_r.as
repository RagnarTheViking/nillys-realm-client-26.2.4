package _03U_
{
   import _C_._1xG_;
   
   public class _0S_r implements _03U_._1U_N_
   {
       
      
      [Inject]
      public var _0xZ_:_03U_._1U_N_;
      
      [Inject]
      public var _jk:_03U_._51;
      
      public var _1vD_:Vector.<_1xG_>;
      
      public function _0S_r()
      {
         this._1vD_ = new Vector.<_1xG_>();
         super();
      }
      
      public function _1Z_q(param1:String) : Boolean
      {
         return true;
      }
      
      public function getValue(param1:String) : String
      {
         if(param1 != "" && this._wP_(param1))
         {
            return param1;
         }
         return this._0xZ_.getValue(param1);
      }
      
      private function _wP_(param1:String) : Boolean
      {
         return this._0z0(param1) || this._0qz(param1);
      }
      
      private function _0z0(param1:String) : Boolean
      {
         return !this._0xZ_._1Z_q(param1);
      }
      
      private function _T_4(param1:String) : void
      {
         var _loc2_:String = this._S_u(param1);
         var _loc3_:_1xG_ = new _1xG_();
         _loc3_.key = param1;
         _loc3_._1Z_q = this._0xZ_._1Z_q(param1);
         _loc3_._c__ = _loc2_;
         _loc3_.value = this._0xZ_.getValue(param1);
         this._1vD_.push(_loc3_);
      }
      
      private function _0qz(param1:String) : Boolean
      {
         return this._S_u(param1) != this._jk._lP_();
      }
      
      public function clear() : void
      {
      }
      
      public function setValue(param1:String, param2:String, param3:String) : void
      {
         this._0xZ_.setValue(param1,param2,param3);
      }
      
      public function _S_u(param1:String) : String
      {
         return this._0xZ_._S_u(param1);
      }
   }
}
