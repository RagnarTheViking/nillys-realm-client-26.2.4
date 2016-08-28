package _1R_m
{
   import _03U_._51;
   import _K_r._eo;
   import _wi.Injector;
   import _X_m._r4;
   import _0sm._1P_X_;
   import _0pN_._114;
   import _0pN_._eg;
   import _0pN_._1my;
   
   public class _1F_7
   {
       
      
      [Inject]
      public var language:String;
      
      [Inject]
      public var model:_51;
      
      [Inject]
      public var _1j5:_eo;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _0pM_:_r4;
      
      [Inject]
      public var _0kx:_1R_m._sc;
      
      [Inject]
      public var _12B_:_1P_X_;
      
      [Inject]
      public var _0rU_:_114;
      
      public function _1F_7()
      {
         super();
      }
      
      public function execute() : void
      {
         this.model._03M_(this.language);
         this._1j5.dispatch();
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._0pM_);
         _loc1_.add(new _1my(this._0kx));
         _loc1_.add(new _1my(this._12B_));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
   }
}
