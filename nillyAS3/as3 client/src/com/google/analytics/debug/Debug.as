package com.google.analytics.debug
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class Debug extends Label
   {
      
      public static var count:uint;
       
      
      private var _lines:Array;
      
      private var _preferredForcedWidth:uint = 540;
      
      private var _linediff:int = 0;
      
      public var maxLines:uint = 16;
      
      public function Debug(param1:uint = 0, param2:Align = null, param3:Boolean = false)
      {
         if(param2 == null)
         {
            param2 = Align.bottom;
         }
         super("","uiLabel",param1,param2,param3);
         this.name = "Debug" + count++;
         this._lines = [];
         selectable = true;
         addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
      }
      
      public function writeBold(param1:String) : void
      {
         this.write(param1,true);
      }
      
      private function _getLinesToDisplay(param1:int = 0) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         if(this._lines.length - 1 > this.maxLines)
         {
            if(this._linediff <= 0)
            {
               this._linediff = this._linediff + param1;
            }
            else if(this._linediff > 0 && param1 < 0)
            {
               this._linediff = this._linediff + param1;
            }
            _loc3_ = this._lines.length - this.maxLines + this._linediff;
            _loc4_ = _loc3_ + this.maxLines;
            _loc2_ = this._lines.slice(_loc3_,_loc4_);
         }
         else
         {
            _loc2_ = this._lines;
         }
         return _loc2_;
      }
      
      private function onKey(param1:KeyboardEvent = null) : void
      {
         var _loc2_:Array = null;
         switch(param1.keyCode)
         {
            case Keyboard.DOWN:
               _loc2_ = this._getLinesToDisplay(1);
               break;
            case Keyboard.UP:
               _loc2_ = this._getLinesToDisplay(-1);
               break;
            default:
               _loc2_ = null;
         }
         if(_loc2_ == null)
         {
            return;
         }
         text = _loc2_.join("\n");
      }
      
      override public function get forcedWidth() : uint
      {
         if(this.parent)
         {
            if(UISprite(this.parent).forcedWidth > this._preferredForcedWidth)
            {
               return this._preferredForcedWidth;
            }
            return UISprite(this.parent).forcedWidth;
         }
         return super.forcedWidth;
      }
      
      public function write(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc6_:int = 0;
         if(param1.indexOf("") > -1)
         {
            _loc3_ = param1.split("\n");
         }
         else
         {
            _loc3_ = [param1];
         }
         var _loc4_:* = "";
         var _loc5_:* = "";
         if(param2)
         {
            _loc4_ = "<b>";
            _loc5_ = "</b>";
         }
         while(_loc6_ < _loc3_.length)
         {
            this._lines.push(_loc4_ + _loc3_[_loc6_] + _loc5_);
            _loc6_++;
         }
         var _loc7_:Array = this._getLinesToDisplay();
         text = _loc7_.join("\n");
      }
      
      public function close() : void
      {
         this.dispose();
      }
      
      override protected function dispose() : void
      {
         removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         super.dispose();
      }
   }
}
