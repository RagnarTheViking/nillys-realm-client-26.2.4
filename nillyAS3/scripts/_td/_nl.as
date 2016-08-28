package _td
{
   import flash.display.Sprite;
   import _f7.Signal;
   
   public class _nl extends Sprite
   {
       
      
      public var textChanged:Signal;
      
      public function _nl()
      {
         this.textChanged = new Signal();
         super();
      }
   }
}
