package _dM_
{
   import _0R_R_._1Q_g;
   import _0pN_._114;
   import _K_r._01k;
   import _0pN_._M_Y_;
   import _0pN_._1my;
   
   public class _Z_Z_
   {
       
      
      [Inject]
      public var login:_1Q_g;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var refresh:_01k;
      
      public function _Z_Z_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_M_Y_ = new _M_Y_(this.login);
         _loc1_._1hh(new _1my(this.refresh));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
   }
}
