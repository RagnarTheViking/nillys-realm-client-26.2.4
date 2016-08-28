package PrivateMessages
{
   import Frames.TextInput;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import com.company.ui._0H_R_;
   import flash.events.MouseEvent;
   import flash.events.FocusEvent;
   
   public class BetterTextInput extends TextInput
   {
       
      
      private var textFieldWidth:int;
      
      private var textFieldHeight:int;
      
      private var over:Boolean;
      
      private var focused:Boolean;
      
      public function BetterTextInput(param1:String, param2:int = 238, param3:int = 30)
      {
         this.textFieldWidth = param2;
         this.textFieldHeight = param3;
         super(param1,false);
         this.inputText_.multiline = true;
         this.inputText_.wordWrap = true;
         this.inputText_.updateMetrics();
         this.inputText_.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.inputText_.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.inputText_.addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this.inputText_.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
      }
      
      override protected function draw() : void
      {
         graphics.lineStyle(1,this.over || this.focused?uint(16777215):uint(10263708),1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         graphics.beginFill(0,1);
         graphics.drawRect(0,this.inputText_.y,this.textFieldWidth,this.textFieldHeight);
         graphics.endFill();
         graphics.lineStyle();
      }
      
      override protected function createInputText() : _0H_R_
      {
         return new _0H_R_(20,16777215,true,this.textFieldWidth,this.textFieldHeight);
      }
      
      override public function getHeight() : int
      {
         return this.textFieldHeight + 50;
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         this.over = true;
         this.draw();
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         this.over = false;
         this.draw();
      }
      
      private function onFocusIn(param1:FocusEvent) : void
      {
         this.focused = true;
         this.draw();
      }
      
      private function onFocusOut(param1:FocusEvent) : void
      {
         this.focused = false;
         this.draw();
      }
   }
}
