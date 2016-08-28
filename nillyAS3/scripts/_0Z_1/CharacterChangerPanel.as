package _0Z_1
{
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import _C_._1O_I_;
   
   public class CharacterChangerPanel extends _0eJ_
   {
       
      
      public function CharacterChangerPanel(param1:GameSprite)
      {
         super(param1,_1O_I_._0V_p,_1O_I_._0T_H_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      override protected function onButtonClick(param1:MouseEvent) : void
      {
         gs_.closed.dispatch();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            gs_.closed.dispatch();
         }
      }
   }
}
