package _1O___
{
   import _1cV_.Console;
   import _0sm._17m;
   
   public final class _0ms
   {
       
      
      [Inject]
      public var console:Console;
      
      [Inject]
      public var log:_17m;
      
      public function _0ms()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:String = "  " + this.console._1jn().join("\r  ");
         this.log.dispatch(_loc1_);
      }
   }
}
