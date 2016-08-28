package PrivateMessages
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import Frames.FancyButton.FancyButton;
   import com.company.assembleegameclient.ui.ScrollBar;
   import flash.display.Shape;
   import flash.events.Event;
   import Frames.XButton;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import Frames.FancyButton.GoldenButtonDesign;
   
   public class ViewPrivateMessagesFrame extends Sprite
   {
       
      
      private var gs:GameSpriteBase;
      
      private var sendNewMessageButton:FancyButton;
      
      private var scrollBar:ScrollBar;
      
      private var messages:Array;
      
      private var readMessageFrame:PrivateMessages.ReadPrivateMessageFrame;
      
      private var entryHolder:Sprite;
      
      private var entryHolderMask:Shape;
      
      public function ViewPrivateMessagesFrame(param1:GameSpriteBase, param2:Array)
      {
         var _loc3_:XButton = null;
         super();
         this.gs = param1;
         this.messages = param2;
         this.gs.mui_.setEnablePlayerInput(false);
         graphics.beginFill(16777215,1);
         graphics.drawRect(0,0,800,30);
         graphics.endFill();
         addChild(new SimpleText().setSize(20).setAutoSize(TextFieldAutoSize.CENTER).setColor(0).setBold(true).setPosition(0,5).setTextWidth(800).setHTML(true).setStringBuilder(new SText("PRIVATE MESSAGES")));
         graphics.beginFill(10066329,1);
         graphics.drawRect(0,30,800,45);
         graphics.endFill();
         addChild(new SimpleText().setSize(20).setAutoSize(TextFieldAutoSize.LEFT).setColor(0).setBold(true).setPosition(0,40).setTextWidth(800).setHTML(true).setStringBuilder(new SText("My Messages")));
         this.sendNewMessageButton = new FancyButton("SEND NEW MESSAGE",20,new GoldenButtonDesign());
         this.sendNewMessageButton.changed.add(this.alignButton);
         this.sendNewMessageButton.clicked.add(this.sendMessage);
         addChild(this.sendNewMessageButton);
         graphics.beginFill(0,1);
         graphics.drawRect(0,75,800,525);
         graphics.endFill();
         _loc3_ = new XButton(30);
         _loc3_.x = 800 - 30;
         _loc3_.clicked.add(this.closeDialog);
         addChild(_loc3_);
         this.scrollBar = new ScrollBar(16,515);
         this.scrollBar.x = 778;
         this.scrollBar.y = 80;
         this.scrollBar.addEventListener(Event.CHANGE,this.onScroll);
         addChild(this.scrollBar);
         this.addMessages();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function addMessages() : void
      {
         var _loc1_:MessageEntry = null;
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         if(this.entryHolder)
         {
            removeChild(this.entryHolder);
            removeChild(this.entryHolderMask);
         }
         this.entryHolder = new Sprite();
         this.entryHolderMask = new Shape();
         this.entryHolder.mask = this.entryHolderMask;
         this.entryHolder.y = 80;
         this.entryHolderMask.y = 75;
         this.entryHolderMask.graphics.beginFill(0);
         this.entryHolderMask.graphics.drawRect(0,0,800,525);
         this.entryHolderMask.graphics.endFill();
         addChild(this.entryHolder);
         addChild(this.entryHolderMask);
         _loc3_ = 0;
         for each(_loc2_ in this.messages)
         {
            _loc1_ = new MessageEntry(_loc2_);
            _loc1_.x = 5;
            _loc1_.y = _loc3_;
            _loc1_.deleted.add(this.deleteMessage);
            _loc1_.readMessage.add(this.readMessage);
            this.entryHolder.addChild(_loc1_);
            _loc3_ = _loc3_ + 55;
         }
         this.scrollBar._0jj(515,this.entryHolder.height);
      }
      
      private function readMessage(param1:MessageEntry, param2:Object) : void
      {
         if(this.readMessageFrame && contains(this.readMessageFrame))
         {
            removeChild(this.readMessageFrame);
         }
         this.readMessageFrame = new PrivateMessages.ReadPrivateMessageFrame(param1,param2);
         this.readMessageFrame.deleteMessage.add(this.deleteFromReadMessage);
         this.readMessageFrame.respond.add(this.sendMessage);
         addChild(this.readMessageFrame);
      }
      
      private function deleteFromReadMessage(param1:MessageEntry) : void
      {
         param1.deleteMessage();
      }
      
      private function deleteMessage(param1:Object) : void
      {
         this.messages.splice(this.messages.indexOf(param1),1);
         this.addMessages();
      }
      
      private function onScroll(param1:Event) : void
      {
         if(isNaN(this.scrollBar._zH_()))
         {
            return;
         }
         this.entryHolder.y = 80 + -this.scrollBar._zH_() * (this.entryHolder.height - 515);
      }
      
      private function alignButton(param1:FancyButton) : void
      {
         param1.x = 800 - (param1.width + 10);
         param1.y = 35;
      }
      
      private function sendMessage(param1:String = "", param2:String = "", param3:String = "") : void
      {
         parent.removeChild(this);
         this.gs.addChild(new SendMessageFrame(this.gs,param1,param2,param3));
      }
      
      private function closeDialog() : void
      {
         parent.removeChild(this);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.gs.mui_.setEnablePlayerInput(true);
      }
   }
}
