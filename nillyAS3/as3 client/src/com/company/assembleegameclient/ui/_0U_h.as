package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _1gF_._I_a;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsSolidFill;
   import com.company.util.GraphicHelper;
   import flash.display.GraphicsStroke;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.utils.getTimer;
   import _C_._1O_I_;
   import _1xa._dU_;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import _1gF_.SimpleText;
   
   public class _0U_h extends _uF_
   {
      
      private static const _1kf:int = 2999;
      
      private static const _055:int = 0;
      
      private static const _1Y_H_:int = 1;
      
      private static const _0ok:int = 2;
      
      private static const _G_7:int = 3;
       
      
      public var _hi:Sprite;
      
      public var _0h5:Shape;
      
      public var _1rE_:_I_a;
      
      public var h_:int;
      
      private var _0K_i:int;
      
      private var _1p3:int;
      
      private var _17k:Vector.<IGraphicsData>;
      
      private var outlineGraphicsData_:Vector.<IGraphicsData>;
      
      public function _0U_h(param1:int, param2:int = 0)
      {
         super(param2);
         this._0R_X_();
         this._1p3 = getTimer();
         this._1rE_ = new _I_a();
         this._1rE_.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this._1rE_.setSize(param1).setColor(3552822).setBold(true);
         this._1rE_.setStringBuilder(new _dU_().setParams(_1O_I_._0C_R_));
         w_ = param2 != 0?int(param2):int(this._1rE_.width + 12);
         this.h_ = this._1rE_.height + 8;
         this._1rE_.x = w_ / 2;
         this._1rE_.y = this.h_ / 2;
         GraphicHelper.clearGraphicsPath(path_);
         GraphicHelper.drawUi(0,0,w_,this._1rE_.height + 8,4,[1,1,1,1],path_);
         this._hi = this._0oS_();
         addChild(this._hi);
         addChild(this._1rE_);
         this.draw();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _0R_X_() : void
      {
         var _loc1_:GraphicsSolidFill = new GraphicsSolidFill(12566463,1);
         this._17k = new <IGraphicsData>[_loc1_,path_,GraphicHelper.END_FILL];
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(16777215,1);
         var _loc3_:GraphicsStroke = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,_loc2_);
         this.outlineGraphicsData_ = new <IGraphicsData>[_loc3_,path_,GraphicHelper._1yz];
      }
      
      public function reset() : void
      {
         this._1p3 = getTimer();
         this._0K_i = _055;
         this.setEnabled(false);
         this._0D_S_(_1O_I_._0C_R_);
      }
      
      public function disable() : void
      {
         this._0K_i = _G_7;
         this.setEnabled(false);
         this._0D_S_(_1O_I_._0C_R_);
      }
      
      private function _0D_S_(param1:String) : void
      {
         this._1rE_.setStringBuilder(new _dU_().setParams(param1));
      }
      
      private function setEnabled(param1:Boolean) : void
      {
         if(param1 == mouseEnabled)
         {
            return;
         }
         mouseEnabled = param1;
         mouseChildren = param1;
         graphicsData_[0] = !!param1?_jv:_1xo;
         this.draw();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.reset();
         this.draw();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.draw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         _jv.color = 16768133;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         _jv.color = 16777215;
         this.draw();
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this._0K_i = _0ok;
         this.setEnabled(false);
         this._0D_S_(_1O_I_._N_M_);
      }
      
      private function _0oS_() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.clear();
         _loc3_.graphics.drawGraphicsData(this._17k);
         _loc2_.addChild(_loc3_);
         this._0h5 = new Shape();
         _loc2_.addChild(this._0h5);
         _loc2_.mask = this._0h5;
         _loc1_.addChild(_loc2_);
         var _loc4_:Shape = new Shape();
         _loc4_.graphics.clear();
         _loc4_.graphics.drawGraphicsData(this.outlineGraphicsData_);
         _loc1_.addChild(_loc4_);
         return _loc1_;
      }
      
      private function _dq(param1:Number) : void
      {
         this._0h5.graphics.clear();
         this._0h5.graphics.beginFill(12566463);
         this._0h5.graphics.drawRect(0,0,w_ * param1,this.h_);
         this._0h5.graphics.endFill();
      }
      
      private function draw() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _loc1_ = getTimer();
         if(this._0K_i == _055)
         {
            if(_loc1_ - this._1p3 >= _1kf)
            {
               this._0K_i = _1Y_H_;
               this.setEnabled(true);
            }
         }
         switch(this._0K_i)
         {
            case _055:
               this._hi.visible = true;
               _loc2_ = (_loc1_ - this._1p3) / _1kf;
               this._dq(_loc2_);
               break;
            case _G_7:
            case _1Y_H_:
            case _0ok:
               this._hi.visible = false;
         }
         graphics.clear();
         graphics.drawGraphicsData(graphicsData_);
      }
   }
}
