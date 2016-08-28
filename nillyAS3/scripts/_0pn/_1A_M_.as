package _0pn
{
   import _1y1.BuyPackageTask;
   import _0pN_._114;
   
   public class _1A_M_
   {
       
      
      [Inject]
      public var _1dS_:BuyPackageTask;
      
      [Inject]
      public var _1B_d:_114;
      
      public function _1A_M_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._1B_d.add(this._1dS_);
         this._1dS_.start();
      }
   }
}
