package _td
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.events.Event;
   import _1xa.SText;
   import com.company.util.Keys;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import _1xa._1eo;
   import flash.events.KeyboardEvent;
   import flash.utils.getTimer;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   
   public class KeyCodeBox extends Sprite
   {
      
      public static const WIDTH:int = 80;
      
      public static const HEIGHT:int = 32;
       
      
      public var _1O_x:uint;
      
      public var selected_:Boolean;
      
      public var _1yP_:Boolean;
      
      private var _I_X_:SimpleText = null;
      
      public function KeyCodeBox(param1:uint)
      {
         super();
         this._1O_x = param1;
         this.selected_ = false;
         this._1yP_ = false;
         this._I_X_ = new SimpleText().setSize(16).setColor(16777215);
         this._I_X_.setBold(true);
         this._I_X_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this._I_X_.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         addChild(this._I_X_);
         this._1W_A_();
         this._0N_C_();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      public function value() : uint
      {
         return this._1O_x;
      }
      
      public function _E_8(param1:uint) : void
      {
         if(param1 == this._1O_x)
         {
            return;
         }
         this._1O_x = param1;
         this._1W_j();
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      public function _1W_j() : void
      {
         this._0D_S_(new SText(Keys._0L_[this._1O_x]));
      }
      
      private function _1W_A_() : void
      {
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         _loc1_.lineStyle(2,this.selected_ || this._1yP_?uint(11776947):uint(4473924));
         _loc1_.beginFill(3355443);
         _loc1_.drawRect(0,0,WIDTH,HEIGHT);
         _loc1_.endFill();
         _loc1_.lineStyle();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.selected_ = true;
         this._1W_A_();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.selected_ = false;
         this._1W_A_();
      }
      
      private function _0D_S_(param1:_1eo) : void
      {
         this._I_X_.setStringBuilder(param1);
         this._I_X_.x = WIDTH / 2;
         this._I_X_.y = HEIGHT / 2;
         this._1W_A_();
      }
      
      private function _0N_C_() : void
      {
         this._1yP_ = false;
         removeEventListener(Event.ENTER_FRAME,this._1ak);
         if(stage != null)
         {
            removeEventListener(KeyboardEvent.KEY_DOWN,this._3Z_);
            stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._0H_X_,true);
         }
         this._1W_j();
         addEventListener(MouseEvent.CLICK,this._5b);
      }
      
      private function _B_D_() : void
      {
         if(stage == null)
         {
            return;
         }
         stage.stageFocusRect = false;
         stage.focus = this;
         this._1yP_ = true;
         removeEventListener(MouseEvent.CLICK,this._5b);
         addEventListener(Event.ENTER_FRAME,this._1ak);
         addEventListener(KeyboardEvent.KEY_DOWN,this._3Z_);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._0H_X_,true);
      }
      
      private function _5b(param1:MouseEvent) : void
      {
         this._B_D_();
      }
      
      private function _1ak(param1:Event) : void
      {
         var _loc2_:int = getTimer() / 400;
         var _loc3_:* = _loc2_ % 2 == 0;
         if(_loc3_)
         {
            this._0D_S_(new SText(""));
         }
         else
         {
            this._0D_S_(new _dU_().setParams(_1O_I_._S_1));
         }
      }
      
      private function _3Z_(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
         this._1O_x = param1.keyCode;
         this._0N_C_();
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      private function _0H_X_(param1:MouseEvent) : void
      {
         this._0N_C_();
      }
   }
}
