package Queue
{
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextField;
   import flash.events.Event;
   import Packets.Server.QueuePing;
   import flash.text.TextFieldAutoSize;
   
   public class QueuePosition extends Sprite
   {
      
      private static const msgFormat:TextFormat = defaultTextFormat();
       
      
      private const textPrefix:String = "Queue Position: ";
      
      protected var msg_:TextField;
      
      public function QueuePosition(param1:int, param2:int)
      {
         super();
         mouseEnabled = false;
         doubleClickEnabled = false;
         mouseChildren = false;
         this.msg_ = new TextField();
         this.msg_.defaultTextFormat = msgFormat;
         this.msg_.autoSize = TextFieldAutoSize.LEFT;
         this.msg_.text = this.textPrefix + param1 + "/" + param2;
         addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.destroy,false,0,true);
      }
      
      private static function defaultTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = 16754688;
         _loc1_.size = 14;
         _loc1_.bold = true;
         _loc1_.font = "Myriad Pr";
         return _loc1_;
      }
      
      private function init(param1:Event) : void
      {
         addChild(this.msg_);
         parent.addEventListener(QueueEvent.UPDATE_POSITION,this.update);
      }
      
      private function destroy(param1:Event) : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         parent.removeEventListener(QueueEvent.UPDATE_POSITION,this.update);
      }
      
      private function update(param1:QueueEvent) : void
      {
         var _loc2_:QueuePing = param1.result as QueuePing;
         this.msg_.text = this.textPrefix + _loc2_.position_ + "/" + _loc2_.count_;
      }
   }
}
