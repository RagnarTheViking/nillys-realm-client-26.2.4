package _1O_R_
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import _f7.Signal;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import com.company.assembleegameclient.util._A_o;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import _05g._1S_m;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   import com.company.googleanalytics.GA;
   import com.company.util.GraphicHelper;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import _1S_0.NativeMappedSignal;
   
   public class ErrorDialog extends Sprite
   {
      
      public static const _1I_a:int = 11776947;
      
      protected static const WIDTH:int = 300;
       
      
      protected var graphicsData_:Vector.<IGraphicsData>;
      
      public var ok:Signal;
      
      public var box_:Sprite;
      
      public var rect_:Shape;
      
      public var _R_E_:SimpleText;
      
      public var _7H_:SimpleText = null;
      
      public var button1_:Button = null;
      
      public var button2_:Button = null;
      
      public var _10V_:String = null;
      
      public var _1vR_:Number = 0;
      
      public var _038:Number = 0;
      
      public var _1gH_:_A_o;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var _0O_n:GraphicsSolidFill;
      
      protected var path_:GraphicsPath;
      
      protected var _0d0:_1S_m;
      
      public function ErrorDialog(param1:String)
      {
         this.box_ = new Sprite();
         this.rect_ = new Shape();
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this._0O_n = new GraphicsSolidFill(3552822,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._0d0 = new _1S_m();
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         var _loc2_:String = ["An error has occured:",param1].join("\n");
         this._1gH_ = new _A_o(this);
         this._10V_ = "/error";
         this._0ww(_loc2_,"D\'oh, this isn\'t good","Ok",null);
         this.makeUIAndAdd();
         this._0d0.complete.addOnce(this.onComplete);
         addChild(this.box_);
         this.ok = new NativeMappedSignal(this,Dialog.LEFT_BUTTON);
      }
      
      private function _0ww(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.initText(param1);
         this._197(this._R_E_);
         this._14A_(param2);
         this._0nv(param3,param4);
      }
      
      protected function makeUIAndAdd() : void
      {
      }
      
      protected function initText(param1:String) : void
      {
         this._R_E_ = new SimpleText().setSize(14).setColor(_1I_a);
         this._R_E_.setTextWidth(WIDTH - 40);
         this._R_E_.x = 20;
         this._R_E_.setMultiLine(true).setWordWrap(true).setAutoSize(TextFieldAutoSize.CENTER);
         this._R_E_.setStringBuilder(new SText(param1));
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
         if(param1 != null)
         {
            this._7H_ = new SimpleText().setSize(18).setColor(5746018);
            this._7H_.setTextWidth(WIDTH);
            this._7H_.setBold(true);
            this._7H_.setAutoSize(TextFieldAutoSize.CENTER);
            this._7H_.filters = [new DropShadowFilter(0,0,0,1,8,8,1)];
            this._7H_.setStringBuilder(new SText(param1));
            this._197(this._7H_);
         }
      }
      
      private function _0nv(param1:String, param2:String) : void
      {
         if(param1 != null)
         {
            this.button1_ = new Button(16,param1,120);
            this.button1_.addEventListener(MouseEvent.CLICK,this.onButton1Click);
         }
         if(param2 != null)
         {
            this.button2_ = new Button(16,param2,120);
            this.button2_.addEventListener(MouseEvent.CLICK,this.onButton2Click);
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
         this.box_.addChildAt(this.rect_,0);
         this.box_.filters = [new DropShadowFilter(0,0,0,1,16,16,1)];
      }
      
      private function _1W_A_() : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,this.getBoxHeight() + 10,4,[1,1,1,1],this.path_);
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
         if(this.button1_ != null)
         {
            _loc1_ = this.box_.height + 16;
            this.box_.addChild(this.button1_);
            this.button1_.y = _loc1_;
            if(this.button2_ == null)
            {
               this.button1_.x = WIDTH / 2 - this.button1_.width / 2;
            }
            else
            {
               this.button1_.x = WIDTH / 4 - this.button1_.width / 2;
               this.box_.addChild(this.button2_);
               this.button2_.x = 3 * WIDTH / 4 - this.button2_.width / 2;
               this.button2_.y = _loc1_;
            }
         }
      }
      
      private function _W_e() : void
      {
         if(this.button1_ && this.box_.contains(this.button1_))
         {
            this.box_.removeChild(this.button1_);
         }
         if(this.button2_ && this.box_.contains(this.button2_))
         {
            this.box_.removeChild(this.button2_);
         }
      }
      
      private function _N_5() : void
      {
         if(this._7H_ != null)
         {
            this._7H_.y = 2;
            this._R_E_.y = this._7H_.height + 8;
         }
         else
         {
            this._R_E_.y = 4;
         }
      }
      
      private function onButton1Click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Dialog.LEFT_BUTTON));
      }
      
      private function onButton2Click(param1:Event) : void
      {
         dispatchEvent(new Event(Dialog.RIGHT_BUTTON));
      }
      
      public function _0N_Q_(param1:Number) : void
      {
         this.rect_.alpha = param1 > 1?Number(1):param1 < 0?Number(0):Number(param1);
      }
   }
}
