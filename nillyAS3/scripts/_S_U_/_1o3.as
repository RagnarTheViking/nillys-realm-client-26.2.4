package _S_U_
{
   import _0pN_._114;
   
   public class _1o3
   {
       
      
      [Inject]
      public var startup:_S_U_._1yd;
      
      [Inject]
      public var _0rU_:_114;
      
      public function _1o3()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0rU_.add(this.startup);
         this.startup.start();
      }
   }
}
