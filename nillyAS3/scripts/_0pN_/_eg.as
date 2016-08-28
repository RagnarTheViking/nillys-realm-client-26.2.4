package _0pN_
{
   public class _eg extends _049
   {
       
      
      private var _0S_t:Vector.<_0pN_._1nd>;
      
      private var index:int;
      
      private var _V_a:Boolean;
      
      public function _eg()
      {
         super();
         this._0S_t = new Vector.<_0pN_._1nd>();
      }
      
      public function _02A_() : Boolean
      {
         return this._V_a;
      }
      
      public function _pl(param1:Boolean) : void
      {
         this._V_a = param1;
      }
      
      public function add(param1:_0pN_._1nd) : void
      {
         this._0S_t.push(param1);
      }
      
      override protected function startTask() : void
      {
         this.index = 0;
         this._1g9();
      }
      
      override protected function onReset() : void
      {
         var _loc1_:_0pN_._1nd = null;
         for each(_loc1_ in this._0S_t)
         {
            _loc1_.reset();
         }
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
         return this.index < this._0S_t.length;
      }
      
      private function _1C_T_() : void
      {
         var _loc1_:_0pN_._1nd = this._0S_t[this.index++];
         _loc1_.lastly.addOnce(this._07n);
         _loc1_.start();
      }
      
      private function _07n(param1:_0pN_._1nd, param2:Boolean, param3:String) : void
      {
         if(param2 || this._V_a)
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
