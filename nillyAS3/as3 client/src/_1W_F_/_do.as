package _1W_F_
{
   import flash.errors.IllegalOperationError;
   
   public class _do implements _0U_B_, _0D_s
   {
       
      
      protected const _0rM_:Vector.<Class> = new Vector.<Class>();
      
      protected const _1F_s:Vector.<Class> = new Vector.<Class>();
      
      protected const _0qP_:Vector.<Class> = new Vector.<Class>();
      
      protected var _1N_9:_1W_F_._15u;
      
      public function _do()
      {
         super();
      }
      
      public function allOf(... rest) : _do
      {
         this._0zG_(rest,this._0rM_);
         return this;
      }
      
      public function anyOf(... rest) : _do
      {
         this._0zG_(rest,this._1F_s);
         return this;
      }
      
      public function noneOf(... rest) : _do
      {
         this._0zG_(rest,this._0qP_);
         return this;
      }
      
      public function _qm() : _1W_F_._15u
      {
         return this._1N_9 = this._1N_9 || this._nt();
      }
      
      public function _09T_() : _0D_s
      {
         this._qm();
         return this;
      }
      
      public function clone() : _do
      {
         return new _do().allOf(this._0rM_).anyOf(this._1F_s).noneOf(this._0qP_);
      }
      
      protected function _nt() : _1W_F_._15u
      {
         if(this._0rM_.length == 0 && this._1F_s.length == 0 && this._0qP_.length == 0)
         {
            throw new _182(_182._0L_S_);
         }
         return new _N_6(this._0rM_,this._1F_s,this._0qP_);
      }
      
      protected function _0zG_(param1:Array, param2:Vector.<Class>) : void
      {
         this._1N_9 && this._T_9();
         this._Z_Y_(param1,param2);
      }
      
      protected function _T_9() : void
      {
         throw new IllegalOperationError("This TypeMatcher has been sealed and can no longer be configured");
      }
      
      protected function _Z_Y_(param1:Array, param2:Vector.<Class>) : void
      {
         var _loc3_:Class = null;
         if(param1.length == 1 && (param1[0] is Array || param1[0] is Vector.<Class>))
         {
            for each(_loc3_ in param1[0])
            {
               param2.push(_loc3_);
            }
         }
         else
         {
            for each(_loc3_ in param1)
            {
               param2.push(_loc3_);
            }
         }
      }
   }
}
