package Frames
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import com.company.ui._0H_R_;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import _1xa._dU_;
   import _1xa.SText;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   
   public class TextInput extends Sprite
   {
       
      
      public var nameText_:SimpleText;
      
      public var inputText_:_0H_R_;
      
      public var errorText_:SimpleText;
      
      public function TextInput(param1:String, param2:Boolean)
      {
         super();
         this.nameText_ = new SimpleText().setSize(18).setColor(11776947);
         this.nameText_.setBold(true);
         this.nameText_.setStringBuilder(new _dU_().setParams(param1));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this.inputText_ = this.createInputText();
         this.inputText_.y = 30;
         this.inputText_.x = 6;
         this.inputText_.border = false;
         this.inputText_.displayAsPassword = param2;
         this.inputText_.updateMetrics();
         addChild(this.inputText_);
         this.draw();
         this.inputText_.addEventListener(Event.CHANGE,this.onChange);
         this.errorText_ = new SimpleText().setSize(12).setColor(16549442);
         this.errorText_.y = this.inputText_.y + this.inputText_.height + 2;
         this.errorText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.errorText_);
      }
      
      protected function createInputText() : _0H_R_
      {
         return new _0H_R_(20,11776947,true,238,30);
      }
      
      protected function draw() : void
      {
         graphics.lineStyle(2,4539717,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         graphics.beginFill(3355443,1);
         graphics.drawRect(0,this.inputText_.y,238,30);
         graphics.endFill();
         graphics.lineStyle();
      }
      
      public function text() : String
      {
         return this.inputText_.text;
      }
      
      public function setErrorText(param1:String, param2:Object = null) : void
      {
         this.errorText_.setStringBuilder(new _dU_().setParams(param1,param2));
      }
      
      public function clearErrorText() : void
      {
         this.errorText_.setStringBuilder(new SText(""));
      }
      
      protected function onChange(param1:Event) : void
      {
         this.errorText_.setStringBuilder(new SText(""));
      }
      
      public function getHeight() : int
      {
         return 88;
      }
   }
}
