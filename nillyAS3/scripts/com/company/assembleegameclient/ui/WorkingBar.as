package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.display.Shape;
   
   public class WorkingBar extends Sprite
   {
       
      
      private var squares:Vector.<Square>;
      
      private var w:int;
      
      private var slowX:int;
      
      private var fastX:int;
      
      private var color:uint;
      
      public function WorkingBar(param1:int = 300, param2:uint = 43775)
      {
         super();
         this.w = param1;
         this.color = param2;
         this.slowX = param1 / 2 - param1 / 2 / 5;
         this.fastX = param1 / 2 + param1 / 2 / 5;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(0,0);
         _loc3_.graphics.drawRect(0,0,param1,6);
         _loc3_.graphics.endFill();
         addChild(_loc3_);
         mask = _loc3_;
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,param1,6);
         graphics.endFill();
         this.addSquares();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function addSquares() : void
      {
         this.squares = new Vector.<WorkingBar>();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.squares.push(new Square(_loc1_,this.color));
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            addChild(this.squares[_loc1_]);
            _loc1_++;
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Square = null;
         for each(_loc2_ in this.squares)
         {
            if(_loc2_.x < 0)
            {
               _loc2_.x = _loc2_.x + this.getSpeed(false);
            }
            else
            {
               if(_loc2_.x + _loc2_.width > this.w)
               {
                  _loc2_.x = 0;
               }
               if(_loc2_.x > this.slowX && _loc2_.x < this.fastX)
               {
                  _loc2_.x = _loc2_.x + this.getSpeed(false);
               }
               else if(_loc2_.x <= this.slowX)
               {
                  _loc2_.x = _loc2_.x + this.getSpeed(true);
               }
               else
               {
                  _loc2_.x = _loc2_.x + this.getSpeed(true);
               }
            }
         }
      }
      
      public function getSpeed(param1:Boolean) : Number
      {
         return !!param1?Number(2 * WebMain.stage_.scaleX):Number(WebMain.stage_.scaleX);
      }
   }
}

import flash.display.Sprite;

class Square extends Sprite
{
    
   
   private var offset:int;
   
   function Square(param1:int, param2:uint)
   {
      super();
      this.offset = param1;
      x = -(param1 * 15);
      y = 2;
      graphics.beginFill(param2,1);
      graphics.drawRect(0,0,4,4);
      graphics.endFill();
   }
}
