package ToolTips
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import _05g._1S_m;
   import flash.display.DisplayObject;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.company.assembleegameclient.parameters.Parameters;
   import _td.Options;
   import _1A_k._J_D_;
   import _0bE_._1Q_n;
   import com.company.util.GraphicHelper;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.filters.DropShadowFilter;
   
   public class ToolTip extends Sprite
   {
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      protected const _01T_:_1S_m = new _1S_m();
      
      private var background_:uint;
      
      private var _0aP_:Number;
      
      private var _0T_O_:uint;
      
      private var _0gs:Number;
      
      private var _1ik:Boolean;
      
      private var _0A_l:Boolean = false;
      
      private var _1S_7:Boolean = false;
      
      public var _15U_:int;
      
      public var _6v:int;
      
      private var _B_W_:DisplayObject;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      public function ToolTip(param1:uint, param2:Number, param3:uint, param4:Number, param5:Boolean = true)
      {
         this._0O_n = new GraphicsSolidFill(0,1);
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this.background_ = param1;
         this._0aP_ = param2;
         this._0T_O_ = param3;
         this._0gs = param4;
         this._1ik = param5;
         mouseEnabled = false;
         mouseChildren = false;
         filters = [new DropShadowFilter(0,0,0,1,16,16)];
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._01T_.complete.add(this._0S_F_);
      }
      
      private function _0S_F_() : void
      {
         this.alignUI();
         this.draw();
         this.position();
      }
      
      protected function alignUI() : void
      {
      }
      
      public function _0Z_3(param1:DisplayObject) : void
      {
         if(param1)
         {
            this._B_W_ = param1;
            this._B_W_.addEventListener(MouseEvent.ROLL_OUT,this._1E_I_);
         }
      }
      
      public function _1gr() : void
      {
         if(this._B_W_)
         {
            this._B_W_.removeEventListener(MouseEvent.ROLL_OUT,this._1E_I_);
            if(parent)
            {
               parent.removeChild(this);
            }
            this._B_W_ = null;
         }
      }
      
      public function _15P_() : void
      {
         this._0A_l = true;
         this._1S_7 = false;
      }
      
      public function _09v() : void
      {
         this._1S_7 = true;
         this._0A_l = false;
      }
      
      private function _1E_I_(param1:MouseEvent) : void
      {
         this._1gr();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(this._01T_.isEmpty())
         {
            this.draw();
         }
         if(this._1ik)
         {
            this.position();
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         if(!this._1ik && Parameters.data_.enhancedQuestToolTip == true)
         {
            addEventListener(Event.ENTER_FRAME,this.drawOnEnterFrame);
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         if(this._1ik)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.drawOnEnterFrame);
         }
      }
      
      public function drawOnEnterFrame(param1:Event) : void
      {
         this.draw();
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.position();
      }
      
      public function positionFixed() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = Parameters.data_["uiscale"];
         var _loc4_:Number = 800 / stage.stageWidth;
         var _loc5_:Number = 600 / stage.stageHeight;
         if(this.parent is Options)
         {
            _loc1_ = (stage.mouseX + stage.stageWidth / 2 - 400) / stage.stageWidth * 800;
            _loc2_ = (stage.mouseY + stage.stageHeight / 2 - 300) / stage.stageHeight * 600;
         }
         else
         {
            _loc1_ = (stage.stageWidth - 800) / 2 + stage.mouseX;
            _loc2_ = (stage.stageHeight - 600) / 2 + stage.mouseY;
            if(this.parent is _J_D_ || this is _1D_l && !(this.parent is _1Q_n))
            {
               if(_loc3_ == true)
               {
                  this.parent.scaleX = _loc4_ / _loc5_;
                  this.parent.scaleY = 1;
                  _loc1_ = _loc1_ * _loc5_;
                  _loc2_ = _loc2_ * _loc5_;
               }
               else
               {
                  this.parent.scaleX = _loc4_;
                  this.parent.scaleY = _loc5_;
               }
            }
         }
         if(stage == null)
         {
            return;
         }
         if(stage.mouseX + 0.5 * stage.stageWidth - 400 < stage.stageWidth / 2)
         {
            x = _loc1_ + 12;
         }
         else
         {
            x = _loc1_ - width - 1;
         }
         if(x < 12)
         {
            x = 12;
         }
         if(stage.mouseY + 0.5 * stage.stageHeight - 300 < stage.stageHeight / 3)
         {
            y = _loc2_ + 12;
         }
         else
         {
            y = _loc2_ - height - 1;
         }
         if(y < 12)
         {
            y = 12;
         }
      }
      
      protected function position() : void
      {
         this.positionFixed();
      }
      
      public function draw() : void
      {
         this._0O_n.color = this.background_;
         this._0O_n.alpha = this._0aP_;
         this.outlineFill_.color = this._0T_O_;
         this.outlineFill_.alpha = this._0gs;
         graphics.clear();
         this._15U_ = width;
         this._6v = height;
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(-6,-6,this._15U_ + 12,this._6v + 12,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
   }
}
