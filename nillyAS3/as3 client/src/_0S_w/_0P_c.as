package _0S_w
{
   import Frames.Frame;
   import Frames.TextInput;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class _0P_c extends Frame
   {
       
      
      public var _g5:TextInput;
      
      public function _0P_c(param1:String)
      {
         super("Tile properties","Cancel","Save",null);
         this._g5 = new TextInput("Object Name",false);
         if(param1 != null)
         {
            this._g5.inputText_.text = param1;
         }
         _O_n(this._g5);
         cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         actionButton.addEventListener(MouseEvent.CLICK,this._11L_);
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function _11L_(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
