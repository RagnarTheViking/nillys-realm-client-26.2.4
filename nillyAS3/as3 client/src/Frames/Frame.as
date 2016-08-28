package Frames
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._03S_;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.text.TextFieldAutoSize;
   import _0T_b._09H_;
   import flash.display.DisplayObject;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import flash.events.Event;
   import com.company.util.GraphicHelper;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   public class Frame extends Sprite
   {
      
      private static const _S_W_:Number = 17;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public var _7H_:SimpleText;
      
      public var cancelButton:_03S_;
      
      public var actionButton:_03S_;
      
      public var _10V_:String;
      
      public var _1W_S_:Vector.<Frames.TextInput>;
      
      public var _1xF_:Vector.<_03S_>;
      
      public var w_:int = 288;
      
      public var h_:int = 100;
      
      private var _1ds:GraphicsSolidFill;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path1_:GraphicsPath;
      
      private var path2_:GraphicsPath;
      
      public function Frame(param1:String, param2:String, param3:String, param4:String = "", param5:int = 288)
      {
         this._1W_S_ = new Vector.<Frames.TextInput>();
         this._1xF_ = new Vector.<_03S_>();
         this._1ds = new GraphicsSolidFill(5066061,1);
         this._0O_n = new GraphicsSolidFill(3552822,1);
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path1_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.path2_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0O_n,this.path2_,GraphicHelper.END_FILL,this._1ds,this.path1_,GraphicHelper.END_FILL,this._0pt,this.path2_,GraphicHelper._1yz];
         super();
         this.w_ = param5;
         this._7H_ = new SimpleText().setSize(13).setColor(11776947);
         this._7H_.setStringBuilder(new _dU_().setParams(param1));
         this._7H_.filters = [new DropShadowFilter(0,0,0)];
         this._7H_.x = 5;
         this._7H_.y = 3;
         this._7H_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addChild(this._7H_);
         this._0lj(param2);
         this._0F_o(param3);
         this._10V_ = param4;
         filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function _0lj(param1:String) : void
      {
         this.cancelButton = new _03S_(18,true,param1);
         if(param1 != "")
         {
            this.cancelButton.buttonMode = true;
            this.cancelButton.x = 109;
            addChild(this.cancelButton);
         }
      }
      
      private function _0F_o(param1:String) : void
      {
         this.actionButton = new _03S_(18,true,param1);
         if(param1 != "")
         {
            this.actionButton.buttonMode = true;
            this.actionButton.x = this.w_ - this.actionButton.width - 26;
            this.actionButton.setAutoSize(TextFieldAutoSize.RIGHT);
            addChild(this.actionButton);
         }
      }
      
      public function _1D_0(param1:_09H_) : void
      {
         addChild(param1);
         param1.y = this.h_ - 60;
         param1.x = 17;
         this.h_ = this.h_ + param1.getHeight();
      }
      
      public function _O_n(param1:Frames.TextInput) : void
      {
         this._1W_S_.push(param1);
         addChild(param1);
         param1.y = this.h_ - 60;
         param1.x = 17;
         this.h_ = this.h_ + param1.getHeight();
      }
      
      public function _oP_(param1:_03S_) : void
      {
         this._1xF_.push(param1);
         param1.x = _S_W_;
         addChild(param1);
         this.positionText(param1);
      }
      
      public function _N_2(param1:DisplayObject, param2:int = 8) : void
      {
         addChild(param1);
         param1.y = this.h_ - 66;
         param1.x = param2;
         this.h_ = this.h_ + param1.height;
      }
      
      public function _rt(param1:String, param2:Object = null) : void
      {
         var text:SimpleText = null;
         var position:Function = null;
         var plainText:String = param1;
         var tokens:Object = param2;
         position = function():void
         {
            positionText(text);
            draw();
         };
         text = new SimpleText().setSize(12).setColor(16777215);
         text.setStringBuilder(new _dU_().setParams(plainText,tokens));
         text.filters = [new DropShadowFilter(0,0,0)];
         text.textChanged.add(position);
         addChild(text);
      }
      
      protected function positionText(param1:DisplayObject) : void
      {
         param1.y = this.h_ - 66;
         param1.x = _S_W_;
         this.h_ = this.h_ + 20;
      }
      
      public function _15Z_(param1:String) : void
      {
         var _loc2_:SimpleText = null;
         _loc2_ = new SimpleText().setSize(20).setColor(11711154).setBold(true);
         _loc2_.setStringBuilder(new _dU_().setParams(param1));
         _loc2_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addChild(_loc2_);
         _loc2_.y = this.h_ - 60;
         _loc2_.x = 15;
         this.h_ = this.h_ + 40;
      }
      
      public function _1al(param1:_zu) : void
      {
         addChild(param1);
         param1.y = this.h_ - 66;
         param1.x = _S_W_;
         this.h_ = this.h_ + 44;
      }
      
      public function _N_d(param1:_00x) : void
      {
         addChild(param1);
         param1.y = this.h_ - 66;
         param1.x = 18;
         this.h_ = this.h_ + param1.height;
      }
      
      public function _F_X_(param1:int) : void
      {
         this.h_ = this.h_ + param1;
      }
      
      public function disable() : void
      {
         var _loc1_:_03S_ = null;
         mouseEnabled = false;
         mouseChildren = false;
         for each(_loc1_ in this._1xF_)
         {
            _loc1_._1xQ_(11776947);
         }
         this.cancelButton._1xQ_(11776947);
         this.actionButton._1xQ_(11776947);
      }
      
      public function _0F_M_() : void
      {
         var _loc1_:_03S_ = null;
         mouseEnabled = true;
         mouseChildren = true;
         for each(_loc1_ in this._1xF_)
         {
            _loc1_._1xQ_(16777215);
         }
         this.cancelButton._1xQ_(16777215);
         this.actionButton._1xQ_(16777215);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         this.draw();
         if(this._1W_S_.length > 0)
         {
            stage.focus = this._1W_S_[0].inputText_;
         }
      }
      
      protected function draw() : void
      {
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this.path1_);
         GraphicHelper.drawUi(-6,-6,this.w_,20 + 12,4,[1,1,0,0],this.path1_);
         GraphicHelper.clearGraphicsPath(this.path2_);
         GraphicHelper.drawUi(-6,-6,this.w_,this.h_,4,[1,1,1,1],this.path2_);
         this.cancelButton.y = this.h_ - 52;
         this.actionButton.y = this.h_ - 52;
         graphics.drawGraphicsData(this.graphicsData_);
         x = 800 / 2 - this.w_ / 2;
         y = 600 / 2 - this.h_ / 2;
      }
   }
}
