package _0nP_
{
   import _P_S_.Command;
   import _0pN_._114;
   import _wi.Injector;
   import _0pN_._eg;
   import _M_6._0qT_;
   import _0pN_._1my;
   
   public class _1C_a extends Command
   {
       
      
      [Inject]
      public var _1B_d:_114;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _Q_2:_0nP_._G_N_;
      
      public function _1C_a()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._T_X_.getInstance(_0qT_));
         _loc1_.add(new _1my(this._Q_2));
         this._1B_d.add(_loc1_);
         _loc1_.start();
      }
   }
}
