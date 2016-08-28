package _Y_8
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.text.TextField;
   import _05L_._05T_;
   import flash.events.KeyboardEvent;
   import flash.text.TextFieldType;
   import flash.filters.GlowFilter;
   import flash.events.Event;
   import flash.ui.Keyboard;
   
   public class _vv extends Sprite
   {
       
      
      public const message:Signal = new Signal(String);
      
      public const close:Signal = new Signal();
      
      private var input:TextField;
      
      private var _1R_7:Boolean;
      
      public function _vv()
      {
         super();
         visible = false;
         this._1R_7 = false;
      }
      
      public function setup(param1:_05T_, param2:TextField) : void
      {
         addChild(this.input = param2);
         param2.width = param1.chat.width - 2;
         param2.height = param1._A_x;
         param2.y = param1.chat.height - param1._A_x;
      }
      
      public function activate(param1:String, param2:Boolean) : void
      {
         this._1R_7 = false;
         if(param1 != null)
         {
            this.input.text = param1;
         }
         var _loc3_:int = !!param1?int(param1.length):0;
         this.input.setSelection(_loc3_,_loc3_);
         if(param2)
         {
            this._0dc();
         }
         else
         {
            this._0dS_();
         }
         visible = true;
      }
      
      public function deactivate() : void
      {
         this._1R_7 = false;
         removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._W_8);
         visible = false;
         stage && (stage.focus = null);
      }
      
      public function _1sI_() : Boolean
      {
         return this._1R_7;
      }
      
      private function _0dc() : void
      {
         this.input.type = TextFieldType.INPUT;
         this.input.border = true;
         this.input.selectable = true;
         this.input.maxChars = 512;
         this.input.borderColor = 16777215;
         this.input.height = 18;
         this.input.filters = [new GlowFilter(0,1,3,3,2,1)];
         addEventListener(KeyboardEvent.KEY_UP,this._C_6);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._W_8);
         stage && (stage.focus = this.input);
      }
      
      private function _W_8(param1:Event) : void
      {
         this._1R_7 = true;
      }
      
      private function _0dS_() : void
      {
         this.input.type = TextFieldType.DYNAMIC;
         this.input.border = false;
         this.input.selectable = false;
         this.input.filters = [new GlowFilter(0,1,3,3,2,1)];
         this.input.height = 18;
         removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._W_8);
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            if(this.input.text != "")
            {
               this.message.dispatch(this.input.text);
            }
            else
            {
               this.close.dispatch();
            }
            param1.stopImmediatePropagation();
         }
      }
   }
}
