package _1gF_
{
   import flash.display.Sprite;
   import flash.text.TextLineMetrics;
   import _f7.Signal;
   import flash.text.TextField;
   import _03U_._1U_N_;
   import _1xa._1eo;
   import _C_._1L_X_;
   import flash.text.TextFormat;
   
   public class SimpleText extends Sprite implements _1n
   {
      
      public static const MIDDLE:String = "middle";
      
      public static const BOTTOM:String = "bottom";
      
      private static const _D_I_:int = 2;
       
      
      public const textChanged:Signal = new Signal();
      
      public var textField:TextField;
      
      private var _iB_:_1U_N_;
      
      private var _ar:_1eo;
      
      private var size:int = 12;
      
      private var color:uint;
      
      private var font:_1L_X_;
      
      private var bold:Boolean;
      
      private var autoSize:String = "left";
      
      private var _1H_C_:String = "left";
      
      private var _s9:String;
      
      private var multiline:Boolean;
      
      private var wordWrap:Boolean;
      
      private var textWidth:Number = 0;
      
      private var textHeight:Number = 0;
      
      private var html:Boolean;
      
      private var displayAsPassword:Boolean;
      
      private var _Y_l:String;
      
      private var leftMargin:int = 0;
      
      private var indent:int = 0;
      
      private var leading:int = 0;
      
      public function SimpleText()
      {
         super();
      }
      
      private static function _G_3(param1:TextLineMetrics) : Number
      {
         return param1.height - param1.leading;
      }
      
      public function setIndent(param1:int) : SimpleText
      {
         this.indent = param1;
         this._1c9();
         return this;
      }
      
      public function setLeading(param1:int) : SimpleText
      {
         this.leading = param1;
         this._1c9();
         return this;
      }
      
      public function setLeftMargin(param1:int) : SimpleText
      {
         this.leftMargin = param1;
         this._1c9();
         return this;
      }
      
      public function _1E_n(param1:Boolean) : SimpleText
      {
         this.displayAsPassword = param1;
         this._1c9();
         return this;
      }
      
      public function _0A_Z_(param1:String) : SimpleText
      {
         this._Y_l = param1;
         this.textField && (this.textField.name = this._Y_l);
         return this;
      }
      
      public function setSize(param1:int) : SimpleText
      {
         this.size = param1;
         this._1c9();
         return this;
      }
      
      public function setColor(param1:uint) : SimpleText
      {
         this.color = param1;
         this._1c9();
         return this;
      }
      
      public function setBold(param1:Boolean) : SimpleText
      {
         this.bold = param1;
         this._1c9();
         return this;
      }
      
      public function setHorizontalAlign(param1:String) : SimpleText
      {
         this._1H_C_ = param1;
         this._1c9();
         return this;
      }
      
      public function setAutoSize(param1:String) : SimpleText
      {
         this.autoSize = param1;
         this._1c9();
         return this;
      }
      
      public function setMultiLine(param1:Boolean) : SimpleText
      {
         this.multiline = param1;
         this._1c9();
         return this;
      }
      
      public function setWordWrap(param1:Boolean) : SimpleText
      {
         this.wordWrap = param1;
         this._1c9();
         return this;
      }
      
      public function setTextWidth(param1:Number) : SimpleText
      {
         this.textWidth = param1;
         this._1c9();
         return this;
      }
      
      public function setTextHeight(param1:Number) : SimpleText
      {
         this.textHeight = param1;
         this._1c9();
         return this;
      }
      
      public function setHTML(param1:Boolean) : SimpleText
      {
         this.html = param1;
         return this;
      }
      
      public function setStringBuilder(param1:_1eo) : SimpleText
      {
         this._ar = param1;
         this._tA_();
         return this;
      }
      
      public function _1zU_() : _1eo
      {
         return this._ar;
      }
      
      public function setPosition(param1:Number, param2:Number) : SimpleText
      {
         this.x = param1;
         this.y = param2;
         return this;
      }
      
      public function setVerticalAlign(param1:String) : SimpleText
      {
         this._s9 = param1;
         return this;
      }
      
      public function update() : void
      {
         this._tA_();
      }
      
      public function _J_(param1:_1L_X_) : void
      {
         this.font = param1;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
         this._iB_ = param1;
         this._tA_();
      }
      
      public function _7D_(param1:TextField) : void
      {
         param1.width = this.textWidth;
         param1.height = this.textHeight;
         this._Y_l && (param1.name = this._Y_l);
         this._C_0(param1);
         this.textField = param1;
         this._07H_();
         addChild(this.textField);
      }
      
      private function _1c9() : void
      {
         if(this.textField)
         {
            this._07H_();
         }
      }
      
      private function _07H_() : void
      {
         this._1Z_I_();
         this._0V_5();
      }
      
      private function _0V_5() : void
      {
         if(this.textWidth != 0)
         {
            this.textField.width = this.textWidth;
         }
         if(this.textHeight != 0)
         {
            this.textField.height = this.textHeight;
         }
         this.textField.selectable = false;
         this.textField.textColor = this.color;
         this.textField.autoSize = this.autoSize;
         this.textField.multiline = this.multiline;
         this.textField.wordWrap = this.wordWrap;
         this.textField.displayAsPassword = this.displayAsPassword;
         this.textField.embedFonts = true;
      }
      
      private function _1Z_I_() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = this.size;
         _loc1_.font = this.font.getName();
         _loc1_.bold = this.bold;
         _loc1_.align = this._1H_C_;
         _loc1_.leftMargin = this.leftMargin;
         _loc1_.indent = this.indent;
         _loc1_.leading = this.leading;
         this.setTextFormat(_loc1_);
      }
      
      private function _C_0(param1:TextField) : void
      {
         if(this.textField)
         {
            param1.text = this.textField.text;
            removeChild(this.textField);
         }
      }
      
      private function _tA_() : void
      {
         var _loc1_:String = null;
         if(this._11n())
         {
            this._ar._0L_b(this._iB_);
            _loc1_ = this._ar.getString();
            this._0D_S_(_loc1_);
            this._0U_j();
            this._G_p();
            this.textChanged.dispatch();
         }
      }
      
      private function _G_p() : void
      {
         this.textField.height;
      }
      
      public function _0D_S_(param1:String) : void
      {
         if(this.html)
         {
            this.textField.htmlText = param1;
         }
         else
         {
            this.textField.text = param1;
         }
      }
      
      private function _0U_j() : void
      {
         var _loc1_:TextLineMetrics = null;
         if(this._s9 == MIDDLE)
         {
            this._Z_A_();
         }
         else if(this._s9 == BOTTOM)
         {
            _loc1_ = this.textField.getLineMetrics(0);
            this.textField.y = -_G_3(_loc1_);
         }
      }
      
      private function _Z_A_() : void
      {
         this.textField.height;
         var _loc1_:TextFormat = this.textField.getTextFormat();
         var _loc2_:Number = this._1M_I_(_loc1_);
         var _loc3_:Number = this._1Q_2(_loc1_);
         this.textField.y = -(this.textField.height - (_loc2_ / 2 + _loc3_ + _D_I_));
      }
      
      private function _1M_I_(param1:TextFormat) : Number
      {
         return this.font._V_x(Number(param1.size));
      }
      
      private function _1Q_2(param1:TextFormat) : Number
      {
         return this.font._0uA_(Number(param1.size));
      }
      
      public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         this.textField.defaultTextFormat = param1;
         this.textField.setTextFormat(param1,param2,param3);
      }
      
      private function _11n() : Boolean
      {
         return this._iB_ && this._ar && this.textField;
      }
      
      public function _0uA_() : Number
      {
         return this.font._0uA_(Number(this.textField.getTextFormat().size));
      }
      
      public function _1g8() : String
      {
         return !!this.textField?this.textField.text:"null";
      }
      
      public function getColor() : uint
      {
         return this.color;
      }
      
      public function _1X_Q_() : int
      {
         return this.size;
      }
      
      public function _04g() : Boolean
      {
         return this.textField != null;
      }
      
      public function _0U_N_() : Boolean
      {
         return this._iB_ != null;
      }
      
      public function _5m() : Boolean
      {
         return this.font != null;
      }
      
      public function getTextFormat(param1:int = -1, param2:int = -1) : TextFormat
      {
         return this.textField.getTextFormat(param1,param2);
      }
   }
}
