package _0mi
{
   import flash.display.DisplayObject;
   
   public class _0C_N_
   {
       
      
      protected var onComplete:Function;
      
      protected var target:DisplayObject;
      
      public function _0C_N_(param1:DisplayObject)
      {
         super();
         this.target = param1;
      }
      
      public function start() : void
      {
      }
      
      public function _B_(param1:Function) : void
      {
         this.onComplete = param1;
      }
   }
}
