package _1iu
{
   import _1__8._01s;
   import _1__8._1Q_O_;
   import flash.display.DisplayObjectContainer;
   import _1__8._19A_;
   import _0wG_.instanceOf;
   import flash.events.Event;
   import _I_w._0S_m;
   
   public class _0hf implements _01s
   {
       
      
      private const _0yi:String = _0S_m.create(_0hf);
      
      private var _0S_Z_:_1Q_O_;
      
      private var _H_J_:DisplayObjectContainer;
      
      private var _1aY_:_19A_;
      
      public function _0hf()
      {
         super();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         this._0S_Z_ = param1;
         this._1aY_ = param1._A_9(this);
         this._0S_Z_._09l(instanceOf(DisplayObjectContainer),this._10O_);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _10O_(param1:DisplayObjectContainer) : void
      {
         if(this._H_J_)
         {
            this._1aY_._0G_b("A contextView has already been set, ignoring {0}",[param1]);
            return;
         }
         this._H_J_ = param1;
         if(this._H_J_.stage)
         {
            this._V_H_();
         }
         else
         {
            this._1aY_.debug("Context view is not yet on stage. Waiting...");
            this._H_J_.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this._H_J_.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this._V_H_();
      }
      
      private function _V_H_() : void
      {
         this._1aY_.debug("Context view is now on stage. Initializing context...");
         this._0S_Z_._1za.initialize();
         this._H_J_.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._1aY_.debug("Context view has left the stage. Destroying context...");
         this._H_J_.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._0S_Z_._1za.destroy();
      }
   }
}
