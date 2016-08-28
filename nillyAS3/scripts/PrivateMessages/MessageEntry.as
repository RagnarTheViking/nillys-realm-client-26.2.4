package PrivateMessages
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0H_6.GameContext;
   import _4u.Account;
   import Frames.FancyButton.FancyButton;
   import _1xa.SText;
   
   public class MessageEntry extends Sprite
   {
       
      
      public var deleted:Signal;
      
      public var readMessage:Signal;
      
      private var over:Boolean;
      
      private var message:Object;
      
      private var newText:SimpleText;
      
      private var subjectText:SimpleText;
      
      private var senderNameText:SimpleText;
      
      public function MessageEntry(param1:Object)
      {
         var _loc2_:FancyButton = null;
         super();
         this.deleted = new Signal(Object);
         this.message = param1;
         this.readMessage = new Signal(MessageEntry,Object);
         if(!Parameters.data_.privateMessages[param1.receiveTime])
         {
            this.newText = new SimpleText().setSize(20).setBold(true).setColor(16750848).setStringBuilder(new SText("NEW!")).setPosition(5,15);
            addChild(this.newText);
         }
         this.subjectText = new SimpleText().setSize(20).setColor(16777215).setStringBuilder(new SText(param1.subject));
         this.subjectText.textChanged.add(this.alignUI);
         addChild(this.subjectText);
         this.senderNameText = new SimpleText().setSize(16).setColor(16777215).setStringBuilder(new SText("From: " + param1.senderName));
         this.senderNameText.textChanged.add(this.alignUI);
         addChild(this.senderNameText);
         this.draw();
         _loc2_ = new FancyButton("DELETE");
         _loc2_.x = 650;
         _loc2_.y = 8;
         _loc2_.clicked.add(this.deleteMessage);
         addChild(_loc2_);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function refresh() : void
      {
         this.deleted.dispatch(this.message);
      }
      
      private function alignUI() : void
      {
         this.subjectText.x = !!this.newText?Number(this.newText.width + 10):Number(5);
         this.subjectText.y = 5;
         this.senderNameText.x = this.subjectText.x;
         this.senderNameText.y = this.subjectText.height + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.newText && contains(this.newText))
         {
            removeChild(this.newText);
            this.subjectText.x = 5;
            this.senderNameText.x = 5;
         }
         param1.stopImmediatePropagation();
         Parameters.data_.privateMessages[this.message.receiveTime] = true;
         this.readMessage.dispatch(this,this.message);
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(0,1);
         graphics.drawRect(0,0,765,50);
         graphics.endFill();
         graphics.lineStyle(1,!!this.over?uint(7263231):uint(16777215));
         graphics.drawRect(0,0,765,50);
         graphics.lineStyle();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.over = false;
         this.draw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.over = true;
         this.draw();
      }
      
      public function deleteMessage() : void
      {
         Parameters.data_.privateMessages[this.message.receiveTime] = true;
         var _loc1_:WorkingDialog = new WorkingDialog("Deleting message...");
         var _loc2_:Object = GameContext.getInjector().getInstance(Account).credentials();
         _loc2_.time = this.message.receiveTime;
         _loc1_.closed.add(this.refresh);
         parent.parent.addChild(_loc1_);
         _loc1_.sendRequest("/privateMessage/delete",_loc2_);
      }
   }
}

import flash.display.Sprite;
import Frames.FancyButton.FancyButton;
import com.company.assembleegameclient.ui.WorkingBar;
import _1gF_.SimpleText;
import _f7.Signal;
import _0H_6.GameContext;
import _aW_.IWebRequest;
import _1xa.SText;
import flash.text.TextFieldAutoSize;
import _1S_0.NativeMappedSignal;
import flash.events.Event;

class WorkingDialog extends Sprite
{
    
   
   private var closeButton:FancyButton;
   
   private var workingBar:WorkingBar;
   
   private var message:SimpleText;
   
   public var closed:Signal;
   
   function WorkingDialog(param1:String)
   {
      var _loc2_:SimpleText = null;
      super();
      _loc2_ = new SimpleText().setSize(20).setColor(0).setTextWidth(350).setBold(true).setPosition(0,5).setAutoSize(TextFieldAutoSize.CENTER).setStringBuilder(new SText("Soon it\'s okay."));
      this.message = new SimpleText().setSize(16).setColor(16777215).setTextWidth(330).setWordWrap(true).setMultiLine(true).setHTML(true).setPosition(10,40).setStringBuilder(new SText(param1).setPrefix("<p align=\'center\'>").setPostfix("</p>"));
      this.message.textChanged.add(this.draw);
      this.workingBar = new WorkingBar(350);
      this.workingBar.y = 30;
      addChild(this.workingBar);
      addChild(_loc2_);
      addChild(this.message);
      this.closed = new NativeMappedSignal(this,Event.REMOVED_FROM_STAGE);
   }
   
   private function draw(param1:FancyButton = null) : void
   {
      graphics.clear();
      if(param1 && param1.x == 0 && param1.y == 0)
      {
         param1.x = 350 / 2 - param1.width / 2;
         param1.y = height + 5;
      }
      graphics.beginFill(16777215,1);
      graphics.drawRect(0,0,350,30);
      graphics.endFill();
      graphics.beginFill(0,1);
      graphics.drawRect(0,30,350,height - 20);
      graphics.endFill();
      graphics.lineStyle(1,16777215);
      graphics.drawRect(0,0,350,height);
      graphics.endFill();
      if(x == 0)
      {
         x = 400 - width / 2;
      }
      y = 300 - height / 2;
   }
   
   public function sendRequest(param1:String, param2:Object) : void
   {
      var _loc3_:IWebRequest = GameContext.getInjector().getInstance(IWebRequest);
      _loc3_.complete.addOnce(this.onComplete);
      _loc3_.sendRequest(param1,param2);
   }
   
   private function onComplete(param1:Boolean, param2:*) : void
   {
      if(param1)
      {
         if(parent && parent.contains(this))
         {
            parent.removeChild(this);
         }
         return;
      }
      this.message.setStringBuilder(new SText(param2).setPrefix("<p align=\'center\'>").setPostfix("</p>"));
      this.closeButton = new FancyButton("Ok");
      this.closeButton.changed.add(this.draw);
      this.closeButton.clicked.add(this.close);
      addChild(this.closeButton);
      this.workingBar.visible = false;
   }
   
   private function close() : void
   {
      if(parent && parent.contains(this))
      {
         parent.removeChild(this);
      }
   }
}
