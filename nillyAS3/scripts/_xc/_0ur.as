package _xc
{
   import _0R_R_._0oQ_;
   import _0pN_._114;
   import _3b.CloseDialogsSignal;
   import _1__8._19A_;
   import _0pN_._eg;
   import _0pN_._1my;
   
   public class _0ur
   {
       
      
      [Inject]
      public var _0mK_:_0oQ_;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _0ur()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0G_2.debug("execute");
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._0mK_);
         _loc1_.add(new _1my(this._0dR_));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
   }
}
