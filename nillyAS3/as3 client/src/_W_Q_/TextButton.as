package _W_Q_
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.filters.DropShadowFilter;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _1xa._dU_;
   import flash.utils.getTimer;
   import com.company.util.MoreColorUtil;
   import _ll.SFX;
   
   public class TextButton extends Sprite
   {
      
      protected static const _0U_V_:ColorTransform = new ColorTransform(1,220 / 255,133 / 255);
      
      private static const _U_N_:DropShadowFilter = new DropShadowFilter(0,0,0,0.5,12,12);
       
      
      public const clicked:Signal = new Signal();
      
      public const textField:SimpleText = _092();
      
      public const _my:Signal = textField.textChanged;
      
      private var colorTransform:ColorTransform;
      
      private var size:int;
      
      private var _g1:Boolean;
      
      private var _0jJ_:Number;
      
      private var _0X_T_:Number;
      
      private var active:Boolean;
      
      private var color:uint = 16777215;
      
      private var _bZ_:uint;
      
      public function TextButton(param1:String, param2:int, param3:Boolean)
      {
         super();
         this.size = param2;
         this._g1 = param3;
         this.textField.setSize(param2).setColor(16777215).setBold(true);
         this._1nb(param1);
         this._0jJ_ = width;
         this._0X_T_ = height;
         this.activate();
      }
      
      public function activate() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.CLICK,this._0cy);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.active = true;
         this._Q_T_(null);
      }
      
      public function deactivate(param1:uint = 3552822) : void
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.color = param1;
         this._Q_T_(_loc2_);
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         removeEventListener(MouseEvent.CLICK,this._0cy);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.active = false;
      }
      
      public function setColor(param1:uint) : void
      {
         this.color = param1;
         var _loc2_:uint = (param1 & 16711680) >> 16;
         var _loc3_:uint = (param1 & 65280) >> 8;
         var _loc4_:uint = param1 & 255;
         var _loc5_:ColorTransform = new ColorTransform(_loc2_ / 255,_loc3_ / 255,_loc4_ / 255);
         this._Q_T_(_loc5_);
      }
      
      public function isActive() : Boolean
      {
         return this.active;
      }
      
      private function _092() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText();
         _loc1_.filters = [_U_N_];
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _1nb(param1:String) : void
      {
         name = param1;
         this.textField.setStringBuilder(new _dU_().setParams(param1));
      }
      
      public function setAutoSize(param1:String) : void
      {
         this.textField.setAutoSize(param1);
      }
      
      public function setVerticalAlign(param1:String) : void
      {
         this.textField.setVerticalAlign(param1);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(this._g1)
         {
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         if(this._g1)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         _loc2_ = 1.05 + 0.05 * Math.sin(getTimer() / 200);
         this.textField.scaleX = _loc2_;
         this.textField.scaleY = _loc2_;
      }
      
      public function _Q_T_(param1:ColorTransform) : void
      {
         if(param1 == this.colorTransform)
         {
            return;
         }
         this.colorTransform = param1;
         if(this.colorTransform == null)
         {
            this.textField.transform.colorTransform = MoreColorUtil.identity;
         }
         else
         {
            this.textField.transform.colorTransform = this.colorTransform;
         }
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this._Q_T_(_0U_V_);
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         if(this.color != 16777215)
         {
            this.setColor(this.color);
         }
         else
         {
            this._Q_T_(null);
         }
      }
      
      protected function _0cy(param1:MouseEvent) : void
      {
         SFX.play("button_click");
         this.clicked.dispatch();
      }
      
      override public function toString() : String
      {
         return "[TitleMenuOption " + this.textField._1g8() + "]";
      }
   }
}
