package _05g
{
   import _1O_R_.Dialog;
   import _f7.Signal;
   import _Y_9.DateField;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class AgeVerificationDialog extends Dialog
   {
      
      private static const WIDTH:int = 300;
       
      
      private const _1Q_p:String = "AgeVerificationDialog.tooYoung";
      
      private const _00i:String = "AgeVerificationDialog.invalidBirthDate";
      
      private const _H_g:uint = 13;
      
      public const _0ss:Signal = new Signal(Boolean);
      
      private var _o:DateField;
      
      private var _0L_i:SimpleText;
      
      public function AgeVerificationDialog()
      {
         super(_1O_I_._0xN_,"",_1O_I_._0df,_1O_I_._1F_C_,"/ageVerificationDialog");
         addEventListener(Dialog.LEFT_BUTTON,this.onCancel);
         addEventListener(Dialog.RIGHT_BUTTON,this._13p);
      }
      
      override protected function makeUIAndAdd() : void
      {
         this._gp();
         this._0sF_();
      }
      
      private function _gp() : void
      {
         this._xB_();
         this._1z3();
      }
      
      private function _0sF_() : void
      {
         _0d0.pushArgs(this._o._1pv());
         box_.addChild(this._o);
         box_.addChild(this._0L_i);
      }
      
      override protected function initText(param1:String) : void
      {
         _R_E_ = new SimpleText().setSize(14).setColor(11776947);
         _R_E_.setTextWidth(WIDTH - 40);
         _R_E_.x = 20;
         _R_E_.setMultiLine(true).setWordWrap(true).setHTML(true);
         _R_E_.setAutoSize(TextFieldAutoSize.LEFT);
         _R_E_.mouseEnabled = true;
         _R_E_.filters = [new DropShadowFilter(0,0,0,1,6,6,1)];
         this._0D_S_();
      }
      
      private function _0D_S_() : void
      {
         var _loc1_:* = "<font color=\"#7777EE\"><a href=\"" + Parameters._G_i + "\" target=\"_blank\">";
         var _loc2_:* = "<font color=\"#7777EE\"><a href=\"" + Parameters._0bK_ + "\" target=\"_blank\">";
         var _loc3_:* = "</a></font>";
         _R_E_.setStringBuilder(new _dU_().setParams("AgeVerificationDialog.text",{
            "tou":_loc1_,
            "_tou":_loc3_,
            "policy":_loc2_,
            "_policy":_loc3_
         }));
      }
      
      override protected function drawAdditionalUI() : void
      {
         this._o.y = _R_E_.getBounds(box_).bottom + 8;
         this._o.x = 20;
         this._0L_i.y = this._o.y + this._o.height + 8;
         this._0L_i.x = 20;
      }
      
      private function _xB_() : void
      {
         this._o = new DateField();
         this._o.setTitle(_1O_I_._1kQ_);
      }
      
      private function _1z3() : void
      {
         this._0L_i = new SimpleText().setSize(12).setColor(16549442);
         this._0L_i.setMultiLine(true);
         this._0L_i.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
      }
      
      private function onCancel(param1:Event) : void
      {
         this._0ss.dispatch(false);
      }
      
      private function _13p(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:uint = this._1__6();
         var _loc4_:* = "";
         if(!this._o._1L_A_())
         {
            _loc4_ = this._00i;
            _loc2_ = true;
         }
         else if(_loc3_ < this._H_g && !_loc2_)
         {
            _loc4_ = this._1Q_p;
            _loc2_ = true;
         }
         else
         {
            _loc4_ = "";
            _loc2_ = false;
            this._0ss.dispatch(true);
         }
         this._0L_i.setStringBuilder(new _dU_().setParams(_loc4_));
         this._o._ur(_loc2_);
         _1E_B_();
      }
      
      private function _1__6() : uint
      {
         var _loc1_:Date = new Date(this._1X_c());
         var _loc2_:Date = new Date();
         var _loc3_:uint = Number(_loc2_.fullYear) - Number(_loc1_.fullYear);
         if(_loc1_.month > _loc2_.month || _loc1_.month == _loc2_.month && _loc1_.date > _loc2_.date)
         {
            _loc3_--;
         }
         return _loc3_;
      }
      
      private function _1X_c() : Number
      {
         return Date.parse(this._o._K___());
      }
   }
}
