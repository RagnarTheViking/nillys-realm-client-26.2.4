package com.company.assembleegameclient.screens.charrects
{
   import ToolTips.MyPlayerToolTip;
   import _f7.Signal;
   import com.company.assembleegameclient.appengine._0Z_6;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0E_T_._0ih;
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.Star;
   import com.company.rotmg.graphics.DeleteXGraphic;
   import _1hC_._1fX_;
   
   public class CurrentCharacterRect extends CharacterRect
   {
      
      private static var toolTip_:MyPlayerToolTip = null;
       
      
      public const selected:Signal = new Signal();
      
      public const deleteCharacter:Signal = new Signal();
      
      public const showToolTip:Signal = new Signal(Sprite);
      
      public const hideTooltip:Signal = new Signal();
      
      public var charName:String;
      
      public var charStats:_0Z_6;
      
      public var char:SavedCharacter;
      
      public var myPlayerToolTipFactory:com.company.assembleegameclient.screens.charrects.MyPlayerToolTipFactory;
      
      private var charType:_0ih;
      
      private var deleteButton:Sprite;
      
      private var icon:DisplayObject;
      
      public function CurrentCharacterRect(param1:String, param2:_0ih, param3:SavedCharacter, param4:_0Z_6)
      {
         this.myPlayerToolTipFactory = new com.company.assembleegameclient.screens.charrects.MyPlayerToolTipFactory();
         super();
         this.charName = param1;
         this.charType = param2;
         this.char = param3;
         this.charStats = param4;
         var _loc5_:String = param2.name;
         var _loc6_:int = param3._19p.Level;
         super.className = new _dU_().setParams(_1O_I_._H_r,{
            "className":_loc5_,
            "level":_loc6_
         });
         super.color = 6052956;
         super.overColor = 8355711;
         super.init();
         this.makeTagline();
         this.makeDeleteButton();
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         selectContainer.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.deleteButton.addEventListener(MouseEvent.CLICK,this.onDelete);
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.selected.dispatch(this.char);
      }
      
      private function onDelete(param1:MouseEvent) : void
      {
         this.deleteCharacter.dispatch(this.char);
      }
      
      public function setIcon(param1:DisplayObject) : void
      {
         this.icon && selectContainer.removeChild(this.icon);
         this.icon = param1;
         this.icon.x = CharacterRectConstants.ICON_POS_X;
         this.icon.y = CharacterRectConstants.ICON_POS_Y;
         this.icon && selectContainer.addChild(this.icon);
      }
      
      private function makeTagline() : void
      {
         if(this.getNextStarFame() > 0)
         {
            super.makeTaglineIcon();
            super.makeTaglineText(new _dU_().setParams(_1O_I_._qc,{
               "fame":this.char.fame(),
               "nextStarFame":this.getNextStarFame()
            }));
            taglineText.x = taglineText.x + taglineIcon.width;
         }
      }
      
      private function getNextStarFame() : int
      {
         return Star.nextStarFame(this.charStats == null?0:int(this.charStats._1hK_()),this.char.fame());
      }
      
      private function makeDeleteButton() : void
      {
         this.deleteButton = new DeleteXGraphic();
         this.deleteButton.addEventListener(MouseEvent.MOUSE_DOWN,this.onDeleteDown);
         this.deleteButton.x = WIDTH - 40;
         this.deleteButton.y = (HEIGHT - this.deleteButton.height) * 0.5;
         addChild(this.deleteButton);
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         super.onMouseOver(param1);
         this.removeToolTip();
         toolTip_ = this.myPlayerToolTipFactory.create(this.charName,this.char._19p,this.charStats);
         toolTip_._5R_();
         this.showToolTip.dispatch(toolTip_);
      }
      
      override protected function onRollOut(param1:MouseEvent) : void
      {
         super.onRollOut(param1);
         this.removeToolTip();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.removeToolTip();
      }
      
      private function removeToolTip() : void
      {
         this.hideTooltip.dispatch();
      }
      
      private function onDeleteDown(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         dispatchEvent(new _1fX_(this.char));
      }
   }
}
