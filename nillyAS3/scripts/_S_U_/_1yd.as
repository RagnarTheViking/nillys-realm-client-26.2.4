package _S_U_
{
   import _0pN_._049;
   import _0F_D_._12W_;
   import _wi.Injector;
   import _1__8._19A_;
   import _0Z_4._0s9;
   import _0Z_4._1ms;
   import _0pN_._1nd;
   
   public class _1yd extends _049
   {
      
      public static const _A_K_:int = int.MAX_VALUE;
       
      
      private const list:Vector.<_12W_> = new Vector.<_12W_>(0);
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var index:int = 0;
      
      public function _1yd()
      {
         super();
      }
      
      public function _T_y(param1:Class, param2:int = 0) : void
      {
         var _loc3_:_0s9 = new _0s9();
         _loc3_._T_X_ = this._T_X_;
         _loc3_._0E_x = param1;
         _loc3_.priority = param2;
         this.list.push(_loc3_);
      }
      
      public function _1rF_(param1:Class, param2:int = 0) : void
      {
         var _loc3_:_1ms = new _1ms();
         _loc3_._T_X_ = this._T_X_;
         _loc3_._O_x = param1;
         _loc3_.priority = param2;
         this.list.push(_loc3_);
      }
      
      override protected function startTask() : void
      {
         this.list.sort(this._10j);
         this.index = 0;
         this._1g9();
      }
      
      private function _10j(param1:_12W_, param2:_12W_) : int
      {
         return param1._V_S_() - param2._V_S_();
      }
      
      private function _1g9() : void
      {
         if(this._00P_())
         {
            this._1C_T_();
         }
         else
         {
            _0et(true);
         }
      }
      
      private function _00P_() : Boolean
      {
         return this.index < this.list.length;
      }
      
      private function _1C_T_() : void
      {
         var _loc1_:_1nd = this.list[this.index++].make();
         _loc1_.lastly.addOnce(this._07n);
         this._0G_2.info("StartupSequence start:{0}",[_loc1_]);
         _loc1_.start();
      }
      
      private function _07n(param1:_1nd, param2:Boolean, param3:String) : void
      {
         this._0G_2.info("StartupSequence finish:{0} (isOK: {1})",[param1,param2]);
         if(param2)
         {
            this._1g9();
         }
         else
         {
            _0et(false,param3);
         }
      }
   }
}
