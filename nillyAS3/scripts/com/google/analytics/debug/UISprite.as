package com.google.analytics.debug
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.display.Stage;
   
   public class UISprite extends Sprite
   {
       
      
      private var _forcedWidth:uint;
      
      public var margin:com.google.analytics.debug.Margin;
      
      protected var alignTarget:DisplayObject;
      
      protected var listenResize:Boolean;
      
      public var alignement:com.google.analytics.debug.Align;
      
      private var _forcedHeight:uint;
      
      public function UISprite(param1:DisplayObject = null)
      {
         super();
         this.listenResize = false;
         this.alignement = com.google.analytics.debug.Align.none;
         this.alignTarget = param1;
         this.margin = new com.google.analytics.debug.Margin();
         addEventListener(Event.ADDED_TO_STAGE,this._onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this._onRemovedFromStage);
      }
      
      public function get forcedHeight() : uint
      {
         if(this._forcedHeight)
         {
            return this._forcedHeight;
         }
         return height;
      }
      
      private function _onAddedToStage(param1:Event) : void
      {
         this.layout();
         this.resize();
      }
      
      protected function dispose() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < numChildren)
         {
            _loc1_ = getChildAt(_loc2_);
            if(_loc1_)
            {
               removeChild(_loc1_);
            }
            _loc2_++;
         }
      }
      
      public function set forcedHeight(param1:uint) : void
      {
         this._forcedHeight = param1;
      }
      
      public function set forcedWidth(param1:uint) : void
      {
         this._forcedWidth = param1;
      }
      
      protected function layout() : void
      {
      }
      
      public function get forcedWidth() : uint
      {
         if(this._forcedWidth)
         {
            return this._forcedWidth;
         }
         return width;
      }
      
      public function alignTo(param1:com.google.analytics.debug.Align, param2:DisplayObject = null) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:UISprite = null;
         if(param2 == null)
         {
            if(parent is Stage)
            {
               param2 = this.stage;
            }
            else
            {
               param2 = parent;
            }
         }
         if(param2 == this.stage)
         {
            if(this.stage == null)
            {
               return;
            }
            this.stage;
            _loc3_ = 600;
            this.stage;
            _loc4_ = 800;
            _loc5_ = 0;
            _loc6_ = 0;
         }
         else
         {
            _loc7_ = param2 as UISprite;
            if(_loc7_.forcedHeight)
            {
               _loc3_ = _loc7_.forcedHeight;
            }
            else
            {
               _loc3_ = _loc7_.height;
            }
            if(_loc7_.forcedWidth)
            {
               _loc4_ = _loc7_.forcedWidth;
            }
            else
            {
               _loc4_ = _loc7_.width;
            }
            _loc5_ = 0;
            _loc6_ = 0;
         }
         switch(param1)
         {
            case com.google.analytics.debug.Align.top:
               x = _loc4_ / 2 - this.forcedWidth / 2;
               y = _loc6_ + this.margin.top;
               break;
            case com.google.analytics.debug.Align.bottom:
               x = _loc4_ / 2 - this.forcedWidth / 2;
               y = _loc6_ + _loc3_ - this.forcedHeight - this.margin.bottom;
               break;
            case com.google.analytics.debug.Align.left:
               x = _loc5_ + this.margin.left;
               y = _loc3_ / 2 - this.forcedHeight / 2;
               break;
            case com.google.analytics.debug.Align.right:
               x = _loc5_ + _loc4_ - this.forcedWidth - this.margin.right;
               y = _loc3_ / 2 - this.forcedHeight / 2;
               break;
            case com.google.analytics.debug.Align.center:
               x = _loc4_ / 2 - this.forcedWidth / 2;
               y = _loc3_ / 2 - this.forcedHeight / 2;
               break;
            case com.google.analytics.debug.Align.topLeft:
               x = _loc5_ + this.margin.left;
               y = _loc6_ + this.margin.top;
               break;
            case com.google.analytics.debug.Align.topRight:
               x = _loc5_ + _loc4_ - this.forcedWidth - this.margin.right;
               y = _loc6_ + this.margin.top;
               break;
            case com.google.analytics.debug.Align.bottomLeft:
               x = _loc5_ + this.margin.left;
               y = _loc6_ + _loc3_ - this.forcedHeight - this.margin.bottom;
               break;
            case com.google.analytics.debug.Align.bottomRight:
               x = _loc5_ + _loc4_ - this.forcedWidth - this.margin.right;
               y = _loc6_ + _loc3_ - this.forcedHeight - this.margin.bottom;
         }
         if(!this.listenResize && param1 != com.google.analytics.debug.Align.none)
         {
            param2.addEventListener(Event.RESIZE,this.onResize,false,0,true);
            this.listenResize = true;
         }
         this.alignement = param1;
         this.alignTarget = param2;
      }
      
      private function _onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this._onAddedToStage);
         removeEventListener(Event.REMOVED_FROM_STAGE,this._onRemovedFromStage);
         this.dispose();
      }
      
      public function resize() : void
      {
         if(this.alignement != com.google.analytics.debug.Align.none)
         {
            this.alignTo(this.alignement,this.alignTarget);
         }
      }
      
      protected function onResize(param1:Event) : void
      {
         this.resize();
      }
   }
}
