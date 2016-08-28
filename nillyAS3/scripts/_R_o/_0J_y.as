package _R_o
{
   import flash.text.TextField;
   import _4g._0zQ_;
   import _09j._F_J_;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.text.TextFieldType;
   
   public final class _0J_y extends TextField implements _0zQ_
   {
      
      public static const HEIGHT:int = 20;
       
      
      private var _1za:_F_J_;
      
      public function _0J_y()
      {
         super();
         background = true;
         backgroundColor = 13056;
         border = true;
         borderColor = 3355443;
         defaultTextFormat = new TextFormat("_sans",14,16777215,true);
         text = "";
         type = TextFieldType.INPUT;
         restrict = "^`";
         this._1za = new _F_J_(this);
         this._1za._192.add(this.onAddedToStage);
         this._1za._14X_.add(this.onRemovedFromStage);
      }
      
      private function onAddedToStage() : void
      {
         addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function onRemovedFromStage() : void
      {
         removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         var _loc2_:String = text;
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               text = "";
               dispatchEvent(new ConsoleEvent(ConsoleEvent.INPUT,_loc2_));
               return;
            case Keyboard.UP:
               dispatchEvent(new ConsoleEvent(ConsoleEvent.GET_PREVIOUS));
               return;
            case Keyboard.DOWN:
               dispatchEvent(new ConsoleEvent(ConsoleEvent.GET_NEXT));
               return;
            default:
               return;
         }
      }
      
      public function resize(param1:Rectangle) : void
      {
         var _loc2_:int = param1.height * 0.5;
         if(_loc2_ > HEIGHT)
         {
            _loc2_ = HEIGHT;
         }
         width = param1.width;
         height = _loc2_;
         x = param1.x;
         y = param1.bottom - height;
      }
   }
}
