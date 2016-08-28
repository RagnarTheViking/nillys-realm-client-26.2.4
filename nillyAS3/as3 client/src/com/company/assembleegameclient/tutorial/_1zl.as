package com.company.assembleegameclient.tutorial
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import flash.geom.Rectangle;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.utils.getTimer;
   import flash.events.Event;
   import com.company.util.GraphicHelper;
   import flash.events.MouseEvent;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import _1xa._dU_;
   
   public class _1zl extends Sprite
   {
      
      public static const BORDER:int = 8;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var tutorial_:com.company.assembleegameclient.tutorial.Tutorial;
      
      private var rect_:Rectangle;
      
      private var _01o:SimpleText;
      
      private var _pN_:Button = null;
      
      private var startTime_:int;
      
      private var _W_F_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      public function _1zl(param1:com.company.assembleegameclient.tutorial.Tutorial, param2:String, param3:Boolean, param4:Rectangle)
      {
         this._W_F_ = new GraphicsSolidFill(3552822,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,new GraphicsSolidFill(16777215));
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._W_F_,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this.tutorial_ = param1;
         this.rect_ = param4.clone();
         x = this.rect_.x;
         y = this.rect_.y;
         this.rect_.x = 0;
         this.rect_.y = 0;
         this._01o = new SimpleText().setSize(15).setColor(16777215).setTextWidth(this.rect_.width - 4 * BORDER);
         this._01o.setStringBuilder(new _dU_().setParams(param2));
         this._01o.x = 2 * BORDER;
         this._01o.y = 2 * BORDER;
         if(param3)
         {
            this._pN_ = new Button(18,"Next");
            this._pN_.addEventListener(MouseEvent.CLICK,this._1Q_);
            this._pN_.x = this.rect_.width - this._pN_.width - 20;
            this._pN_.y = this.rect_.height - this._pN_.height - 10;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function drawRect() : void
      {
         var _loc1_:Number = Math.min(1,0.1 + 0.9 * (getTimer() - this.startTime_) / 200);
         if(_loc1_ == 1)
         {
            addChild(this._01o);
            if(this._pN_ != null)
            {
               addChild(this._pN_);
            }
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         var _loc2_:Rectangle = this.rect_.clone();
         _loc2_.inflate(-(1 - _loc1_) * this.rect_.width / 2,-(1 - _loc1_) * this.rect_.height / 2);
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height,4,[1,1,1,1],this.path_);
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData_);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.startTime_ = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.drawRect();
      }
      
      private function _1Q_(param1:MouseEvent) : void
      {
         this.tutorial_.doneAction(com.company.assembleegameclient.tutorial.Tutorial._B_P_);
      }
   }
}
