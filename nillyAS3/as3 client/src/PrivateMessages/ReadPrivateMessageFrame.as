package PrivateMessages
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import Frames.FancyButton.FancyButton;
   import Frames.XButton;
   import com.company.assembleegameclient.ui.ScrollBar;
   import flash.display.Shape;
   import mx.utils.StringUtil;
   import flash.events.Event;
   import com.company.util.DateTimeUtil;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import Frames.FancyButton.RedButtonDesign;
   import Frames.FancyButton.GreenButtonDesign;
   
   public class ReadPrivateMessageFrame extends Sprite
   {
       
      
      public var deleteMessage:Signal;
      
      public var respond:Signal;
      
      private var message:Object;
      
      private var entry:PrivateMessages.MessageEntry;
      
      private var informationText:SimpleText;
      
      private var messageText:SimpleText;
      
      private var deleteButton:FancyButton;
      
      private var respondButton:FancyButton;
      
      private var closeButton:XButton;
      
      private var scrollBar:ScrollBar;
      
      private var messageMask:Shape;
      
      private var messageTextY:int;
      
      public function ReadPrivateMessageFrame(param1:PrivateMessages.MessageEntry, param2:Object)
      {
         super();
         this.entry = param1;
         this.message = param2;
         this.deleteMessage = new Signal(PrivateMessages.MessageEntry);
         this.respond = new Signal(String,String,String);
         var _loc3_:String = param2.subject.length > 20?param2.subject.substring(0,20) + "...":param2.subject;
         addChild(new SimpleText().setSize(20).setAutoSize(TextFieldAutoSize.CENTER).setColor(0).setBold(true).setPosition(0,5).setTextWidth(400).setStringBuilder(new SText(_loc3_.toUpperCase())));
         addChild(this.informationText = new SimpleText().setSize(16).setAutoSize(TextFieldAutoSize.LEFT).setColor(16777215).setPosition(0,35).setTextWidth(400).setStringBuilder(new SText(this.buildInformation())));
         addChild(this.messageText = new SimpleText().setSize(16).setAutoSize(TextFieldAutoSize.LEFT).setMultiLine(true).setWordWrap(true).setColor(16777215).setTextWidth(360).setStringBuilder(new SText(param2.message)));
         this.closeButton = new XButton(30);
         this.closeButton.x = 368;
         this.closeButton.clicked.add(this.close);
         addChild(this.closeButton);
         this.deleteButton = new FancyButton("DELETE",20,new RedButtonDesign());
         this.deleteButton.clicked.add(this.deleteClicked);
         addChild(this.deleteButton);
         this.respondButton = new FancyButton("RESPOND",20,new GreenButtonDesign());
         this.respondButton.changed.add(this.draw);
         this.respondButton.clicked.add(this.respondClicked);
         addChild(this.respondButton);
         this.scrollBar = new ScrollBar(16,230);
         this.scrollBar.addEventListener(Event.CHANGE,this.onScroll);
         addChild(this.scrollBar);
         this.messageMask = new Shape();
         this.messageText.mask = this.messageMask;
         addChild(this.messageMask);
      }
      
      private function deleteClicked() : void
      {
         parent.removeChild(this);
         this.deleteMessage.dispatch(this.entry);
      }
      
      private function respondClicked() : void
      {
         this.respond.dispatch(this.message.senderName,this.message.subject.indexOf("RE: ") == 0?this.message.subject:"RE: " + this.message.subject,this.buildRespondMessage());
      }
      
      private function buildRespondMessage() : String
      {
         return StringUtil.substitute("\n\n-----------------------------------------------------\n" + "Original Message:\n" + "-----------------------------------------------------\n" + "{0}\n" + "-----------------------------------------------------\n" + "{1}\n" + "-----------------------------------------------------",this.buildInformation(),this.message.message);
      }
      
      private function onScroll(param1:Event) : void
      {
         if(isNaN(this.scrollBar._zH_()))
         {
            return;
         }
         var _loc2_:Number = this.messageTextY + -this.scrollBar._zH_() * (this.messageText.height - 230);
         this.messageText.y = _loc2_;
      }
      
      private function close() : void
      {
         parent.removeChild(this);
      }
      
      private function buildInformation() : String
      {
         return StringUtil.substitute("From: {0}\n" + "To: {1}\n" + "Subject: {2}\n" + "Received at: {3}\n",this.message.senderName,this.message.recipientName,this.message.subject,DateTimeUtil.formatUTC(new Date(this.message.receiveTime * 1000)));
      }
      
      private function draw(param1:FancyButton) : void
      {
         graphics.clear();
         graphics.beginFill(16777215,1);
         graphics.drawRect(0,0,400,30);
         graphics.endFill();
         graphics.beginFill(0,1);
         graphics.drawRect(0,30,400,370);
         graphics.endFill();
         graphics.lineStyle(1,16777215);
         graphics.moveTo(0,this.informationText.y + this.informationText.height);
         graphics.lineTo(400,this.informationText.y + this.informationText.height);
         graphics.lineStyle();
         graphics.lineStyle(1,16777215);
         graphics.drawRect(5,this.informationText.y + this.informationText.height + 6,390,240);
         graphics.lineStyle();
         this.messageText.y = this.messageTextY = this.informationText.y + this.informationText.height + 11;
         this.messageText.x = 10;
         this.scrollBar.x = 390 - this.scrollBar.width;
         this.scrollBar.y = this.messageText.y;
         this.scrollBar._0jj(240,this.messageText.height);
         this.messageMask.graphics.beginFill(0,0);
         this.messageMask.graphics.drawRect(0,0,360,240);
         this.messageMask.graphics.endFill();
         this.messageMask.x = 10;
         this.messageMask.y = this.informationText.y + this.informationText.height + 6;
         graphics.lineStyle(1,16777215);
         graphics.drawRect(0,0,400,400);
         graphics.lineStyle();
         this.deleteButton.y = 395 - this.deleteButton.height;
         this.deleteButton.x = 5;
         this.respondButton.y = 395 - this.respondButton.height;
         this.respondButton.x = 395 - this.respondButton.width;
         x = 200;
         y = 100;
      }
   }
}
