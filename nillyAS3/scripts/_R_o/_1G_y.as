package _R_o
{
   import _P_S_.Mediator;
   import flash.display.DisplayObjectContainer;
   import _0sm._1br;
   import flash.events.KeyboardEvent;
   
   public class _1G_y extends Mediator
   {
       
      
      private const _1X_x:uint = 27;
      
      [Inject]
      public var view:DisplayObjectContainer;
      
      [Inject]
      public var _1B_v:_1br;
      
      public function _1G_y()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      override public function destroy() : void
      {
         this.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._1X_x)
         {
            this._1B_v.dispatch();
         }
      }
   }
}
