package _1O_R_
{
   import flash.events.Event;
   
   public class _0I_z extends _09N_
   {
       
      
      public function _0I_z(param1:String, param2:String = "Debug")
      {
         super(param2,param1,"OK",null,null);
         addEventListener(Dialog.LEFT_BUTTON,this.onDialogComplete);
      }
      
      private function onDialogComplete(param1:Event) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
