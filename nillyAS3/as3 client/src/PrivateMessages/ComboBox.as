package PrivateMessages
{
   import flash.display.Sprite;
   
   public class ComboBox extends Sprite
   {
       
      
      public var textInput:PrivateMessages.BetterTextInput;
      
      private var items:ComboBoxDropdown;
      
      private var collapseButton:ComboBoxCollapseButton;
      
      private var _selectedItem:Object;
      
      public function ComboBox(param1:String, param2:int = 238, param3:int = 30)
      {
         super();
         this.textInput = new PrivateMessages.BetterTextInput(param1,param2,param3);
         addChild(this.textInput);
         this.items = new ComboBoxDropdown();
         this.items.y = 31 + param3;
         addChild(this.items);
         this.collapseButton = new ComboBoxCollapseButton();
         this.collapseButton.x = 345;
         this.collapseButton.y = 30;
         this.collapseButton.clicked.add(this.collapse);
         addChild(this.collapseButton);
      }
      
      private function collapse() : void
      {
         this.items.visible = !this.items.visible;
      }
      
      public function addItem(param1:Object) : void
      {
         var _loc2_:ComboBoxDropdownItem = this.items.addItem(param1);
         _loc2_.selected.add(this.setSelectedItem);
      }
      
      private function setSelectedItem(param1:Object) : void
      {
         this.selectedItem = param1;
      }
      
      public function get selectedItem() : Object
      {
         return this._selectedItem;
      }
      
      public function set selectedItem(param1:Object) : void
      {
         this._selectedItem = param1;
         this.textInput.inputText_.setText(!!param1.hasOwnProperty("displayText")?param1.displayText:param1.toString());
      }
      
      public function text() : String
      {
         return this.textInput.text();
      }
      
      public function value() : Object
      {
         return !!this.selectedItem.hasOwnProperty("value")?this.selectedItem.value:this.selectedItem;
      }
   }
}

import flash.display.Sprite;
import _T_J_.GTween;
import flash.events.FocusEvent;
import flash.geom.Point;

class ComboBoxDropdown extends Sprite
{
    
   
   private var items:Vector.<ComboBoxDropdownItem>;
   
   function ComboBoxDropdown()
   {
      super();
      this.visible = false;
      this.items = new Vector.<ComboBoxDropdownItem>();
      this.draw();
   }
   
   override public function set visible(param1:Boolean) : void
   {
      if(param1)
      {
         height = 0;
         new GTween(this,0.2,{"height":this.items.length * ComboBoxDropdownItem.HEIGHT});
         stage.stageFocusRect = false;
         stage.focus = this;
         addEventListener(FocusEvent.FOCUS_OUT,this.remove);
      }
      else
      {
         removeEventListener(FocusEvent.FOCUS_OUT,this.remove);
      }
      super.visible = param1;
   }
   
   public function addItem(param1:Object) : ComboBoxDropdownItem
   {
      var _loc2_:ComboBoxDropdownItem = null;
      _loc2_ = new ComboBoxDropdownItem(param1,param1 is String?null:param1.displayText);
      _loc2_.y = this.items.length * ComboBoxDropdownItem.HEIGHT;
      addChild(_loc2_);
      this.items.push(_loc2_);
      this.draw();
      return _loc2_;
   }
   
   private function draw() : void
   {
      graphics.clear();
      graphics.beginFill(0);
      graphics.drawRect(0,0,200,this.items.length * ComboBoxDropdownItem.HEIGHT);
      graphics.endFill();
      graphics.lineStyle(1,16777215);
      graphics.drawRect(0,0,200,this.items.length * ComboBoxDropdownItem.HEIGHT);
      graphics.lineStyle();
   }
   
   private function remove(param1:FocusEvent) : void
   {
      if(this.isMouseOver())
      {
         return;
      }
      this.visible = false;
   }
   
   private function isMouseOver() : Boolean
   {
      var _loc1_:Point = localToGlobal(new Point(mouseX,mouseY));
      return hitTestPoint(_loc1_.x,_loc1_.y,true);
   }
}

import flash.display.Sprite;
import _f7.Signal;
import _1gF_.SimpleText;
import flash.events.MouseEvent;
import _1xa.SText;

class ComboBoxDropdownItem extends Sprite
{
   
   public static const HEIGHT:int = 20;
    
   
   public var selected:Signal;
   
   private var displayText:SimpleText;
   
   private var value:Object;
   
   function ComboBoxDropdownItem(param1:Object, param2:String = null)
   {
      super();
      this.value = param1;
      this.displayText = new SimpleText().setSize(16).setColor(16777215).setPosition(5,1).setStringBuilder(new SText(param2 || param1.toString()));
      addChild(this.displayText);
      this.selected = new Signal(Object);
      addEventListener(MouseEvent.CLICK,this.onClick);
      addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
      addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      this.draw(false);
   }
   
   private function draw(param1:Boolean) : void
   {
      graphics.clear();
      graphics.beginFill(!!param1?uint(16777215):uint(0),1);
      graphics.drawRect(0,0,200,HEIGHT);
      graphics.endFill();
      graphics.lineStyle(1,16777215);
      graphics.lineTo(0,HEIGHT);
      graphics.lineStyle();
      this.displayText.setColor(!!param1?uint(0):uint(16777215));
   }
   
   private function onRollOver(param1:MouseEvent) : void
   {
      this.draw(true);
   }
   
   private function onRollOut(param1:MouseEvent) : void
   {
      this.draw(false);
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      this.selected.dispatch(this.value);
      parent.visible = false;
   }
}

import flash.display.Sprite;
import _f7.Signal;
import flash.events.MouseEvent;
import _1S_0.NativeMappedSignal;

class ComboBoxCollapseButton extends Sprite
{
    
   
   public var clicked:Signal;
   
   function ComboBoxCollapseButton()
   {
      super();
      this.draw(false);
      this.clicked = new NativeMappedSignal(this,MouseEvent.CLICK);
      addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
      addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
   }
   
   private function draw(param1:Boolean) : void
   {
      graphics.clear();
      graphics.beginFill(!!param1?uint(16777215):uint(0),1);
      graphics.drawRect(0,0,30,30);
      graphics.endFill();
      graphics.beginFill(!!param1?uint(0):uint(16777215),1);
      graphics.moveTo(5,8);
      graphics.lineTo(25,8);
      graphics.lineTo(5 + 20 / 2,23);
      graphics.lineTo(5,8);
      graphics.endFill();
   }
   
   private function onRollOver(param1:MouseEvent) : void
   {
      this.draw(true);
   }
   
   private function onRollOut(param1:MouseEvent) : void
   {
      this.draw(false);
   }
}
