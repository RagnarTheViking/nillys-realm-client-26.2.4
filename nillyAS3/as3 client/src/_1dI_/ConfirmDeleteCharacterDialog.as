package _1dI_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class ConfirmDeleteCharacterDialog extends Sprite
   {
       
      
      private const _08u:String = Dialog.LEFT_BUTTON;
      
      private const _0bS_:String = Dialog.RIGHT_BUTTON;
      
      public var deleteCharacter:Signal;
      
      public var cancel:Signal;
      
      public function ConfirmDeleteCharacterDialog()
      {
         super();
         this.deleteCharacter = new Signal();
         this.cancel = new Signal();
      }
      
      public function _0D_S_(param1:String, param2:String) : void
      {
         var _loc3_:Dialog = new Dialog(_1O_I_._mD_,"",_1O_I_._0f2,_1O_I_._07I_,"/deleteDialog");
         _loc3_._1aO_(_1O_I_._0W_q,{
            "name":param1,
            "displayID":param2
         });
         _loc3_.addEventListener(this._08u,this.onCancel);
         _loc3_.addEventListener(this._0bS_,this.onDelete);
         addChild(_loc3_);
      }
      
      private function onCancel(param1:Event) : void
      {
         this.cancel.dispatch();
      }
      
      private function onDelete(param1:Event) : void
      {
         this.deleteCharacter.dispatch();
      }
   }
}
