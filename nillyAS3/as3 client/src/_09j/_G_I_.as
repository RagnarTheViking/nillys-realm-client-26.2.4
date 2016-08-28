package _09j
{
   public class _G_I_
   {
      
      private static const _1nA_:Vector.<int> = Vector.<int>([31,-1,31,30,31,30,31,31,30,31,30,31]);
      
      private static const _ba:int = 2;
       
      
      private var _3Q_:int;
      
      public function _G_I_()
      {
         super();
         this._3Q_ = new Date().getFullYear();
      }
      
      public function _X_2(param1:int) : Boolean
      {
         return param1 > 0 && param1 <= 12;
      }
      
      public function _J_k(param1:int, param2:int = -1, param3:int = -1) : Boolean
      {
         return param1 > 0 && param1 <= this._0tX_(param2,param3);
      }
      
      public function _0tX_(param1:int = -1, param2:int = -1) : int
      {
         if(param1 == -1)
         {
            return 31;
         }
         return param1 == _ba?int(this._0U_Q_(param2)):int(_1nA_[param1 - 1]);
      }
      
      private function _0U_Q_(param1:int) : int
      {
         if(param1 == -1 || this._70(param1))
         {
            return 29;
         }
         return 28;
      }
      
      public function _70(param1:int) : Boolean
      {
         var _loc2_:* = param1 % 4 == 0;
         var _loc3_:* = param1 % 100 == 0;
         var _loc4_:* = param1 % 400 == 0;
         return _loc2_ && (!_loc3_ || _loc4_);
      }
      
      public function _1L_A_(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         return this._1qo(param3,param4) && this._X_2(param1) && this._J_k(param2,param1,param3);
      }
      
      public function _1qo(param1:int, param2:int) : Boolean
      {
         return param1 <= this._3Q_ && param1 > this._3Q_ - param2;
      }
   }
}
