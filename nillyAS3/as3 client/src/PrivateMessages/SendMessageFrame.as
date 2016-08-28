package PrivateMessages
{
   import flash.display.Sprite;
   import Frames.TextInput;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.ui.WorkingBar;
   import Frames.FancyButton.FancyButton;
   import mx.utils.StringUtil;
   import _0H_6.GameContext;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _1gF_.SimpleText;
   import Frames.XButton;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import flash.events.Event;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import com.company.assembleegameclient.objects.Player;
   
   public class SendMessageFrame extends Sprite
   {
      
      public static const WIDTH:int = 400;
      
      public static const HEIGHT:int = 475;
      
      public static var instance:PrivateMessages.SendMessageFrame;
       
      
      private var recipientTextInput:PrivateMessages.ComboBox;
      
      private var messageSubjectInput:TextInput;
      
      private var messageTextInput:TextInput;
      
      private var gs:GameSpriteBase;
      
      private var workingBar:WorkingBar;
      
      private var sendButton:FancyButton;
      
      public function SendMessageFrame(param1:GameSpriteBase, param2:String = "", param3:String = "", param4:String = "")
      {
         var _loc5_:XButton = null;
         super();
         instance = this;
         this.gs = param1;
         this.draw();
         addChild(new SimpleText().setSize(20).setAutoSize(TextFieldAutoSize.CENTER).setColor(0).setBold(true).setPosition(0,5).setTextWidth(400).setHTML(true).setStringBuilder(new SText("SEND MESSAGE")));
         _loc5_ = new XButton(30);
         _loc5_.x = 369;
         _loc5_.clicked.add(this.closeDialog);
         addChild(_loc5_);
         this.recipientTextInput = new PrivateMessages.ComboBox("Recipient",340);
         var _loc6_:Player = param1.map.player_;
         this.recipientTextInput.addItem({
            "value":"messageType.support",
            "displayText":"Support"
         });
         if(_loc6_.guildName_)
         {
            this.recipientTextInput.addItem({
               "value":"messageType.guild.value:" + _loc6_.guildName_,
               "displayText":_loc6_.guildName_ + " (Guild)"
            });
         }
         if(_loc6_.admin_)
         {
            this.recipientTextInput.addItem({
               "value":"messageType.announcement",
               "displayText":"Announcement"
            });
         }
         this.recipientTextInput.x = 10;
         this.recipientTextInput.y = 40;
         this.recipientTextInput.textInput.inputText_.multiline = false;
         this.recipientTextInput.textInput.inputText_.setText(param2);
         this.messageSubjectInput = new BetterTextInput("Subject",380);
         this.messageSubjectInput.x = 10;
         this.messageSubjectInput.y = this.recipientTextInput.textInput.getHeight() + this.recipientTextInput.y;
         this.messageSubjectInput.inputText_.maxChars = 36;
         this.messageSubjectInput.inputText_.setText(param3);
         addChild(this.messageSubjectInput);
         this.messageTextInput = new BetterTextInput("Message",380,190);
         this.messageTextInput.x = 10;
         this.messageTextInput.y = this.messageSubjectInput.getHeight() + this.messageSubjectInput.y;
         this.messageTextInput.inputText_.setText(param4);
         addChild(this.messageTextInput);
         this.sendButton = new FancyButton("SEND");
         this.sendButton.x = 300;
         this.sendButton.y = this.messageTextInput.getHeight() + this.messageTextInput.y - 10;
         this.sendButton.changed.add(this.alignButton);
         this.sendButton.clicked.add(this.sendMessage);
         addChild(this.sendButton);
         addChild(this.recipientTextInput);
         this.x = 300 - WIDTH / 2;
         this.y = 300 - HEIGHT / 2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function alignButton(param1:FancyButton) : void
      {
         param1.x = WIDTH - (param1.width + 10);
      }
      
      private function sendMessage() : void
      {
         this.work();
         if(!StringUtil.trim(this.recipientTextInput.value().toString()))
         {
            this.recipientTextInput.textInput.setErrorText("Please specify a name.");
            this.endWork();
            return;
         }
         if(!StringUtil.trim(this.messageSubjectInput.text()))
         {
            this.messageSubjectInput.setErrorText("Please specify a subject.");
            this.endWork();
            return;
         }
         if(!StringUtil.trim(this.messageTextInput.text()))
         {
            this.messageTextInput.setErrorText("Please specify a message.");
            this.endWork();
            return;
         }
         var _loc1_:IWebRequest = GameContext.getInjector().getInstance(IWebRequest);
         _loc1_.complete.addOnce(this.onSendMessageComplete);
         _loc1_.sendRequest("/privateMessage/send",this.getQuery());
      }
      
      private function getQuery() : Object
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         var _loc2_:Object = _loc1_.credentials();
         _loc2_.message = encodeURIComponent(this.messageTextInput.text());
         _loc2_.recipient = encodeURIComponent(this.recipientTextInput.value().toString());
         _loc2_.subject = encodeURIComponent(this.messageSubjectInput.text());
         return _loc2_;
      }
      
      private function onSendMessageComplete(param1:Boolean, param2:*) : void
      {
         var sprite:Sprite = null;
         var message:SimpleText = null;
         var closeBtn:XButton = null;
         var success:Boolean = param1;
         var data:* = param2;
         sprite = new Sprite();
         var title:SimpleText = new SimpleText().setSize(20).setColor(0).setTextWidth(350).setBold(true).setPosition(0,5).setAutoSize(TextFieldAutoSize.CENTER).setStringBuilder(new SText(!!success?"SUCCESS":"ERROR"));
         message = new SimpleText().setSize(16).setColor(16777215).setTextWidth(330).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER).setStringBuilder(new SText(data.toString())).setPosition(10,40);
         closeBtn = new XButton(30);
         closeBtn.clicked.add(function():void
         {
            if(contains(sprite))
            {
               removeChild(sprite);
            }
            endWork();
            if(success)
            {
               closeDialog();
            }
         });
         message.textChanged.add(function():void
         {
            sprite.graphics.beginFill(16777215,1);
            sprite.graphics.drawRect(0,0,350,30);
            sprite.graphics.endFill();
            sprite.graphics.beginFill(0,1);
            sprite.graphics.drawRect(0,30,350,message.height + 20);
            sprite.graphics.endFill();
            sprite.graphics.lineStyle(1,16777215);
            sprite.graphics.drawRect(0,0,350,message.height + 50);
            sprite.graphics.endFill();
            closeBtn.x = 320;
            sprite.x = 200 - sprite.width / 2;
            sprite.y = 200 - sprite.height / 2;
         });
         sprite.addChild(title);
         sprite.addChild(message);
         sprite.addChild(closeBtn);
         addChild(sprite);
      }
      
      private function closeDialog() : void
      {
         parent.removeChild(this);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.gs.mui_.setEnablePlayerInput(false);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.gs.mui_.setEnablePlayerInput(true);
         instance = null;
      }
      
      private function work() : void
      {
         if(this.workingBar && contains(this.workingBar))
         {
            removeChild(this.workingBar);
         }
         this.workingBar = new WorkingBar(WIDTH,43775);
         this.workingBar.y = 30;
         addChild(this.workingBar);
         this.sendButton.setEnabled(false);
      }
      
      private function endWork() : void
      {
         if(this.workingBar && contains(this.workingBar))
         {
            removeChild(this.workingBar);
         }
         this.sendButton.setEnabled(true);
      }
      
      private function draw(param1:uint = 16777215) : *
      {
         graphics.clear();
         graphics.beginFill(16777215,1);
         graphics.drawRect(0,0,WIDTH,30);
         graphics.endFill();
         graphics.beginFill(0,1);
         graphics.drawRect(0,30,WIDTH,HEIGHT - 30);
         graphics.endFill();
         graphics.lineStyle(1,param1);
         graphics.drawRect(0,0,WIDTH,HEIGHT);
         graphics.lineStyle();
      }
      
      public function blink() : void
      {
         var on:Boolean = false;
         var blinker:Timer = new Timer(100,4);
         blinker.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
         {
            on = !on;
            draw(!!on?uint(39423):uint(16777215));
         });
         blinker.start();
      }
   }
}
