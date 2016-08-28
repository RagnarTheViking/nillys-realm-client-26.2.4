package _1O_R_
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.util._A_o;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import _05g._1S_m;
   import com.company.assembleegameclient.ui.Button;
   import _1xa._dU_;
   import _1xa._1eo;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   import com.company.googleanalytics.GA;
   import com.company.util.GraphicHelper;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   public class Dialog extends Sprite
   {
      
      public static const LEFT_BUTTON:String = "dialogLeftButton";
      
      public static const RIGHT_BUTTON:String = "dialogRightButton";
      
      public static const _1I_a:int = 11776947;
       
      
      protected var graphicsData_:Vector.<IGraphicsData>;
      
      public var type_:String;
      
      public var width_:int = 300;
      
      public var box_:Sprite;
      
      public var rect_:Shape;
      
      public var _R_E_:SimpleText;
      
      public var _7H_:SimpleText = null;
      
      public var _10V_:String = null;
      
      public var _1vR_:Number = 0;
      
      public var _038:Number = 0;
      
      public var _1gH_:_A_o;
      
      public var _mT_:int = 2;
      
      public var _0H_Q_:int = 8;
      
      public var _1H_a:int = 16;
      
      public var _1fA_:int = 10;
      
      public var _0Y_0:int;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var _0O_n:GraphicsSolidFill;
      
      protected var path_:GraphicsPath;
      
      protected var _0d0:_1S_m;
      
      protected var leftButton:Button;
      
      protected var rightButton:Button;
      
      private var _1lC_:String;
      
      private var _0J_S_:String;
      
      private var _1Y_A_:Object;
      
      public function Dialog(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Object = null, param7:int = 300)
      {
         this.width_ = param7;
         this.box_ = new Sprite();
         this.rect_ = new Shape();
         this._0Y_0 = this.setDialogWidth();
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this._0O_n = new GraphicsSolidFill(3552822,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._0d0 = new _1S_m();
         this._1Y_A_ = param6;
         this._1lC_ = param3;
         this._0J_S_ = param4;
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this._1gH_ = new _A_o(this);
         this._10V_ = param5;
         this._0ww(param2,param1);
         this.makeUIAndAdd();
         this._0d0.complete.addOnce(this.onComplete);
         addChild(this.box_);
      }
      
      public function _J_s() : String
      {
         return this._1lC_;
      }
      
      public function _0U_d() : String
      {
         return this._0J_S_;
      }
      
      public function _1aO_(param1:String, param2:Object) : void
      {
         this._R_E_.setStringBuilder(new _dU_().setParams(param1,param2));
      }
      
      public function _1Z_F_(param1:_1eo) : void
      {
         this._7H_.setStringBuilder(param1);
      }
      
      protected function setDialogWidth() : int
      {
         return this.width_;
      }
      
      private function _0ww(param1:String, param2:String) : void
      {
         this.initText(param1);
         this._197(this._R_E_);
         this._14A_(param2);
         this._0nv();
      }
      
      protected function makeUIAndAdd() : void
      {
      }
      
      protected function initText(param1:String) : void
      {
         var _loc2_:_dU_ = null;
         this._R_E_ = new SimpleText().setSize(14).setColor(_1I_a);
         this._R_E_.setTextWidth(this._0Y_0 - 40);
         this._R_E_.x = 20;
         this._R_E_.setMultiLine(true).setWordWrap(true).setAutoSize(TextFieldAutoSize.CENTER);
         this._R_E_.setHTML(true);
         if(!param1.match(/^\w+\.\w+$/))
         {
            _loc2_ = new _dU_().setParams("blank",{"data":param1});
         }
         else
         {
            _loc2_ = new _dU_().setParams(param1).setPrefix("<p align=\"center\">").setPostfix("</p>");
         }
         if(this._1Y_A_)
         {
            _loc2_.setParams(param1,this._1Y_A_);
         }
         this._R_E_.setStringBuilder(_loc2_);
         this._R_E_.mouseEnabled = true;
         this._R_E_.filters = [new DropShadowFilter(0,0,0,1,6,6,1)];
      }
      
      private function _197(param1:SimpleText) : void
      {
         this.box_.addChild(param1);
         this._0d0.push(param1.textChanged);
      }
      
      private function _14A_(param1:String) : void
      {
         var _loc2_:_dU_ = null;
         if(param1 != null)
         {
            this._7H_ = new SimpleText().setSize(18).setColor(5746018);
            this._7H_.setBold(true);
            this._7H_.setAutoSize(TextFieldAutoSize.CENTER);
            this._7H_.filters = [new DropShadowFilter(0,0,0,1,8,8,1)];
            if(!param1.match(/^\w+\.\w+$/))
            {
               _loc2_ = new _dU_().setParams("blank",{"data":param1});
            }
            else
            {
               _loc2_ = new _dU_().setParams(param1);
            }
            this._7H_.setStringBuilder(_loc2_);
            this._197(this._7H_);
         }
      }
      
      private function _0nv() : void
      {
         if(this._1lC_ != null)
         {
            this.leftButton = new Button(16,this._1lC_,120);
            this.leftButton.addEventListener(MouseEvent.CLICK,this._0gd);
         }
         if(this._0J_S_ != null)
         {
            this.rightButton = new Button(16,this._0J_S_,120);
            this.rightButton.addEventListener(MouseEvent.CLICK,this._X_U_);
         }
      }
      
      private function onComplete() : void
      {
         this.draw();
         this._eV_();
      }
      
      private function _eV_() : void
      {
         this.box_.x = this._1vR_ + this._1gH_._05C_() / 2 - this.box_.width / 2;
         this.box_.y = this._038 + this._1gH_._0P_C_() / 2 - this.getBoxHeight() / 2;
         if(this._10V_ != null)
         {
            this._1jO_();
         }
      }
      
      private function _1jO_() : void
      {
         try
         {
            GA.global().trackPageview(this._10V_);
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      private function draw() : void
      {
         this._N_5();
         this.drawAdditionalUI();
         this._1E_B_();
      }
      
      protected function drawAdditionalUI() : void
      {
      }
      
      protected function _1E_B_() : void
      {
         if(this.box_.contains(this.rect_))
         {
            this.box_.removeChild(this.rect_);
         }
         this._W_e();
         this._0D_d();
         this._1W_A_();
         this.drawGraphicsTemplate();
         this.box_.addChildAt(this.rect_,0);
         this.box_.filters = [new DropShadowFilter(0,0,0,1,16,16,1)];
      }
      
      protected function drawGraphicsTemplate() : void
      {
      }
      
      private function _1W_A_() : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,this._0Y_0,this.getBoxHeight() + this._1fA_,4,[1,1,1,1],this.path_);
         var _loc1_:Graphics = this.rect_.graphics;
         _loc1_.clear();
         _loc1_.drawGraphicsData(this.graphicsData_);
      }
      
      protected function getBoxHeight() : Number
      {
         return this.box_.height;
      }
      
      private function _0D_d() : void
      {
         var _loc1_:int = 0;
         if(this.leftButton != null)
         {
            _loc1_ = this.box_.height + this._1H_a;
            this.box_.addChild(this.leftButton);
            this.leftButton.y = _loc1_;
            if(this.rightButton == null)
            {
               this.leftButton.x = this._0Y_0 / 2 - this.leftButton.width / 2;
            }
            else
            {
               this.leftButton.x = this._0Y_0 / 4 - this.leftButton.width / 2;
               this.box_.addChild(this.rightButton);
               this.rightButton.x = 3 * this._0Y_0 / 4 - this.rightButton.width / 2;
               this.rightButton.y = _loc1_;
            }
         }
      }
      
      private function _N_5() : void
      {
         if(this._7H_ != null)
         {
            this._7H_.x = this._0Y_0 / 2;
            this._7H_.y = this._mT_;
            this._R_E_.y = this._7H_.height + this._0H_Q_;
         }
         else
         {
            this._R_E_.y = 4;
         }
      }
      
      private function _W_e() : void
      {
         if(this.leftButton && this.box_.contains(this.leftButton))
         {
            this.box_.removeChild(this.leftButton);
         }
         if(this.rightButton && this.box_.contains(this.rightButton))
         {
            this.box_.removeChild(this.rightButton);
         }
      }
      
      protected function _0gd(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(LEFT_BUTTON));
      }
      
      protected function _X_U_(param1:Event) : void
      {
         dispatchEvent(new Event(RIGHT_BUTTON));
      }
      
      public function addFullDim() : void
      {
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,0,800,600);
         graphics.endFill();
      }
   }
}
