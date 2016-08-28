package _0pN_
{
   public class _114
   {
       
      
      private var _0S_t:Vector.<_0pN_._1nd>;
      
      public function _114()
      {
         super();
         this._0S_t = new Vector.<_0pN_._1nd>(0);
      }
      
      public function add(param1:_0pN_._1nd) : void
      {
         this._0S_t.push(param1);
         param1._0P_3.addOnce(this._07n);
      }
      
      public function _1O_t(param1:_0pN_._1nd) : Boolean
      {
         return this._0S_t.indexOf(param1) != -1;
      }
      
      private function _07n(param1:_0pN_._1nd, param2:Boolean, param3:String = "") : void
      {
         this._0S_t.splice(this._0S_t.indexOf(param1),1);
      }
   }
}
