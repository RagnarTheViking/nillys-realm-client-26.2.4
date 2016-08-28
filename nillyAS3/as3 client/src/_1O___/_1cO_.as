package _1O___
{
   import _1cV_.Console;
   import _0sb._1it;
   import _f7.Signal;
   
   public class _1cO_
   {
       
      
      [Inject]
      public var console:Console;
      
      [Inject]
      public var _19E_:_1it;
      
      [Inject]
      public var _fs:Signal;
      
      public function _1cO_()
      {
         super();
      }
      
      public function execute() : void
      {
         this.console.register(this._19E_,this._fs);
      }
   }
}
