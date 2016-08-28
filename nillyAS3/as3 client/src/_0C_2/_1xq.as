package _0C_2
{
   import _0pN_._049;
   import _0R_R_._1tP_;
   import _0pN_._114;
   import _0pN_._eg;
   import _0pN_._1nd;
   
   public class _1xq extends _049 implements _1tP_
   {
       
      
      [Inject]
      public var _fc:_0C_2._V_F_;
      
      [Inject]
      public var _K_c:_0C_2._08C_;
      
      [Inject]
      public var _0rU_:_114;
      
      public function _1xq()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._fc);
         _loc1_.add(this._K_c);
         _loc1_.lastly.add(this._8l);
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _8l(param1:_1nd, param2:Boolean, param3:String) : void
      {
         _0et(true);
      }
   }
}
