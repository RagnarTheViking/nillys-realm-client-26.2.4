package _09j
{
   import flash.display.DisplayObject;
   import _f7.Signal;
   import flash.events.Event;
   
   public class _F_J_
   {
       
      
      private var target:DisplayObject;
      
      private var _0Q_7:Signal;
      
      private var _S_Q_:Signal;
      
      public function _F_J_(param1:DisplayObject)
      {
         super();
         this.target = param1;
         param1.addEventListener(Event.ADDED_TO_STAGE,this._0ft);
      }
      
      private function _0ft(param1:Event) : void
      {
         this.target.removeEventListener(Event.ADDED_TO_STAGE,this._0ft);
         this.target.addEventListener(Event.REMOVED_FROM_STAGE,this._l1);
         this._0Q_7 && this._0Q_7.dispatch();
      }
      
      private function _l1(param1:Event) : void
      {
         this.target.addEventListener(Event.ADDED_TO_STAGE,this._0ft);
         this.target.removeEventListener(Event.REMOVED_FROM_STAGE,this._l1);
         this._S_Q_ && this._S_Q_.dispatch();
      }
      
      public function get _192() : Signal
      {
         return this._0Q_7 = this._0Q_7 || new Signal();
      }
      
      public function get _14X_() : Signal
      {
         return this._S_Q_ = this._S_Q_ || new Signal();
      }
   }
}
