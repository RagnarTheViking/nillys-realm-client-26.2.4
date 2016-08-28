package Packets
{
   import flash.display.Sprite;
   import _1xa._dU_;
   import _1gF_.SimpleText;
   import flash.utils.getTimer;
   import flash.events.Event;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   
   public class JitterWatcher extends Sprite
   {
      
      private static const _10T_:_dU_ = new _dU_();
       
      
      private var text_:SimpleText = null;
      
      private var lastTime:int = -1;
      
      private var deltas:Vector.<int>;
      
      private var totalDeltas:int;
      
      public function JitterWatcher()
      {
         this.deltas = new Vector.<int>();
         super();
         this.text_ = new SimpleText().setSize(14).setColor(16777215);
         this.text_.setAutoSize(TextFieldAutoSize.LEFT);
         this.text_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.text_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function record() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = getTimer();
         if(this.lastTime == -1)
         {
            this.lastTime = _loc1_;
            return;
         }
         var _loc2_:int = _loc1_ - this.lastTime;
         this.deltas.push(_loc2_);
         this.totalDeltas = this.totalDeltas + _loc2_;
         if(this.deltas.length > 50)
         {
            _loc3_ = this.deltas.shift();
            this.totalDeltas = this.totalDeltas - _loc3_;
         }
         this.lastTime = _loc1_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.text_.setStringBuilder(_10T_.setParams(_1O_I_._1ne,{"jitter":this.jitter()}));
      }
      
      private function jitter() : Number
      {
         var _loc1_:int = 0;
         var _loc5_:Number = NaN;
         var _loc2_:int = this.deltas.length;
         if(_loc2_ == 0)
         {
            return 0;
         }
         var _loc3_:Number = this.totalDeltas / _loc2_;
         var _loc4_:Number = 0;
         for each(_loc1_ in this.deltas)
         {
            _loc4_ = _loc4_ + (_loc1_ - _loc3_) * (_loc1_ - _loc3_);
         }
         _loc5_ = int(Math.sqrt(_loc4_ / _loc2_) * 100) / 100;
         return _loc5_;
      }
   }
}
