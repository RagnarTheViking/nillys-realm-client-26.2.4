package Frames
{
   import _f7.Signal;
   import flash.events.MouseEvent;
   import _C_._1O_I_;
   
   public class NewChooseNameFrame extends Frame
   {
       
      
      public const choose:Signal = new Signal();
      
      public const cancel:Signal = new Signal();
      
      private var name_:Frames.TextInput;
      
      public function NewChooseNameFrame()
      {
         super(_1O_I_._1C_Q_,_1O_I_._0cV_,_1O_I_._0ka,"/newChooseName");
         this.name_ = new Frames.TextInput(_1O_I_._10B_,false);
         this.name_.inputText_.restrict = "A-Za-z";
         var _loc1_:int = 10;
         this.name_.inputText_.maxChars = _loc1_;
         _O_n(this.name_);
         _rt(_1O_I_._0gS_,{"maxChars":_loc1_});
         _rt(_1O_I_._1yG_);
         _rt(_1O_I_._1nT_);
         cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         actionButton.addEventListener(MouseEvent.CLICK,this._E_J_);
      }
      
      private function _E_J_(param1:MouseEvent) : void
      {
         this.choose.dispatch(this.name_.text());
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.cancel.dispatch();
      }
      
      public function _0gM_(param1:String) : void
      {
         this.name_.setErrorText(param1);
      }
   }
}
