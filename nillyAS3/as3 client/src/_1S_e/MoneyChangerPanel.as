package _1S_e
{
   import _0Z_1._0eJ_;
   import _f7.Signal;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import _C_._1O_I_;
   
   public class MoneyChangerPanel extends _0eJ_
   {
       
      
      public var _sp:Signal;
      
      public function MoneyChangerPanel(param1:GameSprite)
      {
         super(param1,_1O_I_._O_U_,_1O_I_._13G_);
         this._sp = new Signal();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      override protected function onButtonClick(param1:MouseEvent) : void
      {
         this._sp.dispatch();
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this._sp.dispatch();
         }
      }
   }
}
