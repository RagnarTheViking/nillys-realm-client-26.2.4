package _P_N_
{
   import _1O_R_._1uu;
   import _1O_R_._1O_f;
   import flash.display.DisplayObjectContainer;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _f7.Signal;
   import _17B_._0I_C_;
   import _1O_R_.Dialog;
   
   public class NewAbility extends FancyDialog implements _1uu
   {
       
      
      private const _0M_v:_1O_f = new _1O_f();
      
      private const _1w9:DisplayObjectContainer = _0I_C_._Z_h();
      
      private const _1M_L_:Number = this._1w9.width;
      
      private const _9O_:Number = this._1w9.height;
      
      public var _0rb:String;
      
      private var _4a:SimpleText;
      
      public function NewAbility(param1:String)
      {
         this._4a = new SimpleText();
         this._0rb = param1;
         super("NewAbility.gratz","NewAbility.text","NewAbility.righteous",null,null);
         this._0M_v.add(this,Dialog.LEFT_BUTTON);
      }
      
      public function _0xb() : String
      {
         return this._0rb;
      }
      
      override protected function makeUIAndAdd() : void
      {
         this._4a.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE).setColor(9632505).setSize(16).setBold(true).setStringBuilder(new _dU_().setParams(this._0rb));
         this._1w9.addChild(this._4a);
         addChild(this._1w9);
         box_.addChild(this._1w9);
         _0d0.pushArgs(this._4a.textChanged);
      }
      
      override protected function drawAdditionalUI() : void
      {
         super.drawAdditionalUI();
         this._4a.x = this._1M_L_ / 2;
         this._4a.y = this._9O_ / 2;
         this._1w9.x = (this.width_ - this._1w9.width) / 2;
         this._1w9.y = _R_E_.getBounds(box_).bottom + _mT_;
         leftButton.y = this._1w9.getBounds(box_).bottom + _1H_a;
      }
      
      public function _1tG_() : Signal
      {
         return this._0M_v._1tG_();
      }
   }
}
