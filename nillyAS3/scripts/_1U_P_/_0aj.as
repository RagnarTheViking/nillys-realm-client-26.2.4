package _1U_P_
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.events.Event;
   
   public class _0aj extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_._eO_;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function _0aj()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._W_Z_(this._1wS_());
         this.view._1H___.add(this._K_B_);
      }
      
      private function _1wS_() : BitmapData
      {
         return ObjectLibrary.getRedrawnTextureFromType(6546,80,true);
      }
      
      private function _K_B_(param1:Event) : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
